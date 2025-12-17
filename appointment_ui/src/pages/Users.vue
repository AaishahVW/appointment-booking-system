<!-- src/pages/Users.vue -->
<template>
  <div>
    <h2>Users</h2>
    <ul>
      <li v-for="user in users" :key="user.userId">
        {{ user.firstName }} {{ user.lastName }}
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, onMounted } from 'vue';
import { api } from '../api/api';

export default defineComponent({
  name: 'Users',
  setup() {
    const users = ref([]);

    const fetchUsers = async () => {
      try {
        const response = await api.get('/users');
        users.value = response.data;
      } catch (error) {
        console.error(error);
      }
    };

    onMounted(fetchUsers);

    return { users };
  },
});
</script>
