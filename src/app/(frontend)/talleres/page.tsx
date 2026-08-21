import type { Metadata } from 'next'
import { SiteChrome } from '@/components/site-chrome'
import { WorkshopsPage } from '@/components/workshops-page'
import { getHomeContent } from '@/lib/content/get-home'
import { CATALOG_TITLE, HOME_DESCRIPTION } from '@/lib/content/site'

export const dynamic = 'force-dynamic'

export const metadata: Metadata = {
  title: CATALOG_TITLE,
  description: HOME_DESCRIPTION,
}

export default async function TalleresPage() {
  const content = await getHomeContent()
  return (
    <SiteChrome nav={content.nav} ethics={content.ethics}>
      <WorkshopsPage
        locations={content.locations}
        title={content.copy.workshopsPage.title}
        body={content.copy.workshopsPage.body}
        imageUrl={content.copy.workshopsPage.imageUrl}
      />
    </SiteChrome>
  )
}
