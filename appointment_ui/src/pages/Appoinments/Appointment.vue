<script setup lang="ts">
import { ref } from 'vue'

import BranchSelector from '@/components/appointments/BranchSelector.vue'
import AppointmentDatePicker from '@/components/appointments/AppointmentDatePicker.vue'
import AppointmentTable from '@/components/appointments/AppointmentTable.vue'
import AppointmentTimePicker from '@/components/appointments/AppointmentTimePicker.vue'

const selectedBranchId = ref<string | null>(null)
const selectedDate = ref<Date | null>(null)
const selectedTime = ref<string | null>(null)
</script>

<template>
  <div>
    <h1 class="text-3xl font-semibold">
      Book an Appointment
    </h1>

    <!-- Branch selection -->
    <BranchSelector
      @branch-selected="selectedBranchId = $event"
    />

    <!-- Date + time -->
    <AppointmentDatePicker
      v-if="selectedBranchId"
      :branchId="selectedBranchId"
      @date-selected="selectedDate = $event"
      @time-selected="selectedTime = $event"
    />

<AppointmentTimePicker
  :times="['09:00', '10:00', '11:00', '14:00', '15:00']"
  v-model="selectedTime"
/>

    <!-- User appointments -->
    <AppointmentTable />
  </div>
</template>
