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
    class="
      fixed w-full
      flex items-center justify-center
      min-h-screen
      bg-[url('/src/assets/images/branchthree.jpg')]
      bg-cover bg-center
    "
  >
    <div class="absolute inset-0 bg-overlay" />

    <div class="relative z-10 max-w-3xl px-6 text-center">
      <h1 class="mb-4 text-4xl font-bold text-surface md:text-5xl">
        Welcome to Capitec’s Appointment Booking System
      </h1>

      <p class="mb-8 text-lg text-surface/90 md:text-xl">
        Book, manage, and track your appointments quickly and securely all in one place.
      </p>

      <Button @click="goToAppointments">
        Book Appointment
      </Button>
    </div>
  </section>
</template>
