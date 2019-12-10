<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Classcategorymodel;
use Redirect, Response;
use App\Logmodel;
use Validator;
use Illuminate\Support\Facades\DB;
class Class_CategoryController extends Controller
{
    public function index(Request $request)
    {

        return view('class_category');
    }
    public function store(Request $request)//For insert or Update Record Of Package Master --
    {
      
    
        $catid = $request->save_update;
      
        $input = $request->all();
        if($catid ==""){
        $validator = Validator::make($input, [
            'classcategory_name' => 'required',
            'statusinfo'=>'required',
            
            ]);
        }else{
            $validator = Validator::make($input, [
                'classcategory_name' => 'required',
                'statusinfo'=>'required',
                
                ]);
        }
            if($validator->fails()){

                return response()->json('less Arguments OR Class Category Already Exists ');
            }else{
                if($catid >0){
                    $data= DB::table('classcategory_master')->where('classcategory_name',$request->classcategory_name)->where('classcategory_id','!=',$catid)->get();
                    $count=count($data);
                    if($count >0){
                        return response()->json('100');
                    }{
                        $classcategory   =   Classcategorymodel::updateOrCreate(
                            ['classcategory_id' => $catid],
                            [
                                'classcategory_name'       =>   $request->classcategory_name,
                                'category_description'        =>   $request->category_description,
                                'status'=>$request->statusinfo,
                                'user_id'=>1,
                
                            ]
                
                        );
                
                       
                
                        
                        if( $catid >0){
                            $Logmodel = new Logmodel;
                
                            $Logmodel->module_name ='Class Category Module' ;
                            $Logmodel->operation_name ='Edit';
                            $Logmodel->reference_id = $catid;
                            $Logmodel->table_name = 'classcategory_master';
                            $Logmodel->user_id = 1;
                            $Logmodel->save();
                                
                        }else{
                            $Logmodel = new Logmodel;
                
                            $Logmodel->module_name ='Class Category Module' ;
                            $Logmodel->operation_name ='Insert';
                            $Logmodel->reference_id = $classcategory->classcategory_id;
                            $Logmodel->table_name = 'classcategory_master';
                            $Logmodel->user_id = 1;
                            $Logmodel->save(); 
                        }
                       
                
                        return response()->json(['data'=> $classcategory]);
                    }
                   
                }else{
                    $data= DB::table('classcategory_master')->where('classcategory_name',$request->classcategory_name)->get();
                    $count=count($data);
                    if($count >0){
                        return response()->json('100');
                    }else{
      
        $classcategory   =   Classcategorymodel::updateOrCreate(
            ['classcategory_id' => $catid],
            [
                'classcategory_name'       =>   $request->classcategory_name,
                'category_description'        =>   $request->category_description,
                'status'=>$request->statusinfo,
                'user_id'=>1,

            ]

        );

       

        
        if( $catid >0){
            $Logmodel = new Logmodel;

            $Logmodel->module_name ='Class Category Module' ;
            $Logmodel->operation_name ='Edit';
            $Logmodel->reference_id = $catid;
            $Logmodel->table_name = 'classcategory_master';
            $Logmodel->user_id = 1;
            $Logmodel->save();
                
        }else{
            $Logmodel = new Logmodel;

            $Logmodel->module_name ='Class Category Module' ;
            $Logmodel->operation_name ='Insert';
            $Logmodel->reference_id = $classcategory->classcategory_id;
            $Logmodel->table_name = 'classcategory_master';
            $Logmodel->user_id = 1;
            $Logmodel->save(); 
        }
       

        return response()->json(['data'=> $classcategory]);
    }
    }
    }

       
    }
    //for cheching Category Exist Or not
    public function checkclasscategory($catname){
        $data= DB::table('classcategory_master')->where('classcategory_name',$catname)->get();
        $count=count($data);
        
        return response()->json($count);
    }
    public function editcheckclasscategory($catname,$id){
        $data= DB::table('classcategory_master')->where('classcategory_name',$catname)->where('classcategory_id','!=',$id)->get();
        $count=count($data);
        
        return response()->json($count);
    }

