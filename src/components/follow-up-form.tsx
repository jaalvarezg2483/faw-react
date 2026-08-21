'use client'

import { zodResolver } from '@hookform/resolvers/zod'
import Alert from '@mui/material/Alert'
import Button from '@mui/material/Button'
import Checkbox from '@mui/material/Checkbox'
import FormControlLabel from '@mui/material/FormControlLabel'
import TextField from '@mui/material/TextField'
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
      accepted: true,
      authorized: true,
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
              <TextField
                {...field}
                value={field.value ?? ''}
                select
                slotProps={{ select: { native: true } }}
                label="Tipo de identificación"
                required
                error={Boolean(errors.idType)}
                helperText={errors.idType?.message}
              >
                <option value="">Tipo de identificación</option>
                {ID_OPTIONS.map((item) => (
                  <option key={item.value} value={item.value}>
                    {item.label}
                  </option>
                ))}
              </TextField>
            )}
          />
          <Controller
            name="identification"
            control={control}
            render={({ field }) => (
              <TextField
                {...field}
                label={idPlaceholder}
                required
                error={Boolean(errors.identification)}
                helperText={errors.identification?.message}
              />
            )}
          />
          <Controller
            name="name"
            control={control}
            render={({ field }) => (
              <TextField
                {...field}
                label="Nombre"
                autoComplete="given-name"
                required
                error={Boolean(errors.name)}
                helperText={errors.name?.message}
              />
            )}
          />
          <Controller
            name="surname"
            control={control}
            render={({ field }) => (
              <TextField
                {...field}
                label="Apellidos"
                autoComplete="family-name"
                required
                error={Boolean(errors.surname)}
                helperText={errors.surname?.message}
              />
            )}
          />
          <Controller
            name="phone"
            control={control}
            render={({ field }) => (
              <TextField
                {...field}
                label="Teléfono"
                autoComplete="tel"
                required
                slotProps={{ htmlInput: { inputMode: 'numeric' } }}
                error={Boolean(errors.phone)}
                helperText={errors.phone?.message}
              />
            )}
          />
          <Controller
            name="email"
            control={control}
            render={({ field }) => (
              <TextField
                {...field}
                type="email"
                label="Correo electrónico"
                autoComplete="email"
                required
                error={Boolean(errors.email)}
                helperText={errors.email?.message}
              />
            )}
          />
          <Controller
            name="comment"
            control={control}
            render={({ field }) => (
              <TextField
                {...field}
                label="Comentario"
                multiline
                minRows={4}
                slotProps={{ htmlInput: { maxLength: 200 } }}
                error={Boolean(errors.comment)}
                helperText={errors.comment?.message}
              />
            )}
          />
          <Controller
            name="accepted"
            control={control}
            render={({ field }) => (
              <FormControlLabel
                className="quote-form__check"
                control={
                  <Checkbox
                    checked={field.value}
                    onChange={(_, checked) => field.onChange(checked)}
                  />
                }
                label={
                  <span>
                    He leído y estoy de acuerdo con los <a href="/terms">Términos y Condiciones</a>
                  </span>
                }
              />
            )}
          />
          {errors.accepted ? <Alert severity="error">{errors.accepted.message}</Alert> : null}
          <Controller
            name="authorized"
            control={control}
            render={({ field }) => (
              <FormControlLabel
                className="quote-form__check"
                control={
                  <Checkbox
                    checked={field.value}
                    onChange={(_, checked) => field.onChange(checked)}
                  />
                }
                label={
                  <span>
                    Al seleccionar esta casilla, autorizo y consiento de forma libre y expresa a
                    Grupo Purdy, sus empleados, representantes, asesores externos e internos a
                    tratar, recopilar, almacenar para uso de Grupo Purdy, la información relativa a
                    mis datos personales, según lo indicado por este documento y/o lo permitido por
                    la Ley.
                  </span>
                }
              />
            )}
          />
          {errors.authorized ? <Alert severity="error">{errors.authorized.message}</Alert> : null}
          {errors.root ? <Alert severity="error">{errors.root.message}</Alert> : null}
          <Button
            className="btn-solid quote-form__submit"
            type="submit"
            variant="contained"
            disabled={isSubmitting}
          >
            ENVIAR
          </Button>
        </form>
      </div>
    </section>
  )
}
