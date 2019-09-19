<template>
  <div>
      <div class="add-button-area">  
        <button class="add-button" @click="newCardShow">New Card</button>
      </div>
      <div>
        <draggable v-model="cards" class="my-home" group="cards">  
          <my-card v-for="card in cards" :key="card.id" :card="card"></my-card>   
        </draggable>
      </div>
  </div>
</template>

<script>
import draggable from 'vuedraggable'
import Card from './layouts/Card.vue'

export default {

  props: ['cards'],

  components: {
    'my-card': Card,
    draggable
  },

  methods: {
    newCardShow() {
      this.$modal.show('newCard')
    }
  }
  
}
</script>

<style scoped>

  .add-button-area {
    text-align: end;
    padding-top: 1rem;
    padding-right: 1rem;
    background-color: beige;
  }

  .add-button {
    font-family: 'Saira Semi Condensed', sans-serif;
    color: white;
    padding: 0.3rem;
    background-color: rgb(111, 165, 111);
    width: 30vw;
    font-size: 1rem;
    height: 3rem;
    border-radius: 5px;
    transition: all 0.3s ease-in-out;
    margin-bottom: 10px;
    cursor: pointer;
  }

  .add-button:hover {
    background-color: darkgreen;
  }

  @media screen and (max-width: 812px) {
    .my-home {
      display: flex !important;
      justify-content: center !important;
    }
    .my-card {
      width: 90vw !important;
      
    }
  }
  .my-home {
    height: 77vh;
    display: flex;
    justify-content: flex-start;
    flex-wrap: wrap;
    overflow: scroll;
  }


</style>