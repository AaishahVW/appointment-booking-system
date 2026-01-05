<script setup lang="ts">
import { ref, watch, onMounted } from "vue";
import { appointmentsApi } from "@/api/appointments.api";
import { branchesApi, type Branch } from "@/api/branch.api";
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
import { Separator } from "@/components/ui/separator";

const auth = useAuthStore();
const appointments = ref<any[]>([]);
const branches = ref<Branch[]>([]);

onMounted(async () => {
  branches.value = await branchesApi.getAll();
});

const loadAppointments = async () => {
  try {
    if (!auth.clientId) return;
    appointments.value = await appointmentsApi.getByClient(auth.clientId);
    console.log("First appointment:", appointments.value[1]);
  } catch (err) {
    console.error("Failed to load appointments", err);
  }
};


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
  <Card class="flex h-full bg-surface/75">
    <CardHeader>
      <CardTitle>Your Appointments</CardTitle>
    </CardHeader>
<Separator />
    <CardContent>
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
  <TableRow v-for="a in appointments" :key="a.appointmentId">
    <TableCell>{{ a.branch?.branchName ?? "Unknown" }}</TableCell>
    <TableCell>{{ a.appointmentDate }}</TableCell>
    <TableCell>{{ a.startTime }}</TableCell>
    <TableCell>{{ a.status }}</TableCell>
  </TableRow>
</TableBody>
      </Table>
    </CardContent>
  </Card>
</template>
