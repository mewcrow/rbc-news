<template>
  <NuxtLayout>
    <NuxtPage/>
  </NuxtLayout>
  <Toaster rich-color />
</template>

<script setup lang="ts">
  import { Toaster } from 'vue-sonner';
  declare global {
    interface Window {
      isHydrated: boolean
    }
  }

  onMounted(() => {
    if (import.meta.client)
      window.isHydrated = true;
  })
</script>
