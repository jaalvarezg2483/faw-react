import { AppImage } from '@/components/ui/AppImage'
import {
  CENTRAL_PHONE,
  CENTRAL_TEL,
  WHATSAPP_DISPLAY,
  WHATSAPP_NUMBER,
  WA_INFO_TEXT,
} from '@/lib/content/site'
import type { SiteLocation } from '@/lib/content/types'
import { InquiryForm } from './inquiry-form'
import { LocationCard } from './location-card'

type Props = {
  locations: SiteLocation[]
  title: string
  body: string
  imageUrl: string
}

export function WorkshopsPage({ locations, title, body, imageUrl }: Props) {
  const workshops = locations.filter((item) => item.isRepairShop)

  return (
    <div className="workshops-page">
      <section className="workshops-hero">
        <div className="workshops-hero__copy">
          <h1>{title}</h1>
          <p>{body}</p>
        </div>
        <AppImage src={imageUrl} alt="" />
      </section>

      <section className="workshops-directory">
        <h2>Talleres</h2>
        <div className="location-accordion">
          {workshops.map((item) => (
            <LocationCard key={item.id} location={item} kind="Taller" />
          ))}
        </div>

        <div className="more-cards">
          <article className="more-card">
            <AppImage src="/assets/images/Taller_VW_y_Higer_1.png" alt="" />
            <h3>Planes de mantenimiento</h3>
            <a className="btn-outline btn-outline--pill" href="/planes-de-mantenimiento">
              Ver más
            </a>
          </article>
          <article className="more-card">
            <AppImage src="/assets/images/Group_1321316804.png" alt="" />
            <h3>Purdy seguros</h3>
            <a
              className="btn-outline btn-outline--pill"
              href="https://www.purdyseguros.com/es/"
              target="_blank"
              rel="noreferrer"
            >
              Ver más
            </a>
          </article>
        </div>
      </section>

      <section className="workshops-contact">
        <div className="workshops-contact__info">
          <h2>Contacto</h2>
          <p className="workshops-contact__label">Central telefónica</p>
          <a className="contact-chip" href={`tel:${CENTRAL_TEL}`}>
            <svg className="contact-chip__svg" viewBox="0 0 24 24" aria-hidden>
              <path
                fill="currentColor"
                d="M6.6 10.8c1.4 2.8 3.8 5.1 6.6 6.6l2.2-2.2c.3-.3.7-.4 1.1-.2 1.2.4 2.5.6 3.8.6.6 0 1 .4 1 1V20c0 .6-.4 1-1 1C10.6 21 3 13.4 3 4c0-.6.4-1 1-1h3.5c.6 0 1 .4 1 1 0 1.3.2 2.6.6 3.8.1.4 0 .8-.2 1.1L6.6 10.8z"
              />
            </svg>
            {CENTRAL_PHONE}
          </a>
          <p className="workshops-contact__label">Correo electrónico</p>
          <a className="contact-chip" href="mailto:ventas@grupopurdy.com">
            <svg className="contact-chip__svg" viewBox="0 0 24 24" aria-hidden>
              <path
                fill="currentColor"
                d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4-8 5-8-5V6l8 5 8-5v2z"
              />
            </svg>
            ventas@grupopurdy.com
          </a>
          <p className="workshops-contact__label">Whatsapp</p>
          <a
            className="contact-chip"
            href={`https://wa.me/${WHATSAPP_NUMBER}?text=${encodeURIComponent(WA_INFO_TEXT)}`}
          >
            <AppImage src="/assets/images/whatsappic.png" alt="" />
            {WHATSAPP_DISPLAY}
          </a>
        </div>
        <InquiryForm variant="workshops" />
      </section>
    </div>
  )
}
