import type { HomeContent, NavItem } from '@/lib/content/types'
import { homeFallback } from '@/lib/content/home-fallback'
import { SiteHeader } from './site-header'
import { EthicsBar } from './ethics-bar'
import { SiteFooter } from './site-footer'

type Props = {
  children: React.ReactNode
  nav?: NavItem[]
  ethics?: HomeContent['ethics']
}

export function SiteChrome({ children, nav, ethics }: Props) {
  return (
    <div className="site-shell">
      <SiteHeader items={nav ?? homeFallback.nav} />
      <main className="site-main">{children}</main>
      <EthicsBar content={ethics ?? homeFallback.ethics} />
      <SiteFooter />
    </div>
  )
}
