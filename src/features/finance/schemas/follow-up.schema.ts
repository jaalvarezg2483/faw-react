import { z } from 'zod'

export const followUpIdTypes = ['fisica', 'juridica', 'dimex', 'pasaporte', 'otro'] as const

export const followUpSchema = z.object({
  idType: z.enum(followUpIdTypes, { error: 'Debes seleccionar un tipo de identificación' }),
  identification: z.string().trim().min(1, 'La identificación es obligatoria'),
  name: z.string().trim().min(1, 'El nombre es obligatorio'),
  surname: z.string().trim().min(1, 'Los apellidos son obligatorios'),
  phone: z
    .string()
    .transform((value) => value.replace(/\D/g, ''))
    .pipe(z.string().length(8, 'Ingrese 8 dígitos')),
  email: z.email('Debes ingresar una dirección de correo válida'),
  comment: z.string().max(200, 'Máximo 200 caracteres'),
  accepted: z.boolean().refine(Boolean, 'Debes aceptar los Términos y Condiciones'),
  authorized: z.boolean().refine(Boolean, 'Debes autorizar el uso de tus datos de contacto'),
})

export type FollowUpFormValues = z.input<typeof followUpSchema>
