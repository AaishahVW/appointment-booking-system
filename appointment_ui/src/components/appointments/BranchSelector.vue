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
import { Label } from '@/components/ui/label'
import { Search } from 'lucide-vue-next'

const emit = defineEmits<{
  (e: 'branch-selected', branchId: string): void
}>()

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
    <Label>Select Branch</Label>

    <div class="relative">
      <Search class="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
      <Input
        v-model="search"
        placeholder="Search branches"
        class="pl-9"
      />
    </div>

    <Accordion type="single" collapsible class="w-full">
      <AccordionItem
        v-for="branch in filteredBranches"
        :key="branch.id"
        :value="branch.id"
      >
        <AccordionTrigger class="text-sm font-medium">
          {{ branch.name }}
        </AccordionTrigger>

        <AccordionContent class="space-y-2 text-sm">
          <p>{{ branch.address }}</p>
          <p>{{ branch.phone }}</p>
          <p>{{ branch.email }}</p>

          <Button size="sm" @click="emit('branch-selected', branch.id)">
            Select Branch
          </Button>
        </AccordionContent>
      </AccordionItem>
    </Accordion>
  </div>
</template>
