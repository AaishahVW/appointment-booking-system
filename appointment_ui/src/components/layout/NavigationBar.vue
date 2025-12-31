<script setup lang="ts">
import CapitecLogo from '@/components/icons/CapitecLogo.vue'
import UserAvatar from '@/components/auth/UserAvatar.vue'

defineEmits<{ (e: 'login'): void }>()
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

      <!-- 🔥 forward event -->
      <UserAvatar @login="$emit('login')" />
    </div>
  </header>
</template>
