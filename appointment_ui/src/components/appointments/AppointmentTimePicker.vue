<script setup lang="ts">
import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import { Label } from "@/components/ui/label"

const props = defineProps<{
  times: string[]
  modelValue: string | null
  unavailableTimes?: string[]
  disabled?: boolean
}>()

const emit = defineEmits<{
  (e: "update:modelValue", value: string): void
}>()

const selectTime = (time: string) => {
  if (props.disabled) return
  if (props.unavailableTimes?.includes(time)) return
  emit("update:modelValue", time)
}
</script>

<template>
      <Label class="py-3">Available Times</Label>
  <div class="grid gap-2 pb-3">
      <Button
        v-for="time in times"
        :key="time"
        variant="secondary"
        size="md"
        :disabled="disabled || unavailableTimes?.includes(time)"
        @click="selectTime(time)"
        :class="cn(
          'rounded-md py-2',
          modelValue === time && 'bg-primary/20 text-primary border-primary',
          unavailableTimes?.includes(time) && 'opacity-40 cursor-not-allowed'
        )"
      >
        {{ time }}
      </Button>
    </div>
</template>
