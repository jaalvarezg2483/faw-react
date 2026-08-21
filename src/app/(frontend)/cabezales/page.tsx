import type { Metadata } from 'next'
import { CatalogList } from '@/components/catalog-list'
import { SiteChrome } from '@/components/site-chrome'
import { getHomeContent } from '@/lib/content/get-home'
import { CATALOG_TITLE, HOME_DESCRIPTION } from '@/lib/content/site'

export const dynamic = 'force-dynamic'

export const metadata: Metadata = {
  title: CATALOG_TITLE,
  description: HOME_DESCRIPTION,
}

export default async function CabezalesPage() {
  const content = await getHomeContent()
  const models = content.models.filter((model) => model.kind === 'Cabezal')
  return (
    <SiteChrome nav={content.nav} ethics={content.ethics}>
      <CatalogList title="Cabezales:" models={models} />
    </SiteChrome>
  )
}
