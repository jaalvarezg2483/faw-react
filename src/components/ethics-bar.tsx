import type { HomeContent } from '@/lib/content/types'

type Props = {
  content: HomeContent['ethics']
}

export function EthicsBar({ content }: Props) {
  return (
    <section className="ethics-bar">
      <p>{content.text}</p>
      <a className="ethics-bar__btn" href={content.href}>
        <span className="ethics-bar__plus" aria-hidden="true">
          +
        </span>
        {content.ctaLabel}
      </a>
    </section>
  )
}
