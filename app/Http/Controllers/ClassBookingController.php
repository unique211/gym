<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ClassBookingController extends Controller
{
    public function index(Request $request)
    {

        return view('class_booking');
    }
}