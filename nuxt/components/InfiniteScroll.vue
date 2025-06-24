<template>
  <div class="flex justify-center items-center h-20">
    <span v-if="nextPageIsLoading" class="loading loading-bars loading-md" />
  </div>
</template>

<script setup lang="ts">
  const { nextPageIsLoading } = storeToRefs(useNewsStore())

  const loadNextPage = () => {
    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
      useNewsStore().loadNextPage()
    }
  }

  if (import.meta.client) {
    window.addEventListener('scroll', loadNextPage);
  }

  onBeforeUnmount(() => window.removeEventListener('scroll', loadNextPage))
</script>