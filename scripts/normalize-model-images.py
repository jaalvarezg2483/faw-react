#!/usr/bin/env python3
from collections import deque
from pathlib import Path

import numpy as np
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT.parent / "checkpoint-1" / "assets-original" / "cms"
OUT = ROOT / "public" / "cms" / "models"

# Lienzo más ancho que 262:180 para que el pickup (1.9:1) y el cabezal
# (1.3:1) ocupen la misma altura visual al hacer object-fit: contain.
CANVAS = (1400, 720)
PAD = 0.07

SOURCES = [
    ("Models_FAA9_image_cBUEy9bvZTtAeLLYtg4C-Tiger T80.jpg", "tiger-t80.jpg"),
    ("Models_FA58_image_zKmKeB8rlHdQ7QDhBRxS-Screenshot 2026-07-03 at 08.36.16.png", "tiger-vh-58.jpg"),
    ("Models_FA43_image_T3EP6Gqw16kojJUoWxZE-Tiger VH 4x4 4.3 T.png", "tiger-vh-43.jpg"),
    ("Models_FC01_image_VCeNTw2MWbqawf8UeBXr-imageCabezal.png", "cabezal-fc01.jpg"),
    ("Models_FV01_image_piiXUNyseXffORbjdBg3-imageVagoneta.png", "vagoneta-fv01.jpg"),
]


def background_mask(arr: np.ndarray) -> np.ndarray:
    rgb = arr[:, :, :3].astype(np.float32)
    alpha = arr[:, :, 3]
    lum = rgb.mean(axis=2)
    trans = alpha < 20
    if float(trans.mean()) > 0.12:
        return trans | ((lum < 12) & (alpha < 80))

    h, w = lum.shape
    is_bg = (lum > 236) | trans
    mask = np.zeros((h, w), dtype=bool)
    queue = deque()
    seeds = [
        (0, 0),
        (w - 1, 0),
        (0, h - 1),
        (w - 1, h - 1),
        (w // 2, 0),
        (w // 2, h - 1),
        (0, h // 2),
        (w - 1, h // 2),
    ]
    for x, y in seeds:
        if is_bg[y, x]:
            mask[y, x] = True
            queue.append((x, y))
    while queue:
        x, y = queue.popleft()
        for nx, ny in ((x - 1, y), (x + 1, y), (x, y - 1), (x, y + 1)):
            if 0 <= nx < w and 0 <= ny < h and not mask[ny, nx] and is_bg[ny, nx]:
                mask[ny, nx] = True
                queue.append((nx, ny))
    return mask


def content_bbox(mask: np.ndarray) -> tuple[int, int, int, int]:
    ys, xs = np.where(~mask)
    if len(xs) == 0:
        h, w = mask.shape
        return 0, 0, w, h
    return int(xs.min()), int(ys.min()), int(xs.max()) + 1, int(ys.max()) + 1


def fit_on_canvas(cropped: Image.Image) -> Image.Image:
    canvas = Image.new("RGBA", CANVAS, (255, 255, 255, 255))
    inner_w = int(CANVAS[0] * (1 - 2 * PAD))
    inner_h = int(CANVAS[1] * (1 - 2 * PAD))
    src = cropped.convert("RGBA")
    scale = min(inner_w / src.width, inner_h / src.height)
    new_size = (max(1, int(src.width * scale)), max(1, int(src.height * scale)))
    resized = src.resize(new_size, Image.Resampling.LANCZOS)
    x = (CANVAS[0] - new_size[0]) // 2
    y = CANVAS[1] - new_size[1] - int(CANVAS[1] * PAD)
    canvas.alpha_composite(resized, (x, y))
    return canvas.convert("RGB")


def normalize(src_name: str, dest_name: str) -> None:
    source = SRC / src_name
    image = Image.open(source).convert("RGBA")
    arr = np.array(image)
    x0, y0, x1, y1 = content_bbox(background_mask(arr))
    result = fit_on_canvas(image.crop((x0, y0, x1, y1)))
    dest = OUT / dest_name
    result.save(dest, "JPEG", quality=92)
    print(f"{dest_name}: {image.size} -> crop {(x1 - x0, y1 - y0)} -> {CANVAS}")


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    for src_name, dest_name in SOURCES:
        if not (SRC / src_name).exists():
            raise SystemExit(f"missing {SRC / src_name}")
        normalize(src_name, dest_name)


if __name__ == "__main__":
    main()
