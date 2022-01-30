<template>
    <div class="container mt-3">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-default">
                    <div class="card-header">DAFTAR CUTI KARYAWAN LEBIH DARI 1 KALI</div>
                    <div class="card-body">
                        <!-- <router-link :to="{ name: 'create' }" class="btn btn-md btn-success">DAFTAR CUTI</router-link> -->
                        <button @click.prevent="logout" class="btn btn-sm btn-danger">LOGOUT</button>

                        <div class="table-responsive mt-2">
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>NAMA</th>
                                    <th>TGL CUTI</th>
                                    <th>KETERANGAN</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(employee) in employees" :key="employee.id">
                                    <td>{{ employee.idpegawai }}</td>
                                    <td>{{ employee.name }}</td>
                                    <td>{{ employee.tglcuti }}</td>
                                    <td>{{ employee.keterangan }}</td>
                                    <!-- <td class="text-center">
                                        <router-link :to="{name: 'edit', params: { id: employee.id }}" class="btn btn-sm btn-primary">EDIT</router-link>
                                        <button @click.prevent="employeeDelete(employee.id, index)" class="btn btn-sm btn-danger">HAPUS</button>
                                    </td> -->
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
                let uri = `http://localhost:8000/api/employees/paidleavereport`;
                this.axios.get(uri).then(response => {
                    //console.log(response);
                    this.employees = response.data.data;
                });
            }else {
                return this.$router.push({ name: 'login' }) 
            }
            
        },
        methods: {
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