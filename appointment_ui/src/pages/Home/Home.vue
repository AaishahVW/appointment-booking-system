<template>
  <div class="flex flex-col items-center justify-center min-h-screen gap-6">
    <h1 class="text-4xl font-bold">Appointment Booking System</h1>
    
    <div class="flex gap-4">
      <Button @click="$router.push('/signup')" variant="default">Sign Up</Button>
      <Button @click="$router.push('/login')" variant="outline">Log In</Button>
    </div>
  </div>
</template>

<script setup lang="ts">
</script>

<style scoped>
</style>
