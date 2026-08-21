import type { CollectionConfig } from 'payload'

import { bundledMediaUrl } from '../lib/cms/bundled-media'
import { publicContentAccess } from '../lib/payload/access'
import { liveHooksFor } from './hooks/revalidate-site'

const liveHooks = liveHooksFor(['/'], ['media'])

export const Media: CollectionConfig = {
  slug: 'media',
  labels: { singular: 'Archivo', plural: 'Media' },
  access: publicContentAccess,
  hooks: {
    ...liveHooks,
    afterRead: [
      ({ doc }) => {
        const bundled = bundledMediaUrl(typeof doc.filename === 'string' ? doc.filename : null)
        if (bundled) {
          doc.url = bundled
          doc.thumbnailURL = bundled
        }
        return doc
      },
    ],
  },
  fields: [
    {
      name: 'alt',
      type: 'text',
      required: true,
    },
    { name: 'title', type: 'text', required: true },
    { name: 'description', type: 'textarea' },
  ],
  upload: {
    staticDir: process.env.MEDIA_DIR || 'public/media',
    disableLocalStorage: process.env.STORAGE_PROVIDER === 'azure',
    displayPreview: true,
    focalPoint: true,
    mimeTypes: ['image/*', 'application/pdf'],
  },
}
