<template>
  <div class="flex justify-center items-center h-20">
    <span v-if="loading" class="loading loading-bars loading-md" />
  </div>
</template>

<script setup lang="ts">
  const loading = ref(false);
  let _disabled = false
  let page = 1;

  if (import.meta.client) {
    window.addEventListener('scroll', () => {
      if (loading.value || _disabled) return;
      if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
        page++;
        loadNextPage(page);
      }
    });
  }

  async function loadNextPage(page: number) {
    loading.value = true;
    await useNewsStore().fetchIndex(page)
    loading.value = false
  }
</script>