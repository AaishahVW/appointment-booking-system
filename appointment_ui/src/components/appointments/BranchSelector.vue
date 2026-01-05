<script setup lang="ts">
import { ref, onMounted, computed } from "vue";
import { Label } from "@/components/ui/label";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import {
  Accordion,
  AccordionItem,
  AccordionTrigger,
  AccordionContent,
} from "@/components/ui/accordion";
import { Search } from "lucide-vue-next";
import { branchesApi, type Branch } from "@/api/branch.api";

const props = defineProps<{
  modelValueBranch: string | null
}>();

const emits = defineEmits<{
  (e: "update:modelValueBranch", value: string): void
  (e: "branch-selected", branchId: string): void
}>();
const selectedBranch = ref<string | null>(null);

const selectBranch = (branchId: string) => {
  selectedBranch.value = branchId;
  emits("branch-selected", branchId);
};


const branches = ref<Branch[]>([]);
const search = ref("");

const loadBranches = async () => {
  try {
    branches.value = await branchesApi.getAll();
  } catch (err) {
    console.error(err);
    alert("Failed to load branches");
  }
};

onMounted(loadBranches);

const filteredBranches = computed(() =>
  branches.value.filter((b) =>
    b.branchName.toLowerCase().includes(search.value.toLowerCase())
  )
);
</script>

<template>
  <div class="space-y-4">
    <Label>Select Branch</Label>

    <div class="relative">
      <Search class="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2" />
      <Input v-model="search" placeholder="Search branches" class="pl-9 bg-surface/50" />
    </div>

    <Accordion type="single" collapsible class="w-full rounded-2xl px-4 bg-surface/50">

      <AccordionItem v-for="branch in filteredBranches" :key="branch.branchId" :value="branch.branchId">
        <AccordionTrigger>{{ branch.branchName }}</AccordionTrigger>
        <AccordionContent class="space-y-4">
  <p>{{ branch.streetNumber }} {{ branch.streetName }}, {{ branch.city }}</p>
  <p>{{ branch.phoneNumber }}</p>
  <p>{{ branch.email }}</p>
  
  <Button
    size="sm"
    variant="secondary"
    :class="selectedBranch === branch.branchId ? 'bg-primary/70 text-primary-foreground hover:bg-primary/90' : ''"
    @click="selectBranch(branch.branchId)"
  >
    Select Branch
  </Button>
</AccordionContent>
      </AccordionItem>
    </Accordion>
  </div>
</template>
