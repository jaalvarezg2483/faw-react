import { existsSync, readdirSync } from 'fs'
import path from 'path'

const ROOT = process.cwd()
const SOURCE_DIRS = ['public/cms', 'public/assets']

type Catalog = {
  byExact: Map<string, string>
  byNormalized: Map<string, string>
}

function normalizeName(value: string) {
  return value
    .toLowerCase()
    .replace(/4\.3/g, '43')
    .replace(/5\.8/g, '58')
    .replace(/[^a-z0-9]/g, '')
}

function collectSources(): Catalog {
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
      if (!/\.(jpe?g|png|webp|gif|svg)$/i.test(entry.name)) continue
      byExact.set(entry.name.toLowerCase(), full)
      const key = normalizeName(entry.name)
      if (!byNormalized.has(key)) byNormalized.set(key, full)
    }
  }

  for (const rel of SOURCE_DIRS) walk(path.resolve(ROOT, rel))
  return { byExact, byNormalized }
}

let catalog: Catalog | null = null

function getCatalog() {
  if (!catalog) catalog = collectSources()
  return catalog
}

function findBundledFile(filename: string) {
  const queue = [filename]
  const tried = new Set<string>()

  while (queue.length > 0) {
    const name = queue.shift()
    if (!name || tried.has(name)) continue
    tried.add(name)

    const hit =
      getCatalog().byExact.get(name.toLowerCase()) ||
      getCatalog().byNormalized.get(normalizeName(name))
    if (hit) return hit

    const numbered = name.match(/^(.*)-(\d+)(\.[^.]+)$/)
    if (numbered) {
      const next = Number(numbered[2]) - 1
      if (next > 0) queue.push(`${numbered[1]}-${next}${numbered[3]}`)
      queue.push(`${numbered[1]}${numbered[3]}`)
    }
    if (name.includes('4.3') || name.includes('5.8')) {
      queue.push(name.replace('4.3', '43').replace('5.8', '58'))
    }
  }

  return null
}

/** Maps a Payload media filename to a bundled public URL that survives Railway deploys. */
export function bundledMediaUrl(filename?: string | null): string | null {
  if (!filename) return null
  const file = findBundledFile(filename)
  if (!file) return null
  const rel = path.relative(path.resolve(ROOT, 'public'), file).replace(/\\/g, '/')
  if (!rel || rel.startsWith('..')) return null
  return `/${rel}`
}
