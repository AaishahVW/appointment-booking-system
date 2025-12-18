<script setup lang="ts">
import { cn } from '@/lib/utils'

defineProps<{
  times: string[]
  modelValue: string | null
}>()

const emits = defineEmits<{
  (e: 'update:modelValue', value: string): void
}>()

const selectTime = (time: string) => {
  emits('update:modelValue', time)
}
</script>

<template>
  <div class="flex flex-col w-full">
    <h3 class="text-sm font-medium text-foreground mb-2">
      Select Time
    </h3>

    <div class="grid gap-2">
      <button
        v-for="time in times"
        :key="time"
        @click="selectTime(time)"
        :class="cn(
          'px-4 py-2 border rounded-md text-sm transition-all',
          modelValue === time
            ? 'bg-(--color-selected) text-(--color-on-selected) border-(--color-selected)'
            : 'bg-(--color-background) border-(--color-outline) text-foreground hover:bg-gray-100 dark:hover:bg-gray-700'
        )"
      >
        {{ time }}
      </button>
    </div>
  </div>
</template>

