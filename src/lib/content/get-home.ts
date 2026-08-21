import { unstable_cache } from 'next/cache'
import { getPayload } from 'payload'
import config from '@payload-config'

import { mediaUrl } from '@/lib/cms/media-url'
import { homeFallback } from './home-fallback'
import type {
  HomeBanner,
  HomeContent,
  HomeModel,
  HomeServiceCard,
  NavItem,
  SiteLocation,
} from './types'

type ModelKind = HomeModel['kind']

function formatPrice(value: number | null | undefined): string {
  if (value == null || Number.isNaN(value)) return ''
  const formatted = Math.round(value)
    .toString()
    .replace(/\B(?=(\d{3})+(?!\d))/g, '.')
  return `$${formatted}*`
}

function passengersLabel(value: string | number | null | undefined): string {
  if (value == null || value === '') return ''
  const text = String(value)
  if (/pasajero/i.test(text)) return text
  return `${text} Pasajeros`
}

function pick<T>(cms: T | null | undefined, fallback: T): T {
  if (cms == null) return fallback
  if (typeof cms === 'string' && cms.trim() === '') return fallback
  return cms
}

async function loadHomeContent(): Promise<HomeContent> {
  try {
    const payload = await getPayload({ config })
    const [modelsRes, bannersRes, servicesRes, navRes, locationsRes, plansRes, settings] =
      await Promise.all([
        payload.find({
          collection: 'models',
          where: { and: [{ enable: { equals: true } }, { isProd: { equals: true } }] },
          sort: 'order',
          limit: 50,
          depth: 1,
        }),
        payload.find({
          collection: 'banners',
          where: { enable: { equals: true } },
          sort: 'order',
          limit: 20,
          depth: 1,
        }),
        payload.find({
          collection: 'services',
          where: { isActive: { equals: true } },
          sort: 'order',
          limit: 20,
          depth: 1,
        }),
        payload.find({
          collection: 'nav-items',
          where: { enable: { equals: true } },
          sort: 'order',
          limit: 40,
          depth: 1,
        }),
        payload.find({
          collection: 'locations',
          where: { isActive: { equals: true } },
          sort: 'order',
          limit: 40,
          depth: 0,
        }),
        payload.find({
          collection: 'maintenance-plans',
          where: { enabled: { equals: true } },
          sort: 'order',
          limit: 20,
          depth: 1,
        }),
        payload.findGlobal({ slug: 'site-settings', depth: 1 }),
      ])

    const models: HomeModel[] =
      modelsRes.docs.length === 0
        ? homeFallback.models
        : modelsRes.docs.map((doc) => {
            const fallback = homeFallback.models.find(
              (model) =>
                model.code === String(doc.code ?? '') || model.slug === String(doc.slug ?? ''),
            )
            const kind = (
              doc.type === 'Cabezal' || doc.type === 'Vagoneta' || doc.type === 'Camion'
                ? doc.type
                : (fallback?.kind ?? 'Camion')
            ) as ModelKind
            const display = doc.promoPrice && doc.promoPrice > 0 ? doc.promoPrice : doc.priceBase
            return {
              id: String(doc.id),
              code: String(doc.code ?? fallback?.code ?? ''),
              name: String(doc.name ?? fallback?.name ?? ''),
              slug: String(doc.slug ?? fallback?.slug ?? ''),
              priceLabel: formatPrice(display ?? undefined) || fallback?.priceLabel || '',
              priceBase: display ?? fallback?.priceBase ?? 0,
              passengersLabel: passengersLabel(doc.passengers) || fallback?.passengersLabel || '',
              imageUrl: mediaUrl(doc.image, doc.urlImage || fallback?.imageUrl || ''),
              kind,
              description: doc.description || fallback?.description,
              techSpecUrl: doc.urlTechSpec || fallback?.techSpecUrl,
            }
          })

    const homeBanners = bannersRes.docs.filter((doc) => doc.section === 'Inicio')
    const banners: HomeBanner[] =
      homeBanners.length === 0
        ? homeFallback.banners
        : homeBanners.map((doc) => ({
            id: String(doc.id),
            imageUrl: mediaUrl(doc.image, doc.bannerUrl || homeFallback.banners[0]?.imageUrl || ''),
            imageUrlMobile: mediaUrl(doc.imageMobile, doc.bannerUrlMobile || '') || null,
            alt: doc.alt || 'FAW Trucks',
          }))

    const planBanner = bannersRes.docs.find((doc) => doc.section === 'PlanesMantenimiento')
    const planBannerUrl = planBanner
      ? mediaUrl(planBanner.image, planBanner.bannerUrl || homeFallback.planBannerUrl)
      : homeFallback.planBannerUrl

    const serviceCards: HomeServiceCard[] =
      servicesRes.docs.length === 0
        ? homeFallback.services.cards
        : servicesRes.docs.map((doc) => ({
            id: String(doc.id),
            title: String(doc.title ?? ''),
            imageUrl: mediaUrl(doc.image, doc.url || ''),
            href: doc.link || doc.page || '#',
            external: Boolean(doc.link && /^https?:/i.test(doc.link)),
          }))

    const nav = mapNav(navRes.docs as unknown as CmsNavDoc[]) || homeFallback.nav

    const mappedLocations: SiteLocation[] =
      locationsRes.docs.length === 0
        ? homeFallback.locations
        : locationsRes.docs.map((doc) => ({
            id: String(doc.id),
            name: String(doc.name ?? ''),
            isBranchOffice: Boolean(doc.isBranchOffice),
            isRepairShop: Boolean(doc.isRepairShop),
            address: String(doc.address ?? ''),
            phone: String(doc.phone ?? ''),
            branchHours: String(doc.branchHours ?? ''),
            workshopHours: String(doc.workshopHours ?? ''),
            googleLink: String(doc.googleLink ?? ''),
            wazeLink: String(doc.wazeLink ?? ''),
            appleMapsLink: String(doc.appleMapsLink ?? ''),
            specialities: String(doc.specialities ?? '')
              .split('\n')
              .map((item) => item.trim())
              .filter(Boolean),
          }))

    const plans =
      plansRes.docs.length === 0
        ? homeFallback.plans
        : plansRes.docs.map((doc) => ({
            id: String(doc.id),
            name: String(doc.name ?? ''),
            imageUrl: mediaUrl(doc.image, doc.planImageUrl || ''),
            imageUrl2: mediaUrl(doc.image2, doc.planImageUrl2 || ''),
          }))

    const settingsData = settings as {
      ethics?: { text?: string | null; ctaLabel?: string | null; href?: string | null }
      servicesPage?: { title?: string | null; body?: string | null }
      plansPage?: { title?: string | null; intro?: string | null }
      workshopsPage?: { title?: string | null; body?: string | null; image?: unknown }
    }

    return {
      ...homeFallback,
      banners,
      models,
      nav,
      locations: mappedLocations,
      plans,
      planBannerUrl,
      services: { ...homeFallback.services, cards: serviceCards },
      ethics: {
        text: pick(settingsData.ethics?.text, homeFallback.ethics.text),
        ctaLabel: pick(settingsData.ethics?.ctaLabel, homeFallback.ethics.ctaLabel),
        href: pick(settingsData.ethics?.href, homeFallback.ethics.href),
      },
      copy: {
        servicesPage: {
          title: pick(settingsData.servicesPage?.title, homeFallback.copy.servicesPage.title),
          body: pick(settingsData.servicesPage?.body, homeFallback.copy.servicesPage.body),
        },
        plansPage: {
          title: pick(settingsData.plansPage?.title, homeFallback.copy.plansPage.title),
          intro: pick(settingsData.plansPage?.intro, homeFallback.copy.plansPage.intro),
        },
        workshopsPage: {
          title: pick(settingsData.workshopsPage?.title, homeFallback.copy.workshopsPage.title),
          body: pick(settingsData.workshopsPage?.body, homeFallback.copy.workshopsPage.body),
          imageUrl: mediaUrl(
            settingsData.workshopsPage?.image,
            homeFallback.copy.workshopsPage.imageUrl,
          ),
        },
      },
    }
  } catch (error) {
    console.error('[content] Payload indisponible; usando fallback migrado', error)
    return homeFallback
  }
}

