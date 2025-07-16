export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.hook('app:mounted', () => {
    if (
      document.getElementById('__NUXT_DATA__')!.dataset.ssr === 'false'
      && import.meta.browser
    ) {
      console.error('SSR is turned off. Change nuxt.config.ts#ssr to \'true\'')
    }
  })
})
