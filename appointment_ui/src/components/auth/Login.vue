<script setup lang="ts">
import { ref } from "vue"
import { useAuthStore } from "@/stores/auth.store"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import {
  Card,
  CardHeader,
  CardTitle,
  CardDescription,
  CardContent,
  CardFooter,
} from "@/components/ui/card"
import { Alert, AlertTitle, AlertDescription } from "@/components/ui/alert"

const emit = defineEmits<{
  (e: "signup"): void
  (e: "success"): void
}>()

const auth = useAuthStore()
const username = ref("")
const password = ref("")
const errorMessage = ref<string | null>(null)

const handleLogin = async () => {
  const success = await auth.login(username.value, password.value)

  if (success) {
    errorMessage.value = null
    emit("success")
  } else {
    errorMessage.value = "Invalid username or password."
  }
}
</script>

<template>
  <Card>
    <CardHeader>
      <CardTitle>Log in</CardTitle>
      <CardDescription>Enter your credentials to continue</CardDescription>
    </CardHeader>

    <CardContent>
      <Alert v-if="errorMessage" variant="error" class="mb-4">
        <AlertTitle>Login failed</AlertTitle>
        <AlertDescription>{{ errorMessage }}</AlertDescription>
      </Alert>

      <form @submit.prevent="handleLogin" class="space-y-4">
        <div class="space-y-1">
          <Label for="username">ID Number</Label>
          <Input id="username" v-model="username" required />
        </div>

        <div class="space-y-1">
          <Label for="password">Password</Label>
          <Input id="password" type="password" v-model="password" required />
        </div>

        <Button type="submit" class="w-full">Log In</Button>
      </form>
    </CardContent>

    <CardFooter class="flex justify-center">
      <Button variant="link" type="button" @click="$emit('signup')">
        Don’t have an account? Sign up
      </Button>
    </CardFooter>
  </Card>
</template>
