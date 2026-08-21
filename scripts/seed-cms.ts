import { getPayload } from 'payload'
import config from '@payload-config'
import { seedCmsIfEmpty } from '../src/seed/cms'

const payload = await getPayload({ config })
await seedCmsIfEmpty(payload)
process.exit(0)
