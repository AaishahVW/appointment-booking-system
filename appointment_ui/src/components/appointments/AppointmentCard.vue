<script setup lang="ts">
import { ref } from 'vue'
import BranchSelector from './BranchSelector.vue'
import AppointmentDatePicker from './AppointmentDatePicker.vue'
import AppointmentTimePicker from './AppointmentTimePicker.vue'
import AppointmentTable from './AppointmentTable.vue'
import Login from '@/components/auth/Login.vue'

import { Button } from '@/components/ui/button'
import {
  Card,
  CardContent,
  CardHeader,
} from '@/components/ui/card'
import Separator from '../ui/separator/Separator.vue'

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

      <Card class="flex flex-col gap-6">
        <CardHeader>
            <BranchSelector @branch-selected="emits('branch-selected', $event)" />
        </CardHeader>
      
        <CardContent>
          <Separator class="my-5"/>
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
<Separator class="my-5"/>
          <div class="flex justify-center gap-4 pt-4">
            <Button @click="showLogin = true">
              Confirm Booking
            </Button>
            <Button variant="outline">
              Reset
            </Button>
          </div>
        </CardContent>
      </Card>

      <Card>
        <CardContent class="p-6">
          <AppointmentTable />
        </CardContent>
      </Card>

    </div>
  </div>

  <Login v-model:open="showLogin" />
</template>
