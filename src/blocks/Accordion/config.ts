import type { Block } from 'payload'

export const AccordionBlock: Block = {
  slug: 'accordion',
  labels: { singular: 'Acordeón', plural: 'Acordeones' },
  fields: [
    { name: 'heading', type: 'text', label: 'Título' },
    {
      name: 'items',
      type: 'array',
      required: true,
      minRows: 1,
      fields: [
        { name: 'question', type: 'text', required: true, label: 'Pregunta' },
        { name: 'answer', type: 'textarea', required: true, label: 'Respuesta' },
      ],
    },
  ],
}
