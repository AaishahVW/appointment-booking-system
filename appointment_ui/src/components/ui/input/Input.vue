<script setup lang="ts">
import { cn } from '@/lib/utils'
import { useVModel } from '@vueuse/core'
import type { HTMLAttributes } from 'vue'
import { inputVariants } from '.'

const props = defineProps<{
  defaultValue?: string | number
  modelValue?: string | number
  class?: HTMLAttributes['class']
  ariaInvalid?: HTMLAttributes['aria-invalid']
}>()

const emits = defineEmits<{
  'update:modelValue': [payload: string | number]
}>()

const modelValue = useVModel(props, 'modelValue', emits, {
  passive: true,
  defaultValue: props.defaultValue,
})
</script>

<template>
  <input
    v-model="modelValue"
    data-slot="input"
    :aria-invalid="props.ariaInvalid"
    :class="cn(
      inputVariants(),
      props.class,
    )"
  >
</template>
