<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LoginController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $credentials = $request->only('email', 'password');

        if ($token = auth()->guard('api-admin')->attempt($credentials)) {
            $guard = 'api-admin';
            $userType = 'admin';
        } elseif ($token = auth()->guard('api-pegawai')->attempt($credentials)) {
            $guard = 'api-pegawai';
            $userType = 'pegawai';
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Email atau Password Anda salah'
            ], 401);
        }

        return response()->json([
            'success' => true,
            'user' => auth()->guard($guard)->user(),
            'token' => $token,
            'userType' => $userType
        ], 200);
    }
}

