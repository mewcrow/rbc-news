<template>
  <div>
    <NewsLatestFetcher/>

    <section class="all-news flex flex-wrap gap-x-4 gap-y-8">
      <NewsCard v-for="(news, i) in allNews" :key="news.slug" v-model="allNews[i]"/>
    </section>

    <NewsInfiniteScroll v-model="allNews" api-url="/api/news" :per-page="newsPerPage"/>
  </div>
</template>

<script lang="ts" setup>
  const newsStore = useNewsStore()
  const { news: allNews } = storeToRefs(newsStore)
  const { newsPerPage } = storeToRefs(useSettingsStore())

  if (!allNews.value.length) {
    newsStore.fetchIndex()
  }
</script>