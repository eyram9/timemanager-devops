<template>
  <div class="app">
    <h1>Time Manager</h1>

    <h2>User</h2>
    <User :user="user" />

    <router-view />
  </div>
</template>

<script setup lang="ts">
import axios from 'axios' 
import { ref, onMounted } from 'vue'
import User from './components/User.vue';

const user = ref({
  name: '',
  email: '',
})

onMounted(async () => {
  const response = await axios.get('/api/users/1')
  const apiUser = response.data.data;

  user.value = {
    name: apiUser.username,
    email: apiUser.email,
  };
});

</script>