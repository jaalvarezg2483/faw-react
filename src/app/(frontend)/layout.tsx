import { GoogleTagManager } from '@next/third-parties/google'
import type { Metadata, Viewport } from 'next'
import localFont from 'next/font/local'
import React from 'react'
import './styles.css'
import { FrontendProviders } from './providers'

const GTM_ID = 'GTM-WSRVH3LK'
const fawFont = localFont({
  src: '../../../public/fonts/Montserrat-Regular.ttf',
  display: 'swap',
  variable: '--font-faw',
})

export const metadata: Metadata = {
  title: 'Faw Trucks Costa Rica | Camiones | Grupo Purdy',
  description:
    'Conocé los camiones de FAW Trucks Costa Rica con el respaldo de Grupo Purdy. Mové tu empresa al futuro con poder y eficiencia. Obtené mayor información aquí.',
  keywords:
    'Faw Costa Rica, Camiones, flotilla empresarial, Faw, repuestos Faw, Faw ficha técnica, Faw camiones precios, Faw Trucks Costa Rica, Flotilla de camiones, soluciones de tranporte empresarial, venta de camiones, venta de camiones Costa Rica, ',
  icons: {
    icon: '/favicon.png',
  },
}

export const dynamic = 'force-dynamic'
export const revalidate = 0

export const viewport: Viewport = {
  themeColor: '#f1f4f8',
  width: 'device-width',
  initialScale: 1,
}

export default async function RootLayout(props: { children: React.ReactNode }) {
  const { children } = props

  return (
    <html lang="es-CR" className={fawFont.variable}>
      <body>
        <FrontendProviders>{children}</FrontendProviders>
        <GoogleTagManager gtmId={GTM_ID} />
      </body>
    </html>
  )
}
