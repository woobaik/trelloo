<template>
  <div >
      <div class="my-navigation">
          <div>
              <img src="../../../assets/images/trello.png" alt="Trello white image" width="210" height="105">
          </div>
          <div>

          </div>
          <div class="sign-links">
              <div class="sign-link">
                  Sign Up
              </div>
              <div class="sign-link">
                  Sign In
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
        background-color: #0079bf;
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