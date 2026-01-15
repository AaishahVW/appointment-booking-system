<script setup lang="ts">
import { ref, watch, onMounted, computed } from "vue"
import { appointmentsApi } from "@/api/appointments.api"
import { timeSlotsApi, type TimeSlot } from "@/api/timeSlots.api"
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
import { Button } from "@/components/ui/button"
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
} from "@/components/ui/dialog"
import {
  AlertDialog,
  AlertDialogContent,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogCancel,
  AlertDialogAction,
} from "@/components/ui/alert-dialog"
import {
  Pagination,
  PaginationContent,
  PaginationItem,
  PaginationPrevious,
  PaginationNext,
} from "@/components/ui/pagination"
import AppointmentTimePicker from "@/components/appointments/AppointmentTimePicker.vue"
import AppointmentDatePicker from "@/components/appointments/AppointmentDatePicker.vue"
import { Pencil, X } from "lucide-vue-next"
import { toLocalDateString } from "@/utils/date"

const auth = useAuthStore()
const appointments = ref<any[]>([])
const isLoading = ref(false)
const availableTimes = ref<TimeSlot[]>([])
const unavailableTimes = ref<string[]>([])
const emit = defineEmits(["appointment-cancelled"])

const props = defineProps<{
  selectedBranchId: string | null
  selectedDate: Date | null
}>()

const loadAppointments = async () => {
  if (!auth.clientId) {
    appointments.value = []
    return
  }
  isLoading.value = true
  appointments.value = await appointmentsApi.getMine()
  isLoading.value = false
}

const loadTimeSlots = async () => {
  try {
    availableTimes.value = await timeSlotsApi.getAll()
  } catch (err) {
    console.error("Failed to load time slots", err)
  }
}

onMounted(() => {
  loadAppointments()
  loadTimeSlots()
})
watch(() => auth.clientId, loadAppointments)
defineExpose({ reload: loadAppointments })

const sortedAppointments = computed(() => {
  return [...appointments.value].sort((a, b) => {
    if (a.status === 'CANCELLED' && b.status !== 'CANCELLED') return 1
    if (b.status === 'CANCELLED' && a.status !== 'CANCELLED') return -1
    const aTime = new Date(a.createdAt ?? a.appointmentDate).getTime()
    const bTime = new Date(b.createdAt ?? b.appointmentDate).getTime()
    return bTime - aTime
  })
})

const page = ref(1)
const pageSize = 5
const totalItems = computed(() => sortedAppointments.value.length)

const paginatedAppointments = computed(() =>
  sortedAppointments.value.slice(
    (page.value - 1) * pageSize,
    page.value * pageSize
  )
)

watch(sortedAppointments, () => {
  if ((page.value - 1) * pageSize >= totalItems.value) page.value = 1
})

const editing = ref<any | null>(null)
const isEditOpen = ref(false)
const editDate = ref<Date | null>(null)
const editTime = ref<string | null>(null)
const savingEdit = ref(false)

const openEdit = (a: any) => {
  editing.value = a
  editDate.value = a.appointmentDate ? new Date(a.appointmentDate) : null
  editTime.value = a.startTime
  isEditOpen.value = true
}

const closeEdit = () => {
  isEditOpen.value = false
  editing.value = null
}

const confirmEdit = async () => {
  if (!editing.value || !editDate.value || !editTime.value) return
  savingEdit.value = true
  await appointmentsApi.update(editing.value.appointmentId, {
    appointmentDate: toLocalDateString(editDate.value),
    startTime: editTime.value,
    endTime: editTime.value,
  })
  await loadAppointments()
  closeEdit()
  savingEdit.value = false
}

const onDateSelected = (date: Date) => {
  editDate.value = date
}

const canceling = ref<any | null>(null)
const isCancelOpen = ref(false)
const cancelingBusy = ref(false)

const openCancel = (a: any) => {
  canceling.value = a
  isCancelOpen.value = true
}

