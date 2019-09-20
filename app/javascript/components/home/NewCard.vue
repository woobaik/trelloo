<template>
    <modal ref="newCardModal" name="newCard" class="new-card-modal" width="60%" height="50%">
      <div class="new-card">
        <div class="new-card-title">
          Add New Card
        </div>
        <div class="new-card-description">
          Please Enter Card Title
        </div>
        <form class="new-card-form" @submit.prevent="addNewCard">
          <input type="text" name="card-title" id="card-title-form" autofocus v-model="newCardTitle">
          <div class="notification" v-show="notification">
            Please Add Card Title :)
          </div>
          <button class="submit-btn">
            Confirm
          </button>
        </form>

      </div>
    </modal>
</template>

<script>

import { bus } from '../../packs/application.js'

export default {  
  data: function() {
    return {
      newCardTitle: '',
      notification: false
    }
  },
  methods: {
    addNewCard() {
      if (this.newCardTitle) {
        const formData = new FormData()
        formData.append('card[name]', this.newCardTitle )
        Rails.ajax({
          type: "POST",
          url: "/cards",
          data: formData,
          dataType: 'json',
          contentType: "application/json",
          success: (response) => {
            bus.$emit('cardAdded', response)
            this.newCardTitle = ''
            this.$modal.hide('newCard')
          },
          error: function(response) {
            console.log('There was something wrong with your entry or our server, Please Try it later')
            console.log(this)
            console.log(formData)
          }
        })
      } else {
        this.notification = true;
      }
    }
  },

  
}
</script>

<style scoped>

.new-card {
  font-family: 'Saira Semi Condensed', sans-serif;
  background-color: white;
  display:flex;
  flex-direction: column;
  align-items: center;
  padding-top: 1rem;
  height: 100%;
}

.new-card-title {
  font-size: 2rem;
}

.new-card-description {
  font-size: 1rem;
}

.new-card-form {
  margin-top: 0.5rem;
  padding: 2rem;
  background-color: rgb(3, 148, 231);
  width: 70%;  
  text-align: center;
  border-radius: 10px;
}

#card-title-form {
  background-color: white;
  border-radius: 10px;
  width: 100%;
  height: 2rem;
  font-size: 2rem;
  padding-left: 0.5rem;
  font-family: 'Saira Semi Condensed', sans-serif;  
}

.submit-btn {
    margin-top: 1rem;
    font-family: 'Saira Semi Condensed', sans-serif;
    color: white;
    padding: 0.3rem;
    background-color: rgb(111, 165, 111);
    width: 40%;
    font-size: 1rem;
    height: 3rem;
    border-radius: 5px;
    transition: all 0.3s ease-in-out;
    margin-bottom: 10px;
    cursor: pointer;
}

.notification {
  padding-top: 1rem;
  color: rgb(241, 180, 190);
}
</style>