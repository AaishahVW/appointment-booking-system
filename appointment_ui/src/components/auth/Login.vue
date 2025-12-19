<script setup lang="ts">
import { ref } from 'vue'

// shadcn-vue components
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import {
  Dialog,
  DialogContent,
  DialogOverlay,
} from '@/components/ui/dialog'
import {
  Card,
  CardHeader,
  CardTitle,
  CardDescription,
  CardContent,
  CardFooter,
} from '@/components/ui/card'
import { Separator } from '@/components/ui/separator'

// 👇 controlled from parent
const open = defineModel<boolean>('open')

const username = ref('')
const password = ref('')

const handleLogin = () => {
  console.log({
    username: username.value,
    password: password.value,
  })
  // TODO: authenticate
}

const handleSignup = () => {
  open.value = false
  // TODO: route to signup
}
</script>

<template>
  <Dialog v-model:open="open">
    <DialogOverlay class="fixed inset-0 bg-black/40 backdrop-blur-sm" />

    <DialogContent class="sm:max-w-md">
      <Card class="border-none shadow-none">
        <CardHeader>
          <CardTitle class="text-2xl">Welcome back</CardTitle>
          <CardDescription>
            Log in to your account to continue
          </CardDescription>
        </CardHeader>

        <CardContent>
          <form @submit.prevent="handleLogin" class="space-y-4">
            <div class="space-y-2">
              <Label for="username">Username</Label>
              <Input
                id="username"
                v-model="username"
                placeholder="Enter your username"
              />
            </div>

            <div class="space-y-2">
              <Label for="password">Password</Label>
              <Input
                id="password"
                v-model="password"
                type="password"
                placeholder="••••••••"
              />
            </div>

            <Button type="submit" class="w-full">
              Log In
            </Button>
          </form>
        </CardContent>

        <CardFooter class="flex flex-col gap-3">
          <Separator />
          <p class="text-sm text-muted-foreground">
            Don’t have an account?
            <Button
              variant="link"
              class="px-1"
              @click="handleSignup"
            >
              Sign up
            </Button>
          </p>
        </CardFooter>
      </Card>
    </DialogContent>
  </Dialog>
</template>
