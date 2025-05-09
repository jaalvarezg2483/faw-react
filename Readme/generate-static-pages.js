const fs = require('fs');
const path = require('path');

const URLBASE = "https://ashy-grass-004a6c20f-preview.eastus2.5.azurestaticapps.net"
//const URLBASE = "https://fawtrucks.cr"

// Lista de páginas a generar
const pages = [
    {
      route: "home",
      title: "Faw Trucks Costa Rica| Camiones | Grupo Purdy",
      description: "Conocé los camiones de FAW Trucks Costa Rica con el respaldo de Grupo Purdy. Mové tu empresa al futuro con poder y eficiencia. Obtené mayor información aquí.",
      image: "/assets/assets/images/splash_faw.png",
      keywords: "Faw Costa Rica, Camiones, flotilla empresarial, Faw, repuestos Faw, Faw ficha técnica, Faw camiones precios, Faw Trucks Costa Rica, Flotilla de camiones, soluciones de tranporte empresarial, venta de camiones, venta de camiones Costa Rica"
    },
    {
        route: "financiamiento",
        title: "Financiamiento | Faw Trucks Costa Rica | Grupo Purdy",
        description: "Conocé las opciones de financiamiento de Faw Trucks Costa Rica con el respaldo de Grupo Purdy. ¡Solicitalo hoy mismo y mové tu negocio!",
        image: "/assets/assets/images/splash_faw.png",
        keywords: "Financiamiento camiones, financiamiento Faw Trucks"
    },
    {
        route: "contactenos",
        title: "Contactanos | Faw Trucks Costa Rica | Grupo Purdy",
        description: "Contactanos en Faw Trucks Costa Rica con el respaldo de Grupo Purdy. ¡Escribinos hoy y llevá tu negocio al siguiente nivel!",
        image: "/assets/assets/images/splash_faw.png",
        keywords: "contactanos, Faw Trucks Costa Rica, Grupo Purdy"
      },
];

// Directorio base para los archivos generados
const outputDir = path.join(__dirname, 'dist');

// Crea el contenido HTML para cada página
const generateHtmlContent = (page) => `
<!DOCTYPE html>
<html lang="es">
<head>
    <!-- Flutter base -->
    <base href="/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="IE=Edge" http-equiv="X-UA-Compatible">

    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Faw">

    <!-- Google Tag Manager -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-WSRVH3LK');</script>
    <!-- End Google Tag Manager -->

    <!-- Metadatos personalizados -->
    <title>${page.title}</title>
    <meta name="description" content="${page.description}">
    <meta name="keywords" content="${page.keywords}">

    <!-- Open Graph & SEO tags -->
    <meta property="og:title" content="${page.title}" />
    <meta property="og:description" content="${page.description}" />
    <meta property="og:image" content="${URLBASE}${page.image}" /> 
    <meta property="og:url" content="${page.route}" />

    <meta name="twitter:title" content="${page.title}" />
    <meta name="twitter:description" content="${page.description}" />
    <meta name="twitter:image" content="${URLBASE}${page.image}" />
    <meta name="twitter:card" content="summary_large_image" />

    <!-- Status Bar color in Safari browser (iOS) and PWA -->
    <meta name="theme-color" media="(prefers-color-scheme: light)" content="#f1f4f8">
    <meta name="theme-color" media="(prefers-color-scheme: dark)"  content="#f1f4f8">

    <link rel="manifest" href="${URLBASE}/manifest.json">

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="${URLBASE}/favicon.png" />

    <!-- Flutter Scripts -->
    <script>
        // Service Worker version injected by Flutter
        var serviceWorkerVersion = null;
    </script>
    <script src="/flutter.js" defer></script>
</head>
<body>
  <script>
    window.addEventListener('load', function (ev) {
      // Descargar main.dart.js para cargar Flutter
      _flutter.loader.loadEntrypoint({
        entrypointUrl: '/main.dart.js',
        serviceWorker: {
          serviceWorkerUrl: '/flutter_service_worker.js?v=',
          serviceWorkerVersion: serviceWorkerVersion,
        },
        onEntrypointLoaded: async function(engineInitializer) {
          // Inicializar Flutter
          let appRunner = await engineInitializer.initializeEngine({});
          await appRunner.runApp();
        }
      });
    });
  </script>
</body>
</html>
`;

// Crea las carpetas y los archivos HTML
const generateStaticPages = () => {
  pages.forEach(page => {
    const pageDir = path.join(outputDir, page.route);
    
    // Crea la carpeta si no existe
    fs.mkdirSync(pageDir, { recursive: true });
    
    // Genera el contenido del archivo HTML
    const htmlContent = generateHtmlContent(page);
    
    // Escribe el archivo HTML
    const filePath = path.join(pageDir, 'index.html');
    fs.writeFileSync(filePath, htmlContent, 'utf8');

    console.log(`Página generada: ${filePath}`);
  });
};

// Ejecuta la generación de las páginas
generateStaticPages();