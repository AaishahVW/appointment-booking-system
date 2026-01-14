<script setup lang="ts">
import { ref } from "vue"
import { useAuthStore } from "@/stores/auth.store"
import AppointmentCard from "@/components/appointments/AppointmentCard.vue"
import AppointmentTable from "@/components/appointments/AppointmentTable.vue"
import AuthDialog from "@/components/auth/AuthDialog.vue"

const auth = useAuthStore()

const authDialog = ref<InstanceType<typeof AuthDialog> | null>(null)
const openLogin = () => authDialog.value?.openLogin()

const selectedBranchId = ref<string | null>(null)
const selectedDate = ref<Date | null>(null)
const selectedTime = ref<string | null>(null)

const tableRef = ref<InstanceType<typeof AppointmentTable> | null>(null)
const reloadAppointments = () => tableRef.value?.reload()
</script>

<template>
  <section
  class="min-h-screen bg-[url('/src/assets/images/branchthree.jpg')] bg-cover bg-center bg-fixed"
>
    <div class="fixed inset-0 bg-overlay" />

    <div class="relative z-10 mx-auto max-w-8xl px-6 pt-10">
      <div class="flex flex-col gap-8">
        <AppointmentCard
          :selectedBranchId="selectedBranchId!"
          :selectedDate="selectedDate"
          :model-value-time="selectedTime"
          @branch-selected="selectedBranchId = $event"
          @date-selected="selectedDate = $event"
          @update:modelValueTime="selectedTime = $event"
          @appointment-booked="reloadAppointments"
          @login-required="openLogin"
        />

        <AppointmentTable
  v-if="auth.isLoggedIn"
  ref="tableRef"
  :selectedBranchId="selectedBranchId"
  :selectedDate="selectedDate"
/>

      </div>
    </div>

    <AuthDialog ref="authDialog" />
  </section>
</template>
