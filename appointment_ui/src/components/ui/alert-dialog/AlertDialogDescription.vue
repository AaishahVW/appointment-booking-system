<script setup lang="ts">
import type { HTMLAttributes } from 'vue'
import {
  AlertDialogDescription,
  type AlertDialogDescriptionProps,
} from 'reka-ui'
import { cn } from '@/lib/utils'
import { reactiveOmit } from '@vueuse/core'

const props = defineProps<AlertDialogDescriptionProps & { class?: HTMLAttributes['class'] }>()

const delegatedProps = reactiveOmit(props, 'class')
</script>

<template>
  <AlertDialogDescription
    data-slot="alert-dialog-description"
    v-bind="delegatedProps"
    :class="cn('text-medium-emphasis text-sm', props.class)"
  >
    <slot />
  </AlertDialogDescription>
</template>
