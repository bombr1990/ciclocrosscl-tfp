# 🚀 Guía de Configuración de Supabase

## Paso 1: Crear el Proyecto en Supabase

1. Ve a [supabase.com](https://supabase.com)
2. Haz clic en **"Start your project"** o **"New Project"**
3. Completa la información:
   - **Name**: ciclocrosscl (o el nombre que prefieras)
   - **Database Password**: Crea una contraseña segura (guárdala!)
   - **Region**: Selecciona la más cercana (ej: South America - São Paulo)
4. Haz clic en **"Create new project"**
5. Espera 1-2 minutos mientras se crea el proyecto

## Paso 2: Ejecutar el Script SQL

1. En tu proyecto de Supabase, ve al menú lateral izquierdo
2. Haz clic en **"SQL Editor"** (ícono de </> )
3. Haz clic en **"New query"**
4. Copia todo el contenido del archivo `supabase-setup.sql`
5. Pégalo en el editor SQL
6. Haz clic en **"Run"** (o presiona Ctrl/Cmd + Enter)
7. Deberías ver el mensaje: **"Success. No rows returned"**

### ✅ Qué hace este script:

- ✨ Crea la tabla `deportistas` con todas las columnas necesarias
- 🔒 Configura Row Level Security (RLS) para seguridad
- 📖 Permite lectura pública (cualquiera puede ver los datos)
- 🔐 Solo usuarios autenticados pueden insertar/editar/eliminar
- 📊 Inserta 15 deportistas de ejemplo
- ⚡ Crea índices para mejorar el rendimiento
- 🕐 Agrega timestamps automáticos

## Paso 3: Verificar que Funciona

1. Ve a **"Table Editor"** en el menú lateral
2. Selecciona la tabla **"deportistas"**
3. Deberías ver 15 filas con datos de deportistas
4. Si ves los datos, ¡todo está listo! ✅

## Paso 4: Obtener las Credenciales

1. Ve a **"Project Settings"** (ícono de ⚙️ en la parte inferior del menú)
2. Haz clic en **"API"**
3. Encontrarás:
   - **Project URL** (VITE_SUPABASE_URL)
   - **anon/public key** (VITE_SUPABASE_ANON_KEY)

### 📋 Copia estas credenciales

## Paso 5: Configurar Variables de Entorno

1. En la raíz de tu proyecto, crea un archivo `.env`:

   ```bash
   cp .env.example .env
   ```

2. Abre el archivo `.env` y reemplaza con tus credenciales:

   ```env
   VITE_SUPABASE_URL=https://tu-proyecto.supabase.co
   VITE_SUPABASE_ANON_KEY=tu-clave-anonima-aqui
   ```

3. **¡IMPORTANTE!** Asegúrate de que `.env` esté en tu `.gitignore`:
   ```bash
   echo ".env" >> .gitignore
   ```

## Paso 6: Probar la Aplicación

1. Reinicia tu servidor de desarrollo:

   ```bash
   npm run dev
   ```

2. Ve a la página de Deportistas en tu navegador

3. Deberías ver los 15 deportistas cargados desde Supabase 🎉

## 🔧 Solución de Problemas

### Error: "Failed to fetch"

- Verifica que las credenciales en `.env` sean correctas
- Asegúrate de que el archivo `.env` esté en la raíz del proyecto
- Reinicia el servidor de desarrollo

### Error: "relation 'deportistas' does not exist"

- El script SQL no se ejecutó correctamente
- Vuelve a ejecutar el script completo en el SQL Editor

### No se ven los datos

- Verifica en el Table Editor que los datos existan
- Abre la consola del navegador (F12) para ver errores
- Verifica que RLS esté configurado correctamente

### Error de permisos

- Revisa que las políticas RLS estén creadas
- La política de lectura debe permitir acceso público (`TO public`)

## 📚 Recursos Adicionales

- [Documentación de Supabase](https://supabase.com/docs)
- [Supabase JavaScript Client](https://supabase.com/docs/reference/javascript/introduction)
- [Row Level Security](https://supabase.com/docs/guides/auth/row-level-security)

## 🎯 Próximos Pasos (Opcional)

Una vez que todo funcione, podrías:

1. **Agregar más deportistas**: Inserta datos manualmente en Table Editor
2. **Crear un formulario de registro**: Para que los deportistas se registren
3. **Agregar autenticación**: Para que los deportistas puedan editar su perfil
4. **Subir imágenes**: Usar Supabase Storage para avatares reales
5. **Crear más tablas**: Para carreras, resultados, equipos, etc.

---

¿Necesitas ayuda con algún paso? ¡Solo pregunta! 🚀
