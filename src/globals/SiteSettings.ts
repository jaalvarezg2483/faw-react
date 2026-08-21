import type { GlobalConfig } from 'payload'

import { afterChangeGlobalRevalidate } from '../collections/hooks/revalidate-site'
import { seoField } from '../fields/seo'
import { publicGlobalAccess } from '../lib/payload/access'

export const SiteSettings: GlobalConfig = {
  slug: 'site-settings',
  label: 'Textos del sitio',
  access: publicGlobalAccess,
  hooks: {
    afterChange: [afterChangeGlobalRevalidate],
  },
  fields: [
    {
      type: 'group',
      name: 'ethics',
      label: 'Línea ética',
      fields: [
        { name: 'text', type: 'textarea' },
        { name: 'ctaLabel', type: 'text' },
        { name: 'href', type: 'text' },
      ],
    },
    {
      type: 'group',
      name: 'servicesPage',
      label: 'Página Servicios',
      fields: [
        { name: 'title', type: 'text' },
        { name: 'body', type: 'textarea' },
      ],
    },
    {
      type: 'group',
      name: 'plansPage',
      label: 'Página Planes',
      fields: [
        { name: 'title', type: 'text' },
        { name: 'intro', type: 'textarea' },
      ],
    },
    {
      type: 'group',
      name: 'workshopsPage',
      label: 'Página Talleres',
      fields: [
        { name: 'title', type: 'text' },
        { name: 'body', type: 'textarea' },
        { name: 'image', type: 'upload', relationTo: 'media' },
      ],
    },
    seoField,
  ],
}
