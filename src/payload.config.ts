import { postgresAdapter } from '@payloadcms/db-postgres'
import { lexicalEditor } from '@payloadcms/richtext-lexical'
import path from 'path'
import { buildConfig } from 'payload'
import { fileURLToPath } from 'url'
import sharp from 'sharp'
import { config as loadEnv } from 'dotenv'

import { Users } from './collections/Users'
import { Media } from './collections/Media'
import { Models } from './collections/Models'
import { Banners } from './collections/Banners'
import { MaintenancePlans } from './collections/MaintenancePlans'
import { Locations } from './collections/Locations'
import { Services } from './collections/Services'
import { NavItems } from './collections/NavItems'
import { Pages } from './collections/Pages'
import { SiteSettings } from './globals/SiteSettings'
import { Header } from './globals/Header'
import { Footer } from './globals/Footer'
import { HomePage } from './globals/HomePage'
import { seedCmsIfEmpty } from './seed/cms'
import { restoreMissingMediaFiles } from './seed/restore-media'
import { getStoragePlugins } from './payload/storage'
import { migrations } from './migrations'
import { getServerEnvironment } from './lib/env/server'

const filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(filename)

loadEnv({ path: path.resolve(dirname, '../.env') })
const environment = getServerEnvironment()

export default buildConfig({
  serverURL: environment.NEXT_PUBLIC_SERVER_URL,
  admin: {
    user: Users.slug,
    avatar: {
      Component: '@/components/admin/AdminAvatar#AdminAvatar',
    },
    importMap: {
      baseDir: path.resolve(dirname),
    },
    meta: {
      titleSuffix: '— FAW CMS',
      icons: [
        {
          rel: 'icon',
          type: 'image/png',
          url: '/favicon.png',
        },
      ],
    },
    components: {
      beforeNavLinks: ['@/components/admin/AdminNavBrand#AdminNavBrand'],
      beforeDashboard: ['@/components/admin/AdminDashboardIntro#AdminDashboardIntro'],
      graphics: {
        Logo: '@/components/admin/AdminLogo#AdminLogo',
        Icon: '@/components/admin/AdminIcon#AdminIcon',
      },
    },
  },
  collections: [
    Users,
    Media,
    Pages,
    Models,
    Banners,
    MaintenancePlans,
    Locations,
    Services,
    NavItems,
  ],
  globals: [SiteSettings, Header, Footer, HomePage],
  editor: lexicalEditor(),
  secret: environment.PAYLOAD_SECRET,
  typescript: {
    outputFile: path.resolve(dirname, 'payload-types.ts'),
  },
  db: postgresAdapter({
    pool: {
      connectionString: environment.DATABASE_URL,
    },
    migrationDir: path.resolve(dirname, 'migrations'),
    push: process.env.NODE_ENV !== 'production',
    prodMigrations: process.env.NODE_ENV === 'production' ? migrations : undefined,
  }),
  sharp,
  upload: {
    abortOnLimit: true,
    limits: { fileSize: 20 * 1024 * 1024 },
    safeFileNames: true,
  },
  plugins: getStoragePlugins(),
  onInit: async (payload) => {
    await seedCmsIfEmpty(payload)
    await restoreMissingMediaFiles(payload)
  },
})
