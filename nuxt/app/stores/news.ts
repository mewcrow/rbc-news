import { defineStore } from 'pinia'

type TNewsResponse = {
  data: TNews[]
  meta: {
    current_page: number
  }
}

export const useNewsStore = defineStore('news', {
  state: () => {
    return {
      news: [] as TNews[],
      prefetchedNews: [] as TNews[],
    }
  },
  actions: {
    async fetchIndex() {
      const { data } = await useSanctumFetch<TNewsResponse>(
        `/api/news?per-page=${useSettingsStore().$state.newsPerPage}`
      )
      this.news = [...this.news, ...data.value!.data]
    },
    async fetchLatest(after: string) {
      const data = await useSanctumClient()<TNewsResponse>(`/api/news/latest?after=${encodeURIComponent(after)}`)
      if (data.data.length) {
        this.prefetchedNews = [...data.data, ...this.prefetchedNews]
      }
    },
    showLatest() {
      this.news = [...this.prefetchedNews, ...this.news]
      this.prefetchedNews = []
    },
    async updateNews(payload: Partial<TNews>) {
      const { id , ...body } = payload
      const updated = (
        await useSanctumClient()<{ data: TNews }>(`/api/news/${payload.id}`, { method: 'PATCH', body })
      ).data
      const idx = this.news.findIndex(n => n.id === updated.id)
      this.news.splice(idx, 1, updated)
    },
    deleteNews(id: number) {
      useSanctumClient()(`/api/news/${id}`, { method: 'DELETE' }).then(() => {
        this.news.splice(this.news.findIndex(n => n.id === id), 1)
      })
    }
  }
})