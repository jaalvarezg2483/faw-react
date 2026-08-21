import type { GlobalConfig } from 'payload'

import { afterChangeGlobalRevalidate } from '../collections/hooks/revalidate-site'
import { seoField } from '../fields/seo'
import { publicGlobalAccess } from '../lib/payload/access'

export const HomePage: GlobalConfig = {
  slug: 'home-page',
  label: 'Página de inicio',
  access: publicGlobalAccess,
  hooks: { afterChange: [afterChangeGlobalRevalidate] },
  fields: [
    { name: 'heading', type: 'text' },
    { name: 'intro', type: 'textarea' },
    {
      name: 'featuredModels',
      type: 'relationship',
      relationTo: 'models',
      hasMany: true,
    },
    seoField,
  ],
}
