<template>
    <div class="workingtime">
        <p class="workingtime__start">
            Start: {{ workingtime.start }}
        </p>

        <p class="workingtime__end">
            End: {{ workingtime.end }}
        </p>
    </div>
</template>

<script setup lang="ts">
import axios from 'axios'
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()

const workingtime = ref({
    start: '',
    end: ''
})

onMounted(async () => {
    const response = await axios.get(
        `/api/workingtime/${route.params.userid}/${route.params.workingtimeid}`
    )

    workingtime.value = response.data.data
})
</script>

<style>
</style>
