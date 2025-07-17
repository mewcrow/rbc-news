<template>
  <NuxtLayout>
    <NuxtPage/>
  </NuxtLayout>
  <Toaster rich-color />
</template>

<script setup lang="ts">
  import { Toaster } from 'vue-sonner';

  onMounted(() => {
    if (import.meta.client)
      document.body.classList.add('hydrated')
  })
</script>
