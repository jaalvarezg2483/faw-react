import type { Metadata } from 'next'
import { FinancePage } from '@/components/finance-page'
import { SiteChrome } from '@/components/site-chrome'
import { getHomeContent } from '@/lib/content/get-home'

export const dynamic = 'force-dynamic'

export const metadata: Metadata = {
  title: 'Financiamiento | Faw Trucks Costa Rica | Grupo Purdy',
  description:
    'Conocé las opciones de financiamiento de Faw Trucks Costa Rica con el respaldo de Grupo Purdy. ¡Solicitalo hoy mismo y mové tu negocio!',
  keywords: 'Financiamiento camiones, financiamiento Faw Trucks',
}

export default async function FinanciamientoOldPage() {
  const content = await getHomeContent()
  return (
    <SiteChrome nav={content.nav}>
      <FinancePage models={content.models} legacy />
    </SiteChrome>
  )
}
