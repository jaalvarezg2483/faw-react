'use client'

import { AppImage } from '@/components/ui/AppImage'
import { useMemo, useState } from 'react'
import type { HomeModel } from '@/lib/content/types'
import {
  banks,
  estimateQuota,
  formatMoney,
  formatQuota,
  type BankOption,
} from '@/lib/content/banks'
import { PURDY_GO_URL, WHATSAPP_NUMBER } from '@/lib/content/site'

type Props = {
  models: HomeModel[]
  legacy?: boolean
}

function TruckIcon() {
  return (
    <svg viewBox="0 0 24 24" width="35" height="35" aria-hidden="true">
      <path
        fill="currentColor"
        d="M3 6h11v9H3V6zm12 3h3.5L21 12.5V15h-6V9zM6.5 18.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zm10 0a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"
      />
    </svg>
  )
}

function ChatIcon() {
  return (
    <svg viewBox="0 0 24 24" width="35" height="35" aria-hidden="true">
      <path fill="currentColor" d="M4 4h16v12H7l-3 3V4zm3 5v2h10V9H7z" />
    </svg>
  )
}

function WhatsAppGlyph() {
  return (
    <svg viewBox="0 0 24 24" width="35" height="35" aria-hidden="true">
      <path
        fill="currentColor"
        d="M12.04 2C6.58 2 2.15 6.43 2.15 11.89c0 1.76.46 3.4 1.27 4.82L2 22l5.44-1.42a9.86 9.86 0 0 0 4.6 1.13h.01c5.46 0 9.89-4.43 9.89-9.89C21.94 6.43 17.5 2 12.04 2zm5.75 14.07c-.24.68-1.4 1.25-1.94 1.33-.5.07-1.13.1-1.82-.11-.42-.13-.96-.31-1.65-.61-2.9-1.25-4.79-4.17-4.94-4.36-.15-.2-1.2-1.6-1.2-3.05s.76-2.16 1.03-2.46c.24-.27.64-.4 1.02-.4h.73c.23 0 .55-.09.86.66.32.77.97 2.37 1.05 2.54.09.17.14.37 0 .6l-.4.65c-.13.2-.27.36-.11.7.15.32.67 1.1 1.44 1.78.99.88 1.83 1.15 2.09 1.28.26.13.41.11.56-.07.16-.18.68-.79.86-1.06.18-.27.36-.22.61-.13l2.05.97c.24.12.4.18.46.28.06.11.06.62-.18 1.3z"
      />
    </svg>
  )
}

function BankCard({
  bank,
  price,
  selected,
  onSelect,
}: {
  bank: BankOption
  price: number
  selected: boolean
  onSelect: () => void
}) {
  const minPrima = Math.round(price * (bank.prima / 100))
  const [prima, setPrima] = useState(String(minPrima))
  const primaNumber = Number(prima.replace(/[^\d.]/g, '')) || 0
  const tooHigh = primaNumber > price
  const tooLow = primaNumber > 0 && primaNumber < minPrima
  const quota = estimateQuota(price, bank, tooHigh || tooLow ? minPrima : primaNumber)

  return (
    <article
      className={selected ? 'bank-card bank-card--selected' : 'bank-card'}
      onClick={onSelect}
    >
      <AppImage src={bank.imageUrl} alt={bank.name} />
      <div className="bank-card__row">
        <span>Tasa fija:</span>
        <strong>{bank.tasa}%</strong>
      </div>
      <div className="bank-card__row">
        <span>Prima:</span>
        <input
          value={prima}
          inputMode="numeric"
          onClick={(event) => event.stopPropagation()}
          onChange={(event) => setPrima(event.target.value)}
        />
      </div>
      {tooHigh ? (
        <p className="bank-card__warn">El monto de prima no puede ser mayor a ${price}</p>
      ) : null}
      {tooLow ? (
        <p className="bank-card__warn">El monto de prima no puede ser menor a ${minPrima}</p>
      ) : null}
      <div className="bank-card__row">
        <span>Plazo:</span>
        <label className="bank-card__plazo">
          <input type="radio" checked readOnly />
          {bank.plazos} años
        </label>
      </div>
      <div className="bank-card__box">
        <span>Cuota bancaria:</span>
        <strong>{formatQuota(quota)}</strong>
      </div>
      <p className="bank-card__monthly">Cuota mensual:</p>
      <p className="bank-card__quota">{formatQuota(quota)}</p>
      <p className="bank-card__disclaimer">{bank.disclaimer}</p>
      <p className="bank-card__reglamento">
        Revisar condiciones en <a href="/reglamento">https://www.fawtrucks.cr/reglamento</a>
      </p>
    </article>
  )
}

