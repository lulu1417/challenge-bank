<?php

namespace App\Http\Controllers;

use App\Http\Controllers\AccountController as AccountController;
use App\ShopWallet;
use App\UserWallet;
use App\Record;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Validator;

class UserController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $account = Auth::user()->account;
        $find = new FindRecord;
        $records = $find->transfer($account);
        return response()->json($records);
        if ($records) {
            return $this->sendResponse($records->toArray(), $response);
        } else
            return "You have no transfer record.";
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            date_default_timezone_set('Asia/Taipei');
            $request->validate([
                'account' => ['required', 'email', 'unique:user_wallets'],
                'password' => ['required', 'string', 'min:6', 'max:12'],
                'name' => ['required']
            ]);

            $apiToken = Str::random(10);

            $hashedPassword = Hash::make($request['password']);
            $create = UserWallet::create([
                'camp' => $request['camp'],
                'name' => $request['name'],
                'account' => $request['account'],
                'password' => $hashedPassword,
                'balance' => 10000,
                'level' => 1,
                'key' => rand(),
                'api_token' => $apiToken,
            ]);
            $create = $create->toArray();
            if ($create) {
                unset($create['api_token']);
                return response()->json($create);
            }

        } catch (Exception $e) {
            sendError($e, 'Registered failed.', 500);
        }
    }

    public function login(Request $request)
    {
        try{
            Log::info($request->input());
            $hashedPassword = UserWallet::where('account', $request['account'])->first()->password;
            $userwallet = UserWallet::where('account', $request['account'])->first();
            $apiToken = Str::random(10);
            if (Hash::check($request['password'], $hashedPassword)) {
                if ($userwallet->update(['api_token' => $apiToken])) { //update api_token
                    $response['name'] = $userwallet->name;
                    $response['account'] = $userwallet->account;
                    $response['api_token'] = $apiToken;
                    $response['key'] = $userwallet->key;
                    return response()->json($response);
                }
            }else{
                return $this->sendError("Wrong password！", 400);

            }
        }catch (Exception $error) {
            if (strpos($error->getMessage(), 'non-object') !== false) {
                $message = "User name not found！";
                return $this->sendError($message, 400);
            }
            return $this->sendError($error->getMessage(), 400);
        }

    }

    public function transfer(Request $request)
    {
        date_default_timezone_set('Asia/Taipei');
        Log::info($request->cookie());
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
        }else{
            $payee = UserWallet::where('account', $request['account'])->first();
        }
        AccountController::increase($amount, $payee);

        //make transfer record
        $create = Record::create([
            'remittance' => $remittance->account,
            'payee' => $payee->account,
            'amount' => $request->amount,
        ]);
        $create['balance'] = $remittance->balance;
        if ($create)
            return response()->json($create);

    }
    public function logout() {
        if (auth::user()->update(['api_token' => 'logged out'])) {
            return reponse()->json("You've logged out");
        }
    }


    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update($id)
    {
        $user = UserWallet::find($id);
        $user->update([
           'level' => 1,
        ]);
        return $this->sendResponse($user->toArray(), 'User updated successfully.');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(UserWallet $member)
    {
        if ($member->delete()) {
            return $this->sendResponse($member->toArray(), 'User deleted successfully.');
        }
    }
}
