<template>
  <div>
      <div class="add-button-area">  
        <button class="add-button" @click="newCardShow">New Card</button>
      </div>
      <div>
        <draggable 
          :list="myCards" 
          class="my-home" 
          group="myCard" 
          @change="dragChanged"
          >  
          <my-card v-for="(card,index) in myCards" :key="card.id" :card="card" :index="index"></my-card>   
        </draggable>
      </div>
  </div>
</template>

<script>
import { bus } from '../packs/application'
import draggable from 'vuedraggable'
import Card from './layouts/Card.vue'
import _  from 'lodash'

export default {
  data: function () {
      return {
        myCards: this.cards
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

      dragChanged({moved}) {
        const formData = new FormData
        formData.append('card[position]', moved.newIndex + 1)        
        Rails.ajax({
          dataType:'json',
          type: 'PUT',
          data: formData,
          url: `/cards/${moved.element.id}/move`,
          success: response => {
          }, 
          error: error => {
            console.log('fail patching')
            console.table(error)
          }
        })

      }

    },

    created() {

      bus.$on('cardAdded', (payload) => {
        this.myCards.push(payload)
        console.log(this.myCards)
      })

      bus.$on('cardDeleted', payload => {

        this.myCards = this.myCards.filter(card => {
          return card.id !== payload
        })
      })


    },

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