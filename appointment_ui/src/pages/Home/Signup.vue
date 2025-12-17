<template>
  <div class="max-w-md mx-auto mt-20 p-6 bg-white rounded-lg shadow-lg">
    <h2 class="text-2xl font-bold mb-6">Sign Up</h2>
    <form @submit.prevent="handleSubmit" class="flex flex-col gap-4">
      <Input v-model="firstName" placeholder="First Name" />
      <Input v-model="lastName" placeholder="Last Name" />
      <Input v-model="email" type="email" placeholder="Email" />
      <Input v-model="phoneNumber" placeholder="Phone Number" />
      <Input v-model="nationalId" placeholder="National ID" />
      <Input v-model="password" type="password" placeholder="Password" />
      <Button type="submit" variant="default">Create Account</Button>
    </form>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';

const firstName = ref('');
const lastName = ref('');
const email = ref('');
const phoneNumber = ref('');
const nationalId = ref('');
const password = ref('');

const handleSubmit = () => {
  console.log({
    firstName: firstName.value,
    lastName: lastName.value,
    email: email.value,
    phoneNumber: phoneNumber.value,
    nationalId: nationalId.value,
    password: password.value,
  });
  // TODO: call backend API to create user
};
</script>

<style scoped>
</style>
