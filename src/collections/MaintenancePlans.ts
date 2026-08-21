import type { CollectionConfig } from 'payload'

import { publicContentAccess } from '../lib/payload/access'
import { liveHooksFor } from './hooks/revalidate-site'

export const MaintenancePlans: CollectionConfig = {
  slug: 'maintenance-plans',
  labels: { singular: 'Plan de mantenimiento', plural: 'Planes de mantenimiento' },
  admin: { useAsTitle: 'name', defaultColumns: ['name', 'code', 'enabled', 'order'] },
  access: publicContentAccess,
  hooks: liveHooksFor(['/planes-de-mantenimiento'], ['maintenance-plans']),
  fields: [
    { name: 'name', type: 'text', required: true },
    { name: 'code', type: 'text' },
    { name: 'image', type: 'upload', relationTo: 'media', label: 'Imagen 1' },
    { name: 'image2', type: 'upload', relationTo: 'media', label: 'Imagen 2' },
    { name: 'planImageUrl', type: 'text' },
    { name: 'planImageUrl2', type: 'text' },
    { name: 'order', type: 'number' },
    { name: 'enabled', type: 'checkbox', defaultValue: true },
  ],
}
