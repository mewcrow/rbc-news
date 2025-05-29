// https://nuxt.com/docs/api/configuration/nuxt-config
import tailwindcss from "@tailwindcss/vite"

export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',
  // ssr: false,
  // logLevel: "verbose",
  // debug: true,

  vite: {
    plugins: [tailwindcss()],
  },

  modules: [
    '@nuxt/eslint',
    ['@nuxtjs/google-fonts', {
        download: true,
        families: {
          Ubuntu: true,
        },
    }],
    '@nuxt/icon',
    '@nuxt/image',
    '@nuxt/scripts',
    '@nuxt/test-utils',
    'nuxt-auth-sanctum',
  ],

  css: [
    '~/assets/css/main.css'
  ],

  runtimeConfig: {
    public: {
      apiBase: '',
    }
  },

  sanctum: {
    // logLevel: 5,
    baseUrl: process.env.NUXT_PUBLIC_API_BASE,
    endpoints: {
      user: 'api/user',
      login: 'api/login',
      logout: 'api/logout',
    },
    client: {
      initialRequest: true,
    }
  },
})