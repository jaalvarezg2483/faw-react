import type { CollectionConfig } from 'payload'

import { publicContentAccess } from '../lib/payload/access'
import { liveHooksFor } from './hooks/revalidate-site'

export const NavItems: CollectionConfig = {
  slug: 'nav-items',
  labels: { singular: 'Ítem de menú', plural: 'Menú' },
  admin: { useAsTitle: 'name', defaultColumns: ['name', 'urlLink', 'enable', 'order'] },
  access: publicContentAccess,
  hooks: liveHooksFor(['/'], ['header', 'navigation']),
  fields: [
    { name: 'name', type: 'text', required: true },
    { name: 'urlLink', type: 'text' },
    { name: 'isLink', type: 'checkbox', defaultValue: true },
    { name: 'isSectionHeader', type: 'checkbox', defaultValue: false },
    { name: 'parent', type: 'relationship', relationTo: 'nav-items' },
    { name: 'enable', type: 'checkbox', defaultValue: true },
    { name: 'order', type: 'number' },
  ],
}
