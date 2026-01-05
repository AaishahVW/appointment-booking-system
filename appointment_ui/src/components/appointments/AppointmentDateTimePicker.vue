<script setup lang="ts">
import AppointmentDatePicker from "./AppointmentDatePicker.vue"
import AppointmentTimePicker from "./AppointmentTimePicker.vue"

defineProps<{
  times: string[]
  selectedTime: string | null
}>()

const emit = defineEmits<{
  (e: "date-selected", date: Date): void
  (e: "update:selectedTime", time: string): void
}>()
</script>

<template>
  <div class="grid grid-cols-1 md:grid-cols-2 gap-12 items-start">

    <div >
      <AppointmentDatePicker
        @date-selected="emit('date-selected', $event)"
      />
    </div>
    <div>
      <AppointmentTimePicker
        :times="times"
        :model-value="selectedTime"
        @update:model-value="emit('update:selectedTime', $event)"
      />
    </div>
  </div>
</template>
