<script setup lang="ts">
import BranchSelector from './BranchSelector.vue'
import AppointmentDatePicker from './AppointmentDatePicker.vue'
import AppointmentTimePicker from './AppointmentTimePicker.vue'

import { Button } from '@/components/ui/button'
import {
  Card,
  CardHeader,
  CardTitle,
  CardDescription,
  CardContent,
} from '@/components/ui/card'
import { Separator } from '@/components/ui/separator'

defineProps<{
  selectedBranchId: string | null
  selectedDate: Date | null
  modelValueTime: string | null
}>()

const emit = defineEmits<{
  (e: 'branch-selected', branchId: string): void
  (e: 'date-selected', date: Date): void
  (e: 'update:modelValueTime', time: string | null): void
  (e: 'login-required'): void
}>()
</script>

<template>
  <Card class="flex h-full">
    <CardHeader>
      <CardTitle>Book an Appointment</CardTitle>
      <CardDescription>
        Choose a branch, date, and time to confirm your booking
      </CardDescription>
    </CardHeader>

    <CardContent>
      <BranchSelector @branch-selected="emit('branch-selected', $event)" />

      <Separator />

      <div class="flex gap-10">
        <AppointmentDatePicker
          @date-selected="emit('date-selected', $event)"
        />

        <AppointmentTimePicker
          :times="['09:00','10:00','11:00','12:00','14:00','15:00','16:00']"
          :model-value="modelValueTime"
          @update:model-value="emit('update:modelValueTime', $event)"
        />
      </div>

      <Separator />

      <div class="mt-4 flex items-center justify-between">
  <Button variant="outline">
    Reset
  </Button>

  <Button @click="$emit('login-required')">
  Confirm Booking
</Button>


</div>

    </CardContent>
  </Card>
</template>
