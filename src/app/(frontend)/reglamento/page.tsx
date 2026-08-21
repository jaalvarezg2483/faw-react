import type { Metadata } from 'next'
import { SiteChrome } from '@/components/site-chrome'
import { getHomeContent } from '@/lib/content/get-home'
import { CATALOG_TITLE, HOME_DESCRIPTION } from '@/lib/content/site'

export const dynamic = 'force-dynamic'

export const metadata: Metadata = {
  title: CATALOG_TITLE,
  description: HOME_DESCRIPTION,
}

export default async function ReglamentoPage() {
  const content = await getHomeContent()
  return (
    <SiteChrome nav={content.nav}>
      <section className="interior-page">
        <div className="interior-block">
          <h1 className="interior-page__title">Reglamento</h1>
        </div>
      </section>
    </SiteChrome>
  )
}
