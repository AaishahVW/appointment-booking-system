<script setup lang="ts">
import CapitecLogo from '@/components/icons/CapitecLogo.vue'
import UserAvatar from '@/components/auth/UserAvatar.vue'
</script>

<template>
  <header
    class="sticky top-0 z-50 w-full border-b bg-background/95 backdrop-blur px-6 py-4"
  >
    <div
      class="mx-auto flex max-w-full items-center justify-between"
    >
      <div class="flex items-center gap-4">
        <CapitecLogo size="sm" />
        <span class="text-md tracking-tight">
          Branch Appointment System
        </span>
      </div>
      <UserAvatar />
    </div>
  </header>
</template>
