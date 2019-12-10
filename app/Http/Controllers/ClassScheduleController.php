<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Redirect, Response;
use App\Logmodel;
use App\Classsechedulemodel;

use Validator;
use Illuminate\Support\Facades\DB;
class ClassScheduleController extends Controller
{
    public function index(Request $request)
    {

        return view('class_schedule');
    }
    //getall class
    public function getdropallclass(){
        $data= DB::table('class_master')->where('status',1)->get();
        return response()->json($data);
    }

    //get all room
    
    public function getdropallroom(){
        $data= DB::table('room_master')->where('status',1)->get();
        return response()->json($data);
    }

    public function store(Request $request)//For insert or Update Record Of Room Master --
    {
      
    
        $catid = $request->save_update;
      
        $input = $request->all();
        if($catid ==""){
        $validator = Validator::make($input, [
            'classsechedule_name' => 'required',
            'instructorid'=>'required',
            'class_schedule'=>'required',
            'max_vacancy'=>'required|numeric|gt:0',
            'class_duration'=>'required|numeric|gt:0',
            'room_id'=>'required',
            'min_cancelation'=>'required',
            'min_booking'=>'required',
            'statusinfo'=>'required',
            
            ]);
        }else{
            $validator = Validator::make($input, [
                'classsechedule_name' => 'required',
                'instructorid'=>'required',
                'class_schedule'=>'required',
                'max_vacancy'=>'required',
                'class_duration'=>'required',
                'room_id'=>'required',
                'min_cancelation'=>'required',
                'min_booking'=>'required',
                'statusinfo'=>'required',
                
                ]);
        }
            if($validator->fails()){

                return response()->json(['less Arguments OR Class Category Already Exists']);
            }else{
                $from1 = strtr($request->class_schedule, '/', '-');
                $class_schedule= date('Y-m-d H:i:s', strtotime($from1));

                $from2 = strtr($request->min_cancelation, '/', '-');
                $min_cancelation= date('Y-m-d H:i:s', strtotime($from2));

                $from3 = strtr($request->min_booking, '/', '-');
                $min_booking= date('Y-m-d H:i:s', strtotime($from3));

                $from4 = strtr($request->classendtime, '/', '-');
                $classendtime= date('Y-m-d H:i:s', strtotime($from4));

                if($catid >0){
                    $classcategory   =   Classsechedulemodel::updateOrCreate(
                        ['classsechedule_id' => $catid],
                        [
                            'classsechedule_name'       =>   $request->classsechedule_name,
                            'class_schedule'=>$class_schedule,
                            'instructor'=>$request->instructorid,
                            'max_vacancy'=>$request->max_vacancy,
                            'class_duration'=>$request->class_duration,
                            'room_id'=>$request->room_id,
                            'min_cancelation'=> $min_cancelation,
                            'min_booking'=>$min_booking,
                            'status'=>$request->statusinfo,
                            'user_id'=>1,
                            'endtime'=>$classendtime,
            
                        ]
            
                    );
            
                   
            
                    
                    if( $catid >0){
                        $Logmodel = new Logmodel;
            
                        $Logmodel->module_name ='Class Schedule Module' ;
                        $Logmodel->operation_name ='Edit';
                        $Logmodel->reference_id = $catid;
                        $Logmodel->table_name = 'class_sechedule_master';
                        $Logmodel->user_id = 1;
                        $Logmodel->save();
                            
                    }else{
                        $Logmodel = new Logmodel;
            
                        $Logmodel->module_name ='Class Schedule Module' ;
                        $Logmodel->operation_name ='Insert';
                        $Logmodel->reference_id = $classcategory->classsechedule_id;
                        $Logmodel->table_name = 'class_sechedule_master';
                        $Logmodel->user_id = 1;
                        $Logmodel->save(); 
                    }
                   
            
                    return response()->json(['data'=> $classcategory]);

                }else{
                //     $data1 = DB::table('class_sechedule_master')
                //     ->select('class_sechedule_master.*')
                //      ->where('room_id',$request->room_id)
                //     ->where('instructor',$request->instructorid)
                //    // ->where('class_schedule','>=',$class_schedule)
                //    // ->where('class_schedule','<=',$classendtime)
                //    // ->whereBetween('class_schedule', [$class_schedule, $classendtime] )
                //    // ->whereBetween('endtime', [$class_schedule, $classendtime])
                //    // ->where('class_schedule' BETWEEN .$class_schedule.' AND '.$classendtime.') AND (endtime BETWEEN '.$class_schedule.' AND '.$classendtime)  
                //     ->get();
                //     $count=count($data1);
                //      $flag=0;
                //     foreach($data1 as $getdata){
                //       $starttime=  $getdata->class_schedule;
                //       $endtime=  $getdata->endtime;

                //       if($starttime >= $class_schedule &&  $starttime <=$classendtime ){
                //         $flag=1;
                //         break;
                //       }
                //       if($endtime >= $class_schedule &&  $endtime <=$classendtime ){
                //         $flag=1;
                //         break;
                //       }

                //     }
                    
                   

                   
                //     if($count >0){
                //         return response()->json('500');
                //     }else{
                        $data2 = DB::table('class_sechedule_master')
                        ->select('class_sechedule_master.*')
                         ->where('room_id',$request->room_id)
                        ->where('instructor',$request->instructorid)
                        ->where('endtime','>=',$class_schedule)
                        ->where('endtime','<=',$classendtime)
                       // ->whereBetween('class_schedule', [$class_schedule, $classendtime] )
                       // ->whereBetween('endtime', [$class_schedule, $classendtime])
                       // ->where('class_schedule' BETWEEN .$class_schedule.' AND '.$classendtime.') AND (endtime BETWEEN '.$class_schedule.' AND '.$classendtime)  
                        ->get();
                        $count1=count($data2);

                       // dd($count1);

                        $classcategory   =   Classsechedulemodel::updateOrCreate(
                            ['classsechedule_id' => $catid],
                            [
                                'classsechedule_name'       =>   $request->classsechedule_name,
                                'class_schedule'=>$class_schedule,
                                'instructor'=>$request->instructorid,
                                'max_vacancy'=>$request->max_vacancy,
                                'class_duration'=>$request->class_duration,
                                'room_id'=>$request->room_id,
                                'min_cancelation'=> $min_cancelation,
                                'min_booking'=>$min_booking,
                                'status'=>$request->statusinfo,
                                'user_id'=>1,
                                'endtime'=>$classendtime,
                
                            ]
                
                        );
                
                       
                
                        
                        if( $catid >0){
                            $Logmodel = new Logmodel;
                
                            $Logmodel->module_name ='Class Schedule Module' ;
                            $Logmodel->operation_name ='Edit';
                            $Logmodel->reference_id = $catid;
                            $Logmodel->table_name = 'class_sechedule_master';
                            $Logmodel->user_id = 1;
                            $Logmodel->save();
                                
                        }else{
                            $Logmodel = new Logmodel;
                
                            $Logmodel->module_name ='Class Schedule Module' ;
                            $Logmodel->operation_name ='Insert';
                            $Logmodel->reference_id = $classcategory->classsechedule_id;
                            $Logmodel->table_name = 'class_sechedule_master';
                            $Logmodel->user_id = 1;
                            $Logmodel->save(); 
                        }
                       
                
                        return response()->json(['data'=> $classcategory]);
                  //  }
                }
               

      
        
    }

        //return Response::json($package);
    }
    public function getscedulaclass(){
        date_default_timezone_set('Asia/Kolkata');
       // $date = date('d-m-Y H:i', time());
        //dd($date);
        $data = DB::table('class_sechedule_master')
       
           ->join('class_master', 'class_master.class_id', '=', 'class_sechedule_master.classsechedule_name')
           ->join('room_master', 'room_master.rooom_id', '=', 'class_sechedule_master.room_id')
            ->select('class_sechedule_master.*', 'class_master.class_name as classname','room_master.room as room')
            ->where('class_schedule','>',date('Y-m-d H:i:s'))
            ->orderBy('class_schedule','DESC')
            ->get();
           return response()->json( $data);

    }
    public function deleteclasssechedule($id){
        $Logmodel = new Logmodel;

        $Logmodel->module_name ='Class Schedule Module' ;
        $Logmodel->operation_name ='Delete';
        $Logmodel->reference_id = $id;
        $Logmodel->table_name = 'class_sechedule_master';
        $Logmodel->user_id =1;
        $Logmodel->save(); 
        $customer = Classsechedulemodel::where('classsechedule_id', $id)->delete();
        return Response::json($customer);
    }
     //for update
     public function update(Request $request, $id)
     {
        $catid = $id;
       
        $data = DB::table('class_sechedule_master')
         ->select('class_sechedule_master.*')
         ->where('classsechedule_id',$catid)
         ->get();
         $count=count($data);
         $input = $request->all();
         if($count >0 ){
         if($catid ==""){
            $validator = Validator::make($input, [
                'classsechedule_name' => 'required',
                'instructorid'=>'required',
                'class_schedule'=>'required',
                'max_vacancy'=>'required',
                'class_duration'=>'required',
                'room_id'=>'required',
                'min_cancelation'=>'required',
                'min_booking'=>'required',
                'statusinfo'=>'required',
                
                ]);
            }else{

                $validator = Validator::make($input, [
                    'classsechedule_name' => 'required',
                    'instructorid'=>'required',
                    'class_schedule'=>'required',
                    'max_vacancy'=>'required',
                    'class_duration'=>'required',
                    'room_id'=>'required',
                    'min_cancelation'=>'required',
                    'min_booking'=>'required',
                    'statusinfo'=>'required',
                    
                    ]);
                   
            }
                // if($validator->fails()){
    
                //     return response()->json('less Arguments OR Class Category Already Exists ');
                // }else{
                    $from1 = strtr($request->class_schedule, '/', '-');
                    $class_schedule= date('Y-m-d H:i:s', strtotime($from1));
    
                    $from2 = strtr($request->min_cancelation, '/', '-');
                    $min_cancelation= date('Y-m-d H:i:s', strtotime($from2));
    
                    $from3 = strtr($request->min_booking, '/', '-');
                    $min_booking= date('Y-m-d H:i:s', strtotime($from3));
          
            $classcategory   =   Classsechedulemodel::updateOrCreate(
                ['classsechedule_id' => $catid],
                [
                    'classsechedule_name'       =>   $request->classsechedule_name,
                    'class_schedule'=>$class_schedule,
                    'instructor'=>$request->instructorid,
                    'max_vacancy'=>$request->max_vacancy,
                    'class_duration'=>$request->class_duration,
                    'room_id'=>$request->room_id,
                    'min_cancelation'=> $min_cancelation,
                    'min_booking'=>$min_booking,
                    'status'=>$request->statusinfo,
                    'user_id'=>1,
    
                ]
    
            );
    
           
    
            
            if( $catid >0){
                $Logmodel = new Logmodel;
    
                $Logmodel->module_name ='Class Schedule Module' ;
                $Logmodel->operation_name ='Edit';
                $Logmodel->reference_id = $catid;
                $Logmodel->table_name = 'class_sechedule_master';
                $Logmodel->user_id = 1;
                $Logmodel->save();
                    
            }else{
                $Logmodel = new Logmodel;
    
                $Logmodel->module_name ='Class Schedule Module' ;
                $Logmodel->operation_name ='Insert';
                $Logmodel->reference_id = $classcategory->classsechedule_id;
                $Logmodel->table_name = 'class_sechedule_master';
                $Logmodel->user_id = 1;
                $Logmodel->save(); 
            }
           
    
            return response()->json(['data'=> $classcategory,'msg'=>'Data Update SuccessFully']);
       // }
    }else{
        return response()->json(['msg'=>'Data Not Found']); 
    }

        }

