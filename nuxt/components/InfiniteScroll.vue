<template>
  <div class="flex justify-center">
    <span v-if="loading" class="loading loading-bars loading-md" />
  </div>
</template>

<script setup lang="ts">
  const apiClient = useSanctumClient()
  const loading = ref(false);
  let _disabled = false
  let page = 1;
  const emit = defineEmits<{
    pageFetched: [page: unknown]
  }>()
  const props = defineProps<{ apiUrl: string }>()

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
    apiClient(`${props.apiUrl}?page=${page}`)
      .then((res: { data: unknown[]}) => {
        emit('pageFetched', res as { data: unknown[] })
        loading.value = false

        if (!res.data.length) {
          _disabled = true
        }
      })
      .finally(() => loading.value = false)
  }
</script>