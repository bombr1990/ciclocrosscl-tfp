<template>
  <nav class="bg-gradient-to-r from-primary-900 to-secondary-700 shadow-lg">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between items-center h-16">
        <!-- Logo y nombre -->
        <div class="flex items-center">
          <router-link to="/" class="flex items-center space-x-2">
            <div class="text-white text-2xl font-bold">🚴</div>
            <span class="text-white text-xl font-bold hidden sm:block"> Ciclocross Chile </span>
          </router-link>
        </div>

        <!-- Menú desktop -->
        <div class="hidden md:flex space-x-8">
          <router-link
            to="/"
            class="text-white hover:text-secondary-300 transition-colors duration-200 font-medium"
            active-class="text-secondary-300 border-b-2 border-secondary-300"
          >
            Inicio
          </router-link>
          <router-link
            to="/resultados"
            class="text-white hover:text-secondary-300 transition-colors duration-200 font-medium"
            active-class="text-secondary-300 border-b-2 border-secondary-300"
          >
            Resultados
          </router-link>
          <router-link
            to="/deportistas"
            class="text-white hover:text-secondary-300 transition-colors duration-200 font-medium"
            active-class="text-secondary-300 border-b-2 border-secondary-300"
          >
            Deportistas
          </router-link>
          <router-link
            to="/contacto"
            class="text-white hover:text-secondary-300 transition-colors duration-200 font-medium"
            active-class="text-secondary-300 border-b-2 border-secondary-300"
          >
            Contacto
          </router-link>
        </div>

        <!-- Botón menú móvil -->
        <div class="md:hidden">
          <button
            @click="mobileMenuOpen = !mobileMenuOpen"
            class="text-white hover:text-secondary-300 focus:outline-none"
          >
            <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path
                v-if="!mobileMenuOpen"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M4 6h16M4 12h16M4 18h16"
              />
              <path
                v-else
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M6 18L18 6M6 6l12 12"
              />
            </svg>
          </button>
        </div>
      </div>

      <!-- Menú móvil -->
      <div v-if="mobileMenuOpen" class="md:hidden pb-4 space-y-2">
        <router-link
          to="/"
          @click="mobileMenuOpen = false"
          class="block text-white hover:text-secondary-300 hover:bg-primary-800 px-3 py-2 rounded transition-colors duration-200"
          active-class="text-secondary-300 bg-primary-800"
        >
          Inicio
        </router-link>
        <router-link
          to="/resultados"
          @click="mobileMenuOpen = false"
          class="block text-white hover:text-secondary-300 hover:bg-primary-800 px-3 py-2 rounded transition-colors duration-200"
          active-class="text-secondary-300 bg-primary-800"
        >
          Resultados
        </router-link>
        <router-link
          to="/deportistas"
          @click="mobileMenuOpen = false"
          class="block text-white hover:text-secondary-300 hover:bg-primary-800 px-3 py-2 rounded transition-colors duration-200"
          active-class="text-secondary-300 bg-primary-800"
        >
          Deportistas
        </router-link>
        <router-link
          to="/contacto"
          @click="mobileMenuOpen = false"
          class="block text-white hover:text-secondary-300 hover:bg-primary-800 px-3 py-2 rounded transition-colors duration-200"
          active-class="text-secondary-300 bg-primary-800"
        >
          Contacto
        </router-link>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { ref } from 'vue'

const mobileMenuOpen = ref(false)
</script>
