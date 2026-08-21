import { SiteChrome } from '@/components/site-chrome'

export default function NotFound() {
  return (
    <SiteChrome>
      <section className="interior">
        <h1 className="interior__title">Página no encontrada</h1>
        <a className="btn-outline" href="/home">
          Inicio
        </a>
      </section>
    </SiteChrome>
  )
}
