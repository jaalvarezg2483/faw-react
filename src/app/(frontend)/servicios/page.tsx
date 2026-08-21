import { AppImage } from '@/components/ui/AppImage'
import type { Metadata } from 'next'
import { SiteChrome } from '@/components/site-chrome'
import { getHomeContent } from '@/lib/content/get-home'
import { CATALOG_TITLE, HOME_DESCRIPTION } from '@/lib/content/site'

export const dynamic = 'force-dynamic'

export const metadata: Metadata = {
  title: CATALOG_TITLE,
  description: HOME_DESCRIPTION,
}

export default async function ServiciosPage() {
  const content = await getHomeContent()
  return (
    <SiteChrome nav={content.nav} ethics={content.ethics}>
      <section className="interior-page services-page">
        <div className="interior-block interior-block--gray">
          <h1 className="interior-page__title">{content.copy.servicesPage.title}</h1>
          <p className="interior-page__body">{content.copy.servicesPage.body}</p>
          <div className="services-page__grid">
            {content.services.cards.map((card) => (
              <article key={card.id} className="service-tile">
                <AppImage src={card.imageUrl} alt="" />
                <h3>{card.title}</h3>
                <a
                  className="btn-outline btn-outline--pill"
                  href={card.href}
                  {...(card.external ? { target: '_blank', rel: 'noopener noreferrer' } : {})}
                >
                  Ver más
                </a>
              </article>
            ))}
          </div>
        </div>
      </section>
    </SiteChrome>
  )
}
