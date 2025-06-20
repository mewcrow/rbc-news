import { defineStore } from 'pinia'

type TNews = {
  title: string
  slug: string
  image: string
  text: string
  created_at: string
}

export const useNewsStore = defineStore('news', {
  state: () => {
    return {
      news: [] as TNews[],
      prefetchedNews: [] as TNews[],
    }
  },
  actions: {
    async fetchIndex(page = 1) {
      const { data } = await useSanctumFetch<{ data: TNews[] }>(
        `/api/news?page=${page}&per-page=${useSettingsStore().$state.newsPerPage}`
      )
      this.news = [...this.news, ...data.value!.data]
    },
    async fetchLatest(after: string) {
      const apiClient = useSanctumClient()

      const data = await apiClient<{ data: TNews[] }>(`/api/news/latest?after=${encodeURIComponent(after)}`)
      if (data.data.length) {
        this.prefetchedNews = [...data.data, ...this.prefetchedNews]
      }
    },
    showPrefetched() {
      this.news = [...this.prefetchedNews, ...this.news]
      this.prefetchedNews = []
    }
  }
})