<template>
  <div class="flex justify-center items-center h-12">
    <span v-if="loading" class="loading loading-bars loading-md" />
    <span v-else-if="latestNews.length" class="underline cursor-pointer" @click="showLatest">
      Показать еще ({{ latestNews.length }})
    </span>
  </div>
</template>

<script setup lang="ts">
  const apiClient = useSanctumClient()
  const loading = ref(false);
  type TNews = {
    title: string
    slug: string
    image: string
    text: string
    created_at: string
  }
  const news = defineModel<TNews[]>({ default: [] })
  const latestNews = ref<TNews[]>([])

  const latestNewsDate = computed(() => {
    if (!news.value!.length) return new Date().toISOString()
    if (latestNews.value.length) return latestNews.value[0].created_at
    if (news.value!.length) return news.value![0].created_at
    return new Date().toISOString()
  })

  if (import.meta.client) {
    setInterval(loadLatestNews, 120000)
  }

  async function loadLatestNews() {
    loading.value = true;
    apiClient<{data: TNews[]}>(`/api/news/latest?after=${encodeURIComponent(latestNewsDate.value)}`)
      .then(res => {
        if (res.data.length) {
          latestNews.value = [...res.data, ...latestNews.value]
        }
        loading.value = false
      })
      .finally(() => loading.value = false)
  }

  const showLatest = () => {
    news.value = [...latestNews.value, ...news.value]
    latestNews.value = []
  }
</script>