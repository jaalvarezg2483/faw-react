import type { Metadata } from 'next'
import { SiteChrome } from '@/components/site-chrome'
import { getHomeContent } from '@/lib/content/get-home'
import { COOKIES_PDF } from '@/lib/content/home-fallback'
import { CATALOG_TITLE, HOME_DESCRIPTION } from '@/lib/content/site'

export const dynamic = 'force-dynamic'

export const metadata: Metadata = {
  title: CATALOG_TITLE,
  description: HOME_DESCRIPTION,
}

export default async function CookiesPage() {
  const content = await getHomeContent()
  return (
    <SiteChrome nav={content.nav}>
      <section className="interior">
        <h1 className="interior__title">Cookies</h1>
        <iframe className="pdf-frame" title="Política de cookies" src={COOKIES_PDF} />
        <a className="btn-outline" href={COOKIES_PDF} target="_blank" rel="noreferrer">
          Abrir PDF
        </a>
      </section>
    </SiteChrome>
  )
}
