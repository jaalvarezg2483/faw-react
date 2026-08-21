import type { CollectionConfig } from 'payload'

import { AccordionBlock } from '../blocks/Accordion/config'
import { CallToActionBlock } from '../blocks/CallToAction/config'
import { CardsBlock } from '../blocks/Cards/config'
import { ContentBlock } from '../blocks/Content/config'
import { HeroBlock } from '../blocks/Hero/config'
import { MediaBlock } from '../blocks/Media/config'
import { seoField } from '../fields/seo'
import { adminsOnly, authenticated } from '../lib/payload/access'
import { liveHooksFor } from './hooks/revalidate-site'

export const Pages: CollectionConfig = {
  slug: 'pages',
  labels: { singular: 'Página', plural: 'Páginas' },
  admin: { useAsTitle: 'title', defaultColumns: ['title', 'slug', '_status', 'updatedAt'] },
  access: {
    read: ({ req }) => (req.user ? true : { _status: { equals: 'published' } }),
    create: authenticated,
    update: authenticated,
    delete: adminsOnly,
  },
  hooks: liveHooksFor(['/'], ['pages']),
  versions: { drafts: { autosave: true }, maxPerDoc: 20 },
  fields: [
    { name: 'title', type: 'text', required: true, label: 'Título' },
    {
      name: 'slug',
      type: 'text',
      required: true,
      unique: true,
      index: true,
      admin: { description: 'Ruta sin diagonales, por ejemplo: nosotros' },
    },
    {
      name: 'layout',
      type: 'blocks',
      required: true,
      minRows: 1,
      blocks: [HeroBlock, ContentBlock, MediaBlock, CardsBlock, AccordionBlock, CallToActionBlock],
    },
    seoField,
  ],
}
