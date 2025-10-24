# Guía PWA - CicloCross Chile

## ✅ Configuración Completada

Tu aplicación ahora está configurada como una Progressive Web App (PWA). Se han implementado los siguientes elementos:

### 1. Manifest.json

- Ubicación: `/public/manifest.json`
- Configurado con nombre, descripción, iconos y tema de colores
- Display mode: standalone (se ve como app nativa)
- Idioma: español chileno (es-CL)

### 2. Vite PWA Plugin

- Instalado `vite-plugin-pwa` y `workbox-window`
- Configurado en `vite.config.js` con:
  - Auto-actualización del service worker
  - Cache para archivos estáticos
  - Cache inteligente para llamadas a Supabase (NetworkFirst strategy)
  - Caché de 1 hora para datos de la API

### 3. Meta Tags PWA

- Agregados en `index.html`:
  - Theme color
  - Apple mobile web app capable
  - Apple touch icon
  - Link al manifest

### 4. Service Worker

- Se generará automáticamente al hacer build
- Estrategia NetworkFirst para la API de Supabase
- Cache de todos los assets estáticos

## 📋 Pasos Pendientes

### 1. Crear Iconos

Necesitas crear los iconos de la app en los siguientes tamaños y colocarlos en `/public/icons/`:

- icon-72x72.png
- icon-96x96.png
- icon-128x128.png
- icon-144x144.png
- icon-152x152.png
- icon-192x192.png
- icon-384x384.png
- icon-512x512.png

**Herramientas recomendadas:**

- [RealFaviconGenerator](https://realfavicongenerator.net/)
- [PWA Builder Image Generator](https://www.pwabuilder.com/imageGenerator)

### 2. Probar la PWA

#### En desarrollo:

```bash
npm run dev
```

#### Para probar como PWA (requiere HTTPS o localhost):

```bash
npm run build
npm run preview
```

Luego abre Chrome DevTools → Application → Manifest/Service Workers

### 3. Instalar la PWA

**En Desktop (Chrome/Edge):**

1. Abre la app en el navegador
2. Busca el ícono de instalación en la barra de direcciones
3. Haz clic en "Instalar"

**En Móvil (Android/iOS):**

1. Abre la app en el navegador
2. En el menú del navegador, selecciona "Agregar a pantalla de inicio"

## 🚀 Deploy en Producción

Para que la PWA funcione correctamente en producción:

1. **HTTPS obligatorio**: Asegúrate de que tu sitio use HTTPS
2. **Build**: Ejecuta `npm run build`
3. **Service Worker**: Se generará automáticamente en `dist/`
4. **Manifest**: Se copiará a `dist/manifest.json`

## 🔧 Configuración Actual

### Estrategias de Cache:

**Assets Estáticos:**

- JS, CSS, HTML, imágenes, fuentes
- Se cachean automáticamente al visitar

**API de Supabase:**

- Estrategia: NetworkFirst (intenta red primero, luego cache)
- TTL: 1 hora
- Máximo 50 entradas en cache

### Características:

- ✅ Funciona offline (una vez cacheada)
- ✅ Auto-actualización del service worker
- ✅ Instalable en escritorio y móvil
- ✅ Optimizada para Supabase
- ✅ Theme color personalizado

## 📝 Notas Importantes

1. Los service workers solo funcionan en:
   - HTTPS (producción)
   - localhost (desarrollo)

2. Para ver cambios en el service worker:
   - Cierra todas las pestañas de la app
   - Vuelve a abrir o usa DevTools → Application → Service Workers → Update

3. Para limpiar el cache durante desarrollo:
   - Chrome DevTools → Application → Clear storage

## 🎨 Personalización

Puedes ajustar colores y configuración en:

- `vite.config.js` → VitePWA options
- `public/manifest.json` → theme_color, background_color
- `index.html` → meta theme-color

¡Tu app CicloCross Chile ahora es una PWA completa! 🚴‍♂️
