<template>
  <div>
      <div class="add-button-area">
        <button class="add-button">New List</button>
      </div>
      <div class="my-home">
        <div class="my-card">
          <div class="my-card-title">
            <div>Todo List</div>
            <div>
              <i class="material-icons plus-icon">add_circle_outline</i>
            </div>
          </div>
          <div class="my-card-body">
            <ul class="my-card-list">
              <li>Install Firetvstick</li>
              <li>Bring coffee from car</li>    
            </ul>
          </div>
          
          <div class="my-card-footer">
            <button class="my-card-footer-delete">Delete List</button>
          </div>
        </div>

        <div class="my-card">

        </div>

        <div class="my-card">

        </div>

        <div class="my-card">
          
        </div>

        <div class="my-card">
          
        </div>
    </div>
  </div>
</template>

<script>
export default {

}
</script>

<style scoped>

  .add-button-area {
    text-align: end;
    padding-top: 1rem;
    padding-right: 1rem;
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
    height: 80vh;
    display: flex;
    justify-content: flex-start;
    flex-wrap: wrap;
    overflow: scroll;
  }

  .my-card {
    background-color: white;
    margin-top: 2vh;
    margin-left: 1vw;
    width: 32vw;
    border-radius: 1vw;
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