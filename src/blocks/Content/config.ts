import type { Block } from 'payload'

export const ContentBlock: Block = {
  slug: 'content',
  labels: { singular: 'Contenido', plural: 'Contenidos' },
  fields: [
    { name: 'heading', type: 'text', label: 'Título' },
    { name: 'body', type: 'textarea', required: true, label: 'Contenido' },
    {
      name: 'alignment',
      type: 'select',
      defaultValue: 'left',
      options: [
        { label: 'Izquierda', value: 'left' },
        { label: 'Centro', value: 'center' },
      ],
    },
  ],
}
