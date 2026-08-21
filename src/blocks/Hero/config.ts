import type { Block } from 'payload'

export const HeroBlock: Block = {
  slug: 'hero',
  labels: { singular: 'Hero', plural: 'Heroes' },
  fields: [
    { name: 'eyebrow', type: 'text', label: 'Antetítulo' },
    { name: 'title', type: 'text', required: true, label: 'Título' },
    { name: 'description', type: 'textarea', label: 'Descripción' },
    { name: 'image', type: 'upload', relationTo: 'media', label: 'Imagen' },
    { name: 'ctaLabel', type: 'text', label: 'Texto del botón' },
    { name: 'ctaHref', type: 'text', label: 'Enlace del botón' },
  ],
}
