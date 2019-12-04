<?php


namespace App\Http\Middleware;


class UserCheckKey
{
    protected function redirectTo($request)
    {
        if (! $request->expectsJson()) {
            return "false";
        }
    }

}
