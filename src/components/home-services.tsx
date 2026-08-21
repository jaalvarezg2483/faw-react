import { AppImage } from '@/components/ui/AppImage'
import type { HomeContent } from '@/lib/content/types'

type Props = {
  content: HomeContent['services']
}

export function HomeServices({ content }: Props) {
  return (
    <section className="home-services">
      <h2>{content.title}</h2>
      {content.body
        ? content.body.split('\n\n').map((paragraph) => (
            <p key={paragraph.slice(0, 24)} className="home-services__intro">
              {paragraph}
            </p>
          ))
        : null}
      <div className="home-services__grid">
        {content.cards.map((card) => (
          <article key={card.id} className="service-card">
            <AppImage src={card.imageUrl} alt="" />
            <h3>{card.title}</h3>
            <a
              className="btn-outline"
              href={card.href}
              {...(card.external ? { target: '_blank', rel: 'noopener noreferrer' } : {})}
            >
              Ver más
            </a>
          </article>
        ))}
      </div>
    </section>
  )
}
