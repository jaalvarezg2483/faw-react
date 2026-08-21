import path from 'path'
import type { Payload } from 'payload'

import { homeFallback } from '../lib/content/home-fallback'
import { locations } from '../lib/content/site'

const ROOT = process.cwd()

async function upload(payload: Payload, file: string, alt: string) {
  const filePath = path.resolve(ROOT, file)
  const doc = await payload.create({
    collection: 'media',
    data: { alt, title: alt },
    filePath,
  })
  return Number(doc.id)
}

export async function seedCmsIfEmpty(payload: Payload) {
  const existing = await payload.count({ collection: 'models' })
  if (existing.totalDocs > 0) return

  payload.logger.info('[cms] Sembrando contenido inicial de FAW…')

  const t80 = await upload(payload, 'public/cms/models/tiger-t80.jpg', 'Tiger T80')
  const vh58 = await upload(payload, 'public/cms/models/tiger-vh-58.jpg', 'Tiger VH 5.8 T')
  const vh43 = await upload(payload, 'public/cms/models/tiger-vh-43.jpg', 'Tiger VH 4x4 4.3 T')
  const cabezal = await upload(payload, 'public/cms/models/cabezal-fc01.jpg', 'Cabezal FC01')
  const vagoneta = await upload(payload, 'public/cms/models/vagoneta-fv01.jpg', 'Vagoneta FV01')
  const homeBanner = await upload(payload, 'public/cms/banners/home.jpg', 'Banner Home')
  const plansBanner = await upload(payload, 'public/cms/banners/planes.png', 'Banner Planes')
  const fa43_1 = await upload(payload, 'public/cms/plans/fa43-1.png', 'Plan Tiger VH 4x4 4.3 T')
  const fa43_2 = await upload(payload, 'public/cms/plans/fa43-2.png', 'Plan Tiger VH 4x4 4.3 T 2')
  const fa58_1 = await upload(payload, 'public/cms/plans/fa58-1.png', 'Plan Tiger VH 5.8 T')
  const fa58_2 = await upload(payload, 'public/cms/plans/fa58-2.png', 'Plan Tiger VH 5.8 T 2')
  const svcPlanes = await upload(
    payload,
    'public/assets/images/Rectangle_39822_(1).png',
    'Planes de mantenimento',
  )
  const svcTalleres = await upload(
    payload,
    'public/assets/images/Taller_VW_y_Higer_1.png',
    'Red de talleres',
  )
  const svcSeguros = await upload(
    payload,
    'public/assets/images/Group_1321316804.png',
    'Purdy Seguros',
  )

  const modelImages: Record<string, number> = {
    FAA9: t80,
    FA58: vh58,
    FA43: vh43,
    FC01: cabezal,
    FV01: vagoneta,
  }

  for (const [index, model] of homeFallback.models.entries()) {
    await payload.create({
      collection: 'models',
      data: {
        name: model.name,
        slug: model.slug,
        code: model.code,
        type: model.kind,
        passengers: model.passengersLabel.replace(' Pasajeros', ''),
        priceBase: model.priceBase,
        image: modelImages[model.code],
        urlImage: model.imageUrl,
        order: index + 1,
        enable: true,
        isProd: true,
      },
    })
  }

  await payload.create({
    collection: 'banners',
    data: {
      section: 'Inicio',
      alt: homeFallback.banners[0]?.alt,
      type: 'IMAGE',
      image: homeBanner,
      bannerUrl: homeFallback.banners[0]?.imageUrl,
      order: 1,
      enable: true,
    },
  })

  await payload.create({
    collection: 'banners',
    data: {
      section: 'PlanesMantenimiento',
      alt: 'LÍDER EN CAMIONES POR MÁS DE 70 DE AÑOS',
      type: 'IMAGE',
      image: plansBanner,
      bannerUrl: '/cms/banners/planes.png',
      order: 1,
      enable: true,
    },
  })

  await payload.create({
    collection: 'maintenance-plans',
    data: {
      name: 'Tiger VH 4x4 4.3 T',
      code: 'FA43',
      image: fa43_1,
      image2: fa43_2,
      order: 2,
      enabled: true,
    },
  })

  await payload.create({
    collection: 'maintenance-plans',
    data: {
      name: 'Tiger VH 5.8 T',
      code: 'FA58',
      image: fa58_1,
      image2: fa58_2,
      order: 4,
      enabled: true,
    },
  })

  for (const [index, card] of homeFallback.services.cards.entries()) {
    const images = [svcPlanes, svcTalleres, svcSeguros]
    await payload.create({
      collection: 'services',
      data: {
        title: card.title,
        image: images[index],
        url: card.imageUrl,
        link: card.href,
        isLink: true,
        isActive: true,
        order: index + 1,
      },
    })
  }

  for (const [index, location] of locations.entries()) {
    await payload.create({
      collection: 'locations',
      data: {
        name: location.name,
        address: location.address,
        phone: location.phone,
        branchHours: location.branchHours,
        workshopHours: location.workshopHours,
        googleLink: location.googleLink,
        wazeLink: location.wazeLink,
        appleMapsLink: location.appleMapsLink,
        specialities: location.specialities.join('\n'),
        isBranchOffice: location.isBranchOffice,
        isRepairShop: location.isRepairShop,
        isActive: true,
        order: index + 1,
      },
    })
  }

  const productos = await payload.create({
    collection: 'nav-items',
    data: { name: 'Productos', isLink: false, isSectionHeader: true, enable: true, order: 2 },
  })

  const nav = [
    { name: 'Inicio', urlLink: '/home', order: 1 },
    { name: 'Camiones', urlLink: '/models', order: 3, parent: productos.id },
    { name: 'Cabezales', urlLink: '/cabezales', order: 4, parent: productos.id },
    { name: 'Vagonetas', urlLink: '/vagonetas', order: 5, parent: productos.id },
    { name: 'Servicios', urlLink: '/servicios', order: 6 },
    { name: 'Financiamiento', urlLink: '/financiamiento', order: 7 },
    { name: 'Contactanos', urlLink: '/contactenos', order: 8 },
  ]

  for (const item of nav) {
    await payload.create({
      collection: 'nav-items',
      data: { ...item, isLink: true, enable: true },
    })
  }

  await payload.updateGlobal({
    slug: 'site-settings',
    data: {
      ethics: homeFallback.ethics,
      servicesPage: {
        title: 'Servicios Integrales',
        body: 'Vos y tu FAW merecen un servicio de calidad. Por eso ponemos a tu disposición nuestros servicios de Purdy Drive, planes de mantenimiento, talleres móviles, seguros, telemática y administración de flota vehicular, capacitaciones empresariales PRO 800, entre otros. Podés contactarnos a través de nuestros canales de atención, donde un grupo de especialistas y asesores estará dispuesto a ayudarte con cualquier consulta o inquietud que tengás.',
      },
      plansPage: {
        title: 'Planes de mantenimiento',
        intro: `Los planes de mantenimiento preventivos de GRUPO PURDY ayudan para que tu FAW siga funcionando de manera óptima.

Lo mejor de todo es que, si comprás tu plan de mantenimiento preventivo, podés evitar costos más elevados de servicios o repuestos en el futuro y obtener estos servicios a precios especiales.

Contar con un plan de mantenimiento te traerá múltiples beneficios como:`,
      },
      workshopsPage: {
        title: 'Red de talleres',
        body: `Contamos con opciones de talleres a tu disposición para que podas realizar mantenimientos preventivos, mecánica rápida o reparaciones mayores, así como carrocería.

· Aplica para flotas y particulares

· Aplica restricciones: disponibilidad de talleres queda sujeta al modelo y reparación que desea realizar.`,
        image: svcTalleres,
      },
    },
  })

  payload.logger.info('[cms] Seed listo. Editá desde /admin')
}
