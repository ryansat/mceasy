require('./bootstrap');

window.Vue = require('vue');
import Vue from 'vue/dist/vue'
import VueAxios from 'vue-axios';
import axios from 'axios';
import VueRouter from 'vue-router'
import App from './App.vue';
import VueSimpleAlert from "vue-simple-alert";

Vue.use(VueSimpleAlert);
window.Vue = Vue
Vue.use(VueRouter)


Vue.use(VueAxios, axios);

import IndexComponent from './components/employee/Index.vue';
import CreateComponent from './components/employee/Create.vue';
import EditComponent from './components/employee/Edit.vue';
import ShowMostPaidLeaveComponent from './components/employee/Most.vue';
import LoginComponent from './components/auth/Login.vue';
import RegisterComponent from './components/auth/Register.vue';
import IndexPaidLeaveComponent from './components/paidleave/Index.vue';
import CreatePaidLeaveComponent from './components/paidleave/Create.vue';
import EditPaidLeaveComponent from './components/paidleave/Edit.vue';
import JoinDateomponent from './components/employee/Early.vue';

const routes = [
    {
        name: 'dashboard',
        path: '/employee',
        component: IndexComponent,
        meta: { requiresAuth: true }
    },
    {
        name: 'create',
        path: '/employee/create',
        component: CreateComponent
    },
    {
        name: 'edit',
        path: '/employee/:id',
        component: EditComponent
    },
    {
        name: 'early',
        path: '/employee/early',
        component: JoinDateomponent
    },

    //user registration
    {
        name: 'login',
        path: '/login',
        component: LoginComponent
    },
    {
        name: 'register',
        path: '/register',
        component: RegisterComponent
    },

    //paid_leave
    {
        name: 'mostleave',
        path: '/employee/mostleave',
        component: ShowMostPaidLeaveComponent
    },
    {
        name: 'paidleave',
        path: '/paidleave',
        component: IndexPaidLeaveComponent,
        meta: { requiresAuth: true }
    },
    {
        name: 'paidleavecreate',
        path: '/paidleave/create',
        component: CreatePaidLeaveComponent
    },
    {
        name: 'paidleaveedit',
        path: '/paidleave/:id',
        component: EditPaidLeaveComponent
    },

];

const router = new VueRouter({
    mode: 'history',
    routes: routes
});

const app = new Vue(Vue.util.extend({ router }, App)).$mount('#app');