<script setup lang="ts">
import CapitecLogo from '@/components/icons/CapitecLogo.vue'
import UserAvatar from '@/components/auth/UserAvatar.vue'
</script>

<template>
  <header
    class="w-full border-b bg-background px-6 py-4"
  >
    <div
      class="mx-auto flex max-w-7xl items-center justify-between"
    >
      <!-- Left: Logo + Title -->
      <div class="flex items-center gap-4">
        <CapitecLogo size="sm" />
        <span class="text-md tracking-tight">
          Branch Appointment System
        </span>
      </div>

      <!-- Right: User Avatar -->
      <UserAvatar />
    </div>
  </header>
</template>
