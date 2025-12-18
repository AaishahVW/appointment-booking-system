<script setup lang="ts">
import { Button } from '@/components/ui/button'
</script>

<template>
  <div class="flex flex-col items-center justify-center min-h-screen gap-6">
 
    

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
