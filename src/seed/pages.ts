import type { Payload } from 'payload'

const sitePages: Array<{ title: string; slug: string; body: string }> = [
  {
    title: 'Inicio',
    slug: 'home',
    body: 'La portada del sitio. El contenido se edita en Globals → Página de inicio, más Banners y Modelos.',
  },
  {
    title: 'Camiones',
    slug: 'models',
    body: 'Catálogo de camiones. Los vehículos se editan en la colección Modelos.',
  },
  {
    title: 'Cabezales',
    slug: 'cabezales',
    body: 'Listado de cabezales. Los vehículos se editan en Modelos (tipo cabezal).',
  },
  {
    title: 'Vagonetas',
    slug: 'vagonetas',
    body: 'Listado de vagonetas. Los vehículos se editan en Modelos (tipo vagoneta).',
  },
  {
    title: 'Servicios Integrales',
    slug: 'servicios',
    body: 'Página de servicios. Tarjetas y textos se editan en Servicios y en Globals → Site Settings.',
  },
  {
    title: 'Financiamiento',
    slug: 'financiamiento',
    body: 'Cotizador y entidades financieras. Los modelos salen de Modelos.',
  },
  {
    title: 'Contactanos',
    slug: 'contactenos',
    body: 'Formulario y datos de contacto.',
  },
  {
    title: 'Red de talleres',
    slug: 'talleres',
    body: 'Red de talleres. Sucursales se editan en Ubicaciones y el texto en Site Settings.',
  },
  {
    title: 'Planes de mantenimiento',
    slug: 'planes-de-mantenimiento',
    body: 'Planes de mantenimiento. Las matrices se editan en Planes de mantenimiento.',
  },
  {
    title: 'Cookies',
    slug: 'cookies',
    body: 'Política de cookies del sitio FAW Trucks Costa Rica.',
  },
  {
    title: 'Términos y condiciones',
    slug: 'terms',
    body: 'Términos y condiciones del sitio FAW Trucks Costa Rica.',
  },
  {
    title: 'Reglamento',
    slug: 'reglamento',
    body: 'Reglamento de financiamiento FAW Trucks Costa Rica.',
  },
  {
    title: 'Mapa del sitio',
    slug: 'sitemap',
    body: 'Mapa de rutas públicas del sitio.',
  },
  {
    title: 'Purdy Drive',
    slug: 'purdy-drive',
    body: 'Landing de Purdy Drive.',
  },
  {
    title: 'Solicitar seguimiento',
    slug: 'solicitar-seguimiento',
    body: 'Formulario para solicitar seguimiento comercial.',
  },
]

export async function seedPagesIfEmpty(payload: Payload) {
  const existing = await payload.count({ collection: 'pages' })
  if (existing.totalDocs > 0) return

  payload.logger.info('[cms] Sembrando páginas del sitio…')

  for (const page of sitePages) {
    await payload.create({
      collection: 'pages',
      draft: false,
      data: {
        title: page.title,
        slug: page.slug,
        _status: 'published',
        layout: [
          {
            blockType: 'content',
            heading: page.title,
            body: page.body,
            alignment: 'left',
          },
        ],
      },
    })
  }
}
