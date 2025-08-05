<template>
  <NuxtLayout>
    <NuxtPage />
    <Toaster :toast-options="{
      duration: 3000,
      closeButton: true,
    }"/>
  </NuxtLayout>
</template>

<script setup lang="ts">
  import { Toaster } from 'vue-sonner';

  onMounted(() => {
    if (import.meta.client)
      document.body.classList.add('hydrated')
  })
</script>
