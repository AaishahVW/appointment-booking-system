<script setup lang="ts">
import { cn } from '@/lib/utils'
import { Button } from '@/components/ui/button'
import { Label } from '@/components/ui/label'

defineProps<{
  times: string[]
  unavailableTimes: string[];
  disabled: boolean;
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
  <Label class="py-3">Select Time</Label>

  <div class="grid gap-2">
    <Button
      v-for="time in times"
      :key="time"
      variant="secondary"
      size="md"
      :disabled="disabled || unavailableTimes.includes(time)"
      @click="selectTime(time)"
      :class="cn(
        'rounded-md py-2',
        modelValue === time && 'bg-primary/20 text-primary border-primary',
        unavailableTimes.includes(time) && 'opacity-40 cursor-not-allowed'
      )"
    >
      {{ time }}
    </Button>
  </div>
</template>

