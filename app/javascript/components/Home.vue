<template>
  <div>
      <div class="add-button-area">  
        <button class="add-button" @click="newCardShow">New Card</button>
      </div>
      <div>
        <draggable 
          v-model="myCard" 
          class="my-home" 
          group="cards" 
         :moved="dragMoved"
          @change="dragChanged"
          >  
          <my-card v-for="card in myCard" :key="card.id" :card="card"></my-card>   
        </draggable>
      </div>
  </div>
</template>

<script>
import { bus } from '../packs/application'
import draggable from 'vuedraggable'
import Card from './layouts/Card.vue'

export default {
  data: function () {
      return {
        myCard: this.cards
      }
    },

    props: ['cards'],


    components: {
      'my-card': Card,
      draggable
    },




    methods: {
      newCardShow() {
        this.$modal.show('newCard')
        
      },

      dragMoved(event) {
        console.log('move', event)

      },

      dragChanged({
        moved
      }) {
        const formData = new FormData
      }

    },

    created() {

      bus.$on('cardAdded', (payload) => {
        this.myCard.push(payload)
      })

      bus.$on('cardDeleted', payload => {

        this.myCard = this.myCard.filter(card => {
          return card.id !== payload
        })
      })

      bus.$on('appendNewList', (payload) => {
        const cardId = payload.card_id
        const index = this.myCard.findIndex(card => card.id === cardId)
        if (!this.myCard[index].lists) {
          this.myCard[index].lists = []
        }
        this.myCard[index].lists.push(payload)
      })
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