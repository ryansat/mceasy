<template>
    <div class="container mt-3">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-default">
                    <div class="card-header">TAMBAH KARYAWAN</div>

                    <div class="card-body">

                        <form @submit.prevent="employeeStore">

                            <div class="form-group">
                                <label>No Induk</label>
                                <input type="text" class="form-control" v-model="employee.employeeid"
                                       placeholder="Masukkan Nomor Induk">
                                <!-- <div v-if="validation.employeeid">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.employeeid[0] }}
                                    </div>
                                </div> -->
                            </div>


                            <div class="form-group">
                                <label>Nama</label>
                                <textarea class="form-control" v-model="employee.name" rows="5"
                                          placeholder="Masukkan nama"></textarea>
                                <!-- <div v-if="validation.name">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.name[0] }}
                                    </div>
                                </div> -->
                            </div>

                            <div class="form-group">
                                <label>Alamat</label>
                                <textarea class="form-control" v-model="employee.address" rows="5"
                                          placeholder="Masukkan alamat"></textarea>
                                <!-- <div v-if="validation.address">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.address[0] }}
                                    </div>
                                </div> -->
                            </div>

                            <div class="form-group">
                                <label>Tanggal Lahir</label>
                                <textarea class="form-control" v-model="employee.birthdate" rows="5"
                                          placeholder="Masukkan tanggal lahir"></textarea>
                                <!-- <div v-if="validation.birthdate">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.birthdate[0] }}
                                    </div>
                                </div> -->
                            </div>

                            <div class="form-group">
                                <label>Tanggal Bergabung</label>
                                <textarea class="form-control" v-model="employee.joindate" rows="5"
                                          placeholder="Masukkan tanggal bergabung"></textarea>
                                <!-- <div v-if="validation.joindate">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.joindate[0] }}
                                    </div>
                                </div> -->
                            </div>


                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">SIMPAN</button>
                                <button type="reset" class="btn btn-md btn-danger">RESET</button>
                            </div>
                        </form>
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
                employee: {},
                validation: [],
                loggedIn: localStorage.getItem('loggedIn'),
                //state token
                token: localStorage.getItem('token'),
            }
        },
        created() {
            if (this.token == null) {
                return this.$router.push({ name: 'login' }) 
            }

        },
        methods: {
            employeeStore() {
                let uri = 'http://localhost:8000/api/employees/store';
                this.axios.post(uri, this.employee)
                    .then((response) => {
                        this.$router.push({
                            name: 'dashboard'
                        });
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            }
        }
    }
</script>