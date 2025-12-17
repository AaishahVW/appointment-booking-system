<template>
  <div class="max-w-md mx-auto mt-20 p-6 bg-white rounded-lg shadow-lg">
    <h2 class="text-2xl font-bold mb-6">Log In</h2>
    <form @submit.prevent="handleLogin" class="flex flex-col gap-4">
      <Input v-model="username" placeholder="Username" />
      <Input v-model="password" type="password" placeholder="Password" />
      <Button type="submit" variant="default">Log In</Button>
    </form>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';

const username = ref('');
const password = ref('');

const handleLogin = () => {
  console.log({ username: username.value, password: password.value });
  // TODO: call backend API to authenticate
};
</script>

<style scoped>
</style>
