import Image from 'next/image'

export function AdminNavBrand() {
  return (
    <div className="faw-admin-nav-brand">
      <Image
        alt="FAW Trucks Grupo Purdy"
        className="faw-admin-nav-brand__logo"
        height={40}
        src="/logos/faw-purdy.png"
        width={180}
      />
      <p className="faw-admin-nav-brand__title">FAW CMS</p>
      <p className="faw-admin-nav-brand__hint">Modelos, contenido y servicios</p>
    </div>
  )
}
