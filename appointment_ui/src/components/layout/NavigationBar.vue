<script setup lang="ts">
import CapitecLogo from '@/components/icons/CapitecLogo.vue'
import UserAvatar from '@/components/auth/UserAvatar.vue'
import { useAuthStore } from '@/stores/auth.store'

defineEmits<{ (e: 'login'): void }>()

const auth = useAuthStore()
</script>

<template>
  <header class="fixed top-0 z-50 w-full bg-background/95 backdrop-blur px-6 py-4">
    <div class="mx-auto flex items-center justify-between">
      <div class="flex items-center gap-4">
        <CapitecLogo size="sm" />
        <span class="text-md tracking-tight">
          Branch Appointment System
        </span>
      </div>

      <UserAvatar
        :is-logged-in="auth.isLoggedIn"
        :first-name="auth.firstName ?? undefined"
        :last-name="auth.lastName ?? undefined"
        @login="$emit('login')"
      />
    </div>
  </header>
</template>
