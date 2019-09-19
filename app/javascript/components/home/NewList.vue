<template>
    <form>
        <li class="my-card-list">
            <input v-model="listInput" type="text" class="my-card-list-item" autofocus >
        </li>
        <div class="notification" v-if="notification">
            {{ notification }}
        </div>
        <div>
            <button class="btn" @click.prevent="submitBtn">Submit</button>
            <button class="btn close-btn" @click.prevent="closeListForm">Close</button>
        </div>
        
    </form>
</template>

<script>
import { bus } from '../../packs/application.js'

export default {
    data: function(){
        return {
            listInput: '',
            notification: ''
        }
    },
    
    props: ['card'],

    methods: {
        submitForm1() {
            console.log('Submit Form body')
        },
        submitBtn() {
            if (!this.listInput) {
                this.notification = 'Please Add List Title'
            } else {
                const formData = new FormData()
                formData.append('list[name]', this.listInput)
                formData.append('list[card_id]', this.card.id)
                Rails.ajax({
                    type: 'POST',
                    url: `/cards/${this.card.id}/lists`,
                    data: formData,
                    dataType:'json',
                    contentType: "application/json",
                    success: (response) => {
                        this.closeListForm()
                        bus.$emit('appendNewList', this.listInput, this.card.id)
                    },
                    error: function(error) {
                        console.log('Someting wrong with our end', error)
                    }
                })
                
            }
        },
        closeListForm() {
            this.$emit('listFormClosed')
        }
    }
}
</script>

<style scoped>
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
      padding: 0.5rem 0;
      cursor: pointer;
      text-align: center;
  }

  .notification {
      padding: 0.5rem 0;
      color: #0079bf;
      font-family: 'Saira Semi Condensed', sans-serif;
  }

  .btn {
      border-color: green;
      border-radius: 5px;
      padding: 0.5rem 1rem;
      color: green;
      transition: all 0.1s ease-in-out
  }

  .btn:hover {
      background-color: green;
      color: white;
  }

  .close-btn {
      border-color: red;
      color: red;
  }
  .close-btn:hover {
      color: white;
      background-color: red;
  }

</style>