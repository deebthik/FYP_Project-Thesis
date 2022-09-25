import Vue from 'vue'
import VueRouter from 'vue-router'
import AdminDashBoard from '../views/AdminDashBoard.vue'
import TimeLine from '../views/Timeline.vue'
import FarmInspector from '../views/FarmInspector.vue'
import Harvester from '../views/Harvester.vue'
import ImporterDashBoard from '../views/Importer.vue'
import ExporterDashBoard from '../views/Exporter.vue'
import ProcesserDashBoard from '../views/Processor.vue'

Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    name: 'admin',
    component: AdminDashBoard
  },
  {
    path: '/timeline/:id',
    name: 'timeline',
    props: true,
    component: TimeLine
  },
  {
    path: '/farminspector',
    name: 'farminspector',
    component: FarmInspector
  }, {
    path: '/harvester',
    name: 'harvester',
    component: Harvester
  }, {
    path: '/exporter',
    name: 'exporter',
    component: ExporterDashBoard
  },{
    path: '/importer',
    name: 'importer',
    component: ImporterDashBoard
  },{
    path: '/processor',
    name: 'processor',
    component: ProcesserDashBoard
  }

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
