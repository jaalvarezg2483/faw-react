import type { Metadata } from 'next'

import { PlansPage } from '@/components/plans-page'
import { SiteChrome } from '@/components/site-chrome'
import { getHomeContent } from '@/lib/content/get-home'
import { CATALOG_TITLE, HOME_DESCRIPTION } from '@/lib/content/site'

export const dynamic = 'force-dynamic'

export const metadata: Metadata = {
  title: CATALOG_TITLE,
  description: HOME_DESCRIPTION,
}

export default async function PlanesDeMantenimientoPage() {
  const content = await getHomeContent()
  return (
    <SiteChrome nav={content.nav} ethics={content.ethics}>
      <PlansPage
        title={content.copy.plansPage.title}
        intro={content.copy.plansPage.intro}
        bannerUrl={content.planBannerUrl}
        plans={content.plans}
      />
    </SiteChrome>
  )
}
