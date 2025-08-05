import { Toaster } from 'vue-sonner'
import { defineNuxtPlugin } from '#app'
import { h } from 'vue'
import 'vue-sonner/style.css'

export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.vueApp.component('Toaster', Toaster)
})