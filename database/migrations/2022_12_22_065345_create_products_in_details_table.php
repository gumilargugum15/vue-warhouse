<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsInDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products_in_details', function (Blueprint $table) {
            $table->id();
            $table->integer('products_in_id')->default(0)->nullable();
            $table->integer('products_id')->default(0)->nullable();
            $table->string('code');
            $table->string('name');
            $table->string('qty');
            $table->string('creator');
            $table->string('modifier');
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
        Schema::dropIfExists('products_in_details');
    }
}
