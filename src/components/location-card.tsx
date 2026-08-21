'use client'

import { AppImage } from '@/components/ui/AppImage'
import { useState } from 'react'
import type { SiteLocation } from '@/lib/content/types'

type Props = {
  location: SiteLocation
  kind: 'Sucursal' | 'Taller'
}

export function LocationCard({ location, kind }: Props) {
  const [open, setOpen] = useState(false)
  const hours = kind === 'Sucursal' ? location.branchHours : location.workshopHours

  return (
    <article className={open ? 'location-card location-card--open' : 'location-card'}>
      <button
        type="button"
        className="location-card__header"
        onClick={() => setOpen((value) => !value)}
      >
        <span className="location-card__plus" aria-hidden>
          {open ? '−' : '+'}
        </span>
        <span className="location-card__name">{location.name}</span>
      </button>

      {open ? (
        <div className="location-card__body">
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

          <div className="location-card__meta">
            {location.phone ? (
              <p>
                <a href={`tel:${location.phone.replace(/[^\d+]/g, '')}`}>
                  Teléfono: {location.phone}
                </a>
              </p>
            ) : null}
            {hours ? <p className="location-card__hours">{hours}</p> : null}
          </div>

          {location.specialities.length > 0 ? (
            <div className="location-card__services">
              <p>Servicios que encontrarás en esta sucursal:</p>
              <ul>
                {location.specialities.map((item) => (
                  <li key={item}>- {item}</li>
                ))}
              </ul>
            </div>
          ) : null}

          {location.address ? <p className="location-card__address">{location.address}</p> : null}
        </div>
      ) : null}
    </article>
  )
}
