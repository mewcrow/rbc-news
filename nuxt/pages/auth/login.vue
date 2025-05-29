<template>
  <div class="page-content border-dashed flex flex-col items-center justify-center p-8 box-rounded">
    <div class="inputs-wrapper flex flex-col justify-center items-center">
      <InputValidation v-model="errors.email" class="mb-2">
        <input v-model="credentials.email" class="input" type="text" placeholder="E-mail">
      </InputValidation>
      <InputValidation v-model="errors.password" class="mb-2">
        <input v-model="credentials.password" class="input mb-2" type="password" placeholder="Password">
      </InputValidation>
      <button @click="submit" class="btn btn-accent mb-8">Log in</button>

      <div class="divider">OR</div>

      <NuxtLink to="/auth/register" class="link">Register</NuxtLink>
    </div>
  </div>
</template>

<script setup lang="ts">
  const { login } = useSanctumAuth();

  const credentials = ref({
    email: '',
    password: '',
  })

  const errors = ref<{ [k: string]: string[] }>({
    email: [],
    password: [],
  })

  const submit = async () => {
    useSanctumUser().value = null
    await login(credentials.value).catch(e => {
      if (e.data.errors) errors.value = e.data.errors
    });
  }
</script>