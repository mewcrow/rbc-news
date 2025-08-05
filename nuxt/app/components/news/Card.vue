<template>
  <div
    v-if="news"
    class="news flex flex-col flex-1/2 md:flex-1/3 lg:flex-1/4 border-dashed box-rounded cursor-pointer relative"
    @click="navigateTo(`news/${news.slug}`)"
    ref="newsEl"
  >
    <img
      v-if="news.image"
      :src="news.image"
      class="w-full h-[12rem] object-cover"
      :alt="news.title"
      loading="lazy"
    >
    <div v-else class="w-full h-[12rem] flex items-center justify-center">
      <Icon size="3em" name="ic:outline-image-not-supported" />
    </div>
    <div class="p-2">
      <h4 class="font-bold mb-2 text-center text-lg line-clamp-2">{{ news.title }}</h4>
      <p class="line-clamp-4">{{ news.text }}</p>
    </div>

    <NewsRating
      v-if="user?.role === 'admin'"
      class="news-rating"
      :news
      @rating-changed="(newRating: number) => highlightBorder(newRating)"
    />
  </div>
</template>

<script lang="ts" setup>
  const news = defineModel<TNews>()
  const user = useSanctumUser<TUser>()
  const newsEl = ref<HTMLElement | null>(null)

  const highlightBorder = (newRating: number) => {
    const classList = newsEl.value?.classList
    if (classList) {
      classList.remove('rating-up', 'rating-down')
      classList.add(newRating > news.value!.rating ? 'rating-up' : 'rating-down')
      setTimeout(() => classList.remove('rating-up', 'rating-down'), 1000)
    }
  }
</script>

<style lang="css" scoped>
  .news:hover {
    .news-rating {
      display: flex;
    }
  }

  .news {
    &.rating-up {
      animation: rating-up 1s
    }

    &.rating-down {
      animation: rating-down 1s
    }
  }

  @keyframes rating-up {
    0% {
      border-color: var(--color-success);
    }
    100% {
      border-color: var(--border-color);
    }
  }

  @keyframes rating-down {
    0% {
      border-color: var(--color-error);
    }
    100% {
      border-color: var(--border-color);
    }
  }
</style>