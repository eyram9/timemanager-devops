import { createRouter, createWebHistory } from 'vue-router'

import WorkingTimes from '../components/Workingtimes.vue'
import WorkingTime from '../components/Workingtime.vue'
import Clock from '../components/Clock.vue'

const routes = [
    {
      path: '/workingTimes/:userID',
      name: 'workingTimes',
      component: WorkingTimes
    },

    {
      path: '/workingTime/:userid',
      name: 'workingTimeCreate',
      component: WorkingTime
    },

    {
      path: '/workingTime/:userid/:workingtimeid',
      name: 'workingTime',
      component: WorkingTime
    },

    {
      path: '/clock/:userid',
      name: 'clock',
      component: Clock
    }
]

export const router = createRouter({
  history: createWebHistory(),
  routes
})
