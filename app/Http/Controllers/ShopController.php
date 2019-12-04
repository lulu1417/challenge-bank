<?php

namespace App\Http\Controllers;

use App\Record;
use App\UserWallet;
use App\ShopWallet;
use http\Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class ShopController extends BaseController
{

    public function index()
    {
        $account = Auth::user()->account;
        $find = new FindRecord;
        $records = $find->transfer($account);
        if (Auth::user()->name == 'Bank') {
            $records = Record::orderBy('created_at','desc')->get();
        }
        if ($records) {
            return response()->json($records);
        } else
            return "You have no transfer record.";
    }


    public function store(Request $request)
    {
        date_default_timezone_set('Asia/Taipei');
        Log::info($request->input());
        try {
            $request->validate([
                'account' => ['required', 'email', 'unique:shop_wallets'],
                'password' => ['required', 'string', 'min:6', 'max:12'],
            ]);

            $apiToken = Str::random(10);
            $hashedPassword = Hash::make($request['password']);
            $create = ShopWallet::create([
                'name' => $request['camp'],
                'account' => $request['account'],
                'password' => $hashedPassword,
                'balance' => 10000,
                'level' => 1,
                'key' => rand(),
                'api_token' => $apiToken,
            ]);

            if ($create) {
                session()->put(['data' => $create]);
                return "Register successfully, and you got $10000.";
            }

        } catch (Exception $e) {
            sendError($e, 'Registered failed.', 500);
        }
    }

    public function login(Request $request)
    {
        try {
            Log::info($request->input());
            if (!$num = ShopWallet::where('account', $request['account'])->get()->count()) {
                $message = "Shop owner name not found！";
                return $this->sendError($message, 400);
            }
            $hashedPassword = ShopWallet::where('account', $request['account'])->first()->password;
            $shopwallet = ShopWallet::where('account', $request['account'])->first();
            $apiToken = Str::random(10);
            if (!Hash::check($request['password'], $hashedPassword)) {
                return response()->json("Wrong password！", 400);
            } else {
                if ($shopwallet->update(['api_token' => $apiToken])) { //update api_token
                    return response()->json($shopwallet);
                }
            }
        } catch (Exception $error) {
            return $this->sendError($error->getMessage(), 400);
        }
    }

    public function admin()
    {
        $others = ShopWallet::where('name', '!=', 'Bank')->get();
        return $this->sendResponse($others->toArray(), ShopWallet::where('name', 'Bank')->first());
    }

    public function transfer(Request $request)
    {
        try {
            DB::beginTransaction();
            date_default_timezone_set('Asia/Taipei');
            Log::info($request->all());
            $amount = $request->amount;

            //deduct remittance's money
            $remittance = Auth::user();

            $charging = AccountController::deduct($amount, $remittance);
            if ($charging < 0) {
                return response()->json("your money is not enough", 401);
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
            $create['balance'] = $remittance->balance;
            DB::commit();
            return response()->json($create);

        } catch (Exception $error) {
            DB::rollback();
            if (strpos($error->getMessage(), '1366') !== false) {
                $message = "Your money is not enough！";
                return $this->sendError($message, 400);
            }
            return $this->sendError($error->getMessage(), 400);
        }
    }

    public function logout()
    {
        if (auth::user()->update(['api_token' => null])) {
            return "You've logged out";
        }
    }

    public
    function update($id)
    {
        $user = Record::find($id);
        $user->delete();
        return $this->sendResponse($user->toArray(), 'delete successfully.');
    }

}