const closeCancel = () => {
  isCancelOpen.value = false
  canceling.value = null
}

const confirmCancel = async () => {
  if (!canceling.value) return
  cancelingBusy.value = true

  await appointmentsApi.update(canceling.value.appointmentId, {
    status: "CANCELLED",
  })

  emit("appointment-cancelled")

  await loadAppointments()
  closeCancel()
  cancelingBusy.value = false
}

watch(editDate, async (date) => {
  if (!date || !editing.value?.branch?.branchId) return

  const availability = await appointmentsApi.getAvailability(
    editing.value.branch.branchId,
    toLocalDateString(date)
  )

  unavailableTimes.value = availability.unavailableTimes
})

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
            <TableHead>Actions</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          <TableRow
            v-for="a in paginatedAppointments"
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
            <TableCell>
              <div class="flex gap-2">
                <Button v-if="a.status === 'BOOKED'" variant="outline" size="xs" @click="openEdit(a)">
                  <Pencil />
                </Button>
                <Button v-if="a.status === 'BOOKED'" variant="outline" size="xs" @click="openCancel(a)">
                  <X />
                </Button>
              </div>
            </TableCell>
          </TableRow>
        </TableBody>
      </Table>
      <Pagination
        class="mt-6"
        v-model:page="page"
        :total="totalItems"
        :items-per-page="pageSize"
      >
        <PaginationContent v-slot="{ items }" class="gap-3">
          <PaginationPrevious />
          <template v-for="(item, index) in items" :key="index">
            <PaginationItem
              v-if="item.type === 'page'"
              :value="item.value"
              :is-active="item.value === page"
            >
              {{ item.value }}
            </PaginationItem>
          </template>
          <PaginationNext />
        </PaginationContent>
      </Pagination>
    </CardContent>
  </Card>

  <Dialog v-model:open="isEditOpen">
    <DialogContent class="max-h-[80vh] bg-dim overflow-y-auto">
      <DialogHeader>
        <DialogTitle>Edit Appointment</DialogTitle>
      </DialogHeader>
      <div class="flex flex-col gap-2">
        <div class="p-2 rounded-md bg-primary-inverse/50">
          <p><strong>Current Date:</strong> {{ editing?.appointmentDate }}</p>
          <p><strong>Current Time:</strong> {{ editing?.startTime }}</p>
        </div>
        <div class="p-2 rounded-md bg-primary-inverse/50">
          <p><strong>New Date:</strong> {{ editDate ? editDate.toLocaleDateString() : '-' }}</p>
          <p><strong>New Time:</strong> {{ editTime ?? '-' }}</p>
        </div>
      <Separator />
        <AppointmentDatePicker
          :selected-date="editDate"
          @date-selected="onDateSelected"
        />
        <Separator />
        <AppointmentTimePicker
  :times="availableTimes.map(t => t.startTime)"
  :unavailable-times="unavailableTimes"
  :disabled="false"
  :model-value="editTime"
  @update:model-value="editTime = $event"
/>
      </div>
      <Separator />
      <DialogFooter class="mt-4 flex justify-end gap-2">
        <Button variant="outline" @click="closeEdit">Cancel</Button>
        <Button :disabled="savingEdit" @click="confirmEdit">Save</Button>
      </DialogFooter>
    </DialogContent>
  </Dialog>

  <AlertDialog v-model:open="isCancelOpen">
    <AlertDialogContent>
      <AlertDialogHeader>
        <AlertDialogTitle>Cancel appointment?</AlertDialogTitle>
        <AlertDialogDescription>
          This appointment will be marked as cancelled.
        </AlertDialogDescription>
      </AlertDialogHeader>
      <AlertDialogFooter>
        <AlertDialogCancel @click="closeCancel">No</AlertDialogCancel>
        <AlertDialogAction :disabled="cancelingBusy" @click="confirmCancel">
          Yes, cancel
        </AlertDialogAction>
      </AlertDialogFooter>
    </AlertDialogContent>
  </AlertDialog>
</template>
