import { AppImage } from '@/components/ui/AppImage'
import type { HomeModel } from '@/lib/content/types'

type Props = {
  title: string
  models: HomeModel[]
  headingLevel?: 'h1' | 'h2'
}

export function CatalogList({ title, models, headingLevel = 'h1' }: Props) {
  const Heading = headingLevel
  return (
    <section className="catalog-page">
      <div className="catalog-page__inner">
        <Heading className="catalog-page__title">{title}</Heading>
        <div className="catalog-page__grid">
          {models.map((model) => (
            <a
              key={model.id}
              className="model-card model-card--catalog"
              href={`/modelos/${model.slug}`}
            >
              <div className="model-card__heading">
                <span className="model-card__bar" />
                <h3>{model.name}</h3>
              </div>
              <p className="model-card__desde">Desde </p>
              <p className="model-card__price">{model.priceLabel}</p>
              <p className="model-card__meta">{model.passengersLabel}</p>
              <p className="model-card__meta">{model.code}</p>
              <span className="model-card__media">
                <AppImage className="model-card__image" src={model.imageUrl} alt={model.name} />
              </span>
            </a>
          ))}
        </div>
      </div>
    </section>
  )
}
