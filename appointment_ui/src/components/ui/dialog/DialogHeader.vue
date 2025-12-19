<script setup lang="ts">
import type { HTMLAttributes } from 'vue'
import { cn } from '@/lib/utils'

const props = defineProps<{
  class?: HTMLAttributes['class']
}>()
</script>

<template>
  <div
    data-slot="dialog-header"
    :class="cn('flex gap-4 items-center bg-dim rounded-t-3xl p-6', props.class)"
  >
    <slot />
  </div>
</template>
