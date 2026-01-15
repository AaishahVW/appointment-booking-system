<script setup lang="ts">
import { ref } from "vue"
import { useAuthStore } from "@/stores/auth.store"
import AppointmentCard from "@/components/appointments/AppointmentCard.vue"
import AppointmentTable from "@/components/appointments/AppointmentTable.vue"
import AuthDialog from "@/components/auth/AuthDialog.vue"
import { appointmentsApi } from "@/api/appointments.api"
import { toLocalDateString } from "@/utils/date"

const auth = useAuthStore()

const authDialog = ref<InstanceType<typeof AuthDialog> | null>(null)
const openLogin = () => authDialog.value?.openLogin()

const selectedBranchId = ref<string | null>(null)
const selectedDate = ref<Date | null>(null)
const selectedTime = ref<string | null>(null)
const unavailableTimes = ref<string[]>([])
const isDayDisabled = ref(false)
const tableRef = ref<InstanceType<typeof AppointmentTable> | null>(null)
const availabilityRefreshKey = ref(0)

const refreshAvailability = async () => {
  if (!selectedBranchId.value || !selectedDate.value) return

  const availability = await appointmentsApi.getAvailability(
    selectedBranchId.value,
    toLocalDateString(selectedDate.value)
  )

  unavailableTimes.value = availability.unavailableTimes
  isDayDisabled.value = availability.disabled
}
const onAppointmentChanged = async () => {
  availabilityRefreshKey.value++
  await refreshAvailability()
  tableRef.value?.reload()
}
</script>

<template>
  <section
  class="min-h-screen bg-[url('/src/assets/images/branchthree.jpg')] bg-cover bg-center bg-fixed"
>
    <div class="fixed inset-0 bg-overlay" />

    <div class="relative z-10 mx-auto max-w-8xl px-6 pt-10">
      <div class="flex flex-col gap-8">
        <AppointmentCard
  :selectedBranchId="selectedBranchId"
  :selectedDate="selectedDate"
  :model-value-time="selectedTime"
  :refresh-key="availabilityRefreshKey"
  @branch-selected="selectedBranchId = $event"
  @date-selected="selectedDate = $event"
  @update:modelValueTime="selectedTime = $event"
  @appointment-booked="onAppointmentChanged"
  @login-required="openLogin"
/>


        <AppointmentTable
  v-if="auth.isLoggedIn"
  ref="tableRef"
  :selectedBranchId="selectedBranchId"
  :selectedDate="selectedDate"
  @appointment-cancelled="onAppointmentChanged"
/>

      </div>
    </div>

    <AuthDialog ref="authDialog" />
  </section>
</template>
