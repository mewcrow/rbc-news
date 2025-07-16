<template>
  <div class="mt-4 flex flex-col items-center">
    <fieldset class="fieldset">
      <legend class="fieldset-legend">Количество новостей на странице</legend>
      <input v-model="newsPerPage" type="number" class="input" placeholder="Количество">
    </fieldset>

    <fieldset class="fieldset">
      <legend class="fieldset-legend">Интервал обновления новостей (сек)</legend>
      <input v-model="newsFetchInterval" type="number" class="input" placeholder="Интервал">
    </fieldset>
  </div>
</template>

<script lang="ts" setup>
  const { newsPerPage, newsFetchInterval } = storeToRefs(useSettingsStore())
</script>