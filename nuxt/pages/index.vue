<template>
  <div>
    <LatestNewsFetcher />

    <div
      v-for="news in allNews" :key="news.slug"
      class="border-dashed mb-4 rounded-[var(--box-radius)] flex cursor-pointer"
      @click="navigateTo(`news/${news.slug}`)"
    >
      <div v-if="news.image" class="shrink-0">
        <img :src="news.image" class="w-[12rem] h-full object-cover" alt="" loading="lazy">
      </div>
      <div class="p-2">
        <h4 class="font-bold pb-2 text-center text-lg">{{ news.title }}</h4>
        <p class="line-clamp-4">{{ news.text }}</p>
      </div>
    </div>

    <InfiniteScroll api-url="/api/news" v-model="allNews"/>
  </div>
</template>

<script lang="ts" setup>
  const newsStore = useNewsStore()
  const { news: allNews } = storeToRefs(newsStore)

  newsStore.fetchIndex()
</script>