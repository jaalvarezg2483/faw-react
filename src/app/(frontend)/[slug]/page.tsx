import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { getPayload } from 'payload'
import config from '@payload-config'

import { RenderBlocks } from '@/components/blocks/RenderBlocks'
import { SiteChrome } from '@/components/site-chrome'
import { getHomeContent } from '@/lib/content/get-home'
import { CATALOG_TITLE } from '@/lib/content/site'

export const dynamic = 'force-dynamic'

type Props = { params: Promise<{ slug: string }> }

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params
  const page = await findPublishedPage(slug)
  if (!page) return { title: CATALOG_TITLE }
  return { title: `${page.title} | FAW Trucks`, description: page.title }
}

export default async function CmsPage({ params }: Props) {
  const { slug } = await params
  const page = await findPublishedPage(slug)
  if (!page) notFound()

  const content = await getHomeContent()
  return (
    <SiteChrome nav={content.nav} ethics={content.ethics}>
      <RenderBlocks blocks={page.layout} />
    </SiteChrome>
  )
}

async function findPublishedPage(slug: string) {
  const payload = await getPayload({ config })
  const result = await payload.find({
    collection: 'pages',
    where: {
      and: [{ slug: { equals: slug } }, { _status: { equals: 'published' } }],
    },
    limit: 1,
    depth: 2,
  })
  return result.docs[0] ?? null
}
