<script setup lang="ts">
import type { HTMLAttributes } from 'vue'
import { alertDialogHeaderVariants, type AlertDialogHeaderVariants } from '.'
import { cn } from '@/lib/utils'

const props = defineProps<{
  variant?: AlertDialogHeaderVariants['variant']
  class?: HTMLAttributes['class']
}>()
</script>

<template>
  <div
    data-slot="alert-dialog-header"
    :class="cn(alertDialogHeaderVariants({ variant }), props.class)"
  >
    <slot />
  </div>
</template>
