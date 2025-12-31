<script setup lang="ts">
import { ref } from 'vue'
import AppointmentCard from '@/components/appointments/AppointmentCard.vue'
import AppointmentTable from '@/components/appointments/AppointmentTable.vue'

const selectedBranchId = ref<string | null>(null)
const selectedDate = ref<Date | null>(null)
const selectedTime = ref<string | null>(null)

const isLoggedIn = ref(false)
</script>

<template>
  <section class="fixed inset-0">
    <!-- Background -->
    <div class="absolute inset-0 bg-[url('/src/assets/images/branchthree.jpg')] bg-cover bg-center" />
    <div class="absolute inset-0 bg-black/70" />

    <!-- Content -->
   <div class="relative z-10 flex h-full items-start justify-center px-4 pt-24">
      <div class="flex w-full max-w-4xl flex-col gap-6">
        <!-- Appointment Card -->
        <AppointmentCard
  :selectedBranchId="selectedBranchId"
  :selectedDate="selectedDate"
  :model-value-time="selectedTime"
  @branch-selected="selectedBranchId = $event"
  @date-selected="selectedDate = $event"
  @update:modelValueTime="selectedTime = $event"
  @login-required="$emit('login-required')"
/>


        <!-- Appointment Table (only when logged in) -->
        <AppointmentTable v-if="isLoggedIn" />
      </div>
    </div>
  </section>
</template>
