import { createRouter, createWebHistory } from 'vue-router';
import Home from '@/pages/Home/Home.vue';
import Signup from '@/components/auth/Signup.vue';
import Login from '@/components/auth/Login.vue';
import Appointment from '@/pages/Appoinments/Appointment.vue'

const routes = [
  { path: '/', name: 'Home', component: Home },
  { path: '/signup', name: 'Signup', component: Signup },
  { path: '/login', name: 'Login', component: Login },
  { path: '/appointments', name: 'Appointments', component: Appointment },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
