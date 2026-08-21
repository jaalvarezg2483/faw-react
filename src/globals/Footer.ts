import type { GlobalConfig } from 'payload'

import { afterChangeGlobalRevalidate } from '../collections/hooks/revalidate-site'
import { publicGlobalAccess } from '../lib/payload/access'

export const Footer: GlobalConfig = {
  slug: 'footer',
  label: 'Pie de página',
  access: publicGlobalAccess,
  hooks: { afterChange: [afterChangeGlobalRevalidate] },
  fields: [
    { name: 'legalText', type: 'textarea' },
    {
      name: 'socialLinks',
      type: 'array',
      fields: [
        { name: 'label', type: 'text', required: true },
        { name: 'url', type: 'text', required: true },
      ],
    },
  ],
}
