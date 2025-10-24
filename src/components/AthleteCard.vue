<template>
  <router-link
    :to="`/deportistas/${athlete.id}`"
    class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-xl transition-shadow duration-200 group cursor-pointer"
  >
    <div class="p-6">
      <div class="flex items-center mb-4">
        <img
          :src="athlete.avatar"
          :alt="athlete.name"
          class="w-20 h-20 rounded-full border-4 border-primary-100 mr-4"
        />
        <div>
          <h3 class="text-xl font-bold text-gray-900 group-hover:text-primary-600 transition-colors">
            {{ athlete.name }}
          </h3>
          <div class="flex flex-wrap gap-2 mt-2">
            <span class="bg-primary-100 text-primary-800 text-xs font-semibold px-2 py-1 rounded">
              {{ getCategoryLabel(athlete.category) }}
            </span>
            <span class="bg-gray-100 text-gray-800 text-xs font-semibold px-2 py-1 rounded">
              {{ athlete.club }}
            </span>
          </div>
        </div>
      </div>

      <div class="grid grid-cols-3 gap-4 pt-4 border-t border-gray-200">
        <div class="text-center">
          <div class="text-2xl font-bold text-secondary-600">
            {{ athlete.victories }}
          </div>
          <div class="text-xs text-gray-600">Victorias</div>
        </div>
        <div class="text-center">
          <div class="text-2xl font-bold text-primary-600">
            {{ athlete.participations }}
          </div>
          <div class="text-xs text-gray-600">Carreras</div>
        </div>
        <div class="text-center">
          <div class="text-2xl font-bold text-green-600">{{ getSuccessRate() }}%</div>
          <div class="text-xs text-gray-600">Éxito</div>
        </div>
      </div>

      <div
        class="mt-4 text-center text-primary-600 font-semibold group-hover:text-primary-800 transition-colors"
      >
        Ver perfil →
      </div>
    </div>
  </router-link>
</template>

<script setup>
import { defineProps } from 'vue'

const props = defineProps({
  athlete: {
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

const getSuccessRate = () => {
  if (props.athlete.participations === 0) return 0
  return Math.round((props.athlete.victories / props.athlete.participations) * 100)
}
</script>
