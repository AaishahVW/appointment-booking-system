<script setup lang="ts">
import { ref, onMounted, computed } from "vue";
import { Label } from "@/components/ui/label";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Accordion, AccordionItem, AccordionTrigger, AccordionContent } from "@/components/ui/accordion";
import { Search } from "lucide-vue-next";
import { branchesApi, type Branch } from "@/api/branch.api";
import { useAuthStore } from "@/stores/auth.store";

const emit = defineEmits<{ (e: "branch-selected", branchId: string): void }>();

const branches = ref<Branch[]>([]);
const search = ref("");
const auth = useAuthStore();

// Fetch branches from backend
const loadBranches = async () => {
  try {
    branches.value = await branchesApi.getAll();
  } catch (err: any) {
    if (err.response?.status === 401) {
      window.dispatchEvent(new Event("login-required"));
    } else {
      console.error(err);
      alert("Failed to load branches");
    }
  }
};


const filteredBranches = computed(() =>
  branches.value.filter((b) =>
    b.branchName.toLowerCase().includes(search.value.toLowerCase())
  )
);
onMounted(() => {
  if (auth.isLoggedIn) {
    loadBranches();
  } else {
    // Optionally wait for login
    window.addEventListener("auth-success", loadBranches, { once: true });
  }
});
</script>

<template>
  <div class="space-y-4">
    <Label>Select Branch</Label>

    <div class="relative">
      <Search class="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
      <Input v-model="search" placeholder="Search branches" class="pl-9" />
    </div>

    <Accordion type="single" collapsible class="w-full">
      <AccordionItem v-for="branch in filteredBranches" :key="branch.branchId" :value="branch.branchId">
        <AccordionTrigger class="text-sm font-medium">{{ branch.branchName }}</AccordionTrigger>

        <AccordionContent class="space-y-2 text-sm">
          <p>{{ branch.streetNumber }} {{ branch.streetName }}, {{ branch.city }}</p>
          <p>{{ branch.phoneNumber }}</p>
          <p>{{ branch.email }}</p>

          <Button size="sm" @click="emit('branch-selected', branch.branchId)">Select Branch</Button>
        </AccordionContent>
      </AccordionItem>
    </Accordion>
  </div>
</template>
