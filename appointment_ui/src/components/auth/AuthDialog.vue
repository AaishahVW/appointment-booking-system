<script setup lang="ts">
import { ref } from 'vue'
import Login from '@/components/auth/Login.vue'
import Signup from '@/components/auth/Signup.vue'
import { Dialog, DialogContent, DialogOverlay } from '@/components/ui/dialog'

const open = ref(false)
const mode = ref<'login' | 'signup'>('login')

defineExpose({
  openLogin() {
    mode.value = 'login'
    open.value = true
  },
  openSignup() {
    mode.value = 'signup'
    open.value = true
  },
})
</script>

<template>
  <Dialog v-model:open="open">
    <DialogOverlay class="fixed inset-0 bg-black/50 backdrop-blur-sm z-50" />
    <DialogContent class="sm:max-w-md z-50">
      <Login
        v-if="mode === 'login'"
        @signup="mode = 'signup'"
        @success="open = false"
      />
      <Signup
        v-else
        @login="mode = 'login'"
        @success="open = false"
      />
    </DialogContent>
  </Dialog>
</template>
