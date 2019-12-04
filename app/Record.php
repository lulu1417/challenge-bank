<?php

namespace App;
use App\ShopWallet;
use Illuminate\Database\Eloquent\Model;

class Record extends Model
{
    protected $fillable = [
        'remittance', 'payee', 'amount', 'charging'
    ];
    public function userRemittance()
    {
        return $this->belongsTo(UserWallet::class, 'remittance','account');
    }
    public function userPayee()
    {
        return $this->belongsTo(UserWallet::class, 'payee','account');
    }
    public function shopRemittance()
    {
        return $this->belongsTo(ShopWallet::class, 'remittance','account');
    }
    public function shopPayee()
    {
        return $this->belongsTo(ShopWallet::class, 'payee','account');
    }
}
