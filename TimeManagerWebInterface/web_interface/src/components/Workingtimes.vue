<template>
    <div class="workingtimes">
        <template v-for="(workingtime, index) in workingtimes" :key="index">
            <p class="workingtimes__index">
                Working Time {{ index + 1 }}
            </p>

            <Workingtime :workingtime="workingtime" />
        </template>
    </div>
</template>

<script setup lang="ts">
import axios from 'axios'
import { ref, onMounted } from 'vue'
import Workingtime from './Workingtime.vue'

const workingtimes = ref([])

onMounted(async () => {
    const response = await axios.get('/api/workingtime/1')

    workingtimes.value = response.data.data
})
</script>