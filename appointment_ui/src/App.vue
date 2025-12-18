<script setup lang="ts">
import NavBar from '@/components/layout/NavigationBar.vue'
</script>

<template>
  <div class="min-h-screen bg-background">
    <NavBar />
    <!-- Page content -->
      <router-view />
  </div>
</template>
