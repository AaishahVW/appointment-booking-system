<script setup lang="ts">
import { ref, watch, onMounted } from "vue"
import BranchSelector from "./BranchSelector.vue"
import AppointmentDateTimePicker from "./AppointmentDateTimePicker.vue"
import { Button } from "@/components/ui/button"
import {
  Card,
  CardHeader,
  CardTitle,
  CardDescription,
  CardContent,
} from "@/components/ui/card"
import { Separator } from "@/components/ui/separator"
import { Alert, AlertTitle, AlertDescription } from "@/components/ui/alert"
import { employeesApi } from "@/api/employees.api"
import { timeSlotsApi, type TimeSlot } from "@/api/timeSlots.api"
import { appointmentsApi } from "@/api/appointments.api"
import { useAuthStore } from "@/stores/auth.store"
import { toLocalDateString } from "@/utils/date"

type PendingAppointmentPayload = {
  employeeId: string
  branchId: string
  appointmentDate: string
  startTime: string
  endTime: string
  status: "BOOKED"
}

const props = defineProps<{
  selectedBranchId: string | null
  selectedDate: Date | null
  modelValueTime: string | null
}>()

const emit = defineEmits([
  "branch-selected",
  "date-selected",
  "update:modelValueTime",
  "appointment-booked",
  "login-required",
])

const auth = useAuthStore()
const alertMessage = ref<string | null>(null)

const availableTimes = ref<TimeSlot[]>([])
const employees = ref<any[]>([])
const selectedEmployee = ref<string | null>(null)
const pendingPayload = ref<PendingAppointmentPayload | null>(null)

onMounted(async () => {
  try {
    availableTimes.value = await timeSlotsApi.getAll()
  } catch (err) {
    console.error(err)
    alertMessage.value = "Failed to load available time slots."
  }
})

watch(
  () => props.selectedBranchId,
  async (branchId) => {
    if (!branchId) return

    try {
      employees.value = await employeesApi.getByBranch(branchId)
      selectedEmployee.value = employees.value[0]?.employeeId ?? null
    } catch (err) {
      console.error(err)
      alertMessage.value = "Failed to load employees."
    }
  },
  { immediate: true }
)

const confirmBooking = async () => {
  alertMessage.value = null

  if (!props.selectedBranchId || !props.selectedDate || !props.modelValueTime) {
    alertMessage.value = "Please select a branch, date, and time."
    return
  }

  const payload: PendingAppointmentPayload = {
    employeeId: selectedEmployee.value!,
    branchId: props.selectedBranchId,
    appointmentDate: toLocalDateString(props.selectedDate),
    startTime: props.modelValueTime,
    endTime: props.modelValueTime,
    status: "BOOKED",
  }

  if (!auth.isLoggedIn) {
    pendingPayload.value = payload
    emit("login-required")
    alertMessage.value = "Please log in to confirm your appointment."
    return
  }

  try {
    await appointmentsApi.create({ ...payload, clientId: auth.clientId! })
    emit("appointment-booked")
  } catch (err) {
    console.error(err)
    alertMessage.value = "Failed to book appointment."
  }
}
</script>

<template>
  <Card class="flex h-full bg-surface/75">
    <CardHeader>
      <CardTitle>Book an Appointment</CardTitle>
      <CardDescription>Choose a branch, date, and time</CardDescription>
    </CardHeader>

    <Separator />

    <CardContent>
      <Alert v-if="alertMessage" variant="error" class="mb-4">
        <AlertTitle>Notice</AlertTitle>
        <AlertDescription>{{ alertMessage }}</AlertDescription>
      </Alert>

      <BranchSelector
        :model-value-branch="props.selectedBranchId"
        @branch-selected="$emit('branch-selected', $event)"
      />

      <AppointmentDateTimePicker
        :times="availableTimes.map(t => t.startTime)"
        :selected-time="props.modelValueTime"
        @date-selected="$emit('date-selected', $event)"
        @update:selectedTime="$emit('update:modelValueTime', $event)"
      />

      <Separator />

      <div class="mt-4 flex justify-between">
        <Button variant="outline" @click="selectedEmployee = null">Reset</Button>
        <Button @click="confirmBooking">Confirm Booking</Button>
      </div>
    </CardContent>
  </Card>
</template>
