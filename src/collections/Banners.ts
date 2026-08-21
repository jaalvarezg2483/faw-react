import type { CollectionConfig } from 'payload'

import { publicContentAccess } from '../lib/payload/access'
import { liveHooksFor } from './hooks/revalidate-site'

export const Banners: CollectionConfig = {
  slug: 'banners',
  labels: { singular: 'Banner', plural: 'Banners' },
  admin: { useAsTitle: 'section', defaultColumns: ['section', 'enable', 'order'] },
  access: publicContentAccess,
  hooks: liveHooksFor(['/', '/home', '/planes-de-mantenimiento'], ['home-page', 'banners']),
  fields: [
    {
      name: 'section',
      type: 'select',
      required: true,
      options: [
        { label: 'Inicio', value: 'Inicio' },
        { label: 'Planes de mantenimiento', value: 'PlanesMantenimiento' },
      ],
    },
    { name: 'alt', type: 'text' },
    { name: 'type', type: 'select', options: ['IMAGE', 'VIDEO'], defaultValue: 'IMAGE' },
    { name: 'image', type: 'upload', relationTo: 'media', label: 'Imagen desktop' },
    { name: 'imageMobile', type: 'upload', relationTo: 'media', label: 'Imagen mobile' },
    { name: 'bannerUrl', type: 'text', admin: { description: 'URL alternativa' } },
    { name: 'bannerUrlMobile', type: 'text' },
    { name: 'videoUrl', type: 'text' },
    { name: 'videoMobileUrl', type: 'text' },
    { name: 'order', type: 'number', defaultValue: 1 },
    { name: 'enable', type: 'checkbox', defaultValue: true },
  ],
}
