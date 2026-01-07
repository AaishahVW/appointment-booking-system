<script setup lang="ts">
import { cn } from '@/lib/utils'
import { reactiveOmit } from '@vueuse/core'
import { Primitive, PrimitiveProps, useForwardProps } from 'reka-ui'
import type { HTMLAttributes } from 'vue'
import { buttonVariants } from '../button'

const props = withDefaults(defineProps<PrimitiveProps & {
  class?: HTMLAttributes['class']
}>(), { as: 'button' })

const delegatedProps = reactiveOmit(props, 'class')

const forwardedProps = useForwardProps(delegatedProps)
</script>

<template>
  <Primitive
    data-slot="alert-action"
    :class="cn(
      buttonVariants({ variant: 'text', size: 'sm' }),
      'px-0! hover:bg-transparent cursor-pointer',
      props.class
    )"
    v-bind="forwardedProps"
  >
    <slot />
  </Primitive>
</template>
