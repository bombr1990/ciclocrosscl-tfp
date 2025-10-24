<template>
  <div
    class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-xl transition-shadow duration-200 group"
  >
    <div class="relative h-48 overflow-hidden">
      <img
        :src="race.image"
        :alt="`Imagen de la carrera ${race.name} en ${race.location}`"
        class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300"
      />
      <div
        class="absolute top-4 right-4 bg-primary-600 text-white px-3 py-1 rounded-full text-sm font-semibold"
      >
        {{ getCategoryLabel(race.category) }}
      </div>
    </div>

    <div class="p-6">
      <h3 class="text-xl font-bold text-gray-900 mb-2">
        {{ race.name }}
      </h3>

      <div class="space-y-2 text-gray-600 mb-4">
        <div class="flex items-center">
          <svg
            class="w-5 h-5 mr-2"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
            aria-hidden="true"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
            />
          </svg>
          <time :datetime="race.date">{{ formatDate(race.date) }}</time>
        </div>
        <div class="flex items-center">
          <svg
            class="w-5 h-5 mr-2"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
            aria-hidden="true"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
            />
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
            />
          </svg>
          {{ race.location }}
        </div>
        <div class="flex items-center">
          <svg
            class="w-5 h-5 mr-2"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
            aria-hidden="true"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"
            />
          </svg>
          {{ race.participants }} participantes
        </div>
      </div>

      <button
        @click="viewResults"
        class="w-full bg-primary-600 hover:bg-primary-700 text-white font-semibold py-2 px-4 rounded-lg transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-offset-2"
        :aria-label="`Ver resultados de la carrera ${race.name}`"
      >
        Ver resultados
      </button>
    </div>
  </div>
</template>

<script setup>
import { defineProps } from 'vue'

const props = defineProps({
  race: {
    type: Object,
    required: true,
  },
})

const getCategoryLabel = (category) => {
  const labels = {
    elite: 'Elite',
    master: 'Master',
    junior: 'Junior',
    principiante: 'Principiante',
  }
  return labels[category] || category
}

const formatDate = (dateString) => {
  const date = new Date(dateString)
  const options = { year: 'numeric', month: 'long', day: 'numeric' }
  return date.toLocaleDateString('es-ES', options)
}

const viewResults = () => {
  // Aquí iría la lógica para mostrar los resultados detallados
  console.log('Ver resultados de:', props.race.name)
  // Podrías abrir un modal o navegar a una página de detalle
}
</script>
