import { getPayload } from 'payload'
import config from '@payload-config'

const email = process.env.ADMIN_EMAIL
const password = process.env.ADMIN_PASSWORD

if (!email || !password) {
  throw new Error('ADMIN_EMAIL y ADMIN_PASSWORD son requeridos')
}

const payload = await getPayload({ config })
const existing = await payload.find({
  collection: 'users',
  where: { email: { equals: email } },
  limit: 1,
})

if (existing.docs.length > 0) {
  console.log(`[cms] El usuario ${email} ya existe`)
  process.exit(0)
}

await payload.create({
  collection: 'users',
  data: { email, password, role: 'admin' },
})

console.log(`[cms] Usuario admin creado: ${email}`)
process.exit(0)
