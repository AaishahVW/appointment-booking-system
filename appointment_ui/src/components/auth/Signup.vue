<script setup lang="ts">
import { ref } from "vue";
import { useAuthStore } from "@/stores/auth.store";

import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Card,
  CardHeader,
  CardTitle,
  CardDescription,
  CardContent,
  CardFooter,
} from "@/components/ui/card";

const emit = defineEmits<{
  (e: "login"): void;
  (e: "success"): void;
}>();

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
    emit("success");
  } else {
    alert("Signup failed. Try again.");
  }
};
</script>

<template>
  <Card>
    <CardHeader>
      <CardTitle>Create account</CardTitle>
      <CardDescription>
        Fill in your details to sign up
      </CardDescription>
    </CardHeader>

    <CardContent>
      <form @submit.prevent="handleSignup" class="space-y-4">
        <div class="grid grid-cols-2 gap-4">
          <div class="space-y-1">
            <Label for="firstName">First name</Label>
            <Input id="firstName" v-model="firstName" required />
          </div>

          <div class="space-y-1">
            <Label for="lastName">Last name</Label>
            <Input id="lastName" v-model="lastName" required />
          </div>
        </div>

        <div class="space-y-1">
          <Label for="email">Email</Label>
          <Input id="email" type="email" v-model="email" />
        </div>

        <div class="space-y-1">
          <Label for="phone">Phone number</Label>
          <Input id="phone" v-model="phoneNumber" />
        </div>

        <div class="space-y-1">
          <Label for="nationalId">National ID</Label>
          <Input id="nationalId" v-model="nationalId" required />
        </div>

        <div class="space-y-1">
          <Label for="password">Password</Label>
          <Input
            id="password"
            type="password"
            v-model="password"
            required
          />
        </div>

        <Button type="submit" class="w-full">
          Sign up
        </Button>
      </form>
    </CardContent>

    <CardFooter class="flex justify-center">
      <Button variant="link" type="button" @click="$emit('login')">
        Already have an account? Log in
      </Button>
    </CardFooter>
  </Card>
</template>
