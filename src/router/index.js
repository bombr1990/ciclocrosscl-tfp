import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Resultados from '../views/Resultados.vue'
import Deportistas from '../views/Deportistas.vue'
import DeportistaDetalle from '../views/DeportistaDetalle.vue'
import Contacto from '../views/Contacto.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/resultados',
      name: 'resultados',
      component: Resultados,
    },
    {
      path: '/deportistas',
      name: 'deportistas',
      component: Deportistas,
    },
    {
      path: '/deportistas/:id',
      name: 'deportista-detalle',
      component: DeportistaDetalle,
    },
    {
      path: '/contacto',
      name: 'contacto',
      component: Contacto,
    },
  ],
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition
    } else {
      return { top: 0 }
    }
  },
})

export default router
