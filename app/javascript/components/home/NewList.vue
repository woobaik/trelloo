<template>
    <form>
        <li class="my-card-list">
            <input type="text" class="my-card-list-item" autofocus>
        </li>
        <button>Submit</button>
    </form>
</template>

<script>
export default {
      
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

</style>