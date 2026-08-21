import { chromium } from 'playwright'
import { mkdir } from 'node:fs/promises'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
const OUT = path.join(ROOT, '..', 'checkpoint-2', 'captures')
const BASE = process.env.BASE_URL || 'http://localhost:3000'

const VIEWPORTS = [
  { id: 'desktop-1920x1080', width: 1920, height: 1080 },
  { id: 'laptop-1440x900', width: 1440, height: 900 },
  { id: 'tablet-768x1024', width: 768, height: 1024 },
  { id: 'mobile-390x844', width: 390, height: 844 },
  { id: 'mobile-360x800', width: 360, height: 800 },
]

function sleep(ms) {
  return new Promise((r) => setTimeout(r, ms))
}

async function main() {
  const browser = await chromium.launch({ headless: true })
  const page = await browser.newPage({ locale: 'es-CR' })

  for (const vp of VIEWPORTS) {
    await page.setViewportSize({ width: vp.width, height: vp.height })
    const dir = path.join(OUT, vp.id, 'home')
    await mkdir(dir, { recursive: true })
    console.log('Home', vp.id)
    await page.goto(`${BASE}/home`, { waitUntil: 'networkidle', timeout: 90000 })
    await sleep(800)
    await page.screenshot({ path: path.join(dir, 'viewport.png'), fullPage: false })
    await page.screenshot({ path: path.join(dir, 'full.png'), fullPage: true })

    await page.locator('.site-header__menu').click()
    await sleep(400)
    await page.screenshot({ path: path.join(dir, 'header-menu-open.png'), fullPage: false })
    await page.locator('.site-header__menu').click()
  }

  await browser.close()
  console.log('Wrote captures to', OUT)
}

main().catch((e) => {
  console.error(e)
  process.exit(1)
})
