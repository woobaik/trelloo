/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import Router from 'vue-router'
import VModal from 'vue-js-modal'

Vue.use(Router)
Vue.use(VModal)
Vue.use(TurbolinksAdapter)


import App from '../app.vue'


Vue.component('app', App)
export const bus = new Vue();
import router from '../router/index.js'
document.addEventListener('turbolinks:load', () => {
    const data = JSON.parse(document.querySelector('div[data-behavior="vue"]').dataset.cards)
    const app = new Vue({
        el: '[data-behavior="vue"]',
        router,
        data: function() {
            return {
                data,
            }
        },
        components: {
            app: App
        },
        template: `<app :original_data="this.data"></app>`,
        created() {
            

        },
        beforeDestroy() {
            bus.$off('cardAdded', payload)
            bus.$off('cardDeleted', payload)
            bus.$off('appendNewList', payload)
        }
    })
    
})
