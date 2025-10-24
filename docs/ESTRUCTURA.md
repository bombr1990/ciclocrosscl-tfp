# Ciclocross Chile - Estructura del Proyecto

## 📋 Descripción

Sitio web informativo para el Ciclocross de Chile con gestión de resultados, perfiles de deportistas y formulario de contacto.

## 🗂️ Estructura del Proyecto

```
src/
├── components/          # Componentes reutilizables
│   ├── Navbar.vue      # Barra de navegación con menú responsive
│   ├── Footer.vue      # Pie de página con información de contacto
│   ├── RaceCard.vue    # Tarjeta para mostrar información de carreras
│   ├── AthleteCard.vue # Tarjeta de perfil de deportista
│   └── SearchBar.vue   # Barra de búsqueda para deportistas
│
├── views/              # Vistas/Páginas principales
│   ├── Home.vue                # Página de inicio
│   ├── Resultados.vue          # Lista de resultados de carreras
│   ├── Deportistas.vue         # Listado de deportistas con filtros
│   ├── DeportistaDetalle.vue   # Perfil detallado de deportista
│   └── Contacto.vue            # Formulario de contacto
│
├── router/             # Configuración de rutas
│   └── index.js        # Rutas de la aplicación
│
├── App.vue             # Componente raíz
└── main.js             # Punto de entrada
```

## 🎯 Secciones Principales

### 1. **Home (Página de Inicio)**

- Hero section con llamadas a la acción
- Cards con enlaces a las secciones principales
- Información sobre el ciclocross
- Diseño atractivo y responsive

### 2. **Resultados**

- Lista de carreras en formato de cards
- Filtros por:
  - Temporada
  - Categoría
  - Búsqueda por nombre
- Información de cada carrera:
  - Fecha y ubicación
  - Número de participantes
  - Categoría
  - Imagen

### 3. **Deportistas**

- Listado completo de ciclistas
- Buscador integrado
- Filtros por:
  - Categoría (Elite, Master, Junior, Principiante)
  - Género
  - Club
  - Ordenamiento (nombre, victorias, participaciones)
- Estadísticas generales
- Cards con información resumida:
  - Avatar y nombre
  - Victorias y participaciones
  - Porcentaje de éxito

### 4. **Detalle de Deportista**

- Perfil completo del ciclista
- Estadísticas:
  - Victorias
  - Participaciones
  - Podios
- Biografía
- Historial completo de competencias
- Posiciones y tiempos
- Navegación fácil de regreso al listado

### 5. **Contacto**

- Formulario completo con campos:
  - Nombre
  - Email
  - Teléfono
  - Motivo del contacto
  - Mensaje
- Validación de campos
- Información de contacto:
  - Email
  - Teléfono
  - Ubicación
- Horarios de atención
- Enlaces a redes sociales

## 🎨 Características de Diseño

- **Responsive**: Adaptado para móviles, tablets y desktop
- **Tailwind CSS**: Estilos modernos y consistentes
- **Gradientes**: Azul corporativo con toques de amarillo
- **Navegación**: Menú hamburguesa en móvil
- **Transiciones**: Efectos suaves en hover y navegación
- **Iconos SVG**: Integrados directamente
- **Scroll Behavior**: Scroll automático al cambiar de página

## 🚀 Funcionalidades Implementadas

### Componentes Reutilizables

- **Navbar**: Navegación principal con responsive menu
- **Footer**: Footer con enlaces y redes sociales
- **RaceCard**: Componente para mostrar carreras
- **AthleteCard**: Componente para mostrar deportistas
- **SearchBar**: Barra de búsqueda con icono

### Router

- Rutas configuradas para todas las páginas
- Navegación dinámica con parámetros (detalle deportista)
- Scroll to top en cambio de página

### Estado y Datos

- Datos de ejemplo incluidos en cada vista
- Computed properties para filtrado
- Sistema de búsqueda reactivo
- Filtros múltiples

## 📦 Próximos Pasos

### Backend Integration

1. Conectar con API para obtener datos reales
2. Implementar autenticación para deportistas
3. Sistema de gestión de contenido para administradores

### Funcionalidades Adicionales

1. **Perfil de Deportista Editable**
   - Login para deportistas
   - Edición de biografía y foto
   - Actualización de datos personales

2. **Resultados Detallados**
   - Ver clasificación completa de cada carrera
   - Descargar resultados en PDF
   - Comparación de tiempos

3. **Calendario**
   - Vista de calendario con próximas carreras
   - Inscripción online
   - Recordatorios

4. **Galería de Fotos**
   - Fotos de cada carrera
   - Sistema de tags
   - Descarga de fotos

5. **Blog/Noticias**
   - Sección de noticias del ciclocross
   - Artículos sobre técnicas
   - Entrevistas a deportistas

## 🛠️ Tecnologías Utilizadas

- **Vue 3**: Framework principal
- **Vue Router**: Navegación
- **Tailwind CSS**: Estilos
- **Vite**: Build tool
- **ESLint**: Linting

## 📱 Responsive Breakpoints

- Mobile: < 768px
- Tablet: 768px - 1024px
- Desktop: > 1024px

## 🎨 Paleta de Colores

- **Primario**: Azul (#1e3a8a, #1e40af, #2563eb)
- **Secundario**: Amarillo (#fbbf24, #f59e0b)
- **Texto**: Gris (#111827, #4b5563, #6b7280)
- **Fondo**: Gris claro (#f9fafb)
- **Éxito**: Verde (#10b981)
- **Advertencia**: Naranja (#f97316)
