'use client'

import { AppImage } from '@/components/ui/AppImage'
import { useState } from 'react'

import type { MaintenancePlan } from '@/lib/content/types'
import { WA_INFO_TEXT, WHATSAPP_NUMBER } from '@/lib/content/site'

const INTRO = `Los planes de mantenimiento preventivos de GRUPO PURDY ayudan para que tu FAW siga funcionando de manera óptima.

Lo mejor de todo es que, si comprás tu plan de mantenimiento preventivo, podés evitar costos más elevados de servicios o repuestos en el futuro y obtener estos servicios a precios especiales.

Contar con un plan de mantenimiento te traerá múltiples beneficios como:`

const BENEFITS = [
  { title: 'AHORRO:', text: '15% a 20% de descuento en el precio del plan.' },
  {
    title: 'DESCUENTO ESPECIALES:',
    text: '10% de descuento sobre repuestos y mano de obra requeridos durante la vigencia del plan.',
  },
  { title: 'ESTABILIDAD DE PRECIO:', text: 'sin incremento de precios durante el plan.' },
  {
    title: 'SALDO TRANSFERIBLE:',
    text: 'al comprar un nuevo vehículo en GRUPO PURDY o una renovación de tu plan.',
  },
  { title: 'COBERTURA:', text: 'acceso a todos los talleres de planta y móviles del grupo.' },
  { title: 'TALLER MÓVIL:', text: 'sin costo para los servicios incluidos en el plan.' },
]

const CHECKS = [
  'Diseñados por el fabricante según los requerimientos técnicos y especificaciones de tu vehículo. ',
  'Aseguran que tu vehículo tendrá un rendimiento óptimo y seguro.',
  'Alarga la vida útil de las piezas de desgaste cuidando tu bolsillo.',
  'Se realizan con materiales y repuestos originales con el mejor rendimiento y durabilidad.',
  'Son realizados por técnicos expertos, capacitados y certificados por el fabricante.',
]

function PlanRow({ plan }: { plan: MaintenancePlan }) {
  const [open, setOpen] = useState(false)
  const images = [plan.imageUrl, plan.imageUrl2].filter(Boolean) as string[]

  return (
    <article className={open ? 'plans-row plans-row--open' : 'plans-row'}>
      <button
        type="button"
        className="plans-row__header"
        onClick={() => setOpen((value) => !value)}
      >
        <span className="plans-row__plus" aria-hidden>
          {open ? '−' : '+'}
        </span>
        <span className="plans-row__name">{plan.name}</span>
      </button>
      {open && images.length > 0 ? (
        <div className="plans-row__body">
          {images.map((src) => (
            <AppImage key={src} src={src} alt={plan.name} />
          ))}
        </div>
      ) : null}
    </article>
  )
}

type Props = {
  title: string
  intro: string
  bannerUrl: string
  plans: MaintenancePlan[]
}

export function PlansPage({ title, intro, bannerUrl, plans }: Props) {
  return (
    <div className="plans-page">
      <section className="plans-hero" aria-label="Banner">
        <AppImage
          src={bannerUrl}
          alt="LÍDER EN CAMIONES POR MÁS DE 70 DE AÑOS Y AHORA CON RESPALDO DE GRUPO PURDY"
        />
      </section>

      <section className="plans-intro">
        <h1 className="plans-intro__title">{title}</h1>
        <p className="plans-intro__body">{intro || INTRO}</p>
        <div className="plans-intro__benefits">
          {BENEFITS.map((item) => (
            <p key={item.title}>
              <strong>• {item.title} </strong>
              {item.text}
            </p>
          ))}
          <p>
            Además de estos beneficios comerciales, nuestros planes de mantenimiento tienen
            características de mucha importancia.
          </p>
        </div>
      </section>

      <section className="plans-benefits">
        <h2 className="plans-intro__title">Beneficios</h2>
        <ul className="check-list">
          {CHECKS.map((item) => (
            <li key={item}>
              <AppImage src="/assets/images/shield-check_1.png" alt="" />
              <span>{item}</span>
            </li>
          ))}
        </ul>
        <h3 className="plans-page__kicker">OPCIONES DE PAGO</h3>
        <p className="plans-page__list">
          {`• Por medio de transferencia bancaria o en nuestras sucursales.
• Por medio de envío de link de pago para su tarjeta de crédito o débito.`}
        </p>
        <h3 className="plans-page__kicker">FINANCIAMIENTOS CAFSA:</h3>
        <p className="plans-page__list">
          {`• 4 ó 6 meses sin intereses.
• Purdy Cuotas hasta 36 meses`}
        </p>
      </section>

      <section className="plans-picker">
        <h2 className="plans-page__title">Planes de mantenimiento disponible para que escojás: </h2>
        <div className="plans-accordion">
          {plans.map((plan) => (
            <PlanRow key={plan.id} plan={plan} />
          ))}
        </div>
      </section>

      <div className="plans-page__cta">
        <a
          className="btn-outline btn-outline--pill"
          href={`https://wa.me/${WHATSAPP_NUMBER}?text=${encodeURIComponent(WA_INFO_TEXT)}`}
        >
          Contactar con un asesor
        </a>
      </div>
    </div>
  )
}
