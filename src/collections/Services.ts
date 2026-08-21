import type { CollectionConfig } from 'payload'

import { publicContentAccess } from '../lib/payload/access'
import { liveHooksFor } from './hooks/revalidate-site'

export const Services: CollectionConfig = {
  slug: 'services',
  labels: { singular: 'Servicio', plural: 'Servicios' },
  admin: { useAsTitle: 'title', defaultColumns: ['title', 'isActive', 'order'] },
  access: publicContentAccess,
  hooks: liveHooksFor(['/', '/home', '/servicios'], ['services']),
  fields: [
    { name: 'title', type: 'text', required: true },
    { name: 'image', type: 'upload', relationTo: 'media' },
    { name: 'url', type: 'text', admin: { description: 'URL alternativa de imagen' } },
    { name: 'link', type: 'text' },
    { name: 'page', type: 'text' },
    { name: 'isLink', type: 'checkbox', defaultValue: true },
    { name: 'isActive', type: 'checkbox', defaultValue: true },
    { name: 'order', type: 'number' },
  ],
}
