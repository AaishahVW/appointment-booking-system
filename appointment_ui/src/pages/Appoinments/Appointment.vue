<!-- src/pages/Appointments.vue -->
<script setup lang="ts">
import { ref } from 'vue'

import AppointmentCard from '@/components/appointments/AppointmentCard.vue'
import AppointmentTable from '@/components/appointments/AppointmentTable.vue'

const selectedBranchId = ref<string | null>(null)
const selectedDate = ref<Date | null>(null)
const selectedTime = ref<string | null>(null)
</script>

<template>
  <div class="min-h-screen bg-background pt-6 pb-12 space-y-10">
    <h1 class="text-3xl font-semibold text-center">
      Book an Appointment
    </h1>

    <!-- Card Layout -->
    <AppointmentCard
  :selectedBranchId="selectedBranchId"
  :selectedDate="selectedDate"
  :model-value-time="selectedTime"
  @branch-selected="selectedBranchId = $event"
  @date-selected="selectedDate = $event"
  @update:modelValueTime="selectedTime = $event"
/>
  </div>
</template>
