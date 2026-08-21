import type { Field } from 'payload'

export const seoField: Field = {
  name: 'seo',
  type: 'group',
  label: 'SEO',
  fields: [
    { name: 'metaTitle', type: 'text', maxLength: 60 },
    { name: 'metaDescription', type: 'textarea', maxLength: 160 },
    { name: 'canonicalUrl', type: 'text' },
    { name: 'noIndex', type: 'checkbox', defaultValue: false },
    { name: 'noFollow', type: 'checkbox', defaultValue: false },
    { name: 'socialImage', type: 'upload', relationTo: 'media' },
    {
      name: 'structuredData',
      type: 'json',
      admin: { description: 'JSON-LD controlado para datos estructurados de Schema.org.' },
    },
  ],
}
