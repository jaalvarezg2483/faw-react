'use client'

import { zodResolver } from '@hookform/resolvers/zod'
import { useState } from 'react'
import { Controller, useForm, useWatch } from 'react-hook-form'

import { inquirySchema, type InquiryFormValues } from '@/features/contact/schemas/inquiry.schema'

type Props = {
  title?: string
  variant?: 'contact' | 'workshops'
}

const ID_PLACEHOLDERS: Record<string, string> = {
  '1': '* Identificación (Cédula Física)',
  '2': '* Identificación (Cédula Juridica)',
  '3': '* Identificación (DIMEX)',
  '4': '* Identificación (Pasaporte)',
  '5': '* Identificación (Otro)',
}

export function InquiryForm({
  title = 'Solicitá acá más información:',
  variant = 'contact',
}: Props) {
  const [done, setDone] = useState(false)
  const {
    control,
    handleSubmit,
    formState: { errors, isSubmitting },
  } = useForm<InquiryFormValues>({
    resolver: zodResolver(inquirySchema),
    defaultValues: {
      idType: undefined,
      identification: '',
      name: '',
      surname: '',
      email: '',
      phone: '',
      comment: '',
      accepted: variant === 'workshops',
      marketing: false,
    },
  })

  const idType = useWatch({ control, name: 'idType' })
  const comment = useWatch({ control, name: 'comment' }) ?? ''

  const submit = handleSubmit(() => {
    setDone(true)
  })

  if (done) {
    return <p className="form-ok">¡Listo!</p>
  }

  return (
    <form
      className={variant === 'workshops' ? 'faw-form faw-form--workshops' : 'faw-form'}
      onSubmit={submit}
      noValidate
    >
      <p className="faw-form__lead">{title}</p>

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
            <option value="">* Tipo de identificación</option>
            <option value="1">Cédula Física</option>
            <option value="2">Cédula Jurídica</option>
            <option value="3">DIMEX</option>
            <option value="4">Pasaporte</option>
            <option value="5">Otro</option>
          </select>
        )}
      />
      {errors.idType ? <p className="form-error">{errors.idType.message}</p> : null}

      <Controller
        name="identification"
        control={control}
        render={({ field }) => (
          <input
            {...field}
            aria-label="Identificación"
            placeholder={idType ? ID_PLACEHOLDERS[idType] : '* Identificación'}
          />
        )}
      />
      {errors.identification ? <p className="form-error">{errors.identification.message}</p> : null}

      <Controller
        name="name"
        control={control}
        render={({ field }) => (
          <input {...field} autoComplete="given-name" aria-label="Nombre" placeholder="* Nombre" />
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
            aria-label="Apellido"
            placeholder="* Apellido"
          />
        )}
      />
      {errors.surname ? <p className="form-error">{errors.surname.message}</p> : null}

      <Controller
        name="email"
        control={control}
        render={({ field }) => (
          <input
            {...field}
            type="email"
            autoComplete="email"
            aria-label="Correo electrónico"
            placeholder="* Correo electrónico"
          />
        )}
      />
      {errors.email ? <p className="form-error">{errors.email.message}</p> : null}

      <Controller
        name="phone"
        control={control}
        render={({ field }) => (
          <input
            {...field}
            autoComplete="tel"
            inputMode="numeric"
            aria-label="Teléfono"
            placeholder="* Teléfono"
          />
        )}
      />
      {errors.phone ? <p className="form-error">{errors.phone.message}</p> : null}

      <div className="faw-form__comment">
        <Controller
          name="comment"
          control={control}
          render={({ field }) => (
            <textarea
              {...field}
              aria-label="Comentarios"
              placeholder="* Comentarios"
              maxLength={300}
            />
          )}
        />
        <span className="faw-form__count">{comment.length}/300</span>
      </div>
      {errors.comment ? <p className="form-error">{errors.comment.message}</p> : null}

      <Controller
        name="accepted"
        control={control}
        render={({ field }) => (
          <label className="faw-form__check">
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

      <button
        className={variant === 'workshops' ? 'btn-solid btn-solid--pill' : 'btn-solid'}
        type="submit"
        disabled={isSubmitting}
      >
        Enviar
      </button>
    </form>
  )
}
