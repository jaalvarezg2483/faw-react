import { AppImage } from '@/components/ui/AppImage'
import type { HomeContent } from '@/lib/content/types'

type Props = {
  finance: HomeContent['finance']
  contact: HomeContent['contact']
}

export function HomeActions({ finance, contact }: Props) {
  return (
    <section className="home-actions">
      <article className="home-actions__block">
        <AppImage src={finance.iconUrl} alt="" />
        <h2>{finance.title}</h2>
        <a className="home-actions__calc" href={finance.href}>
          {finance.calcLabel}
        </a>
        <p>{finance.body}</p>
        <a className="btn-outline" href={finance.href}>
          {finance.ctaLabel}
        </a>
      </article>
      <article className="home-actions__block">
        <AppImage src={contact.iconUrl} alt="" />
        <h2>{contact.title}</h2>
        <p>{contact.body}</p>
        <a className="btn-outline" href={contact.href}>
          {contact.ctaLabel}
        </a>
      </article>
    </section>
  )
}
