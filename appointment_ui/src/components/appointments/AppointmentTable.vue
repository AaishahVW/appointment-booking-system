<script setup lang="ts">
import { ref, watch, onMounted, computed } from "vue"
import { appointmentsApi } from "@/api/appointments.api"
import { useAuthStore } from "@/stores/auth.store"
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Separator } from "@/components/ui/separator"
import { Pencil, X } from "lucide-vue-next"

const auth = useAuthStore()
const appointments = ref<any[]>([])

const loadAppointments = async () => {
  try {
    if (!auth.clientId) {
      appointments.value = []
      return
    }

    appointments.value = await appointmentsApi.getMine()
  } catch (err) {
    console.error("Failed to load appointments", err)
  }
}

defineExpose({ reload: loadAppointments })

onMounted(loadAppointments)

watch(() => auth.clientId, loadAppointments)

/** newest first */
const sortedAppointments = computed(() =>
  [...appointments.value].sort(
    (a, b) =>
      new Date(b.createdAt ?? b.appointmentDate).getTime() -
      new Date(a.createdAt ?? a.appointmentDate).getTime()
  )
)

const emit = defineEmits<{
  (e: "edit", appointment: any): void
  (e: "cancel", appointment: any): void
}>()
</script>

<template>
  <Card class="bg-surface/75">
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
            <TableHead class="text-right">Actions</TableHead>
          </TableRow>
        </TableHeader>

        <TableBody>
          <TableRow
            v-for="a in sortedAppointments"
            :key="a.appointmentId"
            class="hover:bg-muted/40 transition"
          >
            <TableCell>{{ a.branch?.branchName ?? "Unknown" }}</TableCell>
            <TableCell>{{ a.appointmentDate }}</TableCell>
            <TableCell>{{ a.startTime }}</TableCell>

            <TableCell>
              <span class="rounded-full px-2 py-1 text-xs border">
                {{ a.status }}
              </span>
            </TableCell>

            <TableCell class="text-right">
              <div class="flex justify-end gap-3">
                <button @click="$emit('edit', a)">
                  <Pencil class="h-4 w-4" />
                </button>
                <button @click="$emit('cancel', a)">
                  <X class="h-4 w-4" />
                </button>
              </div>
            </TableCell>
          </TableRow>
        </TableBody>
      </Table>
    </CardContent>
  </Card>
</template>
