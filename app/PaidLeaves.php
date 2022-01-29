<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaidLeaves extends Model
{
    protected $fillable = [
        'idpegawai', 'tglcuti', 'lamacuti', 'keterangan'
    ];
}
