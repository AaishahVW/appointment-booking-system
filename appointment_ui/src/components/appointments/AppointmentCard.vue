<script setup lang="ts">
import { ref, watch, onMounted, computed } from "vue"
import BranchSelector from "./BranchSelector.vue"
import AppointmentDateTimePicker from "./AppointmentDateTimePicker.vue"
import { Button } from "@/components/ui/button"
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from "@/components/ui/card"
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

// Props
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

// State
const alertMessage = ref<string | null>(null)
const successMessage = ref<string | null>(null)
const allTimeSlots = ref<TimeSlot[]>([])
const employees = ref<any[]>([])
const selectedEmployee = ref<string | null>(null)
const unavailableTimes = ref<string[]>([])
const isDayDisabled = ref(false)
const pendingPayload = ref<PendingAppointmentPayload | null>(null)
const isBooking = ref(false)

// Helpers
const clearAlertAfter = (ms = 3000) => {
  setTimeout(() => {
    alertMessage.value = null
    successMessage.value = null
  }, ms)
}

const ensureDate = (d: string | Date): Date => (d instanceof Date ? d : new Date(d))

// Load time slots on mount
onMounted(async () => {
  try {
    allTimeSlots.value = await timeSlotsApi.getAll()
  } catch {
    alertMessage.value = "Failed to load time slots."
    clearAlertAfter()
  }
})
const branchEmployeeIndex = ref<Record<string, number>>({})

watch(
  () => props.selectedBranchId,
  async (branchId) => {
    if (!branchId) return
    try {
      employees.value = await employeesApi.getByBranch(branchId)

      // Initialize rotation index if not present
      if (!(branchId in branchEmployeeIndex.value)) {
        branchEmployeeIndex.value[branchId] = 0
      }

      const idx = branchEmployeeIndex.value[branchId] ?? 0
      selectedEmployee.value = employees.value[idx]?.employeeId ?? null
    } catch {
      alertMessage.value = "Failed to load employees."
      clearAlertAfter()
    }
  },
  { immediate: true }
)


// Watch selected branch/date and load availability
watch(
  () => [props.selectedBranchId, props.selectedDate],
  async ([branchId, date]) => {
    if (!branchId || !date) return
const branchIdStr = branchId as string
const localDate = toLocalDateString(ensureDate(date))
const availability = await appointmentsApi.getAvailability(branchIdStr, localDate)


    unavailableTimes.value = []
    isDayDisabled.value = false

  

    isDayDisabled.value = availability.disabled
    unavailableTimes.value = availability.unavailableTimes
  },
  { immediate: true }
)

// Computed: available times
const availableTimes = computed(() => {
  if (!props.selectedDate) return []

  const now = new Date()
  const isToday = toLocalDateString(ensureDate(props.selectedDate)) === toLocalDateString(now)

  return allTimeSlots.value
    .map(t => t.startTime)
    .filter(time => {
      if (unavailableTimes.value.includes(time)) return false
      if (!isToday) return true

      const [hStr, mStr] = time.split(":")
      if (!hStr || !mStr) return false

      const slot = new Date()
      slot.setHours(Number(hStr), Number(mStr), 0, 0)
      return slot > now
    })
})

// Booking
const confirmBooking = async () => {
  if (isBooking.value) return

  if (
    !props.selectedBranchId ||
    !props.selectedDate ||
    !props.modelValueTime
  ) {
    alertMessage.value = "Please select a branch, date, and time."
    clearAlertAfter()
    return
  }

  if (employees.value.length === 0) {
    alertMessage.value = "No employees available for this branch."
    clearAlertAfter()
    return
  }

  isBooking.value = true

const branchId = props.selectedBranchId!
let idx = branchEmployeeIndex.value[branchId] ?? 0
const employee = employees.value[idx]

if (!employee) {
  alertMessage.value = "No valid employee found for this branch."
  clearAlertAfter()
  isBooking.value = false
  return
}

selectedEmployee.value = employee.employeeId

  const payload: PendingAppointmentPayload = {
    employeeId: selectedEmployee.value!,
    branchId,
    appointmentDate: toLocalDateString(ensureDate(props.selectedDate)),
    startTime: props.modelValueTime,
    endTime: props.modelValueTime,
    status: "BOOKED",
  }

  if (!auth.isLoggedIn) {
    pendingPayload.value = payload
    emit("login-required")
    isBooking.value = false
    return
  }

  try {
    await appointmentsApi.create({ ...payload, clientId: auth.clientId! })
    successMessage.value = "Appointment booked successfully 🎉"
    pendingPayload.value = null
    emit("appointment-booked")
    clearAlertAfter()

    // ✅ Advance the index for **next round-robin booking** for this branch
    branchEmployeeIndex.value[branchId] = (idx + 1) % employees.value.length
  } catch (err: any) {
    if (err?.response?.status === 409) {
      alertMessage.value =
        "This time slot was already booked. Please choose another time."
    } else {
      alertMessage.value = "Failed to book appointment."
    }
    clearAlertAfter()
  } finally {
    isBooking.value = false
  }
}


// Auto-book pending after login
watch(
  () => auth.isLoggedIn,
  async (loggedIn) => {
    if (!loggedIn || !pendingPayload.value || !auth.clientId) return
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
    } catch {
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
      <BranchSelector
        :model-value-branch="props.selectedBranchId"
        @branch-selected="$emit('branch-selected', $event)"
      />

      <AppointmentDateTimePicker
        :times="availableTimes"
        :unavailable-times="unavailableTimes"
        :disabled="isDayDisabled"
        :selected-time="props.modelValueTime"
        @date-selected="$emit('date-selected', $event)"
        @update:selectedTime="$emit('update:modelValueTime', $event)"
      />

      <Alert v-if="alertMessage" variant="error" class="mb-4 flex gap-2">
        <AlertCircle class="h-4 w-4 mt-1" />
        <div>
          <AlertTitle>Notice</AlertTitle>
          <AlertDescription>{{ alertMessage }}</AlertDescription>
        </div>
      </Alert>

      <Alert v-if="successMessage" class="mb-4 flex gap-2">
        <CheckCircle2 class="h-4 w-4 mt-1" />
        <div>
          <AlertTitle>Success</AlertTitle>
          <AlertDescription>{{ successMessage }}</AlertDescription>
        </div>
      </Alert>

      <Separator />

      <div class="mt-4 flex justify-between">
        <Button variant="outline" @click="selectedEmployee = null">Reset</Button>
        <Button @click="confirmBooking">Confirm Booking</Button>
      </div>
    </CardContent>
  </Card>
</template>
