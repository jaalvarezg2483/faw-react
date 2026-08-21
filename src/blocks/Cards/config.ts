import type { Block } from 'payload'

export const CardsBlock: Block = {
  slug: 'cards',
  labels: { singular: 'Tarjetas', plural: 'Tarjetas' },
  fields: [
    { name: 'heading', type: 'text', label: 'Título' },
    {
      name: 'items',
      type: 'array',
      required: true,
      minRows: 1,
      fields: [
        { name: 'title', type: 'text', required: true, label: 'Título' },
        { name: 'description', type: 'textarea', label: 'Descripción' },
        { name: 'image', type: 'upload', relationTo: 'media', label: 'Imagen' },
        { name: 'href', type: 'text', label: 'Enlace' },
      ],
    },
  ],
}
