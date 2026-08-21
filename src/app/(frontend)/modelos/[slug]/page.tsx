import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { ModelDetail } from '@/components/model-detail'
import { SiteChrome } from '@/components/site-chrome'
import { getHomeContent, getModelBySlug } from '@/lib/content/get-home'
import { CATALOG_TITLE, HOME_DESCRIPTION } from '@/lib/content/site'

export const dynamic = 'force-dynamic'

type Props = {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params
  const model = await getModelBySlug(slug)
  return {
    title: model ? `${model.name} | Faw Trucks Costa Rica | Grupo Purdy` : CATALOG_TITLE,
    description: HOME_DESCRIPTION,
  }
}

export default async function ModelPage({ params }: Props) {
  const { slug } = await params
  const [content, model] = await Promise.all([getHomeContent(), getModelBySlug(slug)])
  if (!model) notFound()
  return (
    <SiteChrome nav={content.nav} ethics={content.ethics}>
      <ModelDetail model={model} />
    </SiteChrome>
  )
}
