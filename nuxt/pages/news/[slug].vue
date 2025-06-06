<template>
  <article>
    <h1 class="text-center text-3xl font-extrabold mb-4">{{ news.data.title }}</h1>
    <img :src="news.data.image" class="mb-4 md:w-[50vw] lg:w-[50vw] xl:w-[40vw] 2xl:w-[30vw] md:mb-0  md:center md:float-left md:mr-4" alt="" loading="lazy">
    <p>{{ news.data.text }}</p>
  </article>
</template>

<script setup lang="ts">
  const route = useRoute()
  type TNewsResponse = {
    data: {
      [k: string]: string
    }
  }
  const { data: news } = await useSanctumFetch<TNewsResponse>(`/api/news/${route.params.slug}`)
</script>