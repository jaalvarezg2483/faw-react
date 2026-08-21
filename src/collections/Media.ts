import type { CollectionConfig } from 'payload'

import { publicContentAccess } from '../lib/payload/access'
import { liveHooksFor } from './hooks/revalidate-site'

export const Media: CollectionConfig = {
  slug: 'media',
  labels: { singular: 'Archivo', plural: 'Media' },
  access: publicContentAccess,
  hooks: liveHooksFor(['/'], ['media']),
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
    staticDir: process.env.MEDIA_DIR || (process.env.NODE_ENV === 'production' ? '/tmp/faw-media' : 'media'),
    disableLocalStorage: process.env.STORAGE_PROVIDER === 'azure',
    displayPreview: true,
    focalPoint: true,
    mimeTypes: ['image/*', 'application/pdf'],
  },
}
