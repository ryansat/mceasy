<?php

namespace App\Http\Controllers;
use Carbon\Carbon;
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
        $tahuncuti = $request->input('tglcuti');
        $timestamp = strtotime($tahuncuti);
        $date = date("Y", $timestamp);     

        $startDate = "{$date}-01-01";
        $endDate = "{$date}-12-31";

        $mostleave = DB::select(DB::raw("SELECT SUM(paid_leaves.lamacuti) as jumlahcuti FROM paid_leaves
        where tglcuti between '{$startDate}' and '{$endDate}'
        GROUP BY paid_leaves.idpegawai"));

        $jumlahleave = array_column($mostleave, 'jumlahcuti');
        $totalleave = intval($jumlahleave)+intval($request->input('lamacuti'));

        //check jika jumlah cuti yang diajukan melebihi yang tersisa
        if ($totalleave <= 12){
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
