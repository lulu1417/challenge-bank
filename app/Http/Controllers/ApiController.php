<?php

namespace App\Http\Controllers;

use App\Record;
use App\ShopWallet;
use App\UserWallet;
use App\Deposit;
use http\Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ApiController extends BaseController
{
    public function userIndex(Request $request)
    {
        $exist = UserWallet::where('key', $request['key'])->get()->count();
        if ($exist) {
            $account = UserWallet::where('key', $request['key'])->first();
            $find = new FindRecord;
            $records = $find->transfer($account);
            return response()->json($records);
        } else {
            $message = "wrong account or key";
            return response()->json($message, 401);
        }
    }

    public function shopIndex(Request $request)
    {
        $exist = ShopWallet::where('key', $request['key'])->where('account', $request['userID'])->get()->count();
        if ($exist) {
            $account = ShopWallet::where('account', $request['userID'])->where('key', $request['key'])->first();
            $find = new FindRecord;
            $records = $find->transfer($account);

            if ($records) {
                return response()->json($records);
            }
        } else {
            $message = "wrong account or key";
            return response()->json($message, 401);
        }
    }

    public function shopTransfer(Request $request)
    {
        try {
            $exist = ShopWallet::where('account', $request['userID'])->where('key', $request['key'])->get()->count();
            if ($exist) {
                if ($request['userID'] == $request['account']) {
                    $message = "can't transfer to yourself.";
                    return response()->json($message, 400);
                }
                DB::beginTransaction();
                date_default_timezone_set('Asia/Taipei');
                Log::info($request->all());
                $amount = $request->amount;
                if ($amount < 9) {
                    return response()->json("amount must greater than 10", 400);
                }
                //deduct remittance's money
                $remittance = ShopWallet::where('account', $request['userID'])->where('key', $request['key'])->first();
                $charging = AccountController::deduct($amount, $remittance);
                if ($charging < 0) {
                    return response()->json("your money is not enough", 400);
                }
                //increase payee's money
                if (strpos($request->account, 'camp') !== false) {
                    $payee = ShopWallet::where('account', $request['account'])->first();
                } else {
                    $payee = UserWallet::where('account', $request['account'])->first();
                }
                AccountController::increase($amount, $payee);
                $create = Record::create([
                    'remittance' => $remittance->account,
                    'payee' => $payee->account,
                    'amount' => $request->amount,
                    'charging' => $charging,
                ]);
                $create['remittance_balance'] = $remittance->balance;
                $create['payee_balance'] = $payee->balance;
                DB::commit();
                return response()->json($create);
            } else {
                $message = "wrong account or key";
                return response()->json($message, 401);
            }

        } catch (Exception $error) {
            DB::rollback();
            return $this->sendError($error->getMessage(), 400);
        }
    }

    public function userTransfer(Request $request)
    {
        try {
            $exist = UserWallet::where('key', $request['key'])->get()->count();
            if ($exist) {
                if ($request['userID'] == $request['account']) {
                    $message = "can't transfer to yourself.";
                    return response()->json($message, 400);
                }
                DB::beginTransaction();
                date_default_timezone_set('Asia/Taipei');
                Log::info($request->all());
                $amount = $request->amount;
                if ($amount < 9) {
                    return response()->json("amount must greater than 10", 400);
                }
                //deduct remittance's money
                $remittance = UserWallet::where('account', $request['userID'])->where('key', $request['key'])->first();
                $charging = AccountController::deduct($amount, $remittance);
                if ($charging < 0) {
                    return response()->json("your money is not enough", 400);
                }
                //increase payee's money
                if (strpos($request->account, 'camp') !== false) {
                    $payee = ShopWallet::where('account', $request['account'])->first();
                } else {
                    $payee = UserWallet::where('account', $request['account'])->first();
                }
                AccountController::increase($amount, $payee);
                $create = Record::create([
                    'remittance' => $remittance->account,
                    'payee' => $payee->account,
                    'amount' => $request->amount,
                    'charging' => $charging,
                ])->toArray();
                $create['remittance_balance'] = $remittance->balance;
                $create['payee_balance'] = $payee->balance;
                DB::commit();
                return response()->json($create);
            } else {
                $message = "wrong account or key";
                return response()->json($message, 401);
            }

        } catch (Exception $error) {
            DB::rollback();
            if (strpos($error->getMessage(), '1366') !== false) {
                $message = "Your money is not enough！";
                return response()->json($message, 401);
            }
            return $this->sendError($error->getMessage(), 400);
        }
    }

    function deposit(Request $request)
    {
        $exist = UserWallet::where('key', $request['key'])->get()->count();
        if ($exist) {
            $account = UserWallet::where('key', $request['key'])->first();
            AccountController::increase($request->amount, $account);
            $create = Deposit::create([
                'account' => $account->account,
                'deposit' => $request->amount,
                'withdraw' => 0
            ]);
            $create['balance'] = $account->balance;
            return response()->json($create);
        } else {
            return $this->sendError("wrong account or key", 400);
        }
    }

    function depositRecord(Request $request)
    {
        $account = UserWallet::where('key', $request['key'])->first();
        $records = Deposit::where('account', $account->account)->get();
        return $records;

    }

    function withdraw(Request $request)
    {
        $exist = UserWallet::where('key', $request['key'])->get()->count();
        if ($exist) {
            $account = UserWallet::where('key', $request['key'])->first();
            AccountController::deduct($request->amount, $account);
            $create = Deposit::create([
                'account' => $account->account,
                'deposit' => 0,
                'withdraw' => $request->amount,
            ]);
            $create['balance'] = $account->balance;
            return response()->json($create);
        } else {
            return $this->sendError("no record", 400);
        }
    }
}
