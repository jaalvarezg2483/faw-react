import { locations } from './site'
import type { HomeContent } from './types'

export const COOKIES_PDF = '/docs/cookies.pdf'
export const WARRANTY_PDF = '/docs/garantia.pdf'
export const TERMS_PDF = '/docs/terminos.pdf'

export const homeFallback: HomeContent = {
  banners: [
    {
      id: 'home-jun26',
      imageUrl: '/cms/banners/home.jpg',
      imageUrlMobile: '/cms/banners/home.jpg',
      alt: 'TENEMOS NOMBRE Y APELLIDO',
    },
  ],
  models: [
    {
      id: 'FAA9',
      code: 'FAA9',
      name: 'Tiger T80',
      slug: 'tiger-t80',
      priceLabel: '$16.900*',
      priceBase: 16900,
      passengersLabel: '2 Pasajeros',
      imageUrl: '/cms/models/tiger-t80.jpg',
      kind: 'Camion',
    },
    {
      id: 'FA58',
      code: 'FA58',
      name: 'Tiger VH 5.8 T',
      slug: 'tiger-vh-58-t',
      priceLabel: '$33.500*',
      priceBase: 33500,
      passengersLabel: '3 Pasajeros',
      imageUrl: '/cms/models/tiger-vh-58.jpg',
      kind: 'Camion',
    },
    {
      id: 'FA43',
      code: 'FA43',
      name: 'Tiger VH 4x4 4.3 T',
      slug: 'tiger-vh-4x4-43-t',
      priceLabel: '$42.000*',
      priceBase: 42000,
      passengersLabel: '3 Pasajeros',
      imageUrl: '/cms/models/tiger-vh-43.jpg',
      kind: 'Camion',
    },
    {
      id: 'FC01',
      code: 'FC01',
      name: 'Cabezal FC01',
      slug: 'cabezal-fc01',
      priceLabel: '$99.500*',
      priceBase: 99500,
      passengersLabel: '2 Pasajeros',
      imageUrl: '/cms/models/cabezal-fc01.jpg',
      kind: 'Cabezal',
    },
    {
      id: 'FV01',
      code: 'FV01',
      name: 'Vagoneta FV01',
      slug: 'vagoneta-fv01',
      priceLabel: '$96.000*',
      priceBase: 96000,
      passengersLabel: '2 Pasajeros',
      imageUrl: '/cms/models/vagoneta-fv01.jpg',
      kind: 'Vagoneta',
    },
  ],
  nav: [
    { id: 'inicio', label: 'Inicio', href: '/home' },
    {
      id: 'productos',
      label: 'Productos',
      href: null,
      children: [
        { id: 'camiones', label: 'Camiones', href: '/models' },
        { id: 'cabezales', label: 'Cabezales', href: '/cabezales' },
        { id: 'vagonetas', label: 'Vagonetas', href: '/vagonetas' },
      ],
    },
    { id: 'servicios', label: 'Servicios', href: '/servicios' },
    { id: 'financiamiento', label: 'Financiamiento', href: '/financiamiento' },
    { id: 'contactanos', label: 'Contactanos', href: '/contactenos' },
  ],
  totalSupport: {
    title: 'Total Support',
    body: 'Total Support de FAW Trucks Costa Rica se fundamenta en la excelencia del servicio y un acompañamiento integral durante todo el ciclo de vida de tu camión.\n\nNuestro enfoque está en tu satisfacción, optimizando la operación del vehículo, mejorando su desempeño\ny ayudándote a reducir los costos operativos de tu negocio.\n\nConfiá en FAW Trucks Costa Rica para recibir un servicio de alta calidad, asesoramiento técnico especializado y programas diseñados para garantizar un rendimiento confiable, eficiente y duradero de tu flota.',
    ctaLabel: 'Ver más',
    ctaHref: '/servicios',
    infographicUrl: '/assets/images/Group_1321316790.png',
  },
  services: {
    title: 'Servicios Total Support',
    body: 'Como distribuidores de FAW Trucks en Costa Rica, te ofrecemos respaldo completo para que tu camión siempre rinda al máximo. Contamos con tecnología de punta, herramientas especializadas y mecánicos capacitados para brindarte un servicio postventa confiable y eficiente. Además, tenés acceso a repuestos originales FAW y a una red de talleres autorizados en todo el país, para que nunca te quedés varado.\n\nEn FAW Trucks Costa Rica creemos en el soporte integral para clientes individuales y empresas. Por eso te ofrecemos planes de mantenimiento, atención especializada, talleres móviles, soluciones de flota y acompañamiento constante, asegurándonos de que tu operación siga en marcha sin interrupciones.',
    cards: [
      {
        id: 'planes',
        title: 'Planes de mantenimento a tu medida',
        imageUrl: '/assets/images/Rectangle_39822_(1).png',
        href: '/planes-de-mantenimiento',
      },
      {
        id: 'talleres',
        title: 'Red de talleres',
        imageUrl: '/assets/images/Taller_VW_y_Higer_1.png',
        href: '/talleres',
      },
      {
        id: 'seguros',
        title: 'Purdy Seguros',
        imageUrl: '/assets/images/Group_1321316804.png',
        href: 'https://www.purdyseguros.com/es/',
        external: true,
      },
    ],
  },
  finance: {
    title: 'Financiamiento',
    calcLabel: 'Calculo aquí',
    body: 'Ingresá a esta sección para obtener la cotización completa de tu próximo FAW TRUCK',
    ctaLabel: 'Calcular',
    href: '/financiamiento',
    iconUrl: '/assets/images/bank.png',
  },
  contact: {
    title: 'Contactanos',
    body: 'Si tenés consultas respecto a vehículos nuevos, usados, talleres de servicio o repuestos originales, ingresá aquí para ponerte en contacto con nosotros.',
    ctaLabel: 'Contactanos',
    href: '/contactenos',
    iconUrl: '/assets/images/message-square.png',
  },
  ethics: {
    text: 'La línea ética es un espacio seguro y confidencial para reportar, de forma anónima, actos deshonestos o violaciones a las políticas internas y normas de conducta.',
    ctaLabel: 'Info aquí',
    href: 'https://www.grupopurdy.com/linea-etica',
  },
  locations,
  plans: [
    {
      id: 'FA43',
      name: 'Tiger VH 4x4 4.3 T',
      imageUrl: '/cms/plans/fa43-1.png',
      imageUrl2: '/cms/plans/fa43-2.png',
    },
    {
      id: 'FA58',
      name: 'Tiger VH 5.8 T',
      imageUrl: '/cms/plans/fa58-1.png',
      imageUrl2: '/cms/plans/fa58-2.png',
    },
  ],
  planBannerUrl: '/cms/banners/planes.png',
  copy: {
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
      imageUrl: '/assets/images/Taller_VW_y_Higer_1.png',
    },
  },
}
