<template>
    <div class="container mt-3">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-default">
                    <div class="card-header">EDIT PEGAWAI</div>

                    <div class="card-body">

                        <form @submit.prevent="employeeUpdate">

                            <div class="form-group">
                                <label>Nama</label>
                                <textarea class="form-control" v-model="employee.name" rows="5"
                                          placeholder="Masukkan nama"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Alamat</label>
                                <textarea class="form-control" v-model="employee.address" rows="5"
                                          placeholder="Masukkan alamat"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Tanggal Lahir</label>
                                <textarea class="form-control" v-model="employee.birthdate" rows="5"
                                          placeholder="Masukkan tanggal lahir"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Tanggal Bergabung</label>
                                <textarea class="form-control" v-model="employee.joindate" rows="5"
                                          placeholder="Masukkan tanggal bergabung"></textarea>
                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">UPDATE</button>
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
            if (this.token != null) {
                let uri = `http://localhost:8000/api/employees/${this.$route.params.id}`;
                this.axios.get(uri).then((response) => {
                    this.employee = response.data.data;
                });
            }else {
                return this.$router.push({ name: 'login' }) 
            }

        },
        methods: {
            employeeUpdate() {
                let uri = `http://localhost:8000/api/employees/update/${this.$route.params.id}`;
                this.axios.post(uri, this.employee)
                    .then((response) => {
                        this.$router.push({name: 'dashboard'});
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            }
        }
    }
</script>