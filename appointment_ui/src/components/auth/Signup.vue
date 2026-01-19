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
import { Eye, EyeOff } from "lucide-vue-next"

const emit = defineEmits<{
  (e: "login"): void
  (e: "success"): void
}>()

const auth = useAuthStore()

const firstName = ref("")
const lastName = ref("")
const email = ref("")
const phoneNumber = ref("")
const nationalId = ref("")
const password = ref("")
const showPassword = ref(false)

const digitsOnlyInput = (e: Event) => {
  const input = e.target as HTMLInputElement
  input.value = input.value.replace(/\D+/g, "")
}

const isNameValid = (v: string) => /^[A-Za-z]+$/.test(v)

const isEmailValid = computed(() =>
  /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(email.value)
)

const isPhoneValid = computed(() =>
  /^\d{10}$/.test(phoneNumber.value)
)

const isNationalIdValid = computed(() =>
  /^\d{9,13}$/.test(nationalId.value)
)

const hasUppercase = computed(() => /[A-Z]/.test(password.value))
const hasSpecialChar = computed(() => /[@#$_]/.test(password.value))
const hasMinLength = computed(() => password.value.length >= 8)

const isPasswordValid = computed(() =>
  hasUppercase.value && hasSpecialChar.value && hasMinLength.value
)

const canSubmit = computed(() =>
  isNameValid(firstName.value) &&
  isNameValid(lastName.value) &&
  isEmailValid.value &&
  isPhoneValid.value &&
  isNationalIdValid.value &&
  isPasswordValid.value
)

const handleSignup = async () => {
  if (!canSubmit.value) return

  const success = await auth.signup({
    firstName: firstName.value,
    lastName: lastName.value,
    email: email.value,
    phoneNumber: phoneNumber.value,
    nationalId: nationalId.value,
    password: password.value,
  })

  if (success) emit("success")
}
</script>

<template>
  <Card>
    <CardHeader>
      <CardTitle>Create account</CardTitle>
      <CardDescription>Fill in your details to sign up</CardDescription>
    </CardHeader>

    <CardContent>
      <form @submit.prevent="handleSignup" class="space-y-4">
        <div class="grid grid-cols-2 gap-4">
          <div class="space-y-2">
            <Input
              v-model="firstName"
              placeholder="First name"
              :class="firstName && !isNameValid(firstName) ? 'border-error' : ''"
            />
            <p v-if="firstName && !isNameValid(firstName)" class="text-xs text-error">
              Letters only
            </p>
          </div>

          <div class="space-y-2">
            <Input
              v-model="lastName"
              placeholder="Last name"
              :class="lastName && !isNameValid(lastName) ? 'border-error' : ''"
            />
            <p v-if="lastName && !isNameValid(lastName)" class="text-xs text-error">
              Letters only
            </p>
          </div>
        </div>

        <div class="space-y-1">
          <Input
            v-model="email"
            placeholder="Email"
            :class="email && !isEmailValid ? 'border-error' : ''"
          />
          <p v-if="email && !isEmailValid" class="text-xs text-error">
            Enter a valid email address
          </p>
        </div>

        <div class="space-y-1">
          <Input
            v-model="phoneNumber"
            placeholder="Phone number"
            maxlength="10"
            inputmode="numeric"
            @input="digitsOnlyInput"
            :class="phoneNumber && !isPhoneValid ? 'border-error' : ''"
          />
          <p v-if="phoneNumber && !isPhoneValid" class="text-xs text-error">
            Must be exactly 10 digits
          </p>
        </div>

        <div class="space-y-1">
          <Input
            v-model="nationalId"
            placeholder="National ID"
            maxlength="13"
            inputmode="numeric"
            @input="digitsOnlyInput"
            :class="nationalId && !isNationalIdValid ? 'border-error' : ''"
          />
          <p v-if="nationalId && !isNationalIdValid" class="text-xs text-error">
            Must be 9–13 digits
          </p>
        </div>

        <div class="space-y-1">
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

          <ul class="text-xs mt-2 space-y-1">
            <li :class="hasUppercase ? 'text-success' : 'text-error'">
              • One uppercase letter
            </li>
            <li :class="hasSpecialChar ? 'text-success' : 'text-error'">
              • One special character (@ # $ _)
            </li>
            <li :class="hasMinLength ? 'text-success' : 'text-error'">
              • Minimum 8 characters
            </li>
          </ul>
        </div>

        <Button type="submit" class="w-full" :disabled="!canSubmit">
          Sign up
        </Button>
      </form>
    </CardContent>

    <CardFooter class="justify-center">
      <Button variant="link" @click="$emit('login')">
        Already have an account? Log in
      </Button>
    </CardFooter>
  </Card>
</template>
