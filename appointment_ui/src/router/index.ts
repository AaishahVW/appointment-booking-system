import { createRouter, createWebHistory } from 'vue-router';
import Home from '../pages/Home/Home.vue';
import Signup from '../pages/Home/Signup.vue';
import Login from '../pages/Home/Login.vue';
import Users from '../pages/Users.vue';

const routes = [
  { path: '/', name: 'Home', component: Home },
  { path: '/signup', name: 'Signup', component: Signup },
  { path: '/login', name: 'Login', component: Login },
  { path: '/users', name: 'Users', component: Users },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
