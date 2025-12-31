<script setup lang="ts">
import { ref } from 'vue'
import {
  Card,
  CardHeader,
  CardTitle,
  CardDescription,
  CardContent,
  CardFooter,
} from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Button } from '@/components/ui/button'
import { Separator } from '@/components/ui/separator'

const emit = defineEmits<{ (e: 'login'): void }>()

const firstName = ref('')
const lastName = ref('')
const email = ref('')
const phoneNumber = ref('')
const nationalId = ref('')
const password = ref('')

const handleSignup = () => {
  console.log({
    firstName: firstName.value,
    lastName: lastName.value,
    email: email.value,
    phoneNumber: phoneNumber.value,
    nationalId: nationalId.value,
    password: password.value,
  })
}

</script>

<template>
      <Card class="border-none shadow-none">
        <CardHeader>
          <CardTitle class="text-2xl">Create Account</CardTitle>
          <CardDescription>
            Fill in your details to get started
          </CardDescription>
        </CardHeader>

        <CardContent>
          <form @submit.prevent="handleSignup" class="flex flex-col gap-4">
            <Input v-model="firstName" placeholder="First Name" />
            <Input v-model="lastName" placeholder="Last Name" />
            <Input v-model="email" type="email" placeholder="Email" />
            <Input v-model="phoneNumber" placeholder="Phone Number" />
            <Input v-model="nationalId" placeholder="National ID" />
            <Input v-model="password" type="password" placeholder="Password" />
            <Button type="submit" class="mt-2 w-full">
              Create Account
            </Button>
          </form>
        </CardContent>

        <CardFooter class="flex flex-col gap-3">
          <Separator />
          <p class="text-sm text-muted-foreground text-center">
            Already have an account?
            <Button variant="link" @click="$emit('login')">
              Sign in
            </Button>
          </p>
        </CardFooter>
      </Card>
</template>
