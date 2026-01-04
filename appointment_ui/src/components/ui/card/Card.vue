<script setup lang="ts">
import type { HTMLAttributes } from 'vue'
import { cn } from '@/lib/utils'

const props = defineProps<{
  class?: HTMLAttributes['class']
}>()
</script>

<template>
  <div
    data-slot="card"
    :class="
      cn(
        'bg-surface flex flex-col gap-6 rounded-3xl py-6 px-4',
        props.class,
      )
    "
  >
    <slot />
  </div>
</template>
