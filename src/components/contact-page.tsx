'use client'

import { useState } from 'react'
import {
  CENTRAL_PHONE,
  CENTRAL_TEL,
  MAPS_URL,
  SALES_EMAIL,
  WHATSAPP_DISPLAY,
  WHATSAPP_NUMBER,
  WORKSHOP_ADDRESS,
  WA_INFO_TEXT,
} from '@/lib/content/site'
import type { SiteLocation } from '@/lib/content/types'
import { InquiryForm } from './inquiry-form'
import { LocationCard } from './location-card'

type Tab = 'contacto' | 'sucursales' | 'talleres'

type Props = {
  locations: SiteLocation[]
}

export function ContactPage({ locations }: Props) {
  const [tab, setTab] = useState<Tab>('contacto')

  return (
    <section className="contact-page">
      <h1 className="contact-page__title">Contactanos:</h1>
      <div className="pills" role="tablist">
        <button
          type="button"
          className={tab === 'contacto' ? 'pill pill--active' : 'pill'}
          onClick={() => setTab('contacto')}
        >
          Contacto
        </button>
        <button
          type="button"
          className={tab === 'sucursales' ? 'pill pill--active' : 'pill'}
          onClick={() => setTab('sucursales')}
        >
          Sucursales
        </button>
        <button
          type="button"
          className={tab === 'talleres' ? 'pill pill--active' : 'pill'}
          onClick={() => setTab('talleres')}
        >
          Talleres
        </button>
      </div>

      {tab === 'contacto' ? (
        <div className="contact-grid">
          <div className="contact-info">
            <p>
              <span>WhatsApp</span>
              <a href={`https://wa.me/${WHATSAPP_NUMBER}?text=${encodeURIComponent(WA_INFO_TEXT)}`}>
                {WHATSAPP_DISPLAY}
              </a>
            </p>
            <p>
              <span>Central teléfonica</span>
              <a href={`tel:${CENTRAL_TEL}`}>{CENTRAL_PHONE}</a>
            </p>
            <p>
              <span>Correo electrónico</span>
              <a href={`mailto:${SALES_EMAIL}`}>{SALES_EMAIL}</a>
            </p>
            <p>
              <span>Dirección de Taller</span>
              <a href={MAPS_URL} target="_blank" rel="noreferrer">
                {WORKSHOP_ADDRESS}
              </a>
            </p>
          </div>
          <InquiryForm />
        </div>
      ) : (
        <div className="location-accordion location-accordion--contact">
          {locations
            .filter((item) => (tab === 'sucursales' ? item.isBranchOffice : item.isRepairShop))
            .map((item) => (
              <LocationCard
                key={item.id}
                location={item}
                kind={tab === 'sucursales' ? 'Sucursal' : 'Taller'}
              />
            ))}
        </div>
      )}
    </section>
  )
}
