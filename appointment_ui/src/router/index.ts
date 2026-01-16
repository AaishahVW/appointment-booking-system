import { createRouter, createWebHistory } from "vue-router";
import Home from "@/pages/Home/Home.vue";
import Appointment from "@/pages/Appoinments/Appointment.vue";

const routes = [
  { path: "/", name: "Home", component: Home },
  { path: "/appointments", name: "Appointments", component: Appointment },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
