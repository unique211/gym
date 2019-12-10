<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Redirect, Response;
use App\Useraccessmodel;
use App\Loginmastermodel;
use App\Logmodel;
use Session;

class UserAccessController extends Controller
{
    public function index(Request $request)
    {

        return view('user_access');
    }
    public function getallprofileright($usertype){
        $profile= DB::table('profile_master')->where('profile_type',$usertype)->get();
        $count=count($profile);
        if($count >0){
            foreach($profile as $profiledata){
                $id=$profiledata->profile_id;
                if($id > 0){
                     $result =  DB::table('profile_details')
                     ->where('profileid',$id)
                     ->get(); 
                     return Response::json($result);
                }
            }
        }


     }

     public function checkemailaddress($userid){
        $profile= DB::table('useraccess_master')->where('email_id',$userid)->get();
       $count=count($profile);
       return Response::json($count);

    }
    public function checkusername($name){
        $profile= DB::table('useraccess_master')->where('user_name',$name)->get();
        $count=count($profile);
        return Response::json($count);
    }
    public function store(Request $request)
    {
        $ID = $request->save_update;

        if($ID >0){
            $data= DB::table('useraccess_master')->where('user_name',$request->name)->where('useraccess_id','!=',$ID)->get();
            $count=count($data);
            if($count >0){
                return response()->json('100');
            }else{
                $data= DB::table('login_master')->where('user_id',$request->email)->where('ref_id','!=',$ID)->get();
                $count=count($data);
                if($count > 0){
                    return response()->json('101');
                }else{
                    $customer   =   Useraccessmodel::updateOrCreate(
                      
                        ['useraccess_id' => $ID],
                        [
                            'user_name'        =>  $request->name,
                            'email_id'        =>  $request->email,
                            'mobileno'        =>  $request->phone,
                            'status'        => 1,
                            'user_id'        => 1,
                        ]
            
                    );
                    $ref_id = $customer->useraccess_id;
            
                    $urdata = $request->studejsonObj;
                    $u_rights = "";
                    $cnt = 0;
                    
                  
                    
            
                    foreach ($urdata as $value) {
                       
            
                        $u_rights = array(
                            'useraccess_id' => $ref_id,
                            'menuid' => $value["menuid"],
                            'submenuid' =>$value["submenu"],
                            'userright' =>$value["permission"] ,
                        );
                        $result =  DB::table('user_right_details')
                        ->where('menuid',$value["menuid"])
                        ->where('submenuid',$value["submenu"])
                        ->where('useraccess_id',$ref_id)
                        ->get();
                   
                        $count=count($result);
                        if($count >0){
            
                        }else{
                            $result =  DB::table('user_right_details')
                            ->Insert($u_rights);
                        }
            
                      
                        $cnt++;
                    }
                    $str = $request->password;
        
                    $role =    $request->user_type;
                    if ($str != "") {
                        $md5 = md5($str);
                        $password = base64_encode($md5);
                        $customer2   =   Loginmastermodel::updateOrCreate(
                            ['ref_id' => $ref_id, 'role' => $role],
                            [
            
                                'user_id'        =>   $request->user_id,
                                'password'        =>   $password,
                                'role'        =>    $role,
            
                            ]
            
                        );
                    } else {
                        $customer2   =   Loginmastermodel::updateOrCreate(
                            ['ref_id' => $ref_id, 'role' => $role],
                            [
                                'user_id'        =>   $request->user_id,
                                'role'        =>    $role,
                            ]
            
                        );
                    }
            
                    if( $ID >0){
                        $Logmodel = new Logmodel;
            
                        $Logmodel->module_name ='User Access  Module' ;
                        $Logmodel->operation_name ='Edit';
                        $Logmodel->reference_id = $ID;
                        $Logmodel->table_name = 'useraccess_master';
                       // $Logmodel->table_name = 'package_master';
                        $Logmodel->save();
                            
                    }else{
                        $Logmodel = new Logmodel;
            
                        $Logmodel->module_name ='User Access Module' ;
                        $Logmodel->operation_name ='Insert';
                        $Logmodel->reference_id = $ref_id;
                        $Logmodel->table_name = 'useraccess_master';
                       // $Logmodel->table_name = 'package_master';
                        $Logmodel->save(); 
                    }
                    return Response::json($ref_id);
                }

               
            }
        }else{
            $data= DB::table('useraccess_master')->where('user_name',$request->name)->get();
            $count=count($data);
            if($count >0){
                return response()->json('100');
            }else{ 
                $data= DB::table('login_master')->where('user_id',$request->email)->get();
                $count=count($data);
                if($count > 0){
                    return response()->json('101');
                }else{
                    $customer   =   Useraccessmodel::updateOrCreate(
                        ['useraccess_id' => $ID],
                        [
                            'user_name'        =>  $request->name,
                            'email_id'        =>  $request->email,
                            'mobileno'        =>  $request->phone,
                            'status'        => 1,
                            'user_id'        => 1,
                        ]
            
                    );
                    $ref_id = $customer->useraccess_id;
            
                    $urdata = $request->studejsonObj;
                    $u_rights = "";
                    $cnt = 0;
                    
                  
                    
            
                    foreach ($urdata as $value) {
                       
            
                        $u_rights = array(
                            'useraccess_id' => $ref_id,
                            'menuid' => $value["menuid"],
                            'submenuid' =>$value["submenu"],
                            'userright' =>$value["permission"] ,
                        );
                        $result =  DB::table('user_right_details')
                        ->where('menuid',$value["menuid"])
                        ->where('submenuid',$value["submenu"])
                        ->where('useraccess_id',$ref_id)
                        ->get();
                   
                        $count=count($result);
                        if($count >0){
            
                        }else{
                            $result =  DB::table('user_right_details')
                            ->Insert($u_rights);
                        }
            
                      
                        $cnt++;
                    }
                    $str = $request->password;
        
                    $role =    $request->user_type;
                    if ($str != "") {
                        $md5 = md5($str);
                        $password = base64_encode($md5);
                        $customer2   =   Loginmastermodel::updateOrCreate(
                            ['ref_id' => $ref_id, 'role' => $role],
                            [
            
                                'user_id'        =>   $request->user_id,
                                'password'        =>   $password,
                                'role'        =>    $role,
            
                            ]
            
                        );
                    } else {
                        $customer2   =   Loginmastermodel::updateOrCreate(
                            ['ref_id' => $ref_id, 'role' => $role],
                            [
                                'user_id'        =>   $request->user_id,
                                'role'        =>    $role,
                            ]
            
                        );
                    }
            
                    if( $ID >0){
                        $Logmodel = new Logmodel;
            
                        $Logmodel->module_name ='User Access' ;
                        $Logmodel->operation_name ='Edit';
                        $Logmodel->reference_id = $ID;
                        $Logmodel->table_name = 'useraccess_master';
                       // $Logmodel->table_name = 'package_master';
                        $Logmodel->save();
                            
                    }else{
                        $Logmodel = new Logmodel;
            
                        $Logmodel->module_name ='User Access' ;
                        $Logmodel->operation_name ='Insert';
                        $Logmodel->reference_id = $ref_id;
                        $Logmodel->table_name = 'useraccess_master';
                       // $Logmodel->table_name = 'package_master';
                        $Logmodel->save(); 
                    }
                    return Response::json($ref_id);
                }
            } 
        }

       


    }
    public function getall_useraccess(){
        $getresult=array();
        $result =  DB::table('useraccess_master')
        
        ->get();

        $count=count($result);

        if($count >0){
            foreach($result as $data){
                $useraccess_id=$data->useraccess_id;
                $user_name=$data->user_name;
                $email_id=$data->email_id;
                $mobileno=$data->mobileno;
             
                $status=$data->status;
                $userid="";
                $role="";
                if($useraccess_id >0){
                   
                    $result1 =  DB::table('login_master')
                    ->where('ref_id',$useraccess_id)
                    ->where('role','!=','Instructor')
                    ->get();
                    foreach($result1 as $data1){
                        $userid=$data1->user_id;
                        $role=$data1->role;
                    }
                    
                }
                $getresult[]=array(
                        'useraccess_id'=>$useraccess_id,
                        'user_name'=>$user_name,
                        'email_id'=>$email_id,
                        'mobileno'=>$mobileno,
                        'role'=>$role,
                        'userid'=>$userid,
                        'status'=>$status,

                );  
            }
        }
        
        return Response::json($getresult);
    }

    public function getedituserright($id){
        $result =  DB::table('user_right_details')
        ->where('useraccess_id',$id)
        ->get(); 
        return Response::json($result);
    }
    public function useracessrightdel(Request $request){
        $result =  DB::table('user_right_details')->where('useraccess_id', $request->save_update)->delete();
        return Response::json($result); 
    }
    public function deleteuseraccess($id){

       // DB::table('login_master')->where('ref_id', $id)->where('role',$id)delete();
    // DB::update('update login_master set status = ? where ref_id = ? And  role !=? ',[0,$id,"Instructor"]);
   
    DB::table('login_master')->where('ref_id', $id)->where('role','!=','Instructor')->delete();
    
    DB::table('user_right_details')->where('useraccess_id', $id)->delete();
        $Logmodel = new Logmodel;
            
        $Logmodel->module_name ='User Access  Module' ;
        $Logmodel->operation_name ='Delete';
        $Logmodel->reference_id = $id;
        $Logmodel->table_name = 'useraccess_master';
       // $Logmodel->table_name = 'package_master';
        $Logmodel->save();
        
        
        $result =  DB::table('useraccess_master')->where('useraccess_id', $id)->delete();
        return Response::json($result); 
    }
     

}