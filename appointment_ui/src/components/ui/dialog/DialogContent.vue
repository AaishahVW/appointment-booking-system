<script setup lang="ts">
import { cn } from '@/lib/utils'
import { reactiveOmit } from '@vueuse/core'
import { X } from 'lucide-vue-next'
import {
  DialogClose,
  DialogContent,
  type DialogContentEmits,
  type DialogContentProps,
  useForwardPropsEmits,
} from 'reka-ui'
import { type HTMLAttributes } from 'vue'
import { buttonVariants } from '../button'
import DialogOverlay from './DialogOverlay.vue'

const props = defineProps<
  DialogContentProps & { closable?: boolean, class?: HTMLAttributes['class'] }
>()
const emits = defineEmits<DialogContentEmits>()

const delegatedProps = reactiveOmit(props, 'class', 'closable')
const forwarded = useForwardPropsEmits(delegatedProps, emits)
</script>

<template>
  <DialogOverlay />
  <DialogContent
    data-slot="dialog-content"
    v-bind="forwarded"
    :class="cn(
      'bg-surface fixed top-[50%] left-[50%] z-50 grid w-full max-w-[calc(100%-2rem)] translate-x-[-50%] translate-y-[-50%] rounded-3xl border border-outline/40 shadow-xl duration-200 sm:max-w-lg',
      'data-[state=open]:animate-in data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95',
      'data-[state=closed]:animate-out data-[state=closed]:fade-out-0',
      props.class,
    )"
  >
    <slot />

    <DialogClose
      v-if="props.closable"
      :class="cn(buttonVariants({ variant: 'text', size: 'icon' }), 'absolute top-3 right-6 text-medium-emphasis' )"
    >
      <X />
      <span class="sr-only">Close</span>
    </DialogClose>
  </DialogContent>
</template>
