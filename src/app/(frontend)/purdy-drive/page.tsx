import { AppImage } from '@/components/ui/AppImage'
import type { Metadata } from 'next'
import { SiteChrome } from '@/components/site-chrome'
import { getHomeContent } from '@/lib/content/get-home'
import {
  CATALOG_TITLE,
  HOME_DESCRIPTION,
  WA_POSTVENTA_TEXT,
  WHATSAPP_NUMBER,
} from '@/lib/content/site'

export const dynamic = 'force-dynamic'

export const metadata: Metadata = {
  title: CATALOG_TITLE,
  description: HOME_DESCRIPTION,
}

const HERO_COPY = `Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim `

const TIP =
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamc'

export default async function PurdyDrivePage() {
  const content = await getHomeContent()
  return (
    <SiteChrome nav={content.nav}>
      <div className="interior-page">
        <section className="workshops-hero">
          <div className="workshops-hero__copy">
            <h1>Purdy Drive</h1>
            <p>{HERO_COPY}</p>
          </div>
          <AppImage src="https://picsum.photos/seed/483/600" alt="" />
        </section>
        <section className="interior-block">
          <h2 className="interior-page__subtitle">Aprendé con nosotros lo mejores tips sobre:</h2>
          <ul className="check-list">
            <li>
              <AppImage src="/assets/images/shield-check_1.png" alt="" />
              <span>{TIP}</span>
            </li>
            <li>
              <AppImage src="/assets/images/shield-check_1.png" alt="" />
              <span>{TIP}</span>
            </li>
            <li>
              <AppImage src="/assets/images/shield-check_1.png" alt="" />
              <span>{TIP}</span>
            </li>
            <li>
              <AppImage src="/assets/images/shield-check_1.png" alt="" />
              <span>{TIP}</span>
            </li>
          </ul>
          <a
            className="btn-solid btn-solid--wide"
            href={`https://wa.me/${WHATSAPP_NUMBER}?text=${encodeURIComponent(WA_POSTVENTA_TEXT)}`}
          >
            ¡Consultá con Post Venta!
          </a>
        </section>
      </div>
    </SiteChrome>
  )
}
