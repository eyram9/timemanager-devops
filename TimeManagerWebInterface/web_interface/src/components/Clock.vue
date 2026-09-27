<template>
    <div class="clock">
        <template v-if="clock.status">
            <p class="clock__status">Status: Active</p>
            <p class="clock__time">Time: {{ clock.time }}</p>
        </template>

        <template v-else>
            <p class="clock__status">Status: Inactive</p>
            <p class="clock__time">Not Running</p>
        </template>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const clock = ref({
    time: '',
    status: false,
})

onMounted(async () => {
    const response = await axios.get('/api/clock/1')

    const apiClock = response.data.data[0]

    clock.value = {
        time: apiClock.time,
        status: apiClock.status,
    }
})
</script>

<style>
</style>
