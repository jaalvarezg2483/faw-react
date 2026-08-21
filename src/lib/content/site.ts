export const WHATSAPP_NUMBER = '50685891000'
export const WHATSAPP_DISPLAY = '(+506) 8589-1000'
export const CENTRAL_PHONE = '(+506) 2519-7777'
export const CENTRAL_TEL = '+50625197777'
export const SALES_EMAIL = 'Ventas@grupopurdy.com'
export const MAPS_URL = 'https://maps.app.goo.gl/YwF9cAWcii26m1nQ9'
export const PURDY_GO_URL =
  'https://purdygo.com/buscar-vehiculos?isFromReservation=true&isfromCtalogo=false&stateProcess=reservation&brand=FAW'

export const WORKSHOP_ADDRESS =
  'De la entrada principal de Ciudad Toyota, 100 metros al oeste, 250 metros al norte, San José, Las Ánimas, 10107'

export const WA_INFO_TEXT = 'Hola quiero información de FAW'
export const WA_POSTVENTA_TEXT = 'Hola deseo solicitar prueba de manejo'

export type SiteLocation = {
  id: string
  name: string
  isBranchOffice: boolean
  isRepairShop: boolean
  address: string
  phone: string
  branchHours: string
  workshopHours: string
  googleLink: string
  wazeLink: string
  appleMapsLink: string
  specialities: string[]
}

function mapLinks(
  address: string,
  googleLink = `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(address)}`,
) {
  const q = encodeURIComponent(address)
  return {
    googleLink,
    wazeLink: `https://waze.com/ul?q=${q}`,
    appleMapsLink: `https://maps.apple.com/?q=${q}`,
  }
}

export const locations: SiteLocation[] = [
  {
    id: 'sucursal-faw',
    name: 'Sucursal Faw',
    isBranchOffice: true,
    isRepairShop: true,
    address: WORKSHOP_ADDRESS,
    phone: CENTRAL_PHONE,
    branchHours: '',
    workshopHours: '',
    ...mapLinks(WORKSHOP_ADDRESS, MAPS_URL),
    specialities: [],
  },
  {
    id: 'purdy-center-cartago',
    name: 'Purdy Center Cartago',
    isBranchOffice: false,
    isRepairShop: true,
    address: 'Cartago, La Lima, contiguo a Almacén el Rey',
    phone: '(+506) 4080-6580',
    branchHours: '',
    workshopHours: '',
    ...mapLinks('Purdy Center Cartago La Lima'),
    specialities: [],
  },
  {
    id: 'purdy-center-grecia',
    name: 'Purdy Center Grecia',
    isBranchOffice: false,
    isRepairShop: true,
    address: 'De la entrada a Grecia 7 kilómetros, Edificio Fusión Inmobiliaria',
    phone: CENTRAL_PHONE,
    branchHours: '',
    workshopHours: '',
    ...mapLinks('Purdy Center Grecia Edificio Fusion Inmobiliaria'),
    specialities: [],
  },
  {
    id: 'purdy-center-nicoya',
    name: 'Purdy Center Nicoya',
    isBranchOffice: false,
    isRepairShop: true,
    address: '1 km del cruce de Nicoya, carretera a Santa Cruz',
    phone: CENTRAL_PHONE,
    branchHours: '',
    workshopHours: '',
    ...mapLinks('Purdy Center Nicoya carretera a Santa Cruz'),
    specialities: [],
  },
]

export const CATALOG_TITLE = 'Faw Trucks Costa Rica| Camiones | Grupo Purdy'
export const HOME_DESCRIPTION =
  'Conocé los camiones de FAW Trucks Costa Rica con el respaldo de Grupo Purdy. Mové tu empresa al futuro con poder y eficiencia. Obtené mayor información aquí.'
