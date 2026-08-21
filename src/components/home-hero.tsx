'use client'

import { AppImage } from '@/components/ui/AppImage'
import { useState } from 'react'
import type { HomeBanner } from '@/lib/content/types'

type Props = {
  banners: HomeBanner[]
}

export function HomeHero({ banners }: Props) {
  const [index, setIndex] = useState(0)
  const current = banners[index] ?? banners[0]
  if (!current) return null

  const go = (direction: number) => {
    if (banners.length < 2) return
    setIndex((value) => {
      const next = value + direction
      if (next < 0) return banners.length - 1
      if (next >= banners.length) return 0
      return next
    })
  }

  return (
    <section className="home-hero" aria-label="Banner">
      <AppImage className="home-hero__image" src={current.imageUrl} alt={current.alt} />
      <button
        type="button"
        className="home-hero__arrow home-hero__arrow--prev"
        aria-label="Anterior"
        onClick={() => go(-1)}
      >
        ‹
      </button>
      <button
        type="button"
        className="home-hero__arrow home-hero__arrow--next"
        aria-label="Siguiente"
        onClick={() => go(1)}
      >
        ›
      </button>
    </section>
  )
}
