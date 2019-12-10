<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Usermanagecontroller extends Controller
{
    //
    public function index(Request $request){

            return view('usermanagement');
        
        
       
    }
}
