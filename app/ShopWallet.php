<?php

namespace App;

use App\Record;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class ShopWallet extends Authenticatable
{
    protected $fillable = [
        'name', 'account', 'password', 'api_token', 'key', 'balance', 'level',
    ];
    protected $hidden = [
        'password', 'updated_at'
    ];

    public function payment()
    {
        return $this->hasMany(Record::class, 'remittance', 'account');
    }
    public function collection()
    {
        return $this->hasMany(Record::class, 'account','payee');
    }


}
