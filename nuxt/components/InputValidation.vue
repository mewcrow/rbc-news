<template>
  <div :class="props.class">
    <slot />
    <p v-if="model[0]" class="mb-2 text-error text-sm" >{{ model[0] }}</p>
  </div>
</template>

<script setup lang="ts">
  const props = defineProps<{ class: string }>()
  const model = defineModel<string[]>({ default: [] })
</script>