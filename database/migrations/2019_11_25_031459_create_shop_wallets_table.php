<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateShopWalletsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shop_wallets', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('account');
            $table->string('password');
            $table->string('key')->nullable();
            $table->string('api_token')->nullable();
            $table->integer('balance');
            $table->integer('level')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('shop_wallets');
    }
}
