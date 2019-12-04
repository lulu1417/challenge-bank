<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class UserWallet extends Authenticatable
{
    protected $fillable = [
        'name', 'account', 'password', 'api_token', 'key', 'balance','level',
    ];
    protected $hidden = [
        'password',
    ];


}