          //for deleting through api
     public function destroy($id)
     {
         
         $customer = Classsechedulemodel::where('classsechedule_id', $id)->delete();
         if($customer >0){
            $Logmodel = new Logmodel;
 
            $Logmodel->module_name ='Class Schedule  Module' ;
            $Logmodel->operation_name ='Delete';
            $Logmodel->reference_id = $id;
            $Logmodel->table_name = 'class_sechedule_master';
            $Logmodel->user_id =1;
            $Logmodel->save(); 
             return Response::json(['msg'=>'Delete Class Schedule Successfully',]);
         }else{
             return Response::json(['msg'=>'Delete Class Schedule Not Found Successfully',]);
         }
        
 
     }
     public function getsingleclassschedule($id){
        $data = DB::table('class_sechedule_master')
   
        ->join('class_master', 'class_master.class_id', '=', 'class_sechedule_master.classsechedule_name')
        ->join('room_master', 'room_master.rooom_id', '=', 'class_sechedule_master.room_id')
        ->where('class_sechedule_master.classsechedule_id',$id)
        ->select('class_sechedule_master.*', 'class_master.class_name as classname','room_master.room as room')
        ->get();
        return response()->json( $data);
     }
     public function changeclasssechedulestatus($id,$status){
        
            $Logmodel = new Logmodel;
 
            $Logmodel->module_name ='Class Schedule  Module' ;
            $Logmodel->operation_name ='Change Status';
            $Logmodel->reference_id = $id;
            $Logmodel->table_name = 'class_sechedule_master';
            $Logmodel->user_id = 1;
            $Logmodel->save(); 
    
            $customer = DB::update('update class_sechedule_master set status = ? where classsechedule_id = ?',[$status,$id]);
            return Response::json($customer);
        
     }
     public function getdropallinstuctor(){
        $data= DB::table('instuctor_master')->where('status',1)->get();
        return response()->json($data);
     }
     public function getNextUserID() 
{

 $statement = DB::select("show table status like 'instuctor_master'");

 return response()->json(['user_id' => $statement[0]->Auto_increment]);
}

     



}