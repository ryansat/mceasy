<template>
    <div class="container mt-3">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-default">
                    <div class="card-header">EDIT PEGAWAI</div>

                    <div class="card-body">

                        <form @submit.prevent="paidleaveUpdate">

                            <div class="form-group">
                                <label>No Induk</label>
                                <input type="text" class="form-control" v-model="paidleave.idpegawai"
                                       placeholder="Masukkan Nomor Induk">
                            </div>


                            <div class="form-group">
                                <label>Tanggal Cuti</label>
                                <textarea class="form-control" v-model="paidleave.tglcuti" rows="5"
                                          placeholder="Masukkan nama"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Lama Cuti</label>
                                <textarea class="form-control" v-model="paidleave.lamacuti" rows="5"
                                          placeholder="Masukkan alamat"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Keterangan</label>
                                <textarea class="form-control" v-model="paidleave.keterangan" rows="5"
                                          placeholder="Masukkan tanggal lahir"></textarea>
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
                paidleave: {},
                validation: [],
                loggedIn: localStorage.getItem('loggedIn'),
                //state token
                token: localStorage.getItem('token'),
            }
        },
        created() {
            if (this.token != null) {
                let uri = `http://localhost:8000/api/paidleaves/${this.$route.params.id}`;
                this.axios.get(uri).then((response) => {
                    this.paidleave = response.data.data;
                });
            }else {
                return this.$router.push({ name: 'login' }) 
            }

        },
        methods: {
            paidleaveUpdate() {
                let uri = `http://localhost:8000/api/paidleaves/update/${this.$route.params.id}`;
                this.axios.post(uri, this.paidleave)
                    .then((response) => {
                        this.$router.push({name: 'dashboard'});
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            }
        }
    }
</script>