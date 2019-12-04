<?php
namespace App\Http\Controllers;
use App\Charging;
use App\ShopWallet;

class AccountController{

    static function deduct($amount, $account)
    {
        if($account->level == 3){
            $charging = 0;
        }elseif ($account->level == 2){
            $charging = $amount * 0.2;
        }else{
            $charging = $amount * 0.3;
        }
        if($account->balance > $amount + $charging){
            $account->balance -= $amount + $charging;
            $account->update(['balance' => $account->balance]); $bank = ShopWallet::where('name', 'Bank')->first();
            $bank->balance += $charging;
            $bank->update(['balance' => $bank->balance]);
            return $charging;
        }else{
            return -1;
        }

    }
    static function increase($amount, $account)
    {
        $account->balance += $amount;
        $account->update(['balance' => $account->balance]);
    }
}
