import { AppImage } from '@/components/ui/AppImage'
import { WARRANTY_PDF } from '@/lib/content/home-fallback'

export function SiteFooter() {
  return (
    <footer className="site-footer">
      <div className="site-footer__row site-footer__row--titles">
        <a href="/models">Camiones</a>
        <a href="/contactenos">Contactanos</a>
        <a href="/servicios">Total Support</a>
        <a href="https://www.grupopurdy.com/" target="_blank" rel="noreferrer">
          Grupo Purdy
        </a>
      </div>
      <div className="site-footer__row site-footer__row--legal">
        <a href="/terms">Términos y condiciones</a>
        <a href="/cookies">Cookies</a>
        <a href="/sitemap">Mapa</a>
        <a href="https://www.grupopurdy.com/es/sostenibilidad" target="_blank" rel="noreferrer">
          Sostenibilidad
        </a>
        <a href={WARRANTY_PDF} target="_blank" rel="noreferrer">
          Documento Garantía
        </a>
      </div>
      <div className="site-footer__row site-footer__row--bottom">
        <div className="site-footer__social">
          <a
            href="https://www.facebook.com/share/orQ9LgyG8Ejs6nqj/?mibextid=JRoKGi"
            aria-label="Facebook"
          >
            <AppImage src="/assets/images/facebookic.png" alt="" width={25} height={25} />
          </a>
          <a href="https://www.instagram.com/fawtruckscostarica" aria-label="Instagram">
            <AppImage src="/assets/images/instagramic.png" alt="" width={25} height={25} />
          </a>
          <a href="https://www.youtube.com/channel/UCPBsqRYV9v-sfNYJpL1tfEw" aria-label="YouTube">
            <AppImage src="/assets/images/youtubeic.png" alt="" width={25} height={25} />
          </a>
          <a
            href="https://api.whatsapp.com/send/?phone=50685891000&text=Hola+quiero+informaci%C3%B3n+de+FAW&type=phone_number&app_absent=0"
            aria-label="WhatsApp"
          >
            <AppImage src="/assets/images/whatsappic.png" alt="" width={25} height={25} />
          </a>
        </div>
        <AppImage
          className="site-footer__brands"
          src="/assets/images/FawPurdyLogos.png"
          alt="FAW TRUCKS | GRUPO PURDY"
        />
        <p className="site-footer__copy">© 2026 Grupo Purdy | Faw Trucks</p>
      </div>
    </footer>
  )
}
