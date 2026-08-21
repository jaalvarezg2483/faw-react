import { z } from 'zod'

const namePattern = /^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]+$/

export const identificationTypes = ['1', '2', '3', '4', '5'] as const

export const inquirySchema = z
  .object({
    idType: z.enum(identificationTypes, { error: 'Debes seleccionar un tipo de identificación' }),
    identification: z.string().trim().min(1, 'La identificación es obligatoria'),
    name: z
      .string()
      .trim()
      .min(1, 'El nombre es obligatorio')
      .regex(namePattern, 'Ingresá un nombre válido'),
    surname: z
      .string()
      .trim()
      .min(1, 'El apellido es obligatorio')
      .regex(namePattern, 'Ingresá un apellido válido'),
    email: z.email('Debes ingresar una dirección de correo electrónico válida.'),
    phone: z
      .string()
      .transform((value) => value.replace(/\D/g, ''))
      .pipe(z.string().length(8, 'Ingrese 8 dígitos')),
    comment: z.string().max(300, 'Máximo 300 caracteres'),
    accepted: z.boolean().refine(Boolean, 'Debes aceptar los términos y condiciones'),
    marketing: z.boolean(),
  })
  .superRefine(({ idType, identification }, context) => {
    const value = identification.replace(/\s/g, '')
    const requirements: Partial<Record<(typeof identificationTypes)[number], RegExp>> = {
      '1': /^\d{9}$/,
      '2': /^\d{10}$/,
      '3': /^\d{11,12}$/,
      '4': /^.{1,15}$/,
    }

    if (requirements[idType] && !requirements[idType]?.test(value)) {
      context.addIssue({
        code: 'custom',
        message: 'Ingresá un formato válido para el tipo de identificación seleccionado',
        path: ['identification'],
      })
    }
  })

export type InquiryFormValues = z.input<typeof inquirySchema>
