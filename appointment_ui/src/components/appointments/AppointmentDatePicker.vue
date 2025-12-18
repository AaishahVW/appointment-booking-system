<script setup lang="ts">
import type { DateValue } from '@internationalized/date'
import { DateFormatter, getLocalTimeZone, today } from '@internationalized/date'
import { Calendar } from '@/components/ui/calendar'
import { ref, type Ref } from 'vue'

const defaultPlaceholder = today(getLocalTimeZone())
const date = ref() as Ref<DateValue>

const df = new DateFormatter('en-US', { dateStyle: 'long' })

const emit = defineEmits<{
  (e: 'date-selected', date: Date): void
}>()

const onSelectDate = (d: DateValue | undefined) => {
  if (!d) return // ignore undefined
  date.value = d
  emit('date-selected', d.toDate(getLocalTimeZone()))
}
</script>

<template>
  <div class="max-w-fit">
    <h3 class="text-sm font-medium text-foreground mb-2">
      Select Date
    </h3>

    <div class="px-2 py-2 border border-(--color-outline) rounded-md bg-(--color-background) text-sm">
      {{ date ? df.format(date.toDate(getLocalTimeZone())) : 'Pick a date' }}
    </div>
<Calendar
      v-model="date"
      :default-placeholder="defaultPlaceholder"
      layout="month-and-year"
      initial-focus
      @update:model-value="onSelectDate"
      class="
    [&_button]:w-15
    [&_th]:text-center
  "
    />
    
  </div>
</template>

