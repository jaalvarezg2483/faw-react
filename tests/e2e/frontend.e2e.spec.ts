import { expect, test } from '@playwright/test'

const publicRoutes = [
  '/',
  '/home',
  '/contactenos',
  '/financiamiento',
  '/financiamiento-old',
  '/models',
  '/planes-de-mantenimiento',
  '/servicios',
  '/homeCopy',
  '/purdy-drive',
  '/talleres',
  '/sitemap',
  '/cabezales',
  '/vagonetas',
  '/reglamento',
  '/solicitar-seguimiento',
  '/terms',
]

const modelSlugs = [
  'tiger-t80',
  'tiger-vh-58-t',
  'tiger-vh-4x4-43-t',
  'cabezal-fc01',
  'vagoneta-fv01',
]

test.describe('FAW public migration', () => {
  for (const route of publicRoutes) {
    test(`${route} renders without browser errors`, async ({ page }) => {
      const errors: string[] = []
      page.on('pageerror', (error) => errors.push(error.message))

      const response = await page.goto(route, { waitUntil: 'domcontentloaded' })

      expect(response?.status(), route).toBeLessThan(400)
      await expect(page.locator('body')).not.toBeEmpty()
      expect(errors, route).toEqual([])
    })
  }

  for (const slug of modelSlugs) {
    test(`model ${slug} and its gallery render`, async ({ page }) => {
      for (const suffix of ['', '/galeria']) {
        const response = await page.goto(`/modelos/${slug}${suffix}`, {
          waitUntil: 'domcontentloaded',
        })
        expect(response?.status()).toBeLessThan(400)
        await expect(page.getByRole('heading', { level: 1 })).toBeVisible()
      }
    })
  }

  test('home preserves the original navigation model', async ({ page }) => {
    await page.goto('/home')
    await expect(page).toHaveTitle('Faw Trucks Costa Rica | Camiones | Grupo Purdy')
    await expect(page.getByRole('button', { name: 'Abrir menú' })).toBeVisible()
    await page.getByRole('button', { name: 'Abrir menú' }).click()
    await expect(page.getByRole('link', { name: 'Inicio' })).toBeVisible()
    await expect(page.getByRole('link', { name: 'Contactanos' })).toBeVisible()
  })
})
