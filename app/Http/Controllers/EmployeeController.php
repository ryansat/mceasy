<?php

namespace App\Http\Controllers;

use App\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class EmployeeController extends Controller
{
    public function index()
    {
        $employees = Employee::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Employees',
            'data' => $employees
        ], 200);
    }

    public function store(Request $request)
    {
        //validate data
        // $validator = Validator::make($request->all(), [
        //     'employeeid'     => 'required',
        //     'name'           => 'required',
        //     'address'        => 'required',
        //     'birthdate'      => 'birthdate',
        //     'joindate'       => 'joindate',
        // ],
        //     [
        //         'employeeid.required' => 'Masukkan nomor induk employee !',
        //         'name.required' => 'Masukkan nama employee !',
        //         'address.required' => 'Masukkan alamat employee !',
        //         'birthdate.required' => 'Masukkan tanggal lahir employee !',
        //         'joindate.required' => 'Masukkan tanggal bergabung employee !',
        //     ]
        // );

        // if($validator->fails()) {

        //     return response()->json([
        //         'success' => false,
        //         'message' => 'Silahkan Isi Bidang Yang Kosong',
        //         'data'    => $validator->errors()
        //     ],400);

        // } else {

            $employee = Employee::create([
                'employeeid'     => $request->input('employeeid'),
                'name'   => $request->input('name'),
                'address'   => $request->input('address'),
                'birthdate'   => $request->input('birthdate'),
                'joindate'   => $request->input('joindate'),
            ]);


            if ($employee) {
                return response()->json([
                    'success' => true,
                    'message' => 'Employee Berhasil Disimpan!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Employee Gagal Disimpan!',
                ], 400);
            }
        //}
    }


    public function show($id)
    {
        $employee = Employee::whereId($id)->first();

        if ($employee) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Employee!',
                'data'    => $employee
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Employee Tidak Ditemukan!',
                'data'    => ''
            ], 404);
        }
    }

    public function update(Request $request)
    {
        //validate data
        // $validator = Validator::make($request->all(), [
        //     'employeeid'     => 'required',
        //     'name'           => 'required',
        //     'address'        => 'required',
        //     'birthdate'      => 'birthdate',
        //     'joindate'       => 'joindate',
        // ],
        //     [
        //         'employeeid.required' => 'Masukkan nomor induk employee !',
        //         'name.required' => 'Masukkan nama employee !',
        //         'address.required' => 'Masukkan alamat employee !',
        //         'birthdate.required' => 'Masukkan tanggal lahir employee !',
        //         'joindate.required' => 'Masukkan tanggal bergabung employee !',
        //     ]
        // );

        // if($validator->fails()) {

        //     return response()->json([
        //         'success' => false,
        //         'message' => 'Silahkan Isi Bidang Yang Kosong',
        //         'data'    => $validator->errors()
        //     ],400);

        // } else {

            $employee = Employee::whereId($request->input('id'))->update([
                'name'   => $request->input('name'),
                'address'   => $request->input('address'),
                'birthdate'   => $request->input('birthdate'),
                'joindate'   => $request->input('joindate'),
            ]);

            if ($employee) {
                return response()->json([
                    'success' => true,
                    'message' => 'Employee Berhasil Diupdate!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Employee Gagal Diupdate!',
                ], 500);
            }

        // }

    }

    public function destroy($id)
    {
        $employee = Employee::findOrFail($id);
        $employee->delete();

        if ($employee) {
            return response()->json([
                'success' => true,
                'message' => 'Employee Berhasil Dihapus!',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Employee Gagal Dihapus!',
            ], 500);
        }

    }
}