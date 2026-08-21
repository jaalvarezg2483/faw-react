import { AppImage } from '@/components/ui/AppImage'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
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
    title: model ? `Galería ${model.name} | Faw Trucks Costa Rica | Grupo Purdy` : CATALOG_TITLE,
    description: HOME_DESCRIPTION,
  }
}

export default async function ModelGalleryPage({ params }: Props) {
  const { slug } = await params
  const [content, model] = await Promise.all([getHomeContent(), getModelBySlug(slug)])
  if (!model) notFound()
  return (
    <SiteChrome nav={content.nav} ethics={content.ethics}>
      <section className="interior model-detail">
        <h1 className="interior__title">Galería</h1>
        <p>{model.name}</p>
        <AppImage className="model-detail__image" src={model.imageUrl} alt={model.name} />
        <p className="model-detail__note">*Imágenes con fines ilustrativos.</p>
        <a className="btn-outline" href={`/modelos/${model.slug}`}>
          Volver
        </a>
      </section>
    </SiteChrome>
  )
}
