<script setup lang="ts">
import { ref } from "vue";
import { useAuthStore } from "@/stores/auth.store";
import AppointmentCard from "@/components/appointments/AppointmentCard.vue";
import AppointmentTable from "@/components/appointments/AppointmentTable.vue";
import AuthDialog from "@/components/auth/AuthDialog.vue";

const auth = useAuthStore();

const authDialog = ref<InstanceType<typeof AuthDialog> | null>(null);
const openLogin = () => authDialog.value?.openLogin();

const selectedBranchId = ref<string | null>(null);
const selectedDate = ref<Date | null>(null);
const selectedTime = ref<string | null>(null);

// ✅ Ref to the table so we can reload it
const tableRef = ref<InstanceType<typeof AppointmentTable> | null>(null);

const reloadAppointments = () => {
  tableRef.value?.reload();
};
</script>

<template>
  <main class="pt-16">
    <AppointmentCard
      :selectedBranchId="selectedBranchId"
      :selectedDate="selectedDate"
      :model-value-time="selectedTime"
      @branch-selected="selectedBranchId = $event"
      @date-selected="selectedDate = $event"
      @update:modelValueTime="selectedTime = $event"
      @appointment-booked="reloadAppointments"
      @login-required="openLogin"
    />

    <!-- Pass ref so we can reload -->
    <AppointmentTable v-if="auth.isLoggedIn" ref="tableRef" />

    <AuthDialog ref="authDialog" />
  </main>
</template>
