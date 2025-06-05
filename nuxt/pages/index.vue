<template>
  <div>
    <div v-for="news in newsIndexResponse!.data" :key="news.slug" class="border-dashed mb-4 rounded-[var(--box-radius)] flex">
      <div class="w-[12rem] shrink-0">
        <img :src="news.image" alt="" class="w-[12rem] h-full object-cover">
      </div>
      <div class="p-2">
        <h4 class="font-bold pb-2 text-center text-lg">{{ news.title }}</h4>
        <p class="line-clamp-4">{{ news.text }}</p>
      </div>
    </div>
    <InfiniteScroll api-url="/api/news" @page-fetched="page => displayPage(page as TNewsIndexResp)"/>
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

  const displayPage = (page: TNewsIndexResp) => {
    newsIndexResponse.value!.data = [...newsIndexResponse.value!.data, ...page.data]
  }
</script>