<template>
  <div>
    <LatestNewsFetcher />

    <section class="all-news flex flex-wrap gap-x-4 gap-y-8">
      <div
        v-for="news in allNews" :key="news.slug"
        class="news flex flex-col flex-1/2 md:flex-1/3 lg:flex-1/4 border-dashed box-rounded cursor-pointer relative"
        @click="navigateTo(`news/${news.slug}`)"
      >
        <img
          :src="news.image || '/pngtree-no-photo-icon-png-image_4420169.jpg'"
          class="w-full h-[12rem] object-cover"
          :alt="news.title"
          loading="lazy"
        >
        <div class="p-2">
          <h4 class="font-bold mb-2 text-center text-lg line-clamp-2">{{ news.title }}</h4>
          <p class="line-clamp-4">{{ news.text }}</p>
        </div>
        <div
          v-if="user?.role === 'admin'"
          class="news-rating border-dashed box-rounded"
        >
          <div
            class="px-2 br-dashed"
            @click.stop="updateRating($event, news,news.rating - 1)"
          >
            <Icon name="ic:outline-minus"/>
          </div>
          <div class="px-2">Рейтинг: {{ news.rating }}</div>
          <div
            class="px-2 br-dashed bl-dashed"
            @click.stop="updateRating($event, news, news.rating + 1)"
          >
            <Icon class="br-dashed" name="ic:outline-plus"/>
          </div>
          <div
            class="px-2 br-dashed"
            @click.stop="useNewsStore().deleteNews(news.id)"
          >
            <Icon name="ic:delete"/>
          </div>
        </div>
      </div>
    </section>

    <InfiniteScroll v-model="allNews" api-url="/api/news" :per-page="newsPerPage"/>
  </div>
</template>

<script lang="ts" setup>
  const newsStore = useNewsStore()
  const { news: allNews } = storeToRefs(newsStore)
  const { newsPerPage } = storeToRefs(useSettingsStore())
  const user = useSanctumUser<TUser>()

  if (!allNews.value.length) {
    newsStore.fetchIndex()
  }

  const updateRating = async ($event: MouseEvent, news: TNews, rating: number) => {
    if (rating >= 1 && rating <= 10) {
      const classList = ($event.target as HTMLDivElement).closest('.news')?.classList
      classList?.remove('rating-up', 'rating-down')
      classList?.add(rating > news.rating ? 'rating-up' : 'rating-down')
      setTimeout(() => classList?.remove('rating-up', 'rating-down'), 1000)

      news.rating = rating
      newsStore.updateNews({ id: news.id, rating });
    }
  }
</script>

<style lang="css" scoped>
  .news:hover {
    .news-rating {
      display: flex;
    }
  }

  .news-rating {
    display: none;
    position: absolute;
    flex-direction: row;
    align-items: center;
    align-self: center;
    background-color: var(--color-base-100);
    bottom: -1.2rem;
    line-height: 1;
    height: 2rem;
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
      border-color: var(--color-primary-content);
    }
  }

  @keyframes rating-down {
    0% {
      border-color: var(--color-error);
    }
    100% {
      border-color: var(--color-primary-content);
    }
  }
</style>