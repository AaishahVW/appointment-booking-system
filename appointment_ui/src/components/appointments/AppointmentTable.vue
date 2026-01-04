<script setup lang="ts">
import { ref, watch, onMounted } from "vue";
import { appointmentsApi } from "@/api/appointments.api";
import { useAuthStore } from "@/stores/auth.store";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";

const auth = useAuthStore();
const appointments = ref<any[]>([]);

const loadAppointments = async () => {
  if (!auth.clientId) return;

  try {
    appointments.value = await appointmentsApi.getByClient(auth.clientId);
  } catch (err) {
    console.error("Failed to load appointments", err);
  }
};

// ✅ Expose the method so parent can trigger reload
defineExpose({
  reload: loadAppointments,
});

onMounted(loadAppointments);

watch(
  () => auth.clientId,
  () => loadAppointments()
);
</script>

<template>
  <Card class="h-[25vh] flex flex-col">
    <CardHeader class="shrink-0">
      <CardTitle>Your Appointments</CardTitle>
    </CardHeader>

    <CardContent class="flex-1 overflow-y-auto">
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead>Branch</TableHead>
            <TableHead>Date</TableHead>
            <TableHead>Time</TableHead>
            <TableHead>Status</TableHead>
          </TableRow>
        </TableHeader>

        <TableBody>
          <TableRow v-for="a in appointments" :key="a.id">
            <TableCell>{{ a.branchName }}</TableCell>
            <TableCell>{{ a.appointmentDate }}</TableCell>
            <TableCell>{{ a.startTime }}</TableCell>
            <TableCell>{{ a.status }}</TableCell>
          </TableRow>
        </TableBody>
      </Table>
    </CardContent>
  </Card>
</template>
