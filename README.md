# 🚴 Ciclocross Chile

Sitio web oficial para la comunidad de Ciclocross en Chile. Una aplicación web moderna desarrollada con Vue 3 que permite consultar resultados de carreras, perfiles de deportistas, y mantenerse informado sobre el mundo del ciclocross nacional.

## 📋 Descripción del Proyecto

Ciclocross Chile es una plataforma web diseñada para:

- **Resultados de Carreras**: Consulta los resultados de todas las competencias de ciclocross
- **Perfiles de Deportistas**: Visualiza estadísticas, biografías y trayectorias de los ciclistas
- **Búsqueda Avanzada**: Filtra por categoría, género, club y más
- **Contacto**: Comunícate directamente con la organización

## 🚀 Características Principales

### 📊 Gestión de Resultados

- Visualización de carreras por temporada y categoría
- Búsqueda por nombre de carrera
- Información detallada: fecha, ubicación, participantes
- Imágenes de cada evento

### 👥 Perfiles de Deportistas

- Listado completo de ciclistas registrados
- Estadísticas individuales (victorias, participaciones, podios)
- Biografías y trayectorias
- Historial completo de competencias
- Filtros por categoría, género y club

### 🎨 Diseño Moderno y Responsive

- Interfaz adaptada para móviles, tablets y desktop
- Estilos con Tailwind CSS
- Animaciones suaves y transiciones
- Navegación intuitiva

### 🔍 Sistema de Búsqueda

- Búsqueda en tiempo real
- Filtros múltiples combinables
- Ordenamiento personalizado

## 🛠️ Tecnologías

- **Vue 3** (Composition API) - Framework JavaScript progresivo
- **Vue Router 4** - Sistema de navegación
- **Tailwind CSS** - Framework de estilos utility-first
- **Vite** - Build tool de nueva generación
- **Supabase** - Backend as a Service (base de datos)
- **GSAP** - Librería de animaciones
- **PWA** - Progressive Web App capabilities

## 📦 Instalación

```sh
# Clonar el repositorio
git clone https://github.com/bombr1990/ciclocrosscl-tfp.git

# Navegar al directorio
cd ciclocrosscl

# Instalar dependencias
npm install
```

## 🔧 Configuración

### Variables de Entorno

Crea un archivo `.env` en la raíz del proyecto:

```env
VITE_SUPABASE_URL=tu_supabase_url
VITE_SUPABASE_ANON_KEY=tu_supabase_anon_key
```

## 🚀 Uso

### Desarrollo

```sh
# Iniciar servidor de desarrollo
npm run dev
```

El sitio estará disponible en `http://localhost:5173`

### Producción

```sh
# Compilar para producción
npm run build

# Previsualizar build de producción
npm run preview
```

### Linting

```sh
# Ejecutar ESLint
npm run lint

# Formatear código con Prettier
npm run format
```

## 📁 Estructura del Proyecto

```
ciclocrosscl/
├── public/                 # Archivos estáticos
│   ├── manifest.json      # PWA manifest
│   └── icons/             # Iconos de la aplicación
├── src/
│   ├── components/        # Componentes reutilizables
│   │   ├── Navbar.vue
│   │   ├── Footer.vue
│   │   ├── RaceCard.vue
│   │   ├── AthleteCard.vue
│   │   └── SearchBar.vue
│   ├── views/             # Páginas principales
│   │   ├── Home.vue
│   │   ├── Resultados.vue
│   │   ├── Deportistas.vue
│   │   ├── DeportistaDetalle.vue
│   │   └── Contacto.vue
│   ├── router/            # Configuración de rutas
│   ├── services/          # Servicios (API, Supabase)
│   ├── assets/            # Recursos (imágenes, etc)
│   ├── App.vue            # Componente raíz
│   ├── main.js            # Punto de entrada
│   └── style.css          # Estilos globales
├── database/              # Scripts de base de datos
├── docs/                  # Documentación del proyecto
└── README.md
```

## 🎯 Secciones del Sitio

### 🏠 Home

Página de inicio con presentación del ciclocross y acceso rápido a las secciones principales.

### 🏆 Resultados

Listado de carreras con filtros por temporada y categoría. Cada carrera muestra información detallada.

### 👤 Deportistas

Directorio completo de ciclistas con:

- Búsqueda por nombre
- Filtros por categoría, género y club
- Ordenamiento por victorias o participaciones
- Estadísticas individuales

### 📄 Detalle de Deportista

Perfil completo con biografía, estadísticas y historial de competencias.

### 📧 Contacto

Formulario de contacto con validación y información de la organización.

## 🌐 Despliegue

El proyecto está configurado para desplegarse en Netlify:

```toml
# netlify.toml
[build]
  command = "npm run build"
  publish = "dist"
```

## 🎨 Paleta de Colores

- **Primario**: Azul (#1e3a8a, #2563eb)
- **Secundario**: Amarillo (#fbbf24, #f59e0b)
- **Texto**: Gris (#111827, #6b7280)
- **Fondo**: Gris claro (#f9fafb)

## 📱 Responsive Breakpoints

- **Mobile**: < 768px
- **Tablet**: 768px - 1024px
- **Desktop**: > 1024px

## 💻 Entorno de Desarrollo Recomendado

### IDE

- [VS Code](https://code.visualstudio.com/)
- [Vue (Official)](https://marketplace.visualstudio.com/items?itemName=Vue.volar) - Extensión para Vue 3

### DevTools para Navegador

- **Chrome/Edge/Brave**: [Vue.js devtools](https://chromewebstore.google.com/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd)
- **Firefox**: [Vue.js devtools](https://addons.mozilla.org/en-US/firefox/addon/vue-js-devtools/)

## 🔗 Enlaces Útiles

- [Documentación de Vue 3](https://vuejs.org/)
- [Documentación de Vite](https://vitejs.dev/)
- [Documentación de Tailwind CSS](https://tailwindcss.com/)
- [Documentación de Supabase](https://supabase.com/docs)

## 📄 Documentación Adicional

Para más información detallada, consulta:

- [Estructura del Proyecto](./docs/ESTRUCTURA.md)
- [Guía de Temas](./docs/GUIA_TEMAS.md)
- [Configuración de Supabase](./docs/SUPABASE_SETUP.md)
- [Guía PWA](./docs/PWA_GUIDE.md)

## 👥 Contribuir

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -m 'Agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

## 📝 Licencia

Este proyecto es privado y está destinado para uso de la comunidad de Ciclocross Chile.

## ✨ Autor

Desarrollado como proyecto final del curso de Desarrollo Frontend en Shifta.

---

**Ciclocross Chile** - Promoviendo el ciclocross en Chile 🚴‍♂️🇨🇱
