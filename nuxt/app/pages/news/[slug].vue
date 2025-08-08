<template>
  <article class="mt-4 ">
    <h1 class="text-center text-3xl font-extrabold mb-4">{{ news?.data.title }}</h1>

    <img
      :src="news?.data.image"
      class="mb-4 md:w-[50vw] lg:w-[50vw] xl:w-[40vw] 2xl:w-[30vw] md:mb-0  md:center md:float-left md:mr-4"
      alt=""
      loading="lazy"
    >

    <p v-for="paragraph in paragraphs" :key="paragraph" class="mb-2 indent-3">
      {{ paragraph }}
    </p>
  </article>
</template>

<script setup lang="ts">
  const route = useRoute()

  const { data: news } = await useSanctumFetch<{ data: TNews }>(`/api/news/${route.params.slug}`)
  const paragraphs = computed(() => news.value.data.text.split('\n').filter((p: string) => p.trim() !== ''))
</script>