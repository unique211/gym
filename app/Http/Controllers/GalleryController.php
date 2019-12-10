<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Gallarymodel;

use Illuminate\Support\Facades\DB;
use Redirect, Response;
use App\Logmodel;
use Validator;
class GalleryController extends Controller
{
    public function index(Request $request)
    {

        return view('gallery');
    }

    public function galleryuploadimg(Request $request){
       

        $extension = $request->file('file')->getClientOriginalExtension();
       
        $dir = 'gallaryimg/';
        $filename = uniqid() . '_' . time() . '.' . $extension;

       // echo  dd($filename); 
        $request->file('file')->move($dir, $filename);

        
        return $filename;
        }

        public function store(Request $request)//For insert or Update Record Of Room Master --
        {
          
        
            $catid = $request->save_update;
          
            $input = $request->all();
            
    
          //  dd($request->uploadimg_hidden);
            if($catid ==""){
            $validator = Validator::make($input, [
                'uploadimg_hidden' => 'required',
              
                'likes'=>'required',
                'allowshare'=>'required',
            
                
                ]);
            }else{
                $validator = Validator::make($input, [
                    'uploadimg_hidden' => 'required',
                   
                     'likes'=>'required',
                     'allowshare'=>'required',
                    
                    ]);
            }
                if($validator->fails()){
    
                    return response()->json('less Arguments ');
                }else{
                  
    
                   
          
            $dealdata   =   Gallarymodel::updateOrCreate(
                ['gallary_id' => $catid],
                [
                    'uploadimg'       =>   $request->uploadimg_hidden,
                    'nooflike'=>$request->likes,
                    'allowshare'=> $request->allowshare,
                    'user_id'=>1,
    
                ]
    
            );
    
           
    
            
            if( $catid >0){
                $Logmodel = new Logmodel;
    
                $Logmodel->module_name ='Gallary Master Module' ;
                $Logmodel->operation_name ='Edit';
                $Logmodel->reference_id = $catid;
                $Logmodel->table_name = 'gallary_master';
                $Logmodel->user_id = 1;
                $Logmodel->save();
                    
            }else{
                $Logmodel = new Logmodel;
    
                $Logmodel->module_name ='Gallary Master Module' ;
                $Logmodel->operation_name ='Insert';
                $Logmodel->reference_id = $dealdata->gallary_id;
                $Logmodel->table_name = 'gallary_master';
                $Logmodel->user_id = 1;
                $Logmodel->save(); 
            }
           
    
            return response()->json(['data'=> $dealdata]);
        }
    
            //return Response::json($package);
        }
        public function getallgallary(){
            $data = DB::table('gallary_master')
            ->select('gallary_master.*')
            ->where('allowshare',1)
           ->orderBy('gallary_id', 'DESC')
          
            ->get();

            return Response::json($data);
        }

        public function getsingleallgallary($id){
            $data = DB::table('gallary_master')
            ->select('gallary_master.*')
            ->where('allowshare',1)
            ->where('gallary_id',$id)
           ->orderBy('gallary_id', 'DESC')
          
            ->get();
            $count=count($data);
            if($count >0){
                return Response::json($data);
            }else{
                return Response::json(['msg'=>'Record Not Found']); 
            }

            
        }
        public function changepostshare($id,$status){
           
            $Logmodel = new Logmodel;

            $Logmodel->module_name ='Gallary Master Module' ;
            $Logmodel->operation_name ='Change Allowshare';
            $Logmodel->reference_id = $id;
            $Logmodel->table_name = 'gallary_master';
            $Logmodel->user_id = 1;
            $Logmodel->save(); 
    
            $customer = DB::update('update gallary_master set allowshare = ? where gallary_id = ?',[$status,$id]);
            return Response::json($customer);
        }
        public function deletegallary($id){
            $Logmodel = new Logmodel;
    
            $Logmodel->module_name ='Gallary Master Module' ;
            $Logmodel->operation_name ='Delete';
            $Logmodel->reference_id = $id;
            $Logmodel->table_name = 'gallary_master';
           // $Logmodel->table_name = 'package_master';
            $Logmodel->save(); 
            $customer = Gallarymodel::where('gallary_id', $id)->delete();
            return Response::json($customer);
        }

        //for api update

        public function update(Request $request, $id)
        {
            $catid = $id;
          
            $input = $request->all();
            
    
          //  dd($request->uploadimg_hidden);
            if($catid ==""){
            $validator = Validator::make($input, [
                'uploadimg_hidden' => 'required',
              
                'likes'=>'required',
                'allowshare'=>'required',
            
                
                ]);
            }else{
                $validator = Validator::make($input, [
                    'uploadimg_hidden' => 'required',
                   
                     'likes'=>'required',
                     'allowshare'=>'required',
                    
                    ]);
            }
                if($validator->fails()){
    
                    return response()->json('less Arguments ');
                }else{
                  
    
                   
          
            $dealdata   =   Gallarymodel::updateOrCreate(
                ['gallary_id' => $catid],
                [
                    'uploadimg'       =>   $request->uploadimg_hidden,
                    'nooflike'=>$request->likes,
                    'allowshare'=> $request->allowshare,
                    'user_id'=>1,
    
                ]
    
            );
    
           
    
            
            if( $catid >0){
                $Logmodel = new Logmodel;
    
                $Logmodel->module_name ='Gallary Master Module' ;
                $Logmodel->operation_name ='Edit';
                $Logmodel->reference_id = $catid;
                $Logmodel->table_name = 'gallary_master';
                $Logmodel->user_id = 1;
                $Logmodel->save();
                    
            }else{
                $Logmodel = new Logmodel;
    
                $Logmodel->module_name ='Gallary Master Module' ;
                $Logmodel->operation_name ='Insert';
                $Logmodel->reference_id = $dealdata->gallary_id;
                $Logmodel->table_name = 'gallary_master';
                $Logmodel->user_id = 1;
                $Logmodel->save(); 
            }
           
    
            return response()->json(['data'=> $dealdata]);
        }
    
     
        }
        public function destroy($id)
        {
            $Logmodel = new Logmodel;
    
            $Logmodel->module_name ='Gallary Master Module' ;
            $Logmodel->operation_name ='Delete';
            $Logmodel->reference_id = $id;
            $Logmodel->table_name = 'gallary_master';
           // $Logmodel->table_name = 'package_master';
            $Logmodel->save(); 
            $customer = Gallarymodel::where('gallary_id', $id)->delete();
            if($customer >0){
                return Response::json(['msg'=>'Delete Record  Successfully',]);
            }else{
                return Response::json(['msg'=>'Delete Record Not Successfully',]);
            }
           
    
        }
        
}