import type { Metadata } from 'next'
import { SiteChrome } from '@/components/site-chrome'
import { getHomeContent } from '@/lib/content/get-home'
import { COOKIES_PDF } from '@/lib/content/home-fallback'

export const dynamic = 'force-dynamic'

export const metadata: Metadata = {
  title: 'Contactanos | Faw Trucks Costa Rica | Grupo Purdy',
  description:
    'Contactanos en Faw Trucks Costa Rica con el respaldo de Grupo Purdy. ¡Escribinos hoy y llevá tu negocio al siguiente nivel!',
}

export default async function SitemapPage() {
  const content = await getHomeContent()
  return (
    <SiteChrome nav={content.nav}>
      <section className="sitemap-page">
        <h1 className="sitemap-page__title">Mapa del sitio</h1>

        <section className="sitemap-block">
          <h2>Vehículos</h2>
          <span className="sitemap-block__rule" />
          <div className="sitemap-grid sitemap-grid--models">
            {content.models.map((model) => (
              <a key={model.id} href={`/modelos/${model.slug}`}>
                {model.name}
              </a>
            ))}
          </div>
        </section>

        <section className="sitemap-block">
          <h2>Contactanos</h2>
          <span className="sitemap-block__rule" />
          <div className="sitemap-grid sitemap-grid--contact">
            <a href="/contactenos">Contactanos</a>
            <a href="/talleres">Sucursales</a>
            <a href="/talleres">Talleres</a>
          </div>
        </section>

        <section className="sitemap-block">
          <h2>Adicionales</h2>
          <span className="sitemap-block__rule" />
          <div className="sitemap-grid sitemap-grid--extra">
            <a href="/financiamiento">Calcular financiamiento</a>
            <a href="/terms">Términos y condiciones</a>
            <a href="/reglamento">Reglamento</a>
            <a href={COOKIES_PDF} target="_blank" rel="noreferrer">
              Cookies
            </a>
          </div>
        </section>
      </section>
    </SiteChrome>
  )
}
