<script setup lang="ts">
import {
  Avatar,
  AvatarFallback,
  AvatarImage,
} from '@/components/ui/avatar'
import { useRouter } from 'vue-router'

const router = useRouter()

const props = defineProps<{
  isLoggedIn?: boolean
  firstName?: string
  lastName?: string
  referenceNumber?: string // CP or CE
}>()

const initials = (firstName?: string, lastName?: string) => {
  if (!firstName || !lastName) return 'U'
  return `${firstName[0]}${lastName[0]}`.toUpperCase()
}

const goToLogin = () => {
  router.push('/login')
}
</script>

<template>
  <!-- Logged out state -->
  <button
    v-if="!props.isLoggedIn"
    @click="goToLogin"
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

  <!-- Logged in state -->
  <div v-else class="flex items-center gap-3">
    <Avatar>
      <!-- Later add AvatarImage when profile photos exist -->
      <AvatarFallback>
        {{ initials(props.firstName, props.lastName) }}
      </AvatarFallback>
    </Avatar>

    <div class="flex flex-col leading-tight">
      <span class="text-sm font-medium text-foreground">
        {{ props.firstName }} {{ props.lastName }}
      </span>
      <span class="text-xs text-muted-foreground">
        {{ props.referenceNumber }}
      </span>
    </div>
  </div>
</template>
