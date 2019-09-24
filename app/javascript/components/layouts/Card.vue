<template>    
    <div class="my-card">
        <div class="my-card-title">
            <div>{{ card.name }}</div>
            <div @click="addNewList" v-if="!newListOpen">
                <i class="material-icons plus-icon">add_circle_outline</i>                                
            </div>
        </div>
        <div class="my-card-body">
            <ul class="my-card-list">
                <draggable 
                  v-model="myList" 
                  :group="'myCard'"
                  @change="changeList">
                  <li v-for="list in myList" 
                    :key="list.id" 
                    class="my-card-list-item"> 
                      <div>{{list.name}}</div>
                      <div @click="removeList(list)">
                        <i class="material-icons remove-icon">remove_circle</i>
                      </div>
                  </li> 
                </draggable>
                <app-card-new-list ref="newLIst" v-if="newListOpen" @appendNewList="appendListFromNewList" @listFormClosed="listFormClosed" :card="card"></app-card-new-list>
            </ul>
        </div>
        <div class="my-card-footer" >
            <button ref="btnbtn" class="my-card-footer-delete" @click="deleteCard(card.id)">Delete Card</button>
        </div>
        
    </div>
</template>

<script>
import { bus } from '../../packs/application'
import NewList from '../home/NewList.vue'
import draggable from 'vuedraggable'

export default {
    data: function() {
      return {
        newListOpen: false,
        myList: this.card.lists,
      }
    },
    
    props: ['card','index'],

    methods: {
      addNewList(cardId) {
        this.newListOpen = true
      },
      
      deleteCard(id) {
        Rails.ajax({
          type:'DELETE', 
          url: `/cards/${id}`,
          dataType: 'json',
          success: function(response) {
            bus.$emit('cardDeleted', id)            
          }, 
          error: function(response) {
            console.log('something is wrong with in our end. delete card')
            console.log(response)
          }
        })
      }, 

      removeList(clickedList) {
        const listIndex = this.myList.findIndex(list => {
          return list.id === clickedList.id
        })

        Rails.ajax({
          url:`/cards/${clickedList.card_id}/lists/${clickedList.id}`,
          type:'DELETE',
          success: response => {
            this.myList = this.myList.filter(list => {
              return list.id !== this.myList[listIndex].id
            })
          },
          error: function(response) {
            console.log('THERE IS SOMETHING WRONG WITH REMOVING LIST', response)
          }
        })        
      },

      listFormClosed() {
        this.newListOpen = false
      },

      changeList(event) {
        const eventType = event.added || event.moved
        if (eventType) {          
          const targetElement = eventType.element

          const formData = new FormData()
          formData.append('list[card_id]', parseInt(this.card.id))
          formData.append('list[position]', parseInt(eventType.newIndex) + 1)
          Rails.ajax({
            url: `/cards/${eventType.element.card_id}/lists/${eventType.element.id}/move`,
            type: 'PATCH',
            data: formData,  
            success: function(response) {
              console.log('success list move', response)
            }, 
            error: function(response) {
              console.log('fail to move list', response)
            }              
          })
        }        
      },

      appendListFromNewList(payload) {
        if (!this.myList) {
          this.myList = []
        }
        this.myList.push(payload)
       
      }
    },

    components: { 
      'app-card-new-list': NewList,
      draggable: draggable
    }
    
}
</script>

<style scoped>

    .my-card {
      background-color: rgb(243, 243, 243);
      margin-top: 2vh;
      margin-left: 1vw;
      width: 32vw;
      border-radius: 5px;
      overflow-y: scroll;
      overflow: scroll;
      position: relative;
    }

    .my-card-title {
      font-family: 'Ubuntu', sans-serif;
      font-size: 1.5rem;
      height: 2.2rem;
      margin: 2rem;
      text-align: center;
      display: flex;
      justify-content: space-between;
      padding-bottom: 0.7rem;
      border-bottom: 1px solid lightgray;
    }

    .plus-icon {
      color: #0079bf;
      transition: all 0.2s ease-in-out;
      cursor: pointer;
    }

    .plus-icon:hover {
      color: mediumseagreen;
      font-size: 2.2rem;

    }

    .remove-icon {
    }

    .remove-icon:hover {
      animation: rotation 0.2s linear alternate;
      background-color: red;
      border-radius: 50%;
    }

    @keyframes rotation {
      from {
        transform: rotate(0deg);
      }
      to {
        transform: rotate(180deg);
      }
    }

    .my-card-list {
      list-style: none;
      padding: 0;
      text-align: center;
    }

    .my-card-list-item {
      font-size: 1rem;
      font-family: 'Saira Semi Condensed', sans-serif;
      margin: 0 5% 1% 5%;
      background-color: #0079bf;
      color: white;
      border-radius: 0.5vw;
      width: 90%;
      padding: 0.5rem;
      
      cursor: pointer;
      display: flex;
      justify-content: space-between;
    }

    .my-card-footer {
      text-align: center;
    }

    .my-card-footer-delete {
      font-size: 1.2rem;
      background-color: white;
      color: #ee4056;
      height: 5vh;
      width: 10rem;
      border-radius: 10rem;
      transition: all 0.2s ease-in-out;
      font-family: 'Saira Semi Condensed', sans-serif;
    }

    .my-card-footer-delete:hover {
      font-size: 1.2rem;
      background-color: #ee4056;
      height: 5vh;
      width: 10rem;
      border-radius: 10rem;
      color: white;
    }
</style>