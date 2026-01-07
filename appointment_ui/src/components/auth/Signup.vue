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
  (e: "login"): void
  (e: "success"): void
}>()

const auth = useAuthStore()
const errorMessage = ref<string | null>(null)

const firstName = ref("")
const lastName = ref("")
const email = ref("")
const phoneNumber = ref("")
const nationalId = ref("")
const password = ref("")

const handleSignup = async () => {
  const success = await auth.signup({
    firstName: firstName.value,
    lastName: lastName.value,
    email: email.value,
    phoneNumber: phoneNumber.value,
    nationalId: nationalId.value,
    password: password.value,
  })

  if (success) {
    errorMessage.value = null
    emit("success")
  } else {
    errorMessage.value = "Signup failed. Please check your details."
  }
}
</script>

<template>
  <Card>
    <CardHeader>
      <CardTitle>Create account</CardTitle>
      <CardDescription>Fill in your details to sign up</CardDescription>
    </CardHeader>

    <CardContent>
      <Alert v-if="errorMessage" variant="error" class="mb-4">
        <AlertTitle>Signup failed</AlertTitle>
        <AlertDescription>{{ errorMessage }}</AlertDescription>
      </Alert>

      <form @submit.prevent="handleSignup" class="space-y-4">
        <div class="grid grid-cols-2 gap-4">
          <div class="space-y-1">
            <Label>First name</Label>
            <Input v-model="firstName" required />
          </div>
          <div class="space-y-1">
            <Label>Last name</Label>
            <Input v-model="lastName" required />
          </div>
        </div>

        <Input v-model="email" type="email" placeholder="Email" />
        <Input v-model="phoneNumber" placeholder="Phone number" />
        <Input v-model="nationalId" placeholder="National ID" required />
        <Input v-model="password" type="password" placeholder="Password" required />

        <Button type="submit" class="w-full">Sign up</Button>
      </form>
    </CardContent>

    <CardFooter class="flex justify-center">
      <Button variant="link" type="button" @click="$emit('login')">
        Already have an account? Log in
      </Button>
    </CardFooter>
  </Card>
</template>
