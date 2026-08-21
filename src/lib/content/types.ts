export type HomeBanner = {
  id: string
  imageUrl: string
  imageUrlMobile: string | null
  alt: string
}

export type HomeModel = {
  id: string
  code: string
  name: string
  slug: string
  priceLabel: string
  priceBase: number
  passengersLabel: string
  imageUrl: string
  kind: 'Camion' | 'Cabezal' | 'Vagoneta'
  description?: string
  techSpecUrl?: string
}

export type NavItem = {
  id: string
  label: string
  href: string | null
  children?: { id: string; label: string; href: string }[]
}

export type HomeServiceCard = {
  id: string
  title: string
  imageUrl: string
  href: string
  external?: boolean
}

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

export type MaintenancePlan = {
  id: string
  name: string
  imageUrl?: string
  imageUrl2?: string
}

export type SiteCopy = {
  servicesPage: { title: string; body: string }
  plansPage: { title: string; intro: string }
  workshopsPage: { title: string; body: string; imageUrl: string }
}

export type HomeContent = {
  banners: HomeBanner[]
  models: HomeModel[]
  nav: NavItem[]
  locations: SiteLocation[]
  plans: MaintenancePlan[]
  planBannerUrl: string
  copy: SiteCopy
  totalSupport: {
    title: string
    body: string
    ctaLabel: string
    ctaHref: string
    infographicUrl: string
  }
  services: {
    title: string
    body: string
    cards: HomeServiceCard[]
  }
  finance: {
    title: string
    calcLabel: string
    body: string
    ctaLabel: string
    href: string
    iconUrl: string
  }
  contact: {
    title: string
    body: string
    ctaLabel: string
    href: string
    iconUrl: string
  }
  ethics: {
    text: string
    ctaLabel: string
    href: string
  }
}
