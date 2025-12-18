<!-- src/components/appointments/TimePicker.vue -->
<script setup lang="ts">
import { ref} from 'vue'
import { Button } from '@/components/ui/button'
import { Popover, PopoverContent, PopoverTrigger } from '@/components/ui/popover'
import { cn } from '@/lib/utils'

defineProps<{
  times: string[]  // Array of time strings like ["09:00", "10:00", "11:00"]
}>()

const emits = defineEmits<{
  (e: 'update:modelValue', value: string): void
}>()

const selectedTime = ref<string | null>(null)

const selectTime = (time: string) => {
  selectedTime.value = time
  emits('update:modelValue', time)
}
</script>

<template>
  <Popover>
    <PopoverTrigger as-child>
      <Button
        :class="cn(
          !selectedTime && 'text-muted-foreground'
        )"
      >
        {{ selectedTime ?? 'Pick a time' }}
      </Button>
    </PopoverTrigger>

    <PopoverContent class="w-auto p-2">
      <div class="flex flex-col gap-2 max-h-64 overflow-y-auto">
        <button
          v-for="time in times"
          :key="time"
          class="text-left px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-700 rounded"
          @click="selectTime(time)"
        >
          {{ time }}
        </button>
      </div>
    </PopoverContent>
  </Popover>
</template>