export const getHomeContent = unstable_cache(loadHomeContent, ['faw-home-content'], {
  revalidate: 86_400,
  tags: [
    'site-settings',
    'home-page',
    'header',
    'footer',
    'navigation',
    'models',
    'banners',
    'services',
    'locations',
    'maintenance-plans',
    'media',
  ],
})

type CmsNavDoc = {
  id: string | number
  name?: string | null
  urlLink?: string | null
  parent?: string | number | { id?: string | number } | null
}

function mapNav(docs: CmsNavDoc[]): NavItem[] | null {
  if (docs.length === 0) return null
  const childrenByParent = new Map<string, { id: string; label: string; href: string }[]>()
  const roots: NavItem[] = []

  for (const doc of docs) {
    const parent = doc.parent
    const parentId =
      parent && typeof parent === 'object' && parent !== null && 'id' in parent
        ? String((parent as { id: unknown }).id)
        : typeof parent === 'number' || typeof parent === 'string'
          ? String(parent)
          : ''
    const item = {
      id: String(doc.id),
      label: String(doc.name ?? ''),
      href: (doc.urlLink as string) || null,
    }
    if (parentId) {
      const list = childrenByParent.get(parentId) ?? []
      if (item.href) list.push({ id: item.id, label: item.label, href: item.href })
      childrenByParent.set(parentId, list)
    } else {
      roots.push(item)
    }
  }

  return roots.map((item) => {
    const children = childrenByParent.get(item.id)
    return children?.length ? { ...item, children } : item
  })
}

export async function getModels(): Promise<HomeModel[]> {
  const content = await getHomeContent()
  return content.models
}

export async function getModelBySlug(slug: string): Promise<HomeModel | undefined> {
  const models = await getModels()
  return models.find((model) => model.slug === slug)
}
