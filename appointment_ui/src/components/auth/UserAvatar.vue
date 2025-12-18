<script setup lang="ts">
import {
  Avatar,
  AvatarFallback,
  AvatarImage,
} from '@/components/ui/avatar'

defineProps<{
  isLoggedIn?: boolean
  firstName?: string
  lastName?: string
  referenceNumber?: string // CP or CE
}>()

const initials = (firstName?: string, lastName?: string) => {
  if (!firstName || !lastName) return 'U'
  return `${firstName[0]}${lastName[0]}`.toUpperCase()
}
</script>

<template>
  <!-- Logged out state -->
  <Avatar v-if="!isLoggedIn">
    <AvatarImage src="https://github.com/shadcn.png" />
    <AvatarFallback>U</AvatarFallback>
  </Avatar>

  <!-- Logged in state -->
  <div v-else class="flex items-center gap-3">
    <Avatar>
        <AvatarImage src="https://github.com/shadcn.png" />
      <!-- Later add AvatarImage when profile photos exist -->
      <AvatarFallback>
        {{ initials(firstName, lastName) }}
      </AvatarFallback>
    </Avatar>

    <div class="flex flex-col leading-tight">
      <span class="text-sm font-medium text-foreground">
        {{ firstName }} {{ lastName }}
      </span>
      <span class="text-xs text-muted-foreground">
        {{ referenceNumber }}
      </span>
    </div>
  </div>
</template>
