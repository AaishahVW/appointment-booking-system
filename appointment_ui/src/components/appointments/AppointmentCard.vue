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
import { AlertCircle, CheckCircle2 } from "lucide-vue-next"
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
const successMessage = ref<string | null>(null)

const availableTimes = ref<TimeSlot[]>([])
const employees = ref<any[]>([])
const selectedEmployee = ref<string | null>(null)

const pendingPayload = ref<PendingAppointmentPayload | null>(null)
const isBooking = ref(false)

onMounted(async () => {
  try {
    availableTimes.value = await timeSlotsApi.getAll()
  } catch (err) {
    console.error(err)
    alertMessage.value = "Failed to load available time slots."
    clearAlertAfter()
  }
})

const clearAlertAfter = (ms = 3000) => {
  setTimeout(() => {
    alertMessage.value = null
    successMessage.value = null
  }, ms)
}

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
      clearAlertAfter()
    }
  },
  { immediate: true }
)

const confirmBooking = async () => {
  if (isBooking.value) return
  isBooking.value = true
  alertMessage.value = null

  if (!props.selectedBranchId || !props.selectedDate || !props.modelValueTime) {
    alertMessage.value = "Please select a branch, date, and time."
    clearAlertAfter()
    isBooking.value = false
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
    clearAlertAfter()
    isBooking.value = false
    return
  }

  try {
    await appointmentsApi.create({
      ...payload,
      clientId: auth.clientId!,
    })

    successMessage.value = "Appointment booked successfully 🎉"
    pendingPayload.value = null
    emit("appointment-booked")
    clearAlertAfter()
  } catch (err) {
    console.error(err)
    alertMessage.value = "Failed to book appointment after login."
    clearAlertAfter()
  } finally {
    isBooking.value = false
  }
}

watch(
  () => auth.isLoggedIn,
  async (loggedIn) => {
    if (!loggedIn) return
    if (!pendingPayload.value) return
    if (!auth.clientId) return
    if (isBooking.value) return

    isBooking.value = true

    try {
      await appointmentsApi.create({
        ...pendingPayload.value,
        clientId: auth.clientId,
      })

      pendingPayload.value = null
      successMessage.value = "Appointment booked successfully 🎉"
      emit("appointment-booked")
      clearAlertAfter()
    } catch (err) {
      console.error(err)
      alertMessage.value = "Failed to book appointment."
      clearAlertAfter()
    } finally {
      isBooking.value = false
    }
  }
)
</script>

<template>
  <Card class="flex h-full bg-surface/75">
    <CardHeader>
      <CardTitle>Book an Appointment</CardTitle>
      <CardDescription>Choose a branch, date, and time</CardDescription>
    </CardHeader>

    <Separator />

    <CardContent>
      <Alert v-if="alertMessage" variant="error" class="mb-4 flex gap-2">
        <AlertCircle class="h-4 w-4 mt-1" />
        <div>
          <AlertTitle>Notice</AlertTitle>
          <AlertDescription>{{ alertMessage }}</AlertDescription>
        </div>
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

      <Alert v-if="successMessage" class="mb-4 flex gap-2">
        <CheckCircle2 class="h-4 w-4 mt-1" />
        <div>
          <AlertTitle>Success</AlertTitle>
          <AlertDescription>{{ successMessage }}</AlertDescription>
        </div>
      </Alert>

      <Separator />

      <div class="mt-4 flex justify-between">
        <Button variant="outline" @click="selectedEmployee = null">
          Reset
        </Button>
        <Button @click="confirmBooking">
          Confirm Booking
        </Button>
      </div>
    </CardContent>
  </Card>
</template>
