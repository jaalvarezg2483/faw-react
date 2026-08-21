import type { Block } from 'payload'

export const CallToActionBlock: Block = {
  slug: 'callToAction',
  labels: { singular: 'Llamado a la acción', plural: 'Llamados a la acción' },
  fields: [
    { name: 'heading', type: 'text', required: true, label: 'Título' },
    { name: 'description', type: 'textarea', label: 'Descripción' },
    { name: 'label', type: 'text', required: true, label: 'Texto del botón' },
    { name: 'href', type: 'text', required: true, label: 'Enlace' },
  ],
}
