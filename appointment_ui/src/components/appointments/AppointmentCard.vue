<script setup lang="ts">
import { ref, watch } from "vue";
import { onMounted } from "vue";
import BranchSelector from "./BranchSelector.vue";
import AppointmentDatePicker from "./AppointmentDatePicker.vue";
import AppointmentTimePicker from "./AppointmentTimePicker.vue";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardHeader,
  CardTitle,
  CardDescription,
  CardContent,
} from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import { employeesApi } from "@/api/employees.api";
import { timeSlotsApi, type TimeSlot } from "@/api/timeSlots.api";
import { appointmentsApi } from "@/api/appointments.api";
import { useAuthStore } from "@/stores/auth.store";

const props = defineProps<{
  selectedBranchId: string | null;
  selectedDate: Date | null;
  modelValueTime: string | null;
}>();

const emit = defineEmits<{
  (e: "branch-selected", branchId: string): void;
  (e: "date-selected", date: Date): void;
  (e: "update:modelValueTime", time: string | null): void;
  (e: "login-required"): void;
}>();

const auth = useAuthStore();
const employees = ref<any[]>([]);
const availableTimes = ref<TimeSlot[]>([]);
const selectedEmployee = ref<string | null>(null);
const pendingBooking = ref<null | (() => Promise<void>)>(null);

watch(
  [() => props.selectedBranchId, () => props.selectedDate],
  async ([branchId, date]) => {
    if (!branchId || !date) return;

    // fetch available times
    availableTimes.value = await timeSlotsApi.getByBranchAndDate(
      branchId,
      date.toISOString().slice(0, 10)
    );

    // fetch employees for this branch
    employees.value = await employeesApi.getByBranch(branchId);
  }
);

const confirmBooking = async () => {
  if (!auth.clientId?.value) {
    pendingBooking.value = confirmBooking;
    emit("login-required");
    return;
  }

  if (
    !props.selectedBranchId ||
    !props.selectedDate ||
    !props.modelValueTime ||
    !selectedEmployee.value
  ) {
    alert("Please select branch, date, time, and employee");
    return;
  }

  await appointmentsApi.create({
    clientId: auth.clientId.value,
    employeeId: selectedEmployee.value,
    branchId: props.selectedBranchId,
    appointmentDate: props.selectedDate.toISOString().slice(0, 10),
    startTime: props.modelValueTime,
    endTime: props.modelValueTime,
    status: "BOOKED",
  });

  pendingBooking.value = null;
  alert("Appointment booked successfully!");
};

onMounted(() => {
  window.addEventListener("auth-success", async () => {
    if (pendingBooking.value) {
      await pendingBooking.value();
    }
  });
});

</script>

<template>
  <Card class="flex h-full">
    <CardHeader>
      <CardTitle>Book an Appointment</CardTitle>
      <CardDescription>
        Choose a branch, date, time, and employee
      </CardDescription>
    </CardHeader>

    <CardContent>
      <BranchSelector @branch-selected="emit('branch-selected', $event)" />

      <Separator />

      <AppointmentDatePicker
        @date-selected="emit('date-selected', $event)"
      />

      <AppointmentTimePicker
        :times="availableTimes.map((t) => t.startTime)"
        :model-value="props.modelValueTime"
        @update:model-value="emit('update:modelValueTime', $event)"
      />

      <div v-if="employees.length" class="mt-2">
        <label>Select Employee:</label>
        <select v-model="selectedEmployee" class="w-full border rounded px-2 py-1">
          <option disabled value="">-- select an employee --</option>
          <option v-for="emp in employees" :key="emp.employeeId" :value="emp.employeeId">
            {{ emp.workEmail || emp.userId }}
          </option>
        </select>
      </div>

      <Separator />

      <div class="mt-4 flex items-center justify-between">
        <Button variant="outline">Reset</Button>
        <Button @click="confirmBooking">Confirm Booking</Button>
      </div>
    </CardContent>
  </Card>
</template>
