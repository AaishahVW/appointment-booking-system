<script setup lang="ts">
import { Button } from '@/components/ui/button'
import { useRouter } from 'vue-router'

const router = useRouter()

const goToAppointments = () => {
  router.push('/appointments')
}
</script>

<template>
  <section
    class="relative w-full overflow-hidden
           flex items-center justify-center
           bg-cover bg-center"
    style="
      height: calc(100vh - 4rem);
      background-image: url('/src/assets/images/branchthree.jpg');
    "
  >
    <!-- Overlay -->
    <div class="absolute inset-0 bg-black/70" />

    <!-- Content -->
    <div class="relative z-10 max-w-3xl text-center px-6">
      <h1 class="text-4xl md:text-5xl font-bold text-white mb-4">
        Welcome to Capitec’s Appointment Booking System
      </h1>

      <p class="text-lg md:text-xl text-white/90 mb-8">
        Book, manage, and track your appointments quickly and securely —
        all in one place.
      </p>

      <Button @click="goToAppointments">
        Book Appointment
      </Button>
    </div>
  </section>
</template>
