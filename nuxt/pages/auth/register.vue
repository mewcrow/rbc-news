<template>
  <div class="page-content border-dashed box-rounded flex flex-col justify-center items-center p-8">
    <div class="inputs-wrapper flex flex-col justify-center items-center">
      <InputValidation v-model="errors.name" class="mb-2">
        <input v-model="registerPayload.name" class="input mb-2" type="text" placeholder="Имя">
      </InputValidation>
      <InputValidation v-model="errors.email" class="mb-2">
        <input v-model="registerPayload.email" class="input mb-2" type="text" placeholder="E-mail">
      </InputValidation>
      <InputValidation v-model="errors.password" class="mb-2">
        <input v-model="registerPayload.password" class="input mb-2" type="password" placeholder="Пароль">
      </InputValidation>
      <InputValidation v-model="errors.password_confirmation" class="mb-2">
        <input
          v-model="registerPayload.password_confirmation"
          class="input mb-2"
          type="password"
          placeholder="Подверждение пароля"
        >
      </InputValidation>
      <button class="btn btn-accent mb-8" @click="submit">
        <span ref="loading-spinner" class="loading loading-spinner hidden"/>
        Зарегистрироваться
      </button>

      <div class="divider">ИЛИ</div>

      <NuxtLink to="/auth/login" class="link">Войти</NuxtLink>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { toast } from 'vue-sonner'
  const apiClient = useSanctumClient()

  const registerPayload = ref({
    name: '',
    email: '',
    password: '',
    password_confirmation: '',
  })
  const errors = ref<{[k: string]: string[]}>({
    name: [],
    email: [],
    password: [],
    password_confirmation: [],
  })
  const submitSpinner = useTemplateRef<HTMLDivElement>('loading-spinner')

  const submit = async () => {
    submitSpinner.value!.classList.remove('hidden')
    await apiClient('api/register', { method: 'POST', body: registerPayload.value })
      .then(async () => {
        submitSpinner.value!.classList.add('hidden')
        toast.success('Регистрация успешна')
        await useSanctumAuth().refreshIdentity()
        await navigateTo('/')
      })
      .catch(e => {
        submitSpinner.value!.classList.add('hidden')
        if (e.data.errors) errors.value = e.data.errors
      });
  }
</script>