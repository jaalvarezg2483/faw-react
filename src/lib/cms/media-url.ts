type MediaLike = {
  url?: string | null
  filename?: string | null
  updatedAt?: string | null
} | null

export function mediaUrl(value: unknown, fallback = ''): string {
  if (!value) return fallback
  if (typeof value === 'string' && value.trim()) return cacheBust(value)
  if (typeof value === 'object') {
    const media = value as MediaLike
    const raw = media?.url || (media?.filename ? `/api/media/file/${media.filename}` : '')
    if (raw) return cacheBust(raw, media?.updatedAt)
  }
  return fallback
}

function cacheBust(url: string, updatedAt?: string | null) {
  const stamp = updatedAt ? new Date(updatedAt).getTime() : 0
  if (!stamp) return url
  return url.includes('?') ? `${url}&v=${stamp}` : `${url}?v=${stamp}`
}
