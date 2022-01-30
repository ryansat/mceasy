<template>
    <div class="container mt-3">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-default">
                    <div class="card-header">PEGAWAI</div>
                    <div class="card-body">
                        <router-link :to="{ name: 'create' }" class="btn btn-md btn-success">TAMBAH PEGAWAI</router-link>
                        <router-link :to="{ name: 'mostleave' }" class="btn btn-md btn-success">LIHAT CUTI KARYAWAN > 1</router-link>
                        <router-link :to="{ name: 'paidleave' }" class="btn btn-md btn-success">LIHAT STATUS CUTI</router-link>
                        <router-link :to="{ name: 'early' }" class="btn btn-md btn-success">TOP 3 KARYAWAN JOIN DATE</router-link>
                        <button @click.prevent="logout" class="btn btn-sm btn-danger">LOGOUT</button>

                        <div class="table-responsive mt-2">
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>NAMA</th>
                                    <th>ALAMAT</th>
                                    <th>TGL LAHIR</th>
                                    <th>TGL BERGABUNG</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(employee, index) in employees" :key="employee.id">
                                    <td>{{ employee.id }}</td>
                                    <td>{{ employee.name }}</td>
                                    <td>{{ employee.address }}</td>
                                    <td>{{ employee.birthdate }}</td>
                                    <td>{{ employee.joindate }}</td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'edit', params: { id: employee.id }}" class="btn btn-sm btn-primary">EDIT</router-link>
                                        <button @click.prevent="employeeDelete(employee.id, index)" class="btn btn-sm btn-danger">HAPUS</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                employees: [],
                loggedIn: localStorage.getItem('loggedIn'),
                //state token
                token: localStorage.getItem('token'),
            }
        },
        created() {
            // console.log(this.token)
            if (this.token != null) {
                let uri = `http://localhost:8000/api/employees`;
                this.axios.get(uri).then(response => {
                    this.employees = response.data.data;
                });
            }else {
                return this.$router.push({ name: 'login' }) 
            }
            
        },
        methods: {
            employeeDelete(id, index)
            {
                this.axios.delete(`http://localhost:8000/api/employees/${id}`)
                    .then(response => {
                        this.employees.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
            },
            logout(){    
                let token = localStorage.getItem('token')
                axios.defaults.headers.common.Authorization = `Bearer ${token}`
                axios.post('http://localhost:8000/api/logout')
                    .then(response => {
                    console.log(response.status)
                        if(response.status == 200) {
                            //remove localStorage
                            localStorage.removeItem('token')
                            //redirect ke halaman login
                            this.$router.push({
                                name: 'login'
                            })
                        }
                    }).catch(error => {
                    console.log(error.response.data)
                });
            }
        }
    }
</script>