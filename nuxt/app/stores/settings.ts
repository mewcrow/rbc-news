import { defineStore } from 'pinia'

export const useSettingsStore = defineStore('settings', {
  state: () => {
    return {
      newsPerPage: 20,
      newsFetchInterval: 120,
    }
  },
  persist: true,
})