<script setup lang="ts">
import { ref } from 'vue'
import NavBar from '@/components/layout/NavigationBar.vue'
import AuthDialog from '@/components/auth/AuthDialog.vue'
import { Toaster } from '@/components/ui/sonner'

const authDialog = ref<InstanceType<typeof AuthDialog> | null>(null)

const openLogin = () => authDialog.value?.openLogin()
</script>

<template>
  <NavBar @login="openLogin" />

  <main class="pt-16">
    <router-view @login-required="openLogin" />
    <Toaster />
  </main>

  <AuthDialog ref="authDialog" />
</template>
