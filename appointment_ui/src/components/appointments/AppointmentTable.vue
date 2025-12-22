<script setup lang="ts">
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import { Label } from '@/components/ui/label'

const appointments = [
  {
    id: 1,
    branch: 'Cape Town Branch',
    date: '2025-01-12',
    time: '10:30',
    status: 'Confirmed',
  },
]
</script>

<template>
  <div class="space-y-4">
    <Label>Your Appointments</Label>

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
          <TableCell>{{ a.branch }}</TableCell>
          <TableCell>{{ a.date }}</TableCell>
          <TableCell>{{ a.time }}</TableCell>
          <TableCell>{{ a.status }}</TableCell>
        </TableRow>
      </TableBody>
    </Table>
  </div>
</template>
