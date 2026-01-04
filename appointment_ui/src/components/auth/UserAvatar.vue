<script setup lang="ts">
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger } from '@/components/ui/dropdown-menu'
import { useAuthStore } from '@/stores/auth.store'

const auth = useAuthStore()

defineEmits<{
  (e: 'login'): void
}>()

const initials = (firstName: string | null, lastName: string | null) =>
  firstName && lastName ? `${firstName[0]}${lastName[0]}`.toUpperCase() : 'U'

const handleLogout = () => {
  auth.logout()
}
</script>

<template>
  <div>
    <Button
      v-if="!auth.isLoggedIn"
      @click="$emit('login')"
      class="flex items-center gap-2 rounded-md px-2 py-1 hover:bg-muted transition z-50 bg-background"
    >
      <Avatar>
        <AvatarImage src="https://github.com/shadcn.png" />
        <AvatarFallback>U</AvatarFallback>
      </Avatar>
      <span class="text-sm text-foreground">Sign in</span>
    </Button>

    <!-- Logged in -->
    <DropdownMenu v-else>
      <DropdownMenuTrigger asChild>
        <Button class="flex items-center gap-2 rounded-md px-2 py-1 hover:bg-muted transition z-50 bg-background">
          <Avatar>
            <AvatarFallback>{{ initials(auth.firstName, auth.lastName) }}</AvatarFallback>
          </Avatar>
          <span class="text-sm text-foreground">{{ auth.firstName }} {{ auth.lastName }}</span>
        </Button>
      </DropdownMenuTrigger>

      <DropdownMenuContent align="end" class="bg-surface">
        <DropdownMenuItem @click="handleLogout">Logout</DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  </div>
</template>
