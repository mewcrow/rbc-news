<template>
  <div class="layout-default container mx-auto py-4 flex flex-col">
    <header>
      <div class="top-bar">
        <NuxtLink class="br-dashed link" to="/">Главная</NuxtLink>
        <div class="spacer"/>
        <NuxtLink v-if="!isAuthenticated" to="/auth/login" class="bl-dashed link">
          Войти
        </NuxtLink>
        <a v-else class="bl-dashed link" @click.prevent="logout">Выйти {{ `(${user!.name})` }}</a>
      </div>
      <div class="header-logo">
        <NuxtLink to="/" class="flex">
          <Icon name="ic:baseline-newspaper" />
          <span class="inline-block">Новости</span>
        </NuxtLink>
      </div>
    </header>

    <slot/>
  </div>
</template>

<script setup lang="ts">
  const { logout, isAuthenticated } = useSanctumAuth()
  const user = useSanctumUser<{ name: string }>()

  if (import.meta.client && import.meta.dev) {
    console.log(`Logged in as ${JSON.stringify(user.value)}`)
  }
</script>

<style lang="css">
  .layout-default{
    min-height: 100vh;

    header {
      border: var(--dashed-border);
      border-radius: var(--box-radius);

      .header-logo {
        border-top: var(--dashed-border);
        line-height: 1em;
        height: 8rem;
      }

      .top-bar {
        display: flex;

        & > a {
          padding: 0.25rem 0.5rem;
        }

        .spacer {
          flex: 1;
        }
      }

      .header-logo {
        display: flex;
        justify-content: center;
        align-items: center;

        font-size: 5rem;
      }
    }
  }
</style>