<script setup lang="ts">
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger } from '@/components/ui/dropdown-menu'
import { useAuthStore } from '@/stores/auth.store'

const auth = useAuthStore()

defineEmits<{
  (e: 'login'): void
}>()

// Accept null since auth.firstName/lastName can be null
const initials = (firstName: string | null, lastName: string | null) =>
  firstName && lastName ? `${firstName[0]}${lastName[0]}`.toUpperCase() : 'U'

const handleLogout = () => {
  auth.logout() // clears token and reloads page
}
</script>

<template>
  <div>
    <!-- Not logged in -->
    <button
      v-if="!auth.isLoggedIn"
      @click="$emit('login')"
      class="flex items-center gap-2 rounded-md px-2 py-1 hover:bg-muted transition z-50"
    >
      <Avatar>
        <AvatarImage src="https://github.com/shadcn.png" />
        <AvatarFallback>U</AvatarFallback>
      </Avatar>
      <span class="text-sm text-muted-foreground">Sign in</span>
    </button>

    <!-- Logged in -->
    <DropdownMenu v-else>
      <DropdownMenuTrigger asChild>
        <button class="flex items-center gap-2 rounded-md px-2 py-1 hover:bg-muted transition">
          <Avatar>
            <AvatarFallback>{{ initials(auth.firstName, auth.lastName) }}</AvatarFallback>
          </Avatar>
          <span class="text-sm font-medium">{{ auth.firstName }} {{ auth.lastName }}</span>
        </button>
      </DropdownMenuTrigger>

      <DropdownMenuContent align="end">
        <DropdownMenuItem @click="handleLogout">Logout</DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  </div>
</template>
