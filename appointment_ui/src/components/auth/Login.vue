<script setup lang="ts">
import { ref, computed } from "vue"
import { useAuthStore } from "@/stores/auth.store"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import {
  Card,
  CardHeader,
  CardTitle,
  CardDescription,
  CardContent,
  CardFooter,
} from "@/components/ui/card"
import { Alert, AlertTitle, AlertDescription } from "@/components/ui/alert"
import { Eye, EyeOff } from "lucide-vue-next"

const emit = defineEmits<{
  (e: "signup"): void
  (e: "success"): void
}>()

const auth = useAuthStore()

const username = ref("")
const password = ref("")
const showPassword = ref(false)
const errorMessage = ref<string | null>(null)

const digitsOnlyInput = (e: Event) => {
  const input = e.target as HTMLInputElement
  input.value = input.value.replace(/\D+/g, "")
}

const isUsernameValid = computed(() =>
  /^\d{9,13}$/.test(username.value)
)

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
        <div class="space-y-2">
          <Input
            v-model="username"
            placeholder="ID Number"
            maxlength="13"
            inputmode="numeric"
            @input="digitsOnlyInput"
            :class="username && !isUsernameValid ? 'border-error' : ''"
          />
          <p v-if="username && !isUsernameValid" class="text-xs text-error">
            ID number must be between 9 and 13 digits
          </p>
        </div>

        <div class="space-y-2">
          <div class="relative">
            <Input
              :type="showPassword ? 'text' : 'password'"
              v-model="password"
              placeholder="Password"
            />
            <button
              type="button"
              class="absolute right-3 top-4"
              @click="showPassword = !showPassword"
            >
              <Eye
                v-if="!showPassword"
                class="h-5 w-5 text-primary"
              />
              <EyeOff
                v-else
                class="h-5 w-5 text-primary"
              />
            </button>
          </div>
        </div>

        <Button type="submit" class="w-full" :disabled="!isUsernameValid">
          Log In
        </Button>
      </form>
    </CardContent>

    <CardFooter class="justify-center">
      <Button variant="link" @click="$emit('signup')">
        Don’t have an account? Sign up
      </Button>
    </CardFooter>
  </Card>
</template>
