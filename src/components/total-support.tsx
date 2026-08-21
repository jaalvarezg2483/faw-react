import { AppImage } from '@/components/ui/AppImage'
import type { HomeContent } from '@/lib/content/types'

type Props = {
  content: HomeContent['totalSupport']
}

export function TotalSupport({ content }: Props) {
  return (
    <section className="total-support">
      <div className="total-support__copy">
        <h2>{content.title}</h2>
        {content.body.split('\n\n').map((paragraph) => (
          <p key={paragraph.slice(0, 24)}>{paragraph}</p>
        ))}
        <a className="btn-outline" href={content.ctaHref}>
          {content.ctaLabel}
        </a>
      </div>
      <div className="total-support__art">
        <AppImage src={content.infographicUrl} alt="SERVICIOS POST VENTA" />
      </div>
    </section>
  )
}
