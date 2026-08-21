import { AppImage } from '@/components/ui/AppImage'
import type { HomeModel } from '@/lib/content/types'

type Props = {
  models: HomeModel[]
}

export function HomeModels({ models }: Props) {
  return (
    <section className="home-models">
      <h2 className="home-models__title">Camiones Disponibles:</h2>
      <div className="home-models__grid">
        {models.map((model) => (
          <a key={model.id} className="model-card" href={`/modelos/${model.slug}`}>
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
    </section>
  )
}
