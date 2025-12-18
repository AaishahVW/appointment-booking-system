<script setup lang="ts">
import NavBar from '@/components/layout/NavigationBar.vue'
</script>

<template>
  <div class="bg-background">
    <NavBar />

    <!-- Push content below fixed navbar -->
    <main class="pt-16">
      <router-view />
    </main>
  </div>
</template>
