import Vue from 'vue'
import Router from 'vue-router'


import SignIn from '../components/session/SignIn.vue'
import SignUp from '../components/session/SignUp.vue'
import Home from '../components/Home.vue'


Vue.use(Router)

export default new Router({
    mode: 'history',
    routes: [
        {
            path: '/',
            name: 'Home',
            component: Home
        },
        {
            path: 'sign-in',
            name: 'SignIn',
            component: SignIn
        },
        {
            path: 'sign-up',
            name: 'SignUp',
            component: SignUp
        }
    ]
})