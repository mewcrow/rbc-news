<template>
  <div class="flex justify-center items-center h-20">
    <span v-if="nextPageIsLoading" class="loading loading-bars loading-md" />
  </div>
</template>

<script setup lang="ts">
  const loading = ref(false);
  const _disabled = false
  let page = 1;
  const { nextPageIsLoading } = storeToRefs(useNewsStore())

  if (import.meta.client) {
    window.addEventListener('scroll', () => {
      if (loading.value || _disabled) return;
      if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
        page++;
        useNewsStore().loadNextPage(page)
      }
    });
  }
</script>