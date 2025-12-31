<script setup lang="ts">
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'

defineEmits<{
  (e: 'login'): void
}>()

const props = defineProps<{
  isLoggedIn?: boolean
  firstName?: string
  lastName?: string
  referenceNumber?: string
}>()

const initials = (firstName?: string, lastName?: string) =>
  firstName && lastName ? `${firstName[0]}${lastName[0]}`.toUpperCase() : 'U'
</script>

<template>
  <button
    v-if="!props.isLoggedIn"
    @click="$emit('login')"
    class="flex items-center gap-2 rounded-md px-2 py-1 hover:bg-muted transition z-50"
  >
    <Avatar>
      <AvatarImage src="https://github.com/shadcn.png" />
      <AvatarFallback>U</AvatarFallback>
    </Avatar>

    <span class="text-sm text-muted-foreground">Sign in</span>
  </button>

  <div v-else class="flex items-center gap-3">
    <Avatar>
      <AvatarFallback>{{ initials(props.firstName, props.lastName) }}</AvatarFallback>
    </Avatar>
    <div class="flex flex-col leading-tight">
      <span class="text-sm font-medium">{{ props.firstName }} {{ props.lastName }}</span>
      <span class="text-xs text-muted-foreground">{{ props.referenceNumber }}</span>
    </div>
  </div>
</template>
