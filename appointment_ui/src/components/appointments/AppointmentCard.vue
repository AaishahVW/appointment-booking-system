<script setup lang="ts">
import { ref } from 'vue'
import BranchSelector from './BranchSelector.vue'
import AppointmentDatePicker from './AppointmentDatePicker.vue'
import AppointmentTimePicker from './AppointmentTimePicker.vue'
import AppointmentTable from './AppointmentTable.vue'
import Login from '@/components/auth/Login.vue'

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

const emits = defineEmits<{
  (e: 'branch-selected', branchId: string): void
  (e: 'date-selected', date: Date): void
  (e: 'update:modelValueTime', time: string | null): void
}>()

const showLogin = ref(false)
</script>

<template>
  <div class="max-w-7xl mx-auto px-4 py-6">
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 items-start">
      <Card>
        <CardHeader>
          <CardTitle>Book an Appointment</CardTitle>
          <CardDescription>
            Choose a branch, date, and time to confirm your booking
          </CardDescription>
        </CardHeader>

        <CardContent>
          <BranchSelector @branch-selected="emits('branch-selected', $event)" />

          <Separator class="my-4"/>

          <div class="flex gap-6">
            <AppointmentDatePicker
              @date-selected="emits('date-selected', $event)"
              class="flex-1"
            />
            <AppointmentTimePicker
              :times="['09:00','10:00','11:00','12:00','14:00','15:00','16:00']"
              :model-value="modelValueTime"
              @update:model-value="$emit('update:modelValueTime', $event)"
              class="flex-1"
            />
          </div>

          <Separator class="my-4"/>

          <div class="flex justify-center gap-4">
            <Button @click="showLogin = true">Confirm Booking</Button>
            <Button variant="outline">Reset</Button>
          </div>
        </CardContent>
      </Card>

      <Card>
        <CardHeader>
          <CardTitle>Your Appointments</CardTitle>
          <CardDescription>
            View your existing bookings
          </CardDescription>
        </CardHeader>

        <CardContent>
          <AppointmentTable />
        </CardContent>
      </Card>
    </div>
  </div>

  <Login v-model:open="showLogin" />
</template>
