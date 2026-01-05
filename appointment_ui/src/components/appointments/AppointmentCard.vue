<script setup lang="ts">
import { ref, watch, onMounted } from "vue";
import BranchSelector from "./BranchSelector.vue";
import AppointmentDateTimePicker from "./AppointmentDateTimePicker.vue";
import { Button } from "@/components/ui/button";
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import { employeesApi } from "@/api/employees.api";
import { timeSlotsApi, type TimeSlot } from "@/api/timeSlots.api";
import { appointmentsApi } from "@/api/appointments.api";
import { useAuthStore } from "@/stores/auth.store";
import { toLocalDateString } from "@/utils/date";
import { toast } from "vue-sonner";

type PendingAppointmentPayload = {
  employeeId: string;
  branchId: string;
  appointmentDate: string;
  startTime: string;
  endTime: string;
  status: "BOOKED";
};

const props = defineProps<{
  selectedBranchId: string | null;
  selectedDate: Date | null;
  modelValueTime: string | null;
}>();

const emit = defineEmits<{
  (e: "branch-selected", branchId: string): void;
  (e: "date-selected", date: Date): void;
  (e: "update:modelValueTime", time: string | null): void;
  (e: "appointment-booked"): void;
  (e: "login-required"): void;
}>();

const auth = useAuthStore();

const availableTimes = ref<TimeSlot[]>([]);
const employees = ref<any[]>([]);
const selectedEmployee = ref<string | null>(null);
const pendingPayload = ref<PendingAppointmentPayload | null>(null);

onMounted(async () => {
  try {
    availableTimes.value = await timeSlotsApi.getAll();
  } catch (err) {
    console.error(err);
    toast.error("Failed to load time slots");
  }
});

watch(
  () => props.selectedBranchId,
  async (branchId) => {
    if (!branchId) {
      employees.value = [];
      selectedEmployee.value = null;
      return;
    }

    try {
      employees.value = await employeesApi.getByBranch(branchId);
      selectedEmployee.value = employees.value.length ? employees.value[0].employeeId : null;
    } catch (err) {
      console.error(err);
      toast.error("Failed to load employees");
    }
  },
  { immediate: true }
);

const confirmBooking = async () => {
  if (!props.selectedBranchId || !props.selectedDate || !props.modelValueTime || !selectedEmployee.value) {
    toast.warning("Please select branch, date, and time");
    return;
  }

  const payload: PendingAppointmentPayload = {
    employeeId: selectedEmployee.value,
    branchId: props.selectedBranchId,
    appointmentDate: toLocalDateString(props.selectedDate),
    startTime: props.modelValueTime,
    endTime: props.modelValueTime,
    status: "BOOKED",
  };

  if (!auth.isLoggedIn) {
    pendingPayload.value = payload;
    emit("login-required");
    toast.info("Please log in to confirm your appointment");
    return;
  }

  try {
    await appointmentsApi.create({
      ...payload,
      clientId: auth.clientId!,
    });
    pendingPayload.value = null;
    emit("appointment-booked");
    toast.success("Appointment booked successfully!");
  } catch (err) {
    console.error(err);
    toast.error("Failed to book appointment");
  }
};

watch(
  () => auth.isLoggedIn,
  async (loggedIn) => {
    if (!loggedIn || !pendingPayload.value || !auth.clientId) return;

    try {
      await appointmentsApi.create({
        ...pendingPayload.value,
        clientId: auth.clientId,
      });
      pendingPayload.value = null;
      emit("appointment-booked");
      toast.success("Appointment booked successfully after login!");
    } catch (err) {
      console.error(err);
      toast.error("Failed to book appointment after login");
    }
  }
);
</script>

<template>
  <Card class="flex h-full bg-surface/75">
    <CardHeader>
      <CardTitle>Book an Appointment</CardTitle>
      <CardDescription>
        Choose a branch, date, and time
      </CardDescription>
    </CardHeader>
    <Separator />
    <CardContent>
      <BranchSelector
        :model-value-branch="props.selectedBranchId"
        @update:modelValueBranch="$emit('branch-selected', $event)"
        @branch-selected="$emit('branch-selected', $event)"
      />

      <AppointmentDateTimePicker
        :times="availableTimes.map(t => t.startTime)"
        :selected-time="props.modelValueTime"
        @date-selected="$emit('date-selected', $event)"
        @update:selectedTime="$emit('update:modelValueTime', $event)"
      />

      <Separator />

      <div class="mt-4 flex items-center justify-between">
        <Button variant="outline" @click="selectedEmployee = null">Reset</Button>
        <Button @click="confirmBooking">Confirm Booking</Button>
      </div>
    </CardContent>
  </Card>
</template>
