<script setup lang="ts">
import { ref, onMounted, computed } from "vue"
import { Label } from "@/components/ui/label"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import {
  Accordion,
  AccordionItem,
  AccordionTrigger,
  AccordionContent,
} from "@/components/ui/accordion"
import { Alert, AlertTitle, AlertDescription } from "@/components/ui/alert"
import { Search } from "lucide-vue-next"
import { branchesApi, type BranchWithHours } from "@/api/branch.api"

const props = defineProps<{ modelValueBranch: string | null }>()
const emits = defineEmits<{
  (e: "update:modelValueBranch", value: string): void
  (e: "branch-selected", branchId: string): void
}>()

const selectedBranch = ref<string | null>(null)
const branches = ref<BranchWithHours[]>([])
const search = ref("")
const errorMessage = ref<string | null>(null)

const selectBranch = (branchId: string) => {
  selectedBranch.value = branchId
  emits("branch-selected", branchId)
}

const loadBranches = async () => {
  try {
    branches.value = await branchesApi.getAll()
    errorMessage.value = null
  } catch (err) {
    console.error(err)
    errorMessage.value = "Failed to load branches. Please try again."
  }
}

onMounted(loadBranches)

const filteredBranches = computed(() =>
  branches.value.filter((b) =>
    b.branchName.toLowerCase().includes(search.value.toLowerCase())
  )
)
</script>

<template>
  <div class="space-y-4">
    <Alert v-if="errorMessage" variant="error">
      <AlertTitle>Error</AlertTitle>
      <AlertDescription>{{ errorMessage }}</AlertDescription>
    </Alert>

    <Label>Select Branch</Label>

    <div class="relative">
      <Search class="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2" />
      <Input
        v-model="search"
        placeholder="Search branches"
        class="pl-9 bg-surface/50 focus:border-primary focus:ring-1 focus:ring-primary"
      />
    </div>

    <div class="max-h-85 overflow-y-auto rounded-2xl bg-surface/50 shadow-sm">
      <Accordion type="single" collapsible class="w-full">
        <AccordionItem
          v-for="branch in filteredBranches"
          :key="branch.branchId"
          :value="branch.branchId"
        >
          <AccordionTrigger
            class="flex justify-between items-center px-4 py-3 font-medium text-left text-base hover:bg-surface/70 transition-colors rounded-t-2xl"
          >
            {{ branch.branchName }}
          </AccordionTrigger>

          <AccordionContent class="px-4 py-3 bg-surface/75 rounded-b-2xl">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div class="space-y-4">
                <div>
                  <p class="text-low-emphasis/65 tracking-wide mb-1">Address</p>
                  <p class="text-sm text-foreground">
                    {{ branch.streetNumber }} {{ branch.streetName }}, {{ branch.city }}
                  </p>
                </div>
                <div>
                  <p class="text-low-emphasis/65 tracking-wide mb-1">Contact</p>
                  <p class="text-sm text-foreground">{{ branch.phoneNumber }}</p>
                </div>
                <div>
                  <p class="text-low-emphasis/65 tracking-wide mb-1">Email</p>
                  <p class="text-sm text-foreground">{{ branch.email }}</p>
                </div>
              </div>

              <div class="space-y-4">
                <p class="text-low-emphasis/65 tracking-wide mb-1">Branch Hours</p>
                <ul class="text-sm text-foreground space-y-1">
                  <li v-for="hour in branch.businessHours" :key="hour.hoursId">
                    {{ hour.dayOfWeek.charAt(0) + hour.dayOfWeek.slice(1).toLowerCase() }}:
                    {{ hour.openTime }} - {{ hour.closeTime }}
                  </li>
                </ul>
              </div>
            </div>

            <Button
              size="sm"
              variant="outline"
              class="mt-6 w-full"
              :class="selectedBranch === branch.branchId
                ? 'bg-primary/70 text-primary-foreground hover:bg-primary/90'
                : ''"
              @click="selectBranch(branch.branchId)"
            >
              Select Branch
            </Button>
          </AccordionContent>
        </AccordionItem>
      </Accordion>
    </div>
  </div>
</template>
