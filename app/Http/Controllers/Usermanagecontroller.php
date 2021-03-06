<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Usermanagecontroller extends Controller
{
    //
    public function index(Request $request)
    {
        if (!$request->session()->exists('userid')) {
            // user value cannot be found in session
            return redirect('/');
        } else {
            return view('usermanagement');
        }
    }

    public function login_request(Request $request)
    {

        $userid = $request->mobile_no;
        $password = $request->mac_address;
        $result = array();







        $where = array('link_relation_ship.userid' => $userid);
        $data = DB::table('link_relation_ship')
            ->select('link_relation_ship.*', 'member_master.balancepoint')
            ->join('member_master', 'member_master.member_id', '=', 'link_relation_ship.member_id')
            ->where($where)
            ->get();

        $cnt = count($data);
        if ($cnt > 0) {
            foreach ($data as $val) {
                $pass = $val->password;
                if ($pass == "") {
                    DB::table('link_relation_ship')
                        ->where('userid', $userid)
                        ->update(['password' => $password]);
                    $result[] = array(
                        'username' => $userid,
                        'name' => $val->name,
                        'blance' => $val->balancepoint,
                        'link_id' => $val->linkrelid,
                        'member_id' => $val->member_id,
                    );
                    return response()->json(['data' => $result, 'status' => 1]);
                } else {
                    $where = array('link_relation_ship.userid' => $userid, 'link_relation_ship.password' => $password);
                    $data2 = DB::table('link_relation_ship')
                        ->select('link_relation_ship.*', 'member_master.balancepoint')
                        ->join('member_master', 'member_master.member_id', '=', 'link_relation_ship.member_id')
                        ->where($where)
                        ->get();

                    $cnt2 = count($data2);
                    if ($cnt2 > 0) {

                        foreach ($data2 as $val2) {
                            $result[] = array(
                                'username' => $userid,
                                'name' => $val2->name,
                                'balance' => $val2->balancepoint,
                                'link_id' => $val2->linkrelid,
                                'member_id' => $val2->member_id,
                            );
                        }

                        return response()->json(['data' => $result, 'status' => 1]);
                    } else {
                        return response()->json(['data' => $result, 'status' => 0]);
                    }
                }
            }
        } else {

            return response()->json(['data' => $result, 'status' => 0]);
        }




        //dd($endtime);




    }
    public function member_profile(Request $request)
    {

        $userid = $request->mobile_no;


        $result = array();





        $where = array('link_relation_ship.userid' => $userid);
        $data = DB::table('link_relation_ship')
            ->select('link_relation_ship.*', 'member_master.balancepoint', 'member_master.membertype', 'member_master.dateofexpire', 'member_master.currentpackage', 'package_master.package_name')
            ->join('member_master', 'member_master.member_id', '=', 'link_relation_ship.member_id')
            ->join('package_master', 'package_master.packege_id', '=', 'member_master.currentpackage')
            ->where($where)
            ->get();

        $cnt = count($data);
        if ($cnt > 0) {


            foreach ($data as $val) {

                $result[] = array(
                    'name' => $val->name,
                    'user_id' => $val->userid,
                    'balance_point' => $val->balancepoint,
                    'address' => $val->address,
                    'email_id' => $val->email_id,
                    'dob' => $val->dob,
                    'current_package_name' => $val->package_name,
                    'member_type' => $val->membertype,
                    'date_of_expire' => $val->dateofexpire,
                    'image_url' =>  $val->image,
                );
            }
            return response()->json(['data' => $result, 'status' => 1]);
        } else {

            return response()->json(['data' => $result, 'status' => 0]);
        }
    }

    public function update_member_api(Request $request)
    {


        if ($request->has('file')) {
            $extension = $request->file('file')->getClientOriginalExtension();
        $dir = 'gallaryimg/member/';
        $filename = uniqid() . '_' . time() . '.' . $extension;

        // echo  dd($filename);
        $request->file('file')->move($dir, $filename);
        $image_name = $filename;

        $userid = $request->mobile_no;

        $data = array(
            'name' => $request->name,
            'address' => $request->address,
            'email_id' => $request->email_id,
            'dob' => $request->dob,
            'image' =>  $image_name,
        );
        DB::table('link_relation_ship')
            ->where('userid', $userid)
            ->update($data);

        return response()->json(['status' => 1]);
        } else{
            $userid = $request->mobile_no;

            $data = array(
                'name' => $request->name,
                'address' => $request->address,
                'email_id' => $request->email_id,
                'dob' => $request->dob,

            );
            DB::table('link_relation_ship')
                ->where('userid', $userid)
                ->update($data);
                return response()->json(['status' => 1]);
        }



    }



    public function user_settings(Request $request)
    {

        $userid = $request->mobile_no;


        $result = array();





        $where = array('link_relation_ship.userid' => $userid);
        $data = DB::table('link_relation_ship')
            ->select('link_relation_ship.*', 'user_settings.receive_mobile_notification', 'user_settings.prompt_me', 'user_settings.language')
            ->join('user_settings', 'user_settings.link_id', '=', 'link_relation_ship.linkrelid')
            ->where($where)
            ->get();

        $cnt = count($data);
        if ($cnt > 0) {
            $notification = "";
            $prompt_me = "";
            $language = "";

            foreach ($data as $val) {
                if ($val->receive_mobile_notification == 0) {
                    $notification = "False";
                } else {
                    $notification = "True";
                }

                if ($val->prompt_me == 0) {
                    $prompt_me = "False";
                } else {
                    $prompt_me = "True";
                }

                if ($val->language == 1) {
                    $language = "English";
                } else {
                    $language = "Chinese";
                }

                $result[] = array(
                    'receive_mobile_notification' => $notification,
                    'prompt_me' => $prompt_me,
                    'language' => $language,
                );
            }
            return response()->json(['data' => $result, 'status' => 1]);
        } else {

            return response()->json(['data' => $result, 'status' => 0]);
        }




        //dd($endtime);




    }

    public function update_user_settings_api(Request $request)
    {

        $link_id = $request->link_id;


        $data1 = DB::table('user_settings')
            ->select('user_settings.*')
            ->where('link_id', $link_id)
            ->get();

        date_default_timezone_set('Asia/Kolkata');
        $date = date("Y-m-d H:i:s");

        $cnt = count($data1);
        if ($cnt > 0) {
            $data = array(
                'receive_mobile_notification' => $request->receive_mobile_notification,
                'prompt_me' => $request->prompt_me,
                'language' => $request->language,
                'update_date' => $date,
            );
            DB::table('user_settings')
                ->where('link_id', $link_id)
                ->update($data);

            return response()->json(['status' => 1, '' => 'Data Updated']);
        } else {
            $data = array(
                'receive_mobile_notification' => $request->receive_mobile_notification,
                'prompt_me' => $request->prompt_me,
                'language' => $request->language,
                'add_date' => $date,
                'update_date' => $date,
                'link_id' => $link_id,
            );
            $insert_data =  DB::table('user_settings')
            ->Insert($data);
            return response()->json(['status' => 1, '' => 'Data Inserted']);
        }





        //dd($endtime);




    }
}
