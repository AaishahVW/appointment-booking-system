<script setup lang="ts">
import {
  Avatar,
  AvatarFallback,
  AvatarImage,
} from '@/components/ui/avatar'
import { ref } from 'vue'
import Login from '@/components/auth/Login.vue'

const showLogin = ref(false)

const props = defineProps<{
  isLoggedIn?: boolean
  firstName?: string
  lastName?: string
  referenceNumber?: string
}>()

const initials = (firstName?: string, lastName?: string) => {
  if (!firstName || !lastName) return 'U'
  return `${firstName[0]}${lastName[0]}`.toUpperCase()
}
</script>

<template>
  <!-- Logged out -->
  <button
    v-if="!props.isLoggedIn"
    @click="showLogin = true"
    class="flex items-center gap-2 rounded-md px-2 py-1 hover:bg-muted transition"
  >
    <Avatar>
      <AvatarImage src="https://github.com/shadcn.png" />
      <AvatarFallback>U</AvatarFallback>
    </Avatar>

    <span class="text-sm text-muted-foreground">
      Sign in
    </span>
  </button>

  <!-- Logged in -->
  <div v-else class="flex items-center gap-3">
    <Avatar>
      <AvatarFallback>
        {{ initials(props.firstName, props.lastName) }}
      </AvatarFallback>
    </Avatar>

    <div class="flex flex-col leading-tight">
      <span class="text-sm font-medium">
        {{ props.firstName }} {{ props.lastName }}
      </span>
      <span class="text-xs text-muted-foreground">
        {{ props.referenceNumber }}
      </span>
    </div>
  </div>

  <!-- Login Modal -->
  <Login v-model:open="showLogin" />
</template>
