<template>
  <div class="min-h-screen bg-gray-50 py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <!-- Encabezado -->
      <div class="mb-8">
        <h1 class="text-4xl font-bold text-gray-900 mb-4">Deportistas</h1>
        <p class="text-xl text-gray-600">
          Conoce a los ciclistas que compiten en ciclocross en Chile.
        </p>
      </div>

      <!-- Buscador -->
      <SearchBar v-model="searchQuery" />

      <!-- Filtros -->
      <div class="bg-white rounded-lg shadow-md p-6 mb-8">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2"> Categoría </label>
            <select
              v-model="selectedCategory"
              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            >
              <option value="">Todas</option>
              <option value="elite">Elite</option>
              <option value="master">Master</option>
              <option value="junior">Junior</option>
              <option value="principiante">Principiante</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2"> Género </label>
            <select
              v-model="selectedGender"
              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            >
              <option value="">Todos</option>
              <option value="M">Masculino</option>
              <option value="F">Femenino</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2"> Club </label>
            <select
              v-model="selectedClub"
              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            >
              <option value="">Todos</option>
              <option value="club1">CX Santiago</option>
              <option value="club2">Team Valparaíso</option>
              <option value="club3">Concepción CX</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2"> Ordenar por </label>
            <select
              v-model="sortBy"
              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            >
              <option value="name">Nombre</option>
              <option value="victories">Victorias</option>
              <option value="participations">Participaciones</option>
            </select>
          </div>
        </div>
      </div>

      <!-- Estadísticas generales -->
      <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
        <div class="bg-white rounded-lg shadow-md p-6">
          <div class="text-3xl font-bold text-primary-600 mb-2">
            {{ stats.totalAthletes }}
          </div>
          <div class="text-gray-600">Deportistas</div>
        </div>
        <div class="bg-white rounded-lg shadow-md p-6">
          <div class="text-3xl font-bold text-green-600 mb-2">{{ stats.totalClubs }}</div>
          <div class="text-gray-600">Clubes</div>
        </div>
        <div class="bg-white rounded-lg shadow-md p-6">
          <div class="text-3xl font-bold text-primary-600 mb-2">{{ stats.totalCategories }}</div>
          <div class="text-gray-600">Categorías</div>
        </div>
        <div class="bg-white rounded-lg shadow-md p-6">
          <div class="text-3xl font-bold text-orange-600 mb-2">24</div>
          <div class="text-gray-600">Carreras 2025</div>
        </div>
      </div>

      <!-- Indicador de carga -->
      <div v-if="loading" class="text-center py-12">
        <div
          class="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600"
        ></div>
        <p class="mt-4 text-gray-600">Cargando deportistas...</p>
      </div>

      <!-- Mensaje de error -->
      <div v-else-if="error" class="bg-red-50 border border-red-200 rounded-lg p-6 mb-8">
        <p class="text-red-800">{{ error }}</p>
        <button
          @click="loadAthletes"
          class="mt-4 px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors"
        >
          Reintentar
        </button>
      </div>

      <!-- Lista de deportistas -->
      <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <AthleteCard v-for="athlete in sortedAthletes" :key="athlete.id" :athlete="athlete" />
      </div>

      <!-- Mensaje si no hay resultados -->
      <div v-if="!loading && !error && filteredAthletes.length === 0" class="text-center py-12">
        <p class="text-gray-500 text-lg">
          No se encontraron deportistas con los filtros seleccionados.
        </p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import SearchBar from '../components/SearchBar.vue'
import AthleteCard from '../components/AthleteCard.vue'
import { getAllAthletes, getAthletesStats } from '../services/athleteService'

const searchQuery = ref('')
const selectedCategory = ref('')
const selectedGender = ref('')
const selectedClub = ref('')
const sortBy = ref('name')
const athletes = ref([])
const loading = ref(true)
const error = ref(null)
const stats = ref({
  totalAthletes: 0,
  totalClubs: 0,
  totalCategories: 0,
})

// Cargar deportistas desde Supabase
const loadAthletes = async () => {
  try {
    loading.value = true
    error.value = null
    athletes.value = await getAllAthletes()
    stats.value = await getAthletesStats()
  } catch (err) {
    error.value = 'Error al cargar los deportistas. Por favor, intenta nuevamente.'
    console.error(err)
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  loadAthletes()
})

const filteredAthletes = computed(() => {
  return athletes.value.filter((athlete) => {
    const matchesSearch =
      !searchQuery.value || athlete.name.toLowerCase().includes(searchQuery.value.toLowerCase())
    const matchesCategory = !selectedCategory.value || athlete.category === selectedCategory.value
    const matchesGender = !selectedGender.value || athlete.gender === selectedGender.value
    const matchesClub = !selectedClub.value || athlete.club === selectedClub.value

    return matchesSearch && matchesCategory && matchesGender && matchesClub
  })
})

const sortedAthletes = computed(() => {
  const sorted = [...filteredAthletes.value]

  switch (sortBy.value) {
    case 'victories':
      return sorted.sort((a, b) => b.victories - a.victories)
    case 'participations':
      return sorted.sort((a, b) => b.participations - a.participations)
    case 'name':
    default:
      return sorted.sort((a, b) => a.name.localeCompare(b.name))
  }
})
</script>
