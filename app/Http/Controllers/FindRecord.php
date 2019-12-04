<?php


namespace App\Http\Controllers;


use App\Record;

class FindRecord
{
    function transfer($account){

        $records = Record::where('remittance', $account->account)->orWhere('payee', $account->account)->get();
        $i = 0;
        foreach ($records as $record) {
            $remittance = $record['remittance'];
            if (strpos($remittance, 'camp') !== false) {
                $record['remittance'] = $record->with('shopRemittance')->where('remittance', $remittance)->first('remittance')->toArray();
                $data = $record['remittance'];
                $record['remittance'] = $data['shop_remittance'];
            } else {
                $record['remittance'] = $record->with('userRemittance')->where('remittance', $remittance)->first('remittance')->toArray();
                $data = $record['remittance'];
                $record['remittance'] = $data['user_remittance'];
            }
            $payee = $record['payee'];
            if (strpos($payee, 'camp') !== false) {
                $record['payee'] = $record->with('shopPayee')->where('payee', $payee)->first('payee')->toArray();
                $data = $record['payee'];
                $record['payee'] = $data['shop_payee'];
            } else {
                $record['payee'] = $record->with('userPayee')->where('payee', $payee)->first('payee')->toArray();
                $data = $record['payee'];
                $record['payee'] = $data['user_payee'];
            }
            $i++;
        }
        if (count($records) > 30) {
            $next = 50;
            $rate = 0.01;
            $account->level = 2;

        } elseif (count($records) > 50) {
            $next = 100;
            $rate = 0.3;
            $account->level = 3;
        } else {
            $next = 10;
            $rate = 0.3;
            $account->level = 1;
        }
        $account->update([
            'level' => $account->level,
        ]);
        $response['data'] = $records->toArray();
        $response['name'] = $account->name;
        $response['balance'] = $account->balance;
        $response['level'] = $account->level;
        $response['transection'] = count($records);
        $response['transection'] = count($records);
        $response['upgrade'] = $next - $response['transection'];
        $response['rate'] = $rate;
        if ($records) {
            return $response;
        } else
            return "You have no transfer record.";
    }

}
