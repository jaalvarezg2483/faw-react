import type { HomeContent } from '@/lib/content/types'
import { SiteHeader } from './site-header'
import { HomeHero } from './home-hero'
import { HomeModels } from './home-models'
import { TotalSupport } from './total-support'
import { HomeServices } from './home-services'
import { HomeActions } from './home-actions'
import { EthicsBar } from './ethics-bar'
import { SiteFooter } from './site-footer'

type Props = {
  content: HomeContent
}

export function HomePage({ content }: Props) {
  return (
    <div className="home-page">
      <SiteHeader items={content.nav} />
      <HomeHero banners={content.banners} />
      <HomeModels models={content.models} />
      <TotalSupport content={content.totalSupport} />
      <HomeServices content={content.services} />
      <HomeActions finance={content.finance} contact={content.contact} />
      <EthicsBar content={content.ethics} />
      <SiteFooter />
    </div>
  )
}
