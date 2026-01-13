<script lang="ts" setup>
import type { HTMLAttributes } from 'vue'
import { reactiveOmit } from '@vueuse/core'
import { CalendarCellTrigger, type CalendarCellTriggerProps, useForwardProps } from 'reka-ui'
import { cn } from '@/lib/utils'
import { buttonVariants } from '@/components/ui/button'

const props = withDefaults(
  defineProps<CalendarCellTriggerProps & { class?: HTMLAttributes['class'] }>(),
  {
    as: 'button',
    class: undefined,
  },
)

const delegatedProps = reactiveOmit(props, 'class')

const forwardedProps = useForwardProps(delegatedProps)
</script>

<template>
  <CalendarCellTrigger
    data-slot="calendar-cell-trigger"
    :class="cn(
  buttonVariants({ variant: 'ghost' }),
  'w-5 h-5 sm:w-10 sm:h-10 font-normal aria-selected:opacity-100',
  '[&[data-today]:not([data-selected])]:bg-secondary [&[data-today]:not([data-selected])]:text-on-secondary',
  'data-selected:bg-primary data-selected:text-on-primary',
  'data-disabled:text-low-emphasis data-disabled:opacity-50',
  'data-outside-view:text-low-emphasis',
  props.class,
)"

    v-bind="forwardedProps"
  >
    <slot />
  </CalendarCellTrigger>
</template>
