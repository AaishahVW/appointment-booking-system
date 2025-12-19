<script setup lang="ts">
import { ref } from 'vue'
import AppointmentCard from '@/components/appointments/AppointmentCard.vue'

const selectedBranchId = ref<string | null>(null)
const selectedDate = ref<Date | null>(null)
const selectedTime = ref<string | null>(null)
</script>

<template>
  <section class="relative w-full min-h-screen overflow-auto">
    <!-- Fixed Background Image -->
    <div
      class="fixed inset-0 bg-cover bg-center z-0"
      style="background-image: url('/src/assets/images/branchone.jpg');"
    ></div>

    <!-- Fixed Overlay -->
    <div class="fixed inset-0 bg-black/70 z-10"></div>

    <!-- Scrollable Content -->
    <div class="relative z-20 flex flex-col items-center pt-20 px-4">
      <!-- Title -->
      <div class="text-center mb-8">
        <h1 class="text-4xl md:text-5xl font-bold text-white">
          Book an Appointment
        </h1>
      </div>

      <!-- Appointment Card -->
      <div class="w-full">
        <AppointmentCard
          :selectedBranchId="selectedBranchId"
          :selectedDate="selectedDate"
          :model-value-time="selectedTime"
          @branch-selected="selectedBranchId = $event"
          @date-selected="selectedDate = $event"
          @update:modelValueTime="selectedTime = $event"
        />
      </div>
    </div>
  </section>
</template>
