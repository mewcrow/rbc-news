<template>
  <div class="drawer">
    <input id="my-drawer" type="checkbox" class="drawer-toggle" >
    <div class="drawer-content">
      <div class="layout-default container mx-auto py-4 flex flex-col">
        <header>
          <div class="top-bar">
            <label for="my-drawer" class="top-bar-item br-dashed drawer-button">
              <Icon class="inline mr-[0.2rem]" name="ic:baseline-menu"/>
              Меню
            </label>
            <div class="spacer"/>
            <div class="top-bar-item bl-dashed">
              <Icon size="1.5rem" class="inline mr-[0.2rem]" name="ic:baseline-account-circle"/>
              <NuxtLink v-if="!isAuthenticated" to="/auth/login" class="link">
                Войти
              </NuxtLink>
              <a v-else class="cursor-pointer" @click.prevent="logout">Выйти {{ `(${user!.name})` }}</a>
            </div>
          </div>
          <div class="header-logo">
            <NuxtLink to="/" class="flex">
              <Icon name="ic:baseline-newspaper" />
              <span class="inline-block ml-4">Новости</span>
            </NuxtLink>
          </div>
        </header>

        <slot/>

      </div>
    </div>

    <div class="drawer-side">
      <label for="my-drawer" aria-label="close sidebar" class="drawer-overlay"/>
      <ul class="menu bg-base-200 text-base-content min-h-full w-80 p-4 flex flex-col">
        <li><NuxtLink to="/">Главная</NuxtLink></li>
        <li><NuxtLink to="/settings">Настройки</NuxtLink></li>
        <li class="flex-1 opacity-0">Hidden</li>
        <li v-if="isAuthenticated" @click.prevent="logout"><a>Выход</a></li>
        <li v-else><NuxtLink to="/auth/login">Вход</NuxtLink></li>
      </ul>
    </div>
  </div>
</template>

<script setup lang="ts">
  const { logout, isAuthenticated } = useSanctumAuth()
  const user = useSanctumUser<{ name: string }>()

  onMounted(() => {
    if (import.meta.client) {
      for(const drawerItem of document.querySelectorAll('.drawer-side li')) {
        (drawerItem as HTMLLIElement).onclick = () => {
          (document.getElementById('my-drawer') as HTMLInputElement).checked = false
        }
      }
    }
  })
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
        height: 9rem;
      }

      .top-bar {
        display: flex;

        .top-bar-item {
          display: flex;
          align-items: center;
          justify-content: center;
          font-size: 1.2rem;
          padding: 0.15rem 0.5rem;
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