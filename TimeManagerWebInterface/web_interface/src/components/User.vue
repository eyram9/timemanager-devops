<template>
<div class="user">
    <p class="user__name">User: {{ user.name }}</p>
    <p class="user__email">Email: {{ user.email }}</p>
</div>
</template>

<script setup>
const props = defineProps({
  user: {
    type: Object,
    required: true
  }
})


</script>

<style>
</style>
