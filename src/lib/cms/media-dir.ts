import { accessSync, constants, mkdirSync } from 'fs'

const PRODUCTION_MEDIA_DIR = '/data/media'
const EPHEMERAL_MEDIA_DIR = '/tmp/faw-media'

function canWrite(dir: string) {
  try {
    mkdirSync(dir, { recursive: true })
    accessSync(dir, constants.W_OK)
    return true
  } catch {
    return false
  }
}

/** Persistent volume in production; local `media/` in development. */
export function getMediaDir() {
  const candidates = [
    process.env.MEDIA_DIR,
    process.env.NODE_ENV === 'production' ? PRODUCTION_MEDIA_DIR : 'media',
    process.env.NODE_ENV === 'production' ? EPHEMERAL_MEDIA_DIR : null,
  ].filter((value): value is string => Boolean(value))

  for (const dir of candidates) {
    if (canWrite(dir)) return dir
  }

  return process.env.NODE_ENV === 'production' ? EPHEMERAL_MEDIA_DIR : 'media'
}
