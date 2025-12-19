<script setup lang="ts">
import BranchSelector from './BranchSelector.vue'
import AppointmentDatePicker from './AppointmentDatePicker.vue'
import AppointmentTimePicker from './AppointmentTimePicker.vue'
import AppointmentTable from './AppointmentTable.vue'
import Button from '@/components/ui/button/Button.vue'
import Login from '@/components/auth/Login.vue'
import { ref } from 'vue'

defineProps<{
  selectedBranchId: string | null
  selectedDate: Date | null
  modelValueTime: string | null
}>()

const emits = defineEmits<{
  (e: 'branch-selected', branchId: string): void
  (e: 'date-selected', date: Date): void
  (e: 'update:modelValueTime', time: string | null): void
}>()

const showLogin = ref(false)
</script>

<template>
  <div class="max-w-7xl mx-auto px-4 py-6">
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 items-start">

      <!-- LEFT CARD -->
      <div class="bg-white dark:bg-gray-800 rounded-xl shadow-md p-6 flex flex-col gap-6">
        <div class="max-h-96 overflow-y-auto">
          <BranchSelector @branch-selected="emits('branch-selected', $event)" />
        </div>

        <div class="flex gap-6">
          <AppointmentDatePicker
            @date-selected="emits('date-selected', $event)"
            class="flex-2"
          />

          <AppointmentTimePicker
            :times="['09:00','10:00','11:00','12:00','14:00','15:00','16:00']"
            :model-value="modelValueTime"
            @update:model-value="$emit('update:modelValueTime', $event)"
            class="flex-1"
          />
        </div>

        <div class="flex justify-center gap-4 pt-4">
          <Button @click="showLogin = true">
            Confirm Booking
          </Button>
          <Button variant="outline">Reset</Button>
        </div>
      </div>

      <!-- RIGHT CARD -->
      <div class="bg-white dark:bg-gray-800 rounded-xl shadow-md p-6">
        <AppointmentTable />
      </div>

    </div>
  </div>

  <!-- ✅ Move Login outside card -->
  <Login v-model:open="showLogin" />
</template>

