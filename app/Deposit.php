<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Deposit extends Model
{
    protected $fillable = [
        'account', 'deposit', 'withdraw'
    ];
    protected $hidden = [
        'updated_at'
    ];
    public function account()
    {
        return $this->belongsTo(UserWallet::class, 'account','account');
    }
}
