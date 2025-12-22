import { createRouter, createWebHistory } from "vue-router";
import Home from "@/pages/Home/Home.vue";
import Appointment from "@/pages/Appoinments/Appointment.vue";
import ConsultantView from "@/pages/Branch/ConsultantView.vue";

const routes = [
  { path: "/", name: "Home", component: Home },
  { path: "/appointments", name: "Appointments", component: Appointment },
  { path: "/branch/appointments", name: "Branch", component: ConsultantView },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
