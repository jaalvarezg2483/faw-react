'use client'

import { zodResolver } from '@hookform/resolvers/zod'
import Alert from '@mui/material/Alert'
import Button from '@mui/material/Button'
import Checkbox from '@mui/material/Checkbox'
import FormControlLabel from '@mui/material/FormControlLabel'
import TextField from '@mui/material/TextField'
import { useState } from 'react'
import { Controller, useForm, useWatch } from 'react-hook-form'

import { inquirySchema, type InquiryFormValues } from '@/features/contact/schemas/inquiry.schema'

type Props = {
  title?: string
  variant?: 'contact' | 'workshops'
}

export function InquiryForm({
  title = 'Solicitá acá más información:',
  variant = 'contact',
}: Props) {
  const [done, setDone] = useState(false)
  const {
    control,
    handleSubmit,
    setError,
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
      accepted: false,
      marketing: false,
    },
  })

  const idType = useWatch({ control, name: 'idType' })
  const comment = useWatch({ control, name: 'comment' })

  const submit = handleSubmit(async (values) => {
    if (variant === 'workshops' && !values.marketing) {
      setError('marketing', { message: 'Debes autorizar el uso de tus datos de contacto' })
      return
    }
    setDone(true)
  })

  if (done) {
    return <p className="form-ok">¡Listo!</p>
  }

  const idLabel =
    idType === '1' || !idType ? '* Identificación (Cédula Física)' : '* Identificación'

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
            <option value="">Seleccionar</option>
            <option value="1">Cédula Física</option>
            <option value="2">Cédula Jurídica</option>
            <option value="3">DIMEX</option>
            <option value="4">Pasaporte</option>
            <option value="5">Otro</option>
          </TextField>
        )}
      />
      <Controller
        name="identification"
        control={control}
        render={({ field }) => (
          <TextField
            {...field}
            label={idLabel}
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
            label="Apellido"
            autoComplete="family-name"
            required
            error={Boolean(errors.surname)}
            helperText={errors.surname?.message}
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
        name="comment"
        control={control}
        render={({ field }) => (
          <TextField
            {...field}
            label={`Comentarios ${comment.length}/300`}
            multiline
            minRows={4}
            slotProps={{ htmlInput: { maxLength: 300 } }}
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
            className="faw-form__check"
            control={
              <Checkbox checked={field.value} onChange={(_, checked) => field.onChange(checked)} />
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
      {variant === 'workshops' ? (
        <Controller
          name="marketing"
          control={control}
          render={({ field }) => (
            <FormControlLabel
              className="faw-form__check"
              control={
                <Checkbox
                  checked={field.value}
                  onChange={(_, checked) => field.onChange(checked)}
                />
              }
              label="Autorizo a Grupo Purdy el envío de información de sus productos y la utilización de mis datos de contacto"
            />
          )}
        />
      ) : null}
      {errors.marketing ? <Alert severity="error">{errors.marketing.message}</Alert> : null}
      <Button
        className={variant === 'workshops' ? 'btn-solid btn-solid--pill' : 'btn-solid'}
        type="submit"
        variant="contained"
        disabled={isSubmitting}
      >
        Enviar
      </Button>
    </form>
  )
}
