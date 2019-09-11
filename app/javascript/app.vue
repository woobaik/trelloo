<template>
  <div>
    <app-navigation></app-navigation>  
    <app-home></app-home>
    <app-footer></app-footer>
  </div>
  
</template>

<script>
import Navigation from './components/layouts/Navigation.vue'
import Footer from './components/layouts/Footer.vue'
import Home from './components/Home.vue'
export default {
  components: {
    'app-navigation': Navigation,
    'app-home': Home,
    'app-footer': Footer

  }
}
</script>

<style>

</style>