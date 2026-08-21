import { revalidatePath, revalidateTag } from 'next/cache'
import type {
  CollectionAfterChangeHook,
  CollectionAfterDeleteHook,
  GlobalAfterChangeHook,
} from 'payload'

function revalidateContent(paths: readonly string[], tags: readonly string[]) {
  try {
    for (const tag of tags) revalidateTag(tag, 'max')
    for (const path of paths) revalidatePath(path)
  } catch {
    // CLI / generate:types no tienen request de Next
  }
}

export function liveHooksFor(paths: readonly string[], tags: readonly string[]) {
  const afterChange: CollectionAfterChangeHook = ({ doc }) => {
    if ('_status' in doc && doc._status === 'draft') return doc
    revalidateContent(paths, tags)
    return doc
  }
  const afterDelete: CollectionAfterDeleteHook = ({ doc }) => {
    revalidateContent(paths, tags)
    return doc
  }
  return { afterChange: [afterChange], afterDelete: [afterDelete] }
}

export const afterChangeGlobalRevalidate: GlobalAfterChangeHook = ({ doc }) => {
  revalidateContent(
    ['/', '/home', '/servicios', '/talleres', '/planes-de-mantenimiento'],
    ['site-settings'],
  )
  return doc
}
