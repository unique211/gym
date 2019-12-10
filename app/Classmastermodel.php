<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Classmastermodel extends Model
{
    //
    public $primaryKey = 'class_id';
    protected $table = "class_master";
    protected $fillable = [
        'class_name', 'class_category','class_description','status','user_id',
    ];
}
