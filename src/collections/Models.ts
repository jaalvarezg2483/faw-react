import type { CollectionConfig } from 'payload'

import { seoField } from '../fields/seo'
import { publicContentAccess } from '../lib/payload/access'
import { liveHooksFor } from './hooks/revalidate-site'

export const Models: CollectionConfig = {
  slug: 'models',
  labels: { singular: 'Modelo', plural: 'Modelos' },
  admin: { useAsTitle: 'name', defaultColumns: ['name', 'code', 'type', 'enable'] },
  access: publicContentAccess,
  hooks: liveHooksFor(
    ['/', '/home', '/models', '/cabezales', '/vagonetas', '/modelos'],
    ['models'],
  ),
  fields: [
    { name: 'name', type: 'text', required: true },
    { name: 'slug', type: 'text', required: true, unique: true },
    { name: 'code', type: 'text' },
    { name: 'type', type: 'select', options: ['Camion', 'Cabezal', 'Vagoneta'] },
    { name: 'passengers', type: 'text' },
    { name: 'transmission', type: 'text' },
    { name: 'year', type: 'number' },
    { name: 'priceBase', type: 'number' },
    { name: 'promoPrice', type: 'number' },
    { name: 'description', type: 'textarea' },
    {
      name: 'image',
      type: 'upload',
      relationTo: 'media',
      label: 'Imagen principal',
    },
    {
      name: 'urlImage',
      type: 'text',
      admin: { description: 'URL alternativa si no hay archivo en Media' },
    },
    { name: 'urlTechSpec', type: 'text' },
    {
      name: 'gallery',
      type: 'array',
      labels: { singular: 'Foto', plural: 'Galería' },
      fields: [
        { name: 'image', type: 'upload', relationTo: 'media', required: true },
        { name: 'type', type: 'text' },
        { name: 'isMain', type: 'checkbox' },
        { name: 'isActive', type: 'checkbox', defaultValue: true },
      ],
    },
    { name: 'order', type: 'number' },
    { name: 'enable', type: 'checkbox', defaultValue: true },
    { name: 'isProd', type: 'checkbox', defaultValue: true },
    { name: 'isDevelop', type: 'checkbox', defaultValue: false },
    seoField,
  ],
}
