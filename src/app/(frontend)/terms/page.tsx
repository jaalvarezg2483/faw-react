import type { Metadata } from 'next'
import { SiteChrome } from '@/components/site-chrome'
import { getHomeContent } from '@/lib/content/get-home'
import { TERMS_PDF } from '@/lib/content/home-fallback'
import { CATALOG_TITLE, HOME_DESCRIPTION } from '@/lib/content/site'

export const dynamic = 'force-dynamic'

export const metadata: Metadata = {
  title: CATALOG_TITLE,
  description: HOME_DESCRIPTION,
}

export default async function TermsPage() {
  const content = await getHomeContent()
  return (
    <SiteChrome nav={content.nav}>
      <section className="interior">
        <h1 className="interior__title">Términos y condiciones</h1>
        <iframe className="pdf-frame" title="Términos y condiciones" src={TERMS_PDF} />
        <a className="btn-outline" href={TERMS_PDF} target="_blank" rel="noreferrer">
          Abrir PDF
        </a>
      </section>
    </SiteChrome>
  )
}
