<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AttendenceRatingController extends Controller
{
    public function index(Request $request)
    {

        return view('attendence_rating');
    }
}