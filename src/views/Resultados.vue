<template>
  <div class="min-h-screen bg-gray-50 py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <!-- Encabezado -->
      <div class="mb-8">
        <h1 class="text-4xl font-bold text-gray-900 mb-4">Resultados de Carreras</h1>
        <p class="text-xl text-gray-600">
          Consulta los resultados de todas las competencias de ciclocross realizadas en Chile.
        </p>
      </div>

      <!-- Filtros -->
      <div class="bg-white rounded-lg shadow-md p-6 mb-8">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2"> Temporada </label>
            <select
              v-model="selectedYear"
              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            >
              <option value="">Todas</option>
              <option value="2025">2025</option>
              <option value="2024">2024</option>
              <option value="2023">2023</option>
            </select>
          </div>
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
            <label class="block text-sm font-medium text-gray-700 mb-2"> Buscar </label>
            <input
              v-model="searchQuery"
              type="text"
              placeholder="Nombre de carrera..."
              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            />
          </div>
        </div>
      </div>

      <!-- Lista de carreras -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <RaceCard v-for="race in filteredRaces" :key="race.id" :race="race" />
      </div>

      <!-- Mensaje si no hay resultados -->
      <div v-if="filteredRaces.length === 0" class="text-center py-12">
        <p class="text-gray-500 text-lg">
          No se encontraron carreras con los filtros seleccionados.
        </p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import RaceCard from '../components/RaceCard.vue'

const selectedYear = ref('')
const selectedCategory = ref('')
const searchQuery = ref('')

// Datos de ejemplo - en producción vendrían de una API
const races = ref([
  {
    id: 1,
    name: 'Copa Nacional Santiago',
    date: '2025-03-15',
    location: 'Parque Araucano, Santiago',
    category: 'elite',
    participants: 45,
    image: 'https://images.unsplash.com/photo-1541625602330-2277a4c46182?w=400',
  },
  {
    id: 2,
    name: 'Ciclocross de Invierno',
    date: '2025-06-20',
    location: 'Viña del Mar',
    category: 'master',
    participants: 38,
    image: 'https://images.unsplash.com/photo-1517649763962-0c623066013b?w=400',
  },
  {
    id: 3,
    name: 'Desafío CX Valparaíso',
    date: '2025-07-10',
    location: 'Valparaíso',
    category: 'elite',
    participants: 52,
    image: 'https://images.unsplash.com/photo-1505705694385-e5e4b90bc66f?w=400',
  },
  {
    id: 4,
    name: 'CX Series Concepción',
    date: '2024-08-15',
    location: 'Concepción',
    category: 'junior',
    participants: 30,
    image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400',
  },
  {
    id: 5,
    name: 'Campeonato Regional',
    date: '2024-09-05',
    location: 'La Serena',
    category: 'principiante',
    participants: 25,
    image: 'https://images.unsplash.com/photo-1541625602330-2277a4c46182?w=400',
  },
  {
    id: 6,
    name: 'CX Night Race',
    date: '2024-10-22',
    location: 'Santiago',
    category: 'elite',
    participants: 40,
    image: 'https://images.unsplash.com/photo-1517649763962-0c623066013b?w=400',
  },
])

const filteredRaces = computed(() => {
  return races.value.filter((race) => {
    const matchesYear = !selectedYear.value || race.date.includes(selectedYear.value)
    const matchesCategory = !selectedCategory.value || race.category === selectedCategory.value
    const matchesSearch =
      !searchQuery.value ||
      race.name.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
      race.location.toLowerCase().includes(searchQuery.value.toLowerCase())

    return matchesYear && matchesCategory && matchesSearch
  })
})
</script>
