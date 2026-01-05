<script setup lang="ts">
import type { DateValue } from '@internationalized/date'
import { DateFormatter, getLocalTimeZone, today } from '@internationalized/date'
import { Calendar } from '@/components/ui/calendar'
import { Label } from '@/components/ui/label'
import { ref, type Ref } from 'vue'

const defaultPlaceholder = today(getLocalTimeZone())

const date = ref(defaultPlaceholder) as Ref<DateValue>

const df = new DateFormatter('en-US', { dateStyle: 'long' })

const emit = defineEmits<{
  (e: 'date-selected', date: Date): void
}>()

const onSelectDate = (d: DateValue | undefined) => {
  if (!d) return
  date.value = d
  emit('date-selected', d.toDate(getLocalTimeZone()))
}
</script>

<template>

    <Label class="py-3">Select Date</Label>

    <Label class="bg-surface/50 rounded-md px-3 py-3">
      {{ df.format(date.toDate(getLocalTimeZone())) }}
    </Label>

    <Calendar
      v-model="date"
      :default-placeholder="defaultPlaceholder"
      layout="month-and-year"
      initial-focus
      @update:model-value="onSelectDate"
    />

</template>
