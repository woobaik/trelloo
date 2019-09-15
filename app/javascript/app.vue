<template>
  <div>
    <app-navigation></app-navigation>
    <div class="main-page">
      <router-view></router-view>
    </div>
    <app-footer></app-footer>
  </div>

</template>


<script>
import Navigation from './components/layouts/Navigation.vue'
import Footer from './components/layouts/Footer.vue'

export default {
  components: {
    'app-navigation': Navigation,
    'app-footer': Footer
  }
}

</script>

<style>
  .main-page {
    background-color: rgb(3, 148, 231);
  }  
</style>
