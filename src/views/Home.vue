<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Hero Section -->
    <section
      class="bg-gradient-to-r from-primary-900 via-primary-800 to-secondary-900 text-white py-20"
      role="banner"
    >
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center">
          <h1 class="text-5xl md:text-6xl font-bold mb-6">Ciclocross Chile</h1>
          <p class="text-xl md:text-2xl mb-8 text-gray-200">
            El portal oficial del ciclocross en Chile
          </p>
          <div class="flex flex-col sm:flex-row gap-4 justify-center">
            <router-link
              to="/resultados"
              class="bg-secondary-400 hover:bg-secondary-500 text-white font-bold py-3 px-8 rounded-lg transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-secondary-300 focus:ring-offset-2 focus:ring-offset-primary-900"
            >
              Ver Resultados
            </router-link>
            <router-link
              to="/deportistas"
              class="bg-transparent border-2 border-white hover:bg-white hover:text-primary-900 text-white font-bold py-3 px-8 rounded-lg transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-primary-900"
            >
              Conoce a los Deportistas
            </router-link>
          </div>
        </div>
      </div>
    </section>

    <!-- Sección de bienvenida -->
    <section class="py-16" role="main">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-12">
          <h2 class="text-4xl font-bold text-gray-900 mb-4">Bienvenidos</h2>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto">
            Descubre el emocionante mundo del ciclocross en Chile. Conoce los resultados de las
            carreras, sigue a tus deportistas favoritos y mantente informado de todas las
            competencias.
          </p>
        </div>

        <!-- Cards de secciones -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <!-- Card Resultados -->
          <router-link
            to="/resultados"
            class="bg-white rounded-lg shadow-lg p-6 hover:shadow-xl transition-shadow duration-200 group focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-offset-2"
            aria-label="Ver resultados de carreras"
          >
            <div class="text-5xl mb-4 text-center" aria-hidden="true">🏆</div>
            <h3 class="text-2xl font-bold text-gray-900 mb-3 text-center">Resultados</h3>
            <p class="text-gray-600 text-center">
              Consulta los resultados de todas las carreras del calendario nacional de ciclocross.
            </p>
            <div
              class="mt-4 text-center text-primary-600 font-semibold group-hover:text-primary-800"
              aria-hidden="true"
            >
              Ver más →
            </div>
          </router-link>

          <!-- Card Deportistas -->
          <router-link
            to="/deportistas"
            class="bg-white rounded-lg shadow-lg p-6 hover:shadow-xl transition-shadow duration-200 group focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-offset-2"
            aria-label="Ver perfiles de deportistas"
          >
            <div class="text-5xl mb-4 text-center" aria-hidden="true">🚴</div>
            <h3 class="text-2xl font-bold text-gray-900 mb-3 text-center">Deportistas</h3>
            <p class="text-gray-600 text-center">
              Conoce a los ciclistas que compiten en ciclocross y revisa sus historiales de
              competencia.
            </p>
            <div
              class="mt-4 text-center text-primary-600 font-semibold group-hover:text-primary-800"
              aria-hidden="true"
            >
              Ver más →
            </div>
          </router-link>

          <!-- Card Contacto -->
          <router-link
            to="/contacto"
            class="bg-white rounded-lg shadow-lg p-6 hover:shadow-xl transition-shadow duration-200 group focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-offset-2"
            aria-label="Ir a página de contacto"
          >
            <div class="text-5xl mb-4 text-center" aria-hidden="true">📧</div>
            <h3 class="text-2xl font-bold text-gray-900 mb-3 text-center">Contacto</h3>
            <p class="text-gray-600 text-center">
              ¿Tienes preguntas o quieres participar? Ponte en contacto con nosotros.
            </p>
            <div
              class="mt-4 text-center text-primary-600 font-semibold group-hover:text-primary-800"
              aria-hidden="true"
            >
              Ver más →
            </div>
          </router-link>
        </div>
      </div>
    </section>

    <!-- Sección "¿Qué es el Ciclocross?" -->
    <section class="bg-white py-16" aria-labelledby="about-heading">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
          <div>
            <h2 id="about-heading" class="text-4xl font-bold text-gray-900 mb-6">
              ¿Qué es el Ciclocross?
            </h2>
            <p class="text-gray-600 mb-4">
              El ciclocross es una disciplina del ciclismo que combina velocidad, técnica y
              resistencia. Las carreras se desarrollan en circuitos mixtos que incluyen asfalto,
              tierra, césped y obstáculos que requieren que los ciclistas desciendan de sus
              bicicletas y las transporten.
            </p>
            <p class="text-gray-600 mb-4">
              Es un deporte espectacular que se practica principalmente en otoño e invierno,
              ofreciendo carreras emocionantes y accesibles para el público.
            </p>
            <p class="text-gray-600">
              En Chile, el ciclocross ha crecido constantemente, con competencias regulares y una
              comunidad apasionada de deportistas de todas las edades.
            </p>
          </div>
          <div
            class="bg-gradient-to-br from-primary-500 to-secondary-700 rounded-lg p-8 text-white"
          >
            <h3 class="text-2xl font-bold mb-6">Características</h3>
            <ul class="space-y-4" role="list">
              <li class="flex items-start">
                <span class="text-secondary-200 mr-2" aria-hidden="true">✓</span>
                <span>Carreras de 30-60 minutos de alta intensidad</span>
              </li>
              <li class="flex items-start">
                <span class="text-secondary-200 mr-2" aria-hidden="true">✓</span>
                <span>Circuitos técnicos con obstáculos variados</span>
              </li>
              <li class="flex items-start">
                <span class="text-secondary-200 mr-2" aria-hidden="true">✓</span>
                <span>Categorías para todas las edades y niveles</span>
              </li>
              <li class="flex items-start">
                <span class="text-secondary-200 mr-2" aria-hidden="true">✓</span>
                <span>Ambiente familiar y comunitario</span>
              </li>
              <li class="flex items-start">
                <span class="text-secondary-200 mr-2" aria-hidden="true">✓</span>
                <span>Excelente entrenamiento de invierno</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <!-- Llamada a la acción -->
    <section
      class="bg-gradient-to-r from-primary-900 to-secondary-700 text-white py-16"
      aria-labelledby="cta-heading"
    >
      <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <h2 id="cta-heading" class="text-3xl md:text-4xl font-bold mb-6">¿Quieres participar?</h2>
        <p class="text-xl mb-8 text-gray-200">
          Únete a la comunidad del ciclocross en Chile. Contáctanos para más información sobre cómo
          participar en las próximas competencias.
        </p>
        <router-link
          to="/contacto"
          class="inline-block bg-secondary-400 hover:bg-secondary-500 text-white font-bold py-3 px-8 rounded-lg transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-secondary-300 focus:ring-offset-2 focus:ring-offset-primary-900"
        >
          Contáctanos
        </router-link>
      </div>
    </section>
  </div>
</template>

<script setup></script>
