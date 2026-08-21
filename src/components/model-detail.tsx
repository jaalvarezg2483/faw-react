'use client'

import { AppImage } from '@/components/ui/AppImage'
import { useState } from 'react'
import type { HomeModel } from '@/lib/content/types'
import { PURDY_GO_URL, WHATSAPP_NUMBER } from '@/lib/content/site'

type Tab = 'exterior' | 'ficha' | 'destacadas' | 'galeria'

type Props = {
  model: HomeModel
}

export function ModelDetail({ model }: Props) {
  const [tab, setTab] = useState<Tab>('exterior')
  const label =
    model.kind === 'Cabezal' ? 'Cabezal' : model.kind === 'Vagoneta' ? 'Vagoneta' : 'Camion'

  return (
    <section className="interior model-detail">
      <p className="model-detail__kind">{label} Exterior</p>
      <h1 className="interior__title">{model.name}</h1>
      <p className="model-card__desde">Desde </p>
      <p className="model-card__price">{model.priceLabel}</p>
      <p className="model-card__meta">{model.passengersLabel}</p>
      <p className="model-card__meta">{model.code}</p>
      <AppImage className="model-detail__image" src={model.imageUrl} alt={model.name} />
      <p className="model-detail__note">*Imágenes con fines ilustrativos.</p>
      <div className="pills">
        <button
          type="button"
          className={tab === 'exterior' ? 'pill pill--active' : 'pill'}
          onClick={() => setTab('exterior')}
        >
          {label} Exterior
        </button>
        <button
          type="button"
          className={tab === 'ficha' ? 'pill pill--active' : 'pill'}
          onClick={() => setTab('ficha')}
        >
          Ficha Técnica
        </button>
        <button
          type="button"
          className={tab === 'destacadas' ? 'pill pill--active' : 'pill'}
          onClick={() => setTab('destacadas')}
        >
          Características destacadas
        </button>
        <a
          className={tab === 'galeria' ? 'pill pill--active' : 'pill'}
          href={`/modelos/${model.slug}/galeria`}
        >
          Galería
        </a>
      </div>
      {tab === 'ficha' ? (
        model.techSpecUrl ? (
          <a className="btn-outline" href={model.techSpecUrl} target="_blank" rel="noreferrer">
            Ficha Técnica
          </a>
        ) : (
          <p>Consultá la ficha técnica con un asesor.</p>
        )
      ) : null}
      {tab === 'destacadas' ? <p>{model.description || 'Características destacadas'}</p> : null}
      <div className="finance-ctas">
        <a className="btn-solid" href={PURDY_GO_URL} target="_blank" rel="noreferrer">
          Ir a PURDY GO y Reservar en Línea
        </a>
        <a
          className="btn-outline btn-outline--wide"
          href={`https://wa.me/${WHATSAPP_NUMBER}?text=${encodeURIComponent(`¡Quiero RESERVAR el FAW ${model.name}`)}`}
        >
          Negociá tu vehículo aquí
        </a>
        <a
          className="btn-outline btn-outline--wide"
          href={`https://wa.me/${WHATSAPP_NUMBER}?text=${encodeURIComponent(`¡Quiero solicitar Test Drive para el FAW ${model.name}`)}`}
        >
          Contactar con un asesor
        </a>
      </div>
    </section>
  )
}
