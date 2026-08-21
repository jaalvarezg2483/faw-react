import type { CollectionConfig } from 'payload'

import { publicContentAccess } from '../lib/payload/access'
import { liveHooksFor } from './hooks/revalidate-site'

export const Locations: CollectionConfig = {
  slug: 'locations',
  labels: { singular: 'Ubicación', plural: 'Ubicaciones' },
  admin: {
    useAsTitle: 'name',
    defaultColumns: ['name', 'isBranchOffice', 'isRepairShop', 'isActive'],
  },
  access: publicContentAccess,
  hooks: liveHooksFor(['/contactenos', '/talleres'], ['locations']),
  fields: [
    { name: 'name', type: 'text', required: true },
    { name: 'address', type: 'textarea' },
    { name: 'phone', type: 'text' },
    { name: 'branchHours', type: 'textarea' },
    { name: 'workshopHours', type: 'textarea' },
    { name: 'googleLink', type: 'text' },
    { name: 'wazeLink', type: 'text' },
    { name: 'appleMapsLink', type: 'text' },
    { name: 'specialities', type: 'textarea', admin: { description: 'Una por línea' } },
    { name: 'isBranchOffice', type: 'checkbox', defaultValue: false },
    { name: 'isRepairShop', type: 'checkbox', defaultValue: false },
    { name: 'isActive', type: 'checkbox', defaultValue: true },
    { name: 'order', type: 'number' },
  ],
}