export function FinancePage({ models, legacy = false }: Props) {
  const [step, setStep] = useState<1 | 2>(1)
  const [selectedId, setSelectedId] = useState<string | null>(null)
  const [selectedBankId, setSelectedBankId] = useState(banks[0]?.id ?? '')
  const selected = models.find((model) => model.id === selectedId) ?? null
  const totalLabel = useMemo(() => (selected ? formatMoney(selected.priceBase) : ''), [selected])

  return (
    <section className="finance-page">
      <h1 className="finance-page__title">
        {legacy ? 'Financiamiento' : 'Calcular financiamiento'}
      </h1>
      {legacy ? (
        <div className="finance-legacy">
          <a className="btn-solid" href={PURDY_GO_URL} target="_blank" rel="noreferrer">
            Ir a PURDY GO y Reservar en Línea
          </a>
          <p>Tenemos opciones de financiamiento que se ajustan a cada necesidad.</p>
          <p>Primas bajas</p>
          <p>Plazos largos</p>
          <ul>
            <li>Prendario</li>
            <li>Leasing</li>
            <li>Renting</li>
          </ul>
          <p>
            Consultá con nuestros Asesores de Ventas sobre el crédito más conveniente para tu
            negocio.
          </p>
        </div>
      ) : null}
      <div className="stepper">
        <div className="stepper__col">
          <span className="stepper__num stepper__num--done">1</span>
          <span className="stepper__label">Camión</span>
        </div>
        <span className={step === 2 ? 'stepper__line stepper__line--on' : 'stepper__line'} />
        <div className="stepper__col">
          <span className={step === 2 ? 'stepper__num stepper__num--done' : 'stepper__num'}>2</span>
          <span className="stepper__label">Cálculo</span>
        </div>
      </div>
      {step === 1 ? (
        <>
          <p className="finance-page__lead">
            Seleccioná el modelo de tu interés para que podás agregar Planes de Mantenimiento y ver
            diferentes opciones bancarias.
          </p>
          <div className="home-models__grid">
            {models.map((model) => (
              <article key={model.id} className="model-card">
                <div className="model-card__heading">
                  <span className="model-card__bar" />
                  <h3>{model.name}</h3>
                </div>
                <p className="model-card__desde">desde</p>
                <p className="model-card__price">{model.priceLabel.replace('*', '')}</p>
                <p className="model-card__meta">{model.passengersLabel}</p>
                <span className="model-card__media">
                  <AppImage className="model-card__image" src={model.imageUrl} alt={model.name} />
                </span>
                <button
                  type="button"
                  className="btn-outline"
                  onClick={() => {
                    setSelectedId(model.id)
                    setStep(2)
                  }}
                >
                  Seleccionar
                </button>
              </article>
            ))}
          </div>
        </>
      ) : selected ? (
        <div className="finance-calc">
          <h2 className="finance-calc__model">{selected.name}</h2>
          <p className="finance-calc__detail">Detalle de al orden</p>
          <p className="finance-calc__total">Total {totalLabel}</p>
          <a className="btn-solid" href={PURDY_GO_URL} target="_blank" rel="noreferrer">
            Ir a PURDY GO y reservar en línea
          </a>
          <AppImage className="finance-calc__truck" src={selected.imageUrl} alt={selected.name} />
          <div className="entities">
            <h3>Entidades disponibles</h3>
            <div className="bank-grid">
              {banks.map((bank) => (
                <BankCard
                  key={bank.id}
                  bank={bank}
                  price={selected.priceBase}
                  selected={selectedBankId === bank.id}
                  onSelect={() => setSelectedBankId(bank.id)}
                />
              ))}
            </div>
          </div>
          <div className="finance-ctas">
            <a
              className="btn-outline btn-outline--wide"
              href={`https://wa.me/${WHATSAPP_NUMBER}?text=${encodeURIComponent(`¡Quiero solicitar Test Drive para el FAW ${selected.name}`)}`}
            >
              <TruckIcon />
              Solicitar prueba de manejo
            </a>
            <a
              className="btn-outline btn-outline--wide"
              href={`/solicitar-seguimiento?code=${encodeURIComponent(selected.code)}`}
            >
              <ChatIcon />
              Solicitar seguimiento
            </a>
            <a
              className="btn-outline btn-outline--wide"
              href={`https://wa.me/${WHATSAPP_NUMBER}?text=${encodeURIComponent(`¡Quiero RESERVAR el FAW ${selected.name}`)}`}
            >
              <WhatsAppGlyph />
              Contactar Asesor por Whatsapp
            </a>
            <a className="btn-solid" href={`/modelos/${selected.slug}`}>
              Volver al perfil
            </a>
          </div>
        </div>
      ) : null}
    </section>
  )
}
