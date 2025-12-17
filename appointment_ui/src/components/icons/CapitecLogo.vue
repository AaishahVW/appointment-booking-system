<script setup lang="ts">
import capitecLogo from '@/assets/capitec-logo.svg'

defineProps<{
  size?: 'sm' | 'md' | 'lg'
}>()

const sizeClasses = {
  sm: 'h-5',
  md: 'h-10',
  lg: 'h-20',
}
</script>

<template>
  <img
    :src="capitecLogo"
    alt="Capitec Logo"
    :class="['w-auto', sizeClasses[size ?? 'lg']]"
  />
</template>
