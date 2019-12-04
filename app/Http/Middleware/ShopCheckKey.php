<?php


namespace App\Http\Middleware;


class ShopCheckKey
{
    protected function redirectTo($request)
    {
        if (! $request->expectsJson()) {
            return "false";
        }
    }

}
