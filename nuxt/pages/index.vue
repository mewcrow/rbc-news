<template>
  <div>
    <LatestNewsFetcher />

    <section class="all-news flex flex-wrap gap-4">
      <div
        v-for="news in allNews" :key="news.slug"
        class="news flex flex-col flex-1/2 md:flex-1/3 lg:flex-1/4 border-dashed rounded-[var(--box-radius)] cursor-pointer"
        @click="navigateTo(`news/${news.slug}`)"
      >
        <img
          :src="news.image || '/pngtree-no-photo-icon-png-image_4420169.jpg'"
          class="w-full h-[12rem] object-cover"
          :alt="news.title"
          loading="lazy"
        >
        <div class="p-2">
          <h4 class="font-bold pb-2 text-center text-lg line-clamp-2">{{ news.title }}</h4>
          <p class="line-clamp-4">{{ news.text }}</p>
        </div>
      </div>
    </section>

    <InfiniteScroll v-model="allNews" api-url="/api/news"/>
  </div>
</template>

<script lang="ts" setup>
  const newsStore = useNewsStore()
  const { news: allNews } = storeToRefs(newsStore)

  if (!allNews.value.length) {
    newsStore.fetchIndex()
  }
</script>