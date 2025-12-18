<script setup lang="ts">
import { ref, computed } from 'vue'
import { Input } from '@/components/ui/input'
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from '@/components/ui/accordion'
import { Button } from '@/components/ui/button'

const emit = defineEmits<{
  (e: 'branch-selected', branchId: string): void
}>()

// TEMP mock (replace with API)
const branches = ref([
  {
    id: '1',
    name: 'Cape Town Branch',
    address: '123 Long Street, Cape Town',
    phone: '021 555 1234',
    email: 'ct@capitec.co.za',
  },
  {
    id: '2',
    name: 'Johannesburg Branch',
    address: '45 Main Road, Sandton',
    phone: '011 777 8888',
    email: 'jhb@capitec.co.za',
  },
])

const search = ref('')

const filteredBranches = computed(() =>
  branches.value.filter(b =>
    b.name.toLowerCase().includes(search.value.toLowerCase())
  )
)
</script>

<template>
  <div class="space-y-4">
    <h2 class="text-xl font-medium">Select a Branch</h2>

    <Input
      placeholder="Search branches..."
      v-model="search"
    />

    <Accordion type="single" collapsible>
      <AccordionItem
        v-for="branch in filteredBranches"
        :key="branch.id"
        :value="branch.id"
      >
        <AccordionTrigger>
          {{ branch.name }}
        </AccordionTrigger>

        <AccordionContent class="space-y-2">
          <p class="text-sm">{{ branch.address }}</p>
          <p class="text-sm">📞 {{ branch.phone }}</p>
          <p class="text-sm">✉ {{ branch.email }}</p>

          <Button
            size="sm"
            @click="emit('branch-selected', branch.id)"
          >
            Select Branch
          </Button>
        </AccordionContent>
      </AccordionItem>
    </Accordion>
  </div>
</template>
