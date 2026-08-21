import type { Metadata } from 'next'
import { FollowUpForm } from '@/components/follow-up-form'
import { SiteChrome } from '@/components/site-chrome'
import { getHomeContent } from '@/lib/content/get-home'

export const dynamic = 'force-dynamic'

export const metadata: Metadata = {
  title: 'Financiamiento | Faw Trucks Costa Rica | Grupo Purdy',
  description:
    'Conocé las opciones de financiamiento de Faw Trucks Costa Rica con el respaldo de Grupo Purdy. ¡Solicitalo hoy mismo y mové tu negocio!',
}

type Props = {
  searchParams: Promise<{ code?: string; model?: string }>
}

export default async function SolicitarSeguimientoPage({ searchParams }: Props) {
  const params = await searchParams
  const content = await getHomeContent()
  const code = params.code ?? params.model ?? ''
  const model =
    content.models.find((item) => item.code === code) ??
    content.models.find((item) => item.slug === code) ??
    null

  return (
    <SiteChrome nav={content.nav}>
      <FollowUpForm model={model} />
    </SiteChrome>
  )
}
