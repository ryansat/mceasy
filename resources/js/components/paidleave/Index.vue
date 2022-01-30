<template>
    <div class="container mt-3">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-default">
                    <div class="card-header">CUTI</div>
                    <div class="card-body">
                        <router-link :to="{ name: 'paidleavecreate' }" class="btn btn-md btn-success">TAMBAH CUTI</router-link>
                        <button @click.prevent="logout" class="btn btn-sm btn-danger">LOGOUT</button>

                        <div class="table-responsive mt-2">
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tanggal Cuti</th>
                                    <th>Lama Cuti</th>
                                    <th>Keteangan</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(paidleave, index) in paidleaves" :key="paidleave.id">
                                    <td>{{ paidleave.idpegawai }}</td>
                                    <td>{{ paidleave.tglcuti }}</td>
                                    <td>{{ paidleave.lamacuti }}</td>
                                    <td>{{ paidleave.keterangan }}</td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'edit', params: { id: paidleave.id }}" class="btn btn-sm btn-primary">EDIT</router-link>
                                        <button @click.prevent="paidleaveDelete(paidleave.id, index)" class="btn btn-sm btn-danger">HAPUS</button>
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
                paidleaves: [],
                loggedIn: localStorage.getItem('loggedIn'),
                //state token
                token: localStorage.getItem('token'),
            }
        },
        created() {
            // console.log(this.token)
            if (this.token != null) {
                let uri = `http://localhost:8000/api/paidleaves`;
                this.axios.get(uri).then(response => {
                    this.paidleaves = response.data.data;
                });
            }else {
                return this.$router.push({ name: 'login' }) 
            }
            
        },
        methods: {
            paidleaveDelete(id, index)
            {
                this.axios.delete(`http://localhost:8000/api/paidleaves/${id}`)
                    .then(response => {
                        this.paidleaves.splice(index, 1);
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