<template>
  <div class="min-h-screen bg-gray-50 py-12">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
      <!-- Botón volver -->
      <router-link
        to="/deportistas"
        class="inline-flex items-center text-primary-600 hover:text-primary-800 mb-6"
      >
        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M15 19l-7-7 7-7"
          />
        </svg>
        Volver a deportistas
      </router-link>

      <!-- Perfil del deportista -->
      <div class="bg-white rounded-lg shadow-lg overflow-hidden mb-8">
        <div class="bg-gradient-to-r from-primary-900 to-secondary-700 px-8 py-12">
          <div class="flex flex-col md:flex-row items-center gap-6">
            <img
              :src="athlete.avatar"
              :alt="athlete.name"
              class="w-32 h-32 rounded-full border-4 border-white shadow-lg"
            />
            <div class="text-white text-center md:text-left">
              <h1 class="text-4xl font-bold mb-2">{{ athlete.name }}</h1>
              <div class="flex flex-wrap gap-4 justify-center md:justify-start">
                <span class="bg-white/20 px-4 py-1 rounded-full text-sm">
                  {{ getCategoryLabel(athlete.category) }}
                </span>
                <span class="bg-white/20 px-4 py-1 rounded-full text-sm">
                  {{ athlete.club }}
                </span>
                <span class="bg-white/20 px-4 py-1 rounded-full text-sm">
                  {{ athlete.gender === 'M' ? 'Masculino' : 'Femenino' }}
                </span>
              </div>
            </div>
          </div>
        </div>

        <!-- Estadísticas -->
        <div class="grid grid-cols-3 divide-x">
          <div class="px-6 py-8 text-center">
            <div class="text-4xl font-bold text-primary-600 mb-2">
              {{ athlete.victories }}
            </div>
            <div class="text-gray-600">Victorias</div>
          </div>
          <div class="px-6 py-8 text-center">
            <div class="text-4xl font-bold text-green-600 mb-2">
              {{ athlete.participations }}
            </div>
            <div class="text-gray-600">Participaciones</div>
          </div>
          <div class="px-6 py-8 text-center">
            <div class="text-4xl font-bold text-primary-600 mb-2">
              {{ athlete.podiums }}
            </div>
            <div class="text-gray-600">Podios</div>
          </div>
        </div>
      </div>

      <!-- Biografía -->
      <div class="bg-white rounded-lg shadow-md p-8 mb-8">
        <h2 class="text-2xl font-bold text-gray-900 mb-4">Biografía</h2>
        <p class="text-gray-600 leading-relaxed">
          {{ athlete.bio }}
        </p>
      </div>

      <!-- Historial de competencias -->
      <div class="bg-white rounded-lg shadow-md p-8">
        <h2 class="text-2xl font-bold text-gray-900 mb-6">Historial de Competencias</h2>

        <div class="space-y-4">
          <div
            v-for="result in athlete.raceHistory"
            :key="result.id"
            class="border border-gray-200 rounded-lg p-4 hover:shadow-md transition-shadow"
          >
            <div class="flex justify-between items-start mb-2">
              <div>
                <h3 class="font-bold text-gray-900">{{ result.raceName }}</h3>
                <p class="text-sm text-gray-600">{{ result.location }}</p>
              </div>
              <div class="text-right">
                <div
                  class="text-2xl font-bold"
                  :class="{
                    'text-yellow-500': result.position === 1,
                    'text-gray-400': result.position === 2,
                    'text-orange-600': result.position === 3,
                    'text-gray-600': result.position > 3,
                  }"
                >
                  {{ result.position }}°
                </div>
                <p class="text-sm text-gray-500">{{ result.date }}</p>
              </div>
            </div>
            <div class="flex gap-4 text-sm text-gray-600">
              <span>⏱️ Tiempo: {{ result.time }}</span>
              <span>👥 {{ result.totalParticipants }} participantes</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()

// Datos de ejemplo - en producción vendrían de una API
const athlete = ref({
  id: 1,
  name: 'Juan Pérez',
  category: 'elite',
  gender: 'M',
  club: 'CX Santiago',
  victories: 12,
  participations: 45,
  podiums: 28,
  avatar: 'https://i.pravatar.cc/150?img=12',
  bio: 'Ciclista profesional con más de 10 años de experiencia en ciclocross. Comenzó su carrera deportiva en 2013 y desde entonces ha competido en numerosas carreras nacionales e internacionales. Apasionado por el deporte y comprometido con el desarrollo del ciclocross en Chile.',
  raceHistory: [
    {
      id: 1,
      raceName: 'Copa Nacional Santiago',
      location: 'Parque Araucano, Santiago',
      date: '2025-03-15',
      position: 1,
      time: '45:23',
      totalParticipants: 45,
    },
    {
      id: 2,
      raceName: 'CX Night Race',
      location: 'Santiago',
      date: '2024-10-22',
      position: 2,
      time: '48:15',
      totalParticipants: 40,
    },
    {
      id: 3,
      raceName: 'Desafío CX Valparaíso',
      location: 'Valparaíso',
      date: '2024-07-10',
      position: 1,
      time: '43:52',
      totalParticipants: 52,
    },
    {
      id: 4,
      raceName: 'Campeonato Regional',
      location: 'La Serena',
      date: '2024-09-05',
      position: 3,
      time: '50:18',
      totalParticipants: 35,
    },
  ],
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

onMounted(() => {
  // Aquí cargarías los datos del deportista usando route.params.id
  console.log('Cargando deportista con ID:', route.params.id)
})
</script>
