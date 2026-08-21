import { existsSync, readdirSync } from 'fs'
import path from 'path'
import type { Payload } from 'payload'

const ROOT = process.cwd()
const SOURCE_DIRS = ['public/cms', 'public/assets', 'media']

function normalizeName(value: string) {
  return value
    .toLowerCase()
    .replace(/-1(?=\.[^.]+$)/, '')
    .replace(/4\.3/g, '43')
    .replace(/5\.8/g, '58')
    .replace(/[^a-z0-9]/g, '')
}

function collectSources() {
  const byExact = new Map<string, string>()
  const byNormalized = new Map<string, string>()

  const walk = (dir: string) => {
    if (!existsSync(dir)) return
    for (const entry of readdirSync(dir, { withFileTypes: true })) {
      const full = path.join(dir, entry.name)
      if (entry.isDirectory()) {
        walk(full)
        continue
      }
      if (!/\.(jpe?g|png|webp|gif|svg|pdf)$/i.test(entry.name)) continue
      byExact.set(entry.name.toLowerCase(), full)
      const key = normalizeName(entry.name)
      if (!byNormalized.has(key)) byNormalized.set(key, full)
    }
  }

  for (const rel of SOURCE_DIRS) walk(path.resolve(ROOT, rel))
  return { byExact, byNormalized }
}

function findSource(filename: string, catalog: ReturnType<typeof collectSources>) {
  return (
    catalog.byExact.get(filename.toLowerCase()) ||
    catalog.byNormalized.get(normalizeName(filename)) ||
    null
  )
}

export async function restoreMissingMediaFiles(payload: Payload) {
  const catalog = collectSources()
  const existing = await payload.find({
    collection: 'media',
    limit: 1000,
    pagination: false,
    overrideAccess: true,
  })

  let restored = 0
  let missing = 0

  for (const doc of existing.docs) {
    const filename = typeof doc.filename === 'string' ? doc.filename : ''
    if (!filename) continue

    const source = findSource(filename, catalog)
    if (!source) {
      missing += 1
      payload.logger.warn(`[cms] Falta archivo de media: ${filename}`)
      continue
    }

    try {
      await payload.update({
        collection: 'media',
        id: doc.id,
        data: {
          alt: doc.alt,
          title: doc.title,
        },
        filePath: source,
        overrideAccess: true,
      })
      restored += 1
    } catch (error) {
      payload.logger.error(`[cms] No se pudo restaurar ${filename}: ${String(error)}`)
    }
  }

  if (restored || missing) {
    payload.logger.info(`[cms] Media reinyectada: ${restored} archivos, ${missing} sin origen`)
  }
}
