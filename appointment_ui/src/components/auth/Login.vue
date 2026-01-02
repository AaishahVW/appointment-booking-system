<script setup lang="ts">
import { ref } from "vue";
import { useAuthStore } from "@/stores/auth.store";

const emit = defineEmits<{ (e: "signup"): void; (e: "success"): void }>();

const auth = useAuthStore();

const username = ref("");
const password = ref("");

const handleLogin = async () => {
  const success = await auth.login(username.value, password.value);
  if (success) {
    emit("success"); // close the dialog
  } else {
    alert("Login failed. Check your credentials.");
  }
};
</script>

<template>
  <form @submit.prevent="handleLogin" class="space-y-4">
    <input v-model="username" placeholder="Username" />
    <input v-model="password" type="password" placeholder="Password" />
    <button type="submit">Log In</button>
    <button type="button" @click="$emit('signup')">Sign up</button>
  </form>
</template>
