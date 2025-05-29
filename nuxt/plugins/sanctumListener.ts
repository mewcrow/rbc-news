export default defineNuxtPlugin({
    dependsOn: ['nuxt-auth-sanctum'],
    async setup(nuxtApp) {
        nuxtApp.hook('app:created', () => {
            const user = useSanctumUser()
            if (!user.value || !Object.keys(user.value as object).length) {
                user.value = null
            }
        })
    }
})