import type { GlobalConfig } from 'payload'

import { afterChangeGlobalRevalidate } from '../collections/hooks/revalidate-site'
import { publicGlobalAccess } from '../lib/payload/access'

export const Header: GlobalConfig = {
  slug: 'header',
  label: 'Encabezado',
  access: publicGlobalAccess,
  hooks: { afterChange: [afterChangeGlobalRevalidate] },
  fields: [
    { name: 'logo', type: 'upload', relationTo: 'media' },
    {
      name: 'navigation',
      type: 'relationship',
      relationTo: 'nav-items',
      hasMany: true,
    },
  ],
}
