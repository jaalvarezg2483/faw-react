import { z } from 'zod'

const serverEnvironmentSchema = z
  .object({
    NODE_ENV: z.enum(['development', 'test', 'production']).default('development'),
    DATABASE_URL: z.string().min(1, 'DATABASE_URL es requerida'),
    PAYLOAD_SECRET: z.string().min(16, 'PAYLOAD_SECRET debe tener al menos 16 caracteres'),
    STORAGE_PROVIDER: z.enum(['local', 'azure']).default('local'),
    AZURE_STORAGE_CONNECTION_STRING: z.string().optional(),
    AZURE_STORAGE_CONTAINER: z.string().optional(),
    AZURE_STORAGE_ACCOUNT_BASEURL: z.string().url().optional(),
  })
  .superRefine((environment, context) => {
    if (environment.STORAGE_PROVIDER !== 'azure') return

    for (const key of [
      'AZURE_STORAGE_CONNECTION_STRING',
      'AZURE_STORAGE_CONTAINER',
      'AZURE_STORAGE_ACCOUNT_BASEURL',
    ] as const) {
      if (!environment[key]) {
        context.addIssue({
          code: 'custom',
          message: `${key} es requerida cuando STORAGE_PROVIDER=azure`,
          path: [key],
        })
      }
    }
  })

export function getServerEnvironment() {
  return serverEnvironmentSchema.parse(process.env)
}
