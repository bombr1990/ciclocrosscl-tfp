# Guía de Temas - Ciclocross Chile

## 🎨 Sistema de Colores Personalizado

Hemos configurado Tailwind CSS con colores personalizados para facilitar el cambio de tema del sitio.

### Colores Disponibles

#### **Primary (Púrpura)**

- `bg-primary-500` - Púrpura principal
- `bg-primary-600` - Púrpura más oscuro
- `bg-primary-700` - Púrpura oscuro
- `bg-primary-900` - Púrpura muy oscuro
- `text-primary-500` - Texto púrpura
- `border-primary-500` - Borde púrpura

#### **Secondary (Rosa)**

- `bg-secondary-500` - Rosa principal
- `bg-secondary-600` - Rosa más oscuro
- `bg-secondary-700` - Rosa oscuro
- `text-secondary-300` - Texto rosa claro
- `hover:bg-secondary-500` - Hover rosa

#### **Accent (Amarillo/Dorado)**

- `bg-accent-500` - Amarillo principal
- `text-accent-300` - Texto amarillo

## 📝 Cómo Usar los Colores Personalizados

### Antes (usando colores directos):

```vue
<button class="bg-purple-600 hover:bg-purple-700">
  Botón
</button>
```

### Después (usando colores del tema):

```vue
<button class="bg-primary-600 hover:bg-primary-700">
  Botón
</button>
```

## 🔄 Cómo Cambiar el Tema Completo

Para cambiar el tema del sitio, solo necesitas editar `tailwind.config.js`:

### Ejemplo: Cambiar a Tema Azul

```javascript
colors: {
  primary: {
    500: '#3b82f6',  // azul
    600: '#2563eb',
    700: '#1d4ed8',
    900: '#1e3a8a',
  },
  secondary: {
    500: '#06b6d4',  // cyan
    600: '#0891b2',
    700: '#0e7490',
  },
}
```

### Ejemplo: Cambiar a Tema Verde

```javascript
colors: {
  primary: {
    500: '#10b981',  // verde
    600: '#059669',
    700: '#047857',
    900: '#064e3b',
  },
  secondary: {
    500: '#84cc16',  // lima
    600: '#65a30d',
    700: '#4d7c0f',
  },
}
```

## 🎯 Búsqueda y Reemplazo Rápido

Si ya tienes componentes con colores específicos, puedes usar búsqueda global en VS Code:

### Reemplazos Recomendados:

| Buscar       | Reemplazar con  |
| ------------ | --------------- |
| `purple-600` | `primary-600`   |
| `purple-700` | `primary-700`   |
| `purple-800` | `primary-800`   |
| `purple-900` | `primary-900`   |
| `purple-500` | `primary-500`   |
| `purple-100` | `primary-100`   |
| `pink-700`   | `secondary-700` |
| `pink-600`   | `secondary-600` |
| `pink-500`   | `secondary-500` |
| `pink-400`   | `secondary-400` |
| `pink-300`   | `secondary-300` |
| `pink-200`   | `secondary-200` |

### Cómo hacer el reemplazo en VS Code:

1. Presiona `Cmd + Shift + F` (Mac) o `Ctrl + Shift + F` (Windows)
2. Busca: `purple-600`
3. Reemplazar con: `primary-600`
4. Click en "Reemplazar todo"
5. Repite para cada color

## 💡 Ventajas de este Sistema

1. **Cambio de Tema Instantáneo**: Modifica solo `tailwind.config.js`
2. **Consistencia**: Todos los componentes usan los mismos colores
3. **Mantenibilidad**: Más fácil de mantener y actualizar
4. **Escalabilidad**: Fácil agregar temas (oscuro, claro, etc.)

## 🌙 Ejemplo: Implementar Tema Oscuro

Puedes extender el sistema para soportar modo oscuro:

```javascript
theme: {
  extend: {
    colors: {
      primary: {
        // Colores para modo claro
        light: '#a855f7',
        // Colores para modo oscuro
        dark: '#c084fc',
      },
    },
  },
}
```

Y en tus componentes:

```vue
<div class="bg-primary-light dark:bg-primary-dark">
  Contenido
</div>
```

## 📦 Gradientes Personalizados

Para hacer los gradientes más fáciles de cambiar, puedes crear clases personalizadas:

```javascript
// En tailwind.config.js
theme: {
  extend: {
    backgroundImage: {
      'gradient-primary': 'linear-gradient(to right, var(--color-primary-900), var(--color-secondary-700))',
      'gradient-hero': 'linear-gradient(to right, var(--color-primary-900), var(--color-primary-800), var(--color-secondary-900))',
    }
  }
}
```

Uso:

```vue
<section class="bg-gradient-primary">
  Hero Section
</section>
```

## 🔧 Configuración Recomendada Completa

```javascript
/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#faf5ff',
          100: '#f3e8ff',
          200: '#e9d5ff',
          300: '#d8b4fe',
          400: '#c084fc',
          500: '#a855f7',
          600: '#9333ea',
          700: '#7e22ce',
          800: '#6b21a8',
          900: '#581c87',
        },
        secondary: {
          50: '#fdf2f8',
          100: '#fce7f3',
          200: '#fbcfe8',
          300: '#f9a8d4',
          400: '#f472b6',
          500: '#ec4899',
          600: '#db2777',
          700: '#be185d',
          800: '#9f1239',
          900: '#831843',
        },
      },
    },
  },
  plugins: [],
}
```

## 🎨 Temas Preconfigurados

### Tema Actual (Púrpura/Rosa)

✅ Ya configurado

### Tema Azul (Deportivo)

```javascript
primary: { 500: '#3b82f6', 600: '#2563eb', 700: '#1d4ed8', 900: '#1e3a8a' }
secondary: { 500: '#06b6d4', 600: '#0891b2', 700: '#0e7490' }
```

### Tema Verde (Natural)

```javascript
primary: { 500: '#10b981', 600: '#059669', 700: '#047857', 900: '#064e3b' }
secondary: { 500: '#84cc16', 600: '#65a30d', 700: '#4d7c0f' }
```

### Tema Rojo (Energético)

```javascript
primary: { 500: '#ef4444', 600: '#dc2626', 700: '#b91c1c', 900: '#7f1d1d' }
secondary: { 500: '#f97316', 600: '#ea580c', 700: '#c2410c' }
```

## 📚 Recursos Adicionales

- [Tailwind CSS - Customizing Colors](https://tailwindcss.com/docs/customizing-colors)
- [Tailwind CSS - Theme Configuration](https://tailwindcss.com/docs/theme)
- [Color Palette Generator](https://uicolors.app/)
