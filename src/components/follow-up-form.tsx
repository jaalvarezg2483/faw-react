'use client'

import { zodResolver } from '@hookform/resolvers/zod'
import { useState } from 'react'
import { Controller, useForm, useWatch } from 'react-hook-form'
import type { HomeModel } from '@/lib/content/types'
import { banks, estimateQuota, type BankOption } from '@/lib/content/banks'
import {
  followUpSchema,
  type FollowUpFormValues,
} from '@/features/finance/schemas/follow-up.schema'

type IdType = 'fisica' | 'juridica' | 'dimex' | 'pasaporte' | 'otro'

const ID_OPTIONS: { value: IdType; label: string; placeholder: string }[] = [
  { value: 'fisica', label: 'Cédula Física', placeholder: '*Identificación (Cédula Física)' },
  { value: 'juridica', label: 'Cédula Jurídica', placeholder: '*Identificación (Cédula Jurídica)' },
  { value: 'dimex', label: 'DIMEX', placeholder: '*Identificación (DIMEX)' },
  { value: 'pasaporte', label: 'Pasaporte', placeholder: '*Identificación (Pasaporte)' },
  { value: 'otro', label: 'Otro', placeholder: '*Identificación (Otro)' },
]

function banksPayload(model: HomeModel) {
  return banks.map((bank: BankOption) => {
    const prima = Math.round(model.priceBase * (bank.prima / 100))
    return {
      Nombre: bank.name,
      Tasa: bank.tasa,
      Plazos: bank.plazos,
      Comision: bank.comision,
      Prima: prima,
      Id: bank.id,
      image: bank.imageUrl,
      fixedRateMonths: bank.fixedRateMonths,
      Cuota: Number(estimateQuota(model.priceBase, bank, prima).toFixed(2)),
    }
  })
}

type Props = {
  model: HomeModel | null
}

