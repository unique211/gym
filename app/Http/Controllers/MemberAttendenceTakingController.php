<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;


use Illuminate\Support\Facades\DB;
use Redirect, Response;
use App\Logmodel;
use Validator;

class MemberAttendenceTakingController extends Controller
{
    public function index(Request $request)
    {

        return view('member_attendence_taking');
    }
    public function getbetweenclasssechedule(Request $request){

       $starttime= $request->start_time;
       $endtime= $request->end_time;

       //dd($endtime);
       $result=array();

       $data= DB::table('class_sechedule_master')->where('class_schedule','>=',$starttime)->where('class_schedule','<=',$endtime)->get();
       $count=count($data);
        
       if($count >0){
         foreach($data as $classsecheduledata){
             $classsechedule_name=$classsecheduledata->classsechedule_name;
             $class_schedule=$classsecheduledata->class_schedule;
             $instructorid=$classsecheduledata->instructor;
             $max_vacancy=$classsecheduledata->max_vacancy;
             $class_duration=$classsecheduledata->class_duration;
             $room_id=$classsecheduledata->room_id;
                $classname="";
                $instructorname="";
           $classinfo=  DB::table('class_master')->where('class_id',$classsechedule_name)->get();
           foreach($classinfo as $classdata){
            $classname=$classdata->class_name;
           }

           $instructor=  DB::table('instuctor_master')->where('instructorid',$instructorid)->get();
           foreach($instructor as $instructordata){
            $instructorname=$instructordata->instructor_name;
           }
           $result[]=array(
                'classname'=>$classname,
                'class_schedule'=>$class_schedule,
                'instructorname'=>$instructorname,
                'max_vacancy'=>$max_vacancy,
                'class_duration'=>$class_duration,
                'room_id'=>$room_id,
           );

         } 
       }
       
       return response()->json($result);


    }
}