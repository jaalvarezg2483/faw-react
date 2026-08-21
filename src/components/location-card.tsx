'use client'

import { AppImage } from '@/components/ui/AppImage'
import { useState } from 'react'
import type { SiteLocation } from '@/lib/content/types'

type Props = {
  location: SiteLocation
  kind: 'Sucursal' | 'Taller'
}

function PhoneIcon() {
  return (
    <svg viewBox="0 0 24 24" width="22" height="22" aria-hidden>
      <path
        fill="currentColor"
        d="M6.6 10.8c1.4 2.8 3.8 5.1 6.6 6.6l2.2-2.2c.3-.3.7-.4 1.1-.2 1.2.4 2.5.6 3.8.6.6 0 1 .4 1 1V20c0 .6-.4 1-1 1C10.6 21 3 13.4 3 4c0-.6.4-1 1-1h3.5c.6 0 1 .4 1 1 0 1.3.2 2.6.6 3.8.1.4 0 .8-.2 1.1L6.6 10.8z"
      />
    </svg>
  )
}

function ServiceIcon() {
  return (
    <svg viewBox="0 0 24 24" width="22" height="22" aria-hidden>
      <path
        fill="currentColor"
        d="M12 12a4 4 0 1 0-4-4 4 4 0 0 0 4 4zm-7 8v-1.2A5.8 5.8 0 0 1 10.8 13h2.4A5.8 5.8 0 0 1 19 18.8V20H5zm14.7-9.3 1.4-1.4-1.4-1.4.9-.9 1.4 1.4 1.4-1.4.9.9-1.4 1.4 1.4 1.4-.9.9-1.4-1.4-1.4 1.4-.9-.9z"
      />
    </svg>
  )
}

function ClockIcon() {
  return (
    <svg viewBox="0 0 24 24" width="22" height="22" aria-hidden>
      <path
        fill="currentColor"
        d="M12 2a10 10 0 1 0 10 10A10 10 0 0 0 12 2zm1 11H7.5V11H11V6h2z"
      />
    </svg>
  )
}

function PinIcon() {
  return (
    <svg viewBox="0 0 24 24" width="22" height="22" aria-hidden>
      <path
        fill="currentColor"
        d="M12 2a7 7 0 0 0-7 7c0 5.25 7 13 7 13s7-7.75 7-13a7 7 0 0 0-7-7zm0 9.5A2.5 2.5 0 1 1 14.5 9 2.5 2.5 0 0 1 12 11.5z"
      />
    </svg>
  )
}

function mapsEmbedUrl(location: SiteLocation) {
  const query = location.address || location.name
  return `https://maps.google.com/maps?q=${encodeURIComponent(query)}&hl=es&z=16&output=embed`
}

export function LocationCard({ location, kind }: Props) {
  const [open, setOpen] = useState(false)
  const hours = kind === 'Sucursal' ? location.branchHours : location.workshopHours
  const phoneLabel = location.phone.replace(/^\(\+506\)\s*/, '')

  return (
    <article className={open ? 'location-card location-card--open' : 'location-card'}>
      <button
        type="button"
        className="location-card__header"
        aria-expanded={open}
        onClick={() => setOpen((value) => !value)}
      >
        <span className="location-card__plus" aria-hidden>
          {open ? '−' : '+'}
        </span>
        <span className="location-card__name">{location.name}</span>
      </button>

      {open ? (
        <div className="location-card__body">
          <iframe
            className="location-card__embed"
            title={`Mapa de ${location.name}`}
            src={mapsEmbedUrl(location)}
            loading="lazy"
            referrerPolicy="no-referrer-when-downgrade"
          />

          <div className="location-card__maps">
            {location.googleLink ? (
              <a
                href={location.googleLink}
                target="_blank"
                rel="noreferrer"
                className="location-card__map"
              >
                <AppImage src="/assets/images/Google_Maps_Logo.svg.png" alt="Google Maps" />
              </a>
            ) : null}
            {location.wazeLink ? (
              <a
                href={location.wazeLink}
                target="_blank"
                rel="noreferrer"
                className="location-card__map"
              >
                <AppImage src="/assets/images/Waze.png" alt="Waze" />
              </a>
            ) : null}
            {location.appleMapsLink ? (
              <a
                href={location.appleMapsLink}
                target="_blank"
                rel="noreferrer"
                className="location-card__map"
              >
                <AppImage src="/assets/images/apple-maps-wordmark.svg" alt="Apple Maps" />
              </a>
            ) : null}
          </div>

          <div className="location-card__details">
            <div className="location-card__col">
              {location.phone ? (
                <p className="location-card__line">
                  <PhoneIcon />
                  <a href={`tel:${location.phone.replace(/[^\d+]/g, '')}`}>
                    Teléfono: {phoneLabel}
                  </a>
                </p>
              ) : null}
              {location.specialities.length > 0 ? (
                <div className="location-card__services">
                  <p className="location-card__line">
                    <ServiceIcon />
                    <span>Servicios que encontrarás en esta sucursal:</span>
                  </p>
                  <ul>
                    {location.specialities.map((item) => (
                      <li key={item}>- {item}</li>
                    ))}
                  </ul>
                </div>
              ) : null}
            </div>
            <div className="location-card__col">
              {hours ? (
                <p className="location-card__line">
                  <ClockIcon />
                  <span>{hours}</span>
                </p>
              ) : null}
              {location.address ? (
                <p className="location-card__line">
                  <PinIcon />
                  <span>{location.address}</span>
                </p>
              ) : null}
            </div>
          </div>
        </div>
      ) : null}
    </article>
  )
}
