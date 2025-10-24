import { createClient } from '@supabase/supabase-js'

// Configura estas variables con tus credenciales de Supabase
const supabaseUrl = import.meta.env.VITE_SUPABASE_URL || 'YOUR_SUPABASE_URL'
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY || 'YOUR_SUPABASE_ANON_KEY'

// Debug: Verificar que las variables estén cargadas
console.log('🔍 Configuración de Supabase:')
console.log('URL:', supabaseUrl)
console.log('Key:', supabaseAnonKey ? `${supabaseAnonKey.substring(0, 20)}...` : 'NO DEFINIDA')

export const supabase = createClient(supabaseUrl, supabaseAnonKey)
