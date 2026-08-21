'use client'

import { AppImage } from '@/components/ui/AppImage'
import { useState } from 'react'
import type { NavItem } from '@/lib/content/types'
import { SiteNav } from './site-nav'

type Props = {
  items: NavItem[]
}

export function SiteHeader({ items }: Props) {
  const [open, setOpen] = useState(false)

  return (
    <header className="site-header">
      <a className="site-header__logo" href="/home" aria-label="FAW TRUCKS">
        <AppImage src="/assets/images/Faw.png" alt="" />
        <span>FAW TRUCKS</span>
      </a>
      <button
        type="button"
        className={open ? 'site-header__menu site-header__menu--close' : 'site-header__menu'}
        aria-label={open ? 'Cerrar menú' : 'Abrir menú'}
        aria-expanded={open}
        onClick={() => setOpen((value) => !value)}
      >
        {open ? (
          <span className="site-header__close" aria-hidden="true">
            ×
          </span>
        ) : (
          <span className="site-header__burger" aria-hidden="true">
            <span />
            <span />
            <span />
          </span>
        )}
      </button>
      {open ? <SiteNav items={items} onNavigate={() => setOpen(false)} /> : null}
    </header>
  )
}
