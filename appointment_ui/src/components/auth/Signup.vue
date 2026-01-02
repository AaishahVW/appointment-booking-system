<script setup lang="ts">
import { ref } from "vue";
import { useAuthStore } from "@/stores/auth.store";

const emit = defineEmits<{ (e: "login"): void; (e: "success"): void }>();
const auth = useAuthStore();

const firstName = ref("");
const lastName = ref("");
const email = ref("");
const phoneNumber = ref("");
const nationalId = ref("");
const password = ref("");

const handleSignup = async () => {
  const success = await auth.signup({
    firstName: firstName.value,
    lastName: lastName.value,
    email: email.value,
    phoneNumber: phoneNumber.value,
    nationalId: nationalId.value,
    password: password.value,
  });

  if (success) {
    emit("success"); // close the dialog
  } else {
    alert("Signup failed. Try again.");
  }
};
</script>

<template>
  <form @submit.prevent="handleSignup" class="space-y-4">
    <input v-model="firstName" placeholder="First Name" />
    <input v-model="lastName" placeholder="Last Name" />
    <input v-model="email" type="email" placeholder="Email" />
    <input v-model="phoneNumber" placeholder="Phone Number" />
    <input v-model="nationalId" placeholder="National ID" />
    <input v-model="password" type="password" placeholder="Password" />
    <button type="submit">Sign up</button>
    <button type="button" @click="$emit('login')">Login</button>
  </form>
</template>
