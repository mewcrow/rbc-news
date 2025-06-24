<template>
  <div class="flex justify-center items-center h-12">
    <span v-if="loading" class="loading loading-bars loading-md" />
    <span v-else-if="prefetchedNews.length" class="underline cursor-pointer" @click="newsStore.showPrefetched">
      Показать еще ({{ prefetchedNews.length }})
    </span>
  </div>
</template>

<script setup lang="ts">
  const newsStore = useNewsStore()
  const { news, prefetchedNews } = storeToRefs(newsStore)
  const { newsFetchInterval } = storeToRefs(useSettingsStore())
  const loading = ref(false);
  let interval: ReturnType<typeof setTimeout> | null = null;

  const lastNewsDate = computed(() => {
    if (!news.value!.length) return new Date().toISOString()
    if (prefetchedNews.value.length) return prefetchedNews.value[0].created_at
    if (news.value!.length) return news.value![0].created_at
    return new Date().toISOString()
  })

  if (import.meta.client) {
    interval = setInterval(async () => {
      loading.value = true
      await newsStore.fetchLatest(lastNewsDate.value)
      loading.value = false
    }, newsFetchInterval.value * 1000)
  }

  onBeforeUnmount(() => clearInterval(interval as ReturnType<typeof setTimeout>))
</script>