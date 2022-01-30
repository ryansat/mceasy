<?php

namespace App\Http\Controllers;

use DB;
use App\PaidLeaves;
use Illuminate\Http\Request;

class PaidLeavesController extends Controller
{
    public function index()
    {
        $paidleaves = PaidLeaves::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Cuti',
            'data' => $paidleaves
        ], 200);
    }

    public function store(Request $request)
    {
        $mostleave = DB::table('paid_leaves')
        ->selectRaw('SUM(paid_leaves.lamacuti) as jumlahcuti')
        ->groupBy('idpegawai')
        ->havingRaw('idpegawai = ?', [$request->input('idpegawai')])
        ->first();

        $jumlahleave = get_object_vars($mostleave);

        //check jika jumlah cuti yang diajukan melebihi yang tersisa
        if ($jumlahleave['jumlahcuti']+$request->input('lamacuti') < 12){
            $paidleaves = PaidLeaves::create([
                'idpegawai'     => $request->input('idpegawai'),
                'tglcuti'   => $request->input('tglcuti'),
                'lamacuti'   => $request->input('lamacuti'),
                'keterangan'   => $request->input('keterangan'),
            ]);
            if ($paidleaves) {
                return response()->json([
                    'success' => true,
                    'message' => 'Cuti Berhasil Disimpan!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Cuti Gagal Disimpan!',
                ], 400);
            }
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Cuti Gagal Disimpan! Sudah Melebihi Kuota',
            ], 400);
        }
    }


    public function show($id)
    {
        $paidleaves = PaidLeaves::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Cuti',
            'data' => $paidleaves
        ], 200);
    }

    public function update(Request $request)
    {
            $paidleaves = PaidLeaves::whereId($request->input('id'))->update([
                'idpegawai'   => $request->input('idpegawai'),
                'tglcuti'   => $request->input('tglcuti'),
                'lamacuti'   => $request->input('lamacuti'),
                'keterangan'   => $request->input('keterangan'),
            ]);

            if ($paidleaves) {
                return response()->json([
                    'success' => true,
                    'message' => 'Cuti Berhasil Diupdate!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Cuti Gagal Diupdate!',
                ], 500);
            }

        // }

    }

    public function destroy($id)
    {
        $paidleaves = PaidLeaves::findOrFail($id);
        $paidleaves->delete();

        if ($paidleaves) {
            return response()->json([
                'success' => true,
                'message' => 'Cuti Berhasil Dihapus!',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Cuti Gagal Dihapus!',
            ], 500);
        }

    }
}
