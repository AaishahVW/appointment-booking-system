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
const onSuccess = () => {
  open.value = false;
  window.dispatchEvent(new Event("auth-success"));
};
</script>

<template>
  <Dialog v-model:open="open">
    <DialogOverlay class="fixed inset-0 bg-black/50 backdrop-blur-sm z-50" />
    <DialogContent class="z-50">
      <Login
  v-if="mode === 'login'"
  @signup="mode = 'signup'"
  @success="onSuccess"
/>

<Signup
  v-else
  @login="mode = 'login'"
  @success="onSuccess"
/>

    </DialogContent>
  </Dialog>
</template>
