<?php

namespace App\Http\Controllers;

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
        //}
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

    // public function showmost()
    // {
    //     // $mostleave = DB::table('paid_leaves')
    //     //             ->selectRaw('sum(lamacuti) as jumlahcuti, idpegawai')
    //     //             ->groupBy('idpegawai')
    //     //             ->get();

    //     // if ($mostleave) {
    //     //     return response()->json([
    //     //         'success' => true,
    //     //         'message' => 'Detail Cuti!',
    //     //         'data'    => $mostleave
    //     //     ], 200);
    //     // } else {
    //     //     return response()->json([
    //     //         'success' => false,
    //     //         'message' => 'Cuti Tidak Ditemukan!',
    //     //         'data'    => ''
    //     //     ], 404);
    //     // }
    // }

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
