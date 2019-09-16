<template>    
    <div class="my-card">
        <div class="my-card-title">
            <div>{{ card.name }}</div>
            <div>
                <i class="material-icons plus-icon">add_circle_outline</i>
            </div>
        </div>
        <div class="my-card-body">
            <ul class="my-card-list">
                <draggable v-model="card.lists">
                 <li v-for="list in card.lists" :key="list.name"> {{ list.name}}</li> 
                </draggable>
            </ul>
        </div>
        
        <div class="my-card-footer">
            <button class="my-card-footer-delete">Delete Card</button>
        </div>
    </div>
</template>

<script>
import draggable from 'vuedraggable'
export default {
    props: ['card'],
    components: {
        draggable
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
    overflow-y:scroll;
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
    color:mediumseagreen;
    font-size: 2.2rem;
    
  }

  .my-card-list {
    list-style: none;
    padding: 0;
    text-align: center;
  }

  .my-card-list li {
    font-size: 1rem;
    font-family: 'Saira Semi Condensed', sans-serif;
    margin: 0 5% 1% 5%;
    background-color: #0079bf;
    color: white;
    border-radius: 0.5vw;
    width: 90%;
    padding: 0.5rem 0;
    cursor: pointer;
  }

    .my-card-footer {
    text-align: center;
  }

  .my-card-footer-delete {
    font-size: 1.2rem;
    background-color: white;
    color: #ee4056;
    height: 5vh;
    width: 10rem;;
    border-radius: 10rem;
    transition: all 0.2s ease-in-out;
    font-family: 'Saira Semi Condensed', sans-serif;
  }

    .my-card-footer-delete:hover {
    font-size: 1.2rem;
    background-color: #ee4056;
    height: 5vh;
    width: 10rem;;
    border-radius: 10rem;
    color: white;
  }
</style>