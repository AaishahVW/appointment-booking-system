<script setup lang="ts">
import { cn } from '@/lib/utils'
import { reactiveOmit } from '@vueuse/core'
import type { PrimitiveProps } from 'reka-ui'
import { Primitive } from 'reka-ui'
import type { HTMLAttributes } from 'vue'
import type { ButtonVariants } from '.'
import { buttonVariants } from '.'

type Props = PrimitiveProps & {
  variant?: ButtonVariants['variant']
  size?: ButtonVariants['size']
  class?: HTMLAttributes['class']
  disabled?: boolean
}

const props = withDefaults(defineProps<Props>(), {
  as: 'button',
})

const delegatedProps = reactiveOmit(props, 'class')
</script>

<template>
  <Primitive
    data-slot="button"
    v-bind="delegatedProps"
    :class="cn(buttonVariants({ variant, size }), props.class, 'cursor-pointer')"
  >
    <slot />
  </Primitive>
</template>
