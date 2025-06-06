<template>
  <div>
    <div
      v-for="news in newsIndexResponse!.data" :key="news.slug"
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

    <InfiniteScroll api-url="/api/news" @page-fetched="page => renderPage(page as TNewsIndexResp)"/>
  </div>
</template>

<script lang="ts" setup>
  type TNewsIndexResp = {
    data: {
      title: string
      slug: string
      image: string
      text: string
    }[]
  }
  const { data: newsIndexResponse } = await useSanctumFetch<TNewsIndexResp>('/api/news')

  const renderPage = (page: TNewsIndexResp) => {
    newsIndexResponse.value!.data = [...newsIndexResponse.value!.data, ...page.data]
  }
</script>