import { supabase } from './supabaseClient'

/**
 * Obtiene todos los deportistas de la base de datos
 * @returns {Promise<Array>} Lista de deportistas
 */
export const getAllAthletes = async () => {
  try {
    console.log('🔄 Intentando obtener deportistas...')
    const { data, error } = await supabase
      .from('deportistas')
      .select('*')
      .order('name', { ascending: true })

    if (error) {
      console.error('❌ Error de Supabase:', error)
      throw error
    }

    console.log('✅ Deportistas obtenidos:', data?.length || 0)
    return data || []
  } catch (error) {
    console.error('❌ Error al obtener deportistas:', error)
    throw error
  }
}

/**
 * Obtiene un deportista por su ID
 * @param {number} id - ID del deportista
 * @returns {Promise<Object>} Datos del deportista
 */
export const getAthleteById = async (id) => {
  try {
    const { data, error } = await supabase.from('deportistas').select('*').eq('id', id).single()

    if (error) throw error
    return data
  } catch (error) {
    console.error('Error al obtener deportista:', error)
    throw error
  }
}

/**
 * Obtiene deportistas filtrados por categoría
 * @param {string} category - Categoría a filtrar
 * @returns {Promise<Array>} Lista de deportistas filtrados
 */
export const getAthletesByCategory = async (category) => {
  try {
    const { data, error } = await supabase
      .from('deportistas')
      .select('*')
      .eq('category', category)
      .order('name', { ascending: true })

    if (error) throw error
    return data || []
  } catch (error) {
    console.error('Error al obtener deportistas por categoría:', error)
    throw error
  }
}

/**
 * Obtiene estadísticas generales
 * @returns {Promise<Object>} Estadísticas
 */
export const getAthletesStats = async () => {
  try {
    const { data, error, count } = await supabase
      .from('deportistas')
      .select('*', { count: 'exact' })

    if (error) throw error

    // Calcular estadísticas
    const clubs = new Set(data?.map((athlete) => athlete.club)).size
    const categories = new Set(data?.map((athlete) => athlete.category)).size

    return {
      totalAthletes: count || 0,
      totalClubs: clubs,
      totalCategories: categories,
    }
  } catch (error) {
    console.error('Error al obtener estadísticas:', error)
    throw error
  }
}
