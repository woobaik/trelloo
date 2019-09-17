<template>
  <div>
    <app-navigation></app-navigation>
    <app-new-card></app-new-card>
    <div class="main-page">
      <router-view></router-view>
    </div>
    <app-footer></app-footer>
  </div>

</template>


<script>
import Navigation from './components/layouts/Navigation.vue'
import Footer from './components/layouts/Footer.vue'
import NewCard from './components/home/NewCard.vue'

export default {

  components: {
    'app-navigation': Navigation,
    'app-footer': Footer,
    'app-new-card': NewCard
  }
}

</script>

<style>
  .main-page {
    background-color: rgb(3, 148, 231);
  }  
</style>
