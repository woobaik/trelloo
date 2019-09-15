<template>
  <div class="my-footer">
    <div>
      2019 &copy Joungwoo Baik All right reserved.
    </div>
    <div class="my-footer-links">
      <a href="https://www.github.com/woobaik" target="_blank">
        <i class="fab fa-github"></i>
      </a>
      <a href="https://www.linkedin.com/in/baik/" target="_blank">
        <i class="fab fa-linkedin"></i>
      </a>
    </div>
      
  </div>
</template>

<script>
export default {
  
}
</script>

<style>
  .my-footer {
    
    display: flex;
    justify-content: center;
    align-items:center;
    background-color: rgb(0, 121, 191);
    height: 5vh;
    text-align: center;
    color: white;
    padding: 10px;
  }

  .my-footer-links {
    margin-left: 1rem;
    cursor: pointer;
  }

  .my-footer-links a { 
    margin-left: 0.5rem;
    font-size: 1.5rem;
    color: white;
    transition: color 0.3s ease-in-out
  }

  .my-footer-links a:hover {
    color: black;
  }

</style>