<template>
  <div class="flex justify-center items-center h-20">
    <span v-if="nextPageIsLoading" class="loading loading-bars loading-md" />
  </div>
</template>

<script setup lang="ts">
  const props = defineProps<{ apiUrl: string, perPage: number }>()
  const nextPageIsLoading = ref(false)
  const model = defineModel()
  let currentPage = 1

  const loadNextPage = async <T>() => {
    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
      nextPageIsLoading.value = true
      const result = await useSanctumClient()<{ data: T[], meta: { current_page: number } }>(
        `${props.apiUrl}?page=${++currentPage}&per-page=${props.perPage}`
      )
      model.value = [...model.value as T[], ...result.data as T[]]
      currentPage = result.meta.current_page
      nextPageIsLoading.value = false
    }
  }

  if (import.meta.client) {
    window.addEventListener('scroll', loadNextPage);
  }

  onBeforeUnmount(() => window.removeEventListener('scroll', loadNextPage))
</script>