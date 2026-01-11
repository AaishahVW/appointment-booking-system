<script setup lang="ts">
import type { HTMLAttributes } from 'vue'
import { AlertDialogCancel, type AlertDialogCancelProps } from 'reka-ui'
import { buttonVariants } from '../button'
import { cn } from '@/lib/utils'
import { reactiveOmit } from '@vueuse/core'

const props = defineProps<AlertDialogCancelProps & { class?: HTMLAttributes['class'] }>()

const delegatedProps = reactiveOmit(props, 'class')
</script>

<template>
  <AlertDialogCancel
    v-bind="delegatedProps"
    :class="cn(
      buttonVariants({ variant: 'outline' }),
      props.class,
    )"
  >
    <slot />
  </AlertDialogCancel>
</template>
