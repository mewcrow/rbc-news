<template>
  <div class="news-admin-controls border-dashed box-rounded">
    <div
      class="px-2 br-dashed"
      @click.stop="updateRating($event, props.news, props.news.rating - 1)"
    >
      <Icon name="ic:outline-minus"/>
    </div>
    <div class="px-2">Рейтинг: {{ props.news.rating }}</div>
    <div
      class="px-2 br-dashed bl-dashed"
      @click.stop="updateRating($event, props.news, props.news.rating + 1)"
    >
      <Icon name="ic:outline-plus"/>
    </div>
    <div
      class="px-2"
      @click.stop="useNewsStore().deleteNews(props.news.id)"
    >
      <Icon name="ic:delete"/>
    </div>
  </div>
</template>

<script lang="ts" setup>
  import { toast } from 'vue-sonner';

  const props = defineProps<{ news: TNews }>()
  const newsStore = useNewsStore()
  const emit = defineEmits<{
    (e: 'rating-changed', newRating: number): void
  }>()

  const updateRating = async ($event: MouseEvent, news: TNews, rating: number) => {
    if (rating >= 1 && rating <= 10) {
      emit('rating-changed', rating)
      news.rating = rating
      newsStore.updateNews({ id: news.id, rating });
    } else {
      toast.error('Рейтинг должен быть от 1 до 10')
    }
  }
</script>

<style lang="css" scoped>
  .news-admin-controls {
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
</style>