export function FollowUpForm({ model }: Props) {
  const [done, setDone] = useState(false)
  const {
    control,
    handleSubmit,
    setError,
    formState: { errors, isSubmitting },
  } = useForm<FollowUpFormValues>({
    resolver: zodResolver(followUpSchema),
    defaultValues: {
      idType: undefined,
      identification: '',
      name: '',
      surname: '',
      phone: '',
      email: '',
      comment: '',
      accepted: false,
      authorized: false,
    },
  })

  const idType = useWatch({ control, name: 'idType' })

  const idPlaceholder =
    ID_OPTIONS.find((item) => item.value === idType)?.placeholder ?? '*Identificación'

  const submit = handleSubmit(async (values) => {
    if (!model) {
      setError('root', {
        message: 'Ocurrió un error al enviar tu solicitud, por favor inténtalo de nuevo',
      })
      return
    }
    const quotation = {
      docType: 1,
      identification: values.identification,
      name: values.name,
      surname: values.surname,
      email: values.email,
      phonenumber: values.phone,
      comment: values.comment,
      wantToGetFollowUp: true,
      allowToUseInformation: true,
      models: [{ name: model.name, filename: model.imageUrl, price: model.priceBase }],
      purdySeguro: 0,
      bancos: banksPayload(model),
    }
    void quotation
    setDone(true)
  })

  if (done) {
    return (
      <section className="quote-page">
        <p className="form-ok">¡Listo!</p>
        <a className="quote-back" href="/financiamiento">
          <span aria-hidden="true">←</span>
          Volver a cotización
        </a>
      </section>
    )
  }

  return (
    <section className="quote-page">
      <a className="quote-back" href="/financiamiento">
        <span className="quote-back__icon" aria-hidden="true">
          ←
        </span>
        Volver a cotización
      </a>
      <h1 className="quote-page__title">ENVIAR COTIZACIÓN AL CORREO</h1>
      <div className="quote-box">
        <div className="quote-vehicle">
          <h2>ME INTERESA EL VEHÍCULO</h2>
          <p>{model?.name ?? 'modelo'}</p>
        </div>
        <form className="quote-form" onSubmit={submit} noValidate>
          <h2>MIS DATOS</h2>
          <p className="quote-form__hint">*Campos obligatorios</p>

          <Controller
            name="idType"
            control={control}
            render={({ field }) => (
              <select
                {...field}
                value={field.value ?? ''}
                aria-label="Tipo de identificación"
                className={field.value ? undefined : 'faw-form__empty'}
              >
                <option value="">*Tipo de identificación</option>
                {ID_OPTIONS.map((item) => (
                  <option key={item.value} value={item.value}>
                    {item.label}
                  </option>
                ))}
              </select>
            )}
          />
          {errors.idType ? <p className="form-error">{errors.idType.message}</p> : null}

          <Controller
            name="identification"
            control={control}
            render={({ field }) => (
              <input {...field} aria-label="Identificación" placeholder={idPlaceholder} />
            )}
          />
          {errors.identification ? (
            <p className="form-error">{errors.identification.message}</p>
          ) : null}

          <Controller
            name="name"
            control={control}
            render={({ field }) => (
              <input
                {...field}
                autoComplete="given-name"
                aria-label="Nombre"
                placeholder="*Nombre"
              />
            )}
          />
          {errors.name ? <p className="form-error">{errors.name.message}</p> : null}

          <Controller
            name="surname"
            control={control}
            render={({ field }) => (
              <input
                {...field}
                autoComplete="family-name"
                aria-label="Apellidos"
                placeholder="*Apellidos"
              />
            )}
          />
          {errors.surname ? <p className="form-error">{errors.surname.message}</p> : null}

          <Controller
            name="phone"
            control={control}
            render={({ field }) => (
              <input
                {...field}
                autoComplete="tel"
                inputMode="numeric"
                aria-label="Teléfono"
                placeholder="*Teléfono"
              />
            )}
          />
          {errors.phone ? <p className="form-error">{errors.phone.message}</p> : null}

          <Controller
            name="email"
            control={control}
            render={({ field }) => (
              <input
                {...field}
                type="email"
                autoComplete="email"
                aria-label="Correo electrónico"
                placeholder="*Correo electrónico"
              />
            )}
          />
          {errors.email ? <p className="form-error">{errors.email.message}</p> : null}

          <Controller
            name="comment"
            control={control}
            render={({ field }) => (
              <textarea {...field} aria-label="Comentario" placeholder="Comentario" maxLength={200} />
            )}
          />
          {errors.comment ? <p className="form-error">{errors.comment.message}</p> : null}

          <Controller
            name="accepted"
            control={control}
            render={({ field }) => (
              <label className="quote-form__check">
                <input
                  type="checkbox"
                  checked={Boolean(field.value)}
                  onChange={(event) => field.onChange(event.target.checked)}
                />
                <span>
                  He leído y estoy de acuerdo con los <a href="/terms">Términos y Condiciones</a>
                </span>
              </label>
            )}
          />
          {errors.accepted ? <p className="form-error">{errors.accepted.message}</p> : null}

          <Controller
            name="authorized"
            control={control}
            render={({ field }) => (
              <label className="quote-form__check">
                <input
                  type="checkbox"
                  checked={Boolean(field.value)}
                  onChange={(event) => field.onChange(event.target.checked)}
                />
                <span>
                  Al seleccionar esta casilla, autorizo y consiento de forma libre y expresa a Grupo
                  Purdy, sus empleados, representantes, asesores externos e internos a tratar,
                  recopilar, almacenar para uso de Grupo Purdy, la información relativa a mis datos
                  personales, según lo indicado por este documento y/o lo permitido por la Ley.
                </span>
              </label>
            )}
          />
          {errors.authorized ? <p className="form-error">{errors.authorized.message}</p> : null}
          {errors.root ? <p className="form-error">{errors.root.message}</p> : null}

          <button className="btn-solid quote-form__submit" type="submit" disabled={isSubmitting}>
            ENVIAR
          </button>
        </form>
      </div>
    </section>
  )
}
