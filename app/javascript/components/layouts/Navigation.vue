<template>
  <div >
      <div class="my-navigation">
          <div>
              <router-link :to="{name:'Home'}">
                  <img src="../../../assets/images/trello.png" alt="Trello white image" width="210" height="70">
              </router-link>              
          </div>
          <div>

          </div>
          <div class="sign-links">
              <div class="sign-link">
                  <router-link :to= "{name: 'SignIn'}">Sign In</router-link>
              </div>
              

              <div class="sign-link">
                  <router-link :to="{name: 'SignUp'}">Sign Up</router-link>
              </div>
          </div>
          
      </div>
  </div>
</template>

<style scoped>
    .my-navigation{ 
        display: flex;
        color: white;
        justify-content: space-evenly;
        align-items: center;
        background-color: rgb(0, 121, 191);
        height: 10vh;
    }

    .sign-links {
        display: flex;
    }

    .sign-link {
        margin-left: 1rem;
    }
</style>

<script>
export default {
}
</script>