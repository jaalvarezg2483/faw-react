import Link from 'next/link'

export function AdminDashboardIntro() {
  return (
    <section className="faw-admin-dash-intro">
      <div>
        <p className="faw-admin-dash-intro__eyebrow">Panel de contenido</p>
        <h2 className="faw-admin-dash-intro__title">Hola, ¿qué vas a actualizar hoy?</h2>
        <p className="faw-admin-dash-intro__text">
          Usá el menú de la izquierda para administrar modelos, banners, planes de mantenimiento,
          ubicaciones, servicios y textos del sitio FAW.
        </p>
      </div>
      <Link className="faw-admin-dash-intro__cta" href="/admin/globals/home-page">
        Ir a Página de inicio
      </Link>
    </section>
  )
}
