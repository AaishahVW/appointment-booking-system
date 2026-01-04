<script setup lang="ts">
import { ref, watch, onMounted } from "vue";
import BranchSelector from "./BranchSelector.vue";
import AppointmentDatePicker from "./AppointmentDatePicker.vue";
import AppointmentTimePicker from "./AppointmentTimePicker.vue";
import { Button } from "@/components/ui/button";
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import { Label } from "@/components/ui/label";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { employeesApi } from "@/api/employees.api";
import { timeSlotsApi, type TimeSlot } from "@/api/timeSlots.api";
import { appointmentsApi } from "@/api/appointments.api";
import { useAuthStore } from "@/stores/auth.store";

type PendingAppointmentPayload = {
  employeeId: string
  branchId: string
  appointmentDate: string
  startTime: string
  endTime: string
  status: "BOOKED"
}

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
const pendingPayload = ref<PendingAppointmentPayload | null>(null);


// Fetch available times & employees when branch/date changes
watch(
  [() => props.selectedBranchId, () => props.selectedDate],
  async ([branchId, date]) => {
    if (!branchId || !date) return;

    selectedEmployee.value = null;

    availableTimes.value = await timeSlotsApi.getByBranchAndDate(
      branchId,
      date.toISOString().slice(0, 10)
    );

    employees.value = await employeesApi.getByBranch(branchId);
  }
);

const confirmBooking = async () => {
  if (
    !props.selectedBranchId ||
    !props.selectedDate ||
    !props.modelValueTime ||
    !selectedEmployee.value
  ) {
    alert("Please select branch, date, time, and employee");
    return;
  }

  const payload: PendingAppointmentPayload = {
    employeeId: selectedEmployee.value,
    branchId: props.selectedBranchId,
    appointmentDate: props.selectedDate.toISOString().slice(0, 10),
    startTime: props.modelValueTime,
    endTime: props.modelValueTime,
    status: "BOOKED",
  };

  // 🔐 Not logged in → pause booking
  if (!auth.isLoggedIn) {
    pendingPayload.value = payload;
    emit("login-required");
    return;
  }

  // ✅ Logged in → submit immediately
  try {
    await appointmentsApi.create({
      ...payload,
      clientId: auth.clientId!, // ✅ safe here
    });

    pendingPayload.value = null;
    alert("Appointment booked successfully!");
  } catch (err) {
    console.error(err);
    alert("Failed to book appointment");
  }
};


onMounted(() => {
  window.addEventListener("auth-success", async () => {
    if (!pendingPayload.value || !auth.clientId) return;

    try {
      await appointmentsApi.create({
        ...pendingPayload.value,
        clientId: auth.clientId, // ✅ now guaranteed
      });

      pendingPayload.value = null;
      alert("Appointment booked successfully!");
    } catch (err) {
      console.error(err);
      alert("Failed to book appointment after login");
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
      <!-- Branch -->
      <BranchSelector @branch-selected="emit('branch-selected', $event)" />

      <Separator />

      <!-- Date -->
      <AppointmentDatePicker @date-selected="emit('date-selected', $event)" />

      <Separator />

      <!-- Time -->
      <AppointmentTimePicker
        :times="availableTimes.map(t => t.startTime)"
        :model-value="props.modelValueTime"
        @update:model-value="emit('update:modelValueTime', $event)"
      />

      <Separator />

      <!-- Employee -->
      <div v-if="employees.length" class="space-y-1 mt-2">
        <Label>Select Employee</Label>
        <Select v-model="selectedEmployee">
          <SelectTrigger class="w-full">
            <SelectValue placeholder="-- select an employee --" />
          </SelectTrigger>
          <SelectContent>
            <SelectItem
              v-for="emp in employees"
              :key="emp.employeeId"
              :value="emp.employeeId"
            >
              {{ emp.workEmail || emp.userId }}
            </SelectItem>
          </SelectContent>
        </Select>
      </div>

      <Separator />

      <!-- Actions -->
      <div class="mt-4 flex items-center justify-between">
        <Button variant="outline" @click="() => { selectedEmployee = null }">Reset</Button>
        <Button @click="confirmBooking">Confirm Booking</Button>
      </div>
    </CardContent>
  </Card>
</template>
