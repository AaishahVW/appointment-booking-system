<script setup lang="ts">
import { Button } from '@/components/ui/button'

// Import the SVG so Vite resolves it correctly
import CapitecLogo from '@/components/icons/CapitecLogo.vue'
import UserAvatar from '@/components/UserAvatar.vue'
</script>

<template>
  <div class="flex flex-col items-center justify-center min-h-screen gap-6">
    <!-- Logo -->
    <CapitecLogo size="sm" />
<UserAvatar />

 
    <h1 class="text-4xl font-bold text-center">
      Appointment Booking System
    </h1>

    <div class="flex gap-4">
      <Button @click="$router.push('/signup')">
        Sign Up
      </Button>

      <Button variant="outline" @click="$router.push('/login')">
        Log In
      </Button>
    </div>
  </div>
</template>
