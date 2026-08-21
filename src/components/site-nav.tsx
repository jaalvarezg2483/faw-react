'use client'

import { useState } from 'react'
import type { NavItem } from '@/lib/content/types'

type Props = {
  items: NavItem[]
  onNavigate: () => void
}

export function SiteNav({ items, onNavigate }: Props) {
  const [openGroup, setOpenGroup] = useState<string | null>(null)

  return (
    <div className="site-nav" role="dialog" aria-label="Menú">
      <nav className="site-nav__list">
        {items.map((item) => {
          if (item.children?.length) {
            const expanded = openGroup === item.id
            return (
              <div key={item.id} className="site-nav__group">
                <button
                  type="button"
                  className="site-nav__link site-nav__link--button"
                  aria-expanded={expanded}
                  onClick={() => setOpenGroup(expanded ? null : item.id)}
                >
                  {item.label}
                </button>
                {expanded ? (
                  <div className="site-nav__children">
                    {item.children.map((child) => (
                      <a key={child.id} href={child.href} onClick={onNavigate}>
                        {child.label}
                      </a>
                    ))}
                  </div>
                ) : null}
              </div>
            )
          }

          return (
            <a
              key={item.id}
              className={
                item.id === 'inicio' ? 'site-nav__link site-nav__link--current' : 'site-nav__link'
              }
              href={item.href ?? '/home'}
              onClick={onNavigate}
            >
              {item.label}
            </a>
          )
        })}
      </nav>
      <div className="site-nav__social">
        <a
          href="https://www.facebook.com/share/orQ9LgyG8Ejs6nqj/?mibextid=JRoKGi"
          aria-label="Facebook"
        >
          <svg viewBox="0 0 24 24" width="22" height="22" aria-hidden="true">
            <path
              fill="currentColor"
              d="M14 8h3V4h-3c-2.8 0-5 2.2-5 5v3H6v4h3v8h4v-8h3.2L17 12h-4V9c0-.6.4-1 1-1z"
            />
          </svg>
        </a>
        <a href="https://www.instagram.com/fawtruckscostarica" aria-label="Instagram">
          <svg viewBox="0 0 24 24" width="22" height="22" aria-hidden="true">
            <path
              fill="currentColor"
              d="M7 3h10a4 4 0 0 1 4 4v10a4 4 0 0 1-4 4H7a4 4 0 0 1-4-4V7a4 4 0 0 1 4-4zm10 2H7a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2zm-5 3.2A3.8 3.8 0 1 1 8.2 12 3.8 3.8 0 0 1 12 8.2zm0 1.8a2 2 0 1 0 2 2 2 2 0 0 0-2-2zM17.4 6.6a1 1 0 1 1-1 1 1 1 0 0 1 1-1z"
            />
          </svg>
        </a>
        <a href="https://www.linkedin.com/company/faw-trucks-costa-rica/" aria-label="LinkedIn">
          <svg viewBox="0 0 24 24" width="22" height="22" aria-hidden="true">
            <path
              fill="currentColor"
              d="M6.5 9H3.7v11h2.8V9zM5.1 4.2A1.7 1.7 0 1 0 5.1 7.6 1.7 1.7 0 0 0 5.1 4.2zM20.3 20h-2.8v-5.4c0-1.3 0-3-1.8-3s-2.1 1.4-2.1 2.9V20H10.8V9h2.7v1.5h.1c.4-.7 1.3-1.5 2.7-1.5 2.9 0 3.4 1.9 3.4 4.4V20z"
            />
          </svg>
        </a>
      </div>
    </div>
  )
}
