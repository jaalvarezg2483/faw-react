import type { Metadata } from 'next'
import { ContactPage } from '@/components/contact-page'
import { SiteChrome } from '@/components/site-chrome'
import { getHomeContent } from '@/lib/content/get-home'

export const dynamic = 'force-dynamic'

export const metadata: Metadata = {
  title: 'Contactanos | Faw Trucks Costa Rica | Grupo Purdy',
  description:
    'Contactanos en Faw Trucks Costa Rica con el respaldo de Grupo Purdy. ¡Escribinos hoy y llevá tu negocio al siguiente nivel!',
  keywords: 'contactanos, Faw Trucks Costa Rica, Grupo Purdy',
}

export default async function ContactenosPage() {
  const content = await getHomeContent()
  return (
    <SiteChrome nav={content.nav} ethics={content.ethics}>
      <ContactPage locations={content.locations} />
    </SiteChrome>
  )
}