    //for getting all category---
    public function getall_classcategory(){
        $data = DB::table('classcategory_master')
        ->select('classcategory_master.*')
        ->orderBy('classcategory_id','DESC')
        ->get();

        return response()->json($data);
    }
    //for deleting category
    public function deletecategory($id){
        $Logmodel = new Logmodel;

        $Logmodel->module_name ='Class Category Module' ;
        $Logmodel->operation_name ='Delete';
        $Logmodel->reference_id = $id;
        $Logmodel->table_name = 'classcategory_master';
       // $Logmodel->table_name = 'package_master';
        $Logmodel->save(); 
        $customer = Classcategorymodel::where('classcategory_id', $id)->delete();
        return Response::json($customer);
    }
    //for gettting single class 
    public function getsingleclasscategory($id){
        $data = DB::table('classcategory_master')
        ->select('classcategory_master.*')
        ->where('classcategory_id',$id)
        ->get();
        $count=count($data);
        if($count >0){
            return response()->json($data);
        }else{
            return response()->json(['msg'=>'Class Category Not Found']);
        }

       
    }
    //for deleting through api
    public function destroy($id)
    {
        $Logmodel = new Logmodel;

        $Logmodel->module_name ='Class Category Module' ;
        $Logmodel->operation_name ='Delete';
        $Logmodel->reference_id = $id;
        $Logmodel->table_name = 'classcategory_master';
       // $Logmodel->table_name = 'package_master';
        $Logmodel->save(); 
        $customer = Classcategorymodel::where('classcategory_id', $id)->delete();
        if($customer >0){
            return Response::json(['msg'=>'Delete Class Category  Successfully',]);
        }else{
            return Response::json(['msg'=>'Delete Class Category Not Successfully',]);
        }
       

    }
    public function update(Request $request, $id)
    {
        $catid = $id;

        $data = DB::table('classcategory_master')
        ->select('classcategory_master.*')
        ->where('classcategory_id',$catid)
        ->get();
        $count=count($data);
        if($count >0){
      
        $input = $request->all();
        if($catid ==""){
        $validator = Validator::make($input, [
            'classcategory_name' => 'required|unique:classcategory_master',
            'statusinfo'=>'required',
            
            ]);
        }else{
            $validator = Validator::make($input, [
                'classcategory_name' => 'required',
                'statusinfo'=>'required',
                
                ]);
        }
            if($validator->fails()){

                return response()->json('less Arguments OR Class Category Already Exists ');
            }else{
                $data= DB::table('classcategory_master')->where('classcategory_name',$request->classcategory_name)->where('classcategory_id','!=',$catid)->get();
                $count=count($data);
                if($count >0){
                    return response()->json('100');
                }{
      
        $classcategory   =   Classcategorymodel::updateOrCreate(
            ['classcategory_id' => $catid],
            [
                'classcategory_name'       =>   $request->classcategory_name,
                'category_description'        =>   $request->category_description,
                'status'=>$request->statusinfo,
                'user_id'=>1,

            ]

        );

       

        
        if( $catid >0){
            $Logmodel = new Logmodel;

            $Logmodel->module_name ='Class Category Module' ;
            $Logmodel->operation_name ='Edit';
            $Logmodel->reference_id = $catid;
            $Logmodel->table_name = 'classcategory_master';
            $Logmodel->user_id = 1;
            $Logmodel->save();
                
        }else{
            $Logmodel = new Logmodel;

            $Logmodel->module_name ='Class Category Module' ;
            $Logmodel->operation_name ='Insert';
            $Logmodel->reference_id = $classcategory->classcategory_id;
            $Logmodel->table_name = 'classcategory_master';
            $Logmodel->user_id = 1;
            $Logmodel->save(); 
        }
       

        return response()->json(['data'=> $classcategory]);
    }
    }
}else{
    return response()->json(['msg'=>'Class Category Not Founnd' ]);
}
    }

    public function categorychangestatus($id,$status){

        $data1 = DB::table('class_master')
        ->select('class_master.*')
        ->where('class_category',$id)
        ->where('status',1)
        ->get();

        $count=count($data1);
        if($count >0){
            return Response::json('100');
        }else{
            $Logmodel = new Logmodel;
 
            $Logmodel->module_name ='Class Category Module' ;
            $Logmodel->operation_name ='Change Status';
            $Logmodel->reference_id = $id;
            $Logmodel->table_name = 'classcategory_master';
            $Logmodel->user_id = 1;
            $Logmodel->save(); 
    
            $customer = DB::update('update classcategory_master set status = ? where classcategory_id = ?',[$status,$id]);
            return Response::json($customer);
        }

         
        
     }

      //for getting all category---
    public function getdesibleall_classcategory(){
        $result=array();
        $data = DB::table('classcategory_master')
        ->select('classcategory_master.*')
        ->orderBy('classcategory_id','DESC')
        ->get();

        $count=count($data);

        if($count >0){
            foreach($data as $categorydata){
                $classcategory_id=$categorydata->classcategory_id;
                $classcategory_name=$categorydata->classcategory_name;
                $category_description=$categorydata->category_description;
                $status=$categorydata->status;
                $active="";
                if($classcategory_id >0 ){
                    $data2 = DB::table('class_master')
                    ->select('class_master.*')
                    ->where('class_category',$classcategory_id)
                    ->get();
                    $count1=count($data2);
                    if($count1 >0 ){
                        $active=1; 
                    }else{
                        $active=0; 
                    }


                }
                $result[]=array(
                    'classcategory_id'=>$classcategory_id,
                    'classcategory_name'=>$classcategory_name,
                    'category_description'=>$category_description,
                    'status'=>$status,
                    'active'=>$active,
                );
            }
        }

        return response()->json($result);
    }
}