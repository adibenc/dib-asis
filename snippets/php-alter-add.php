<?php

Schema::table('tbl', function (Blueprint $table) {
    $table->string('col')->comment("col")
        ->default("col")->nullable()
        ->after('duration');
    
    /*
    $table->foreign('col')->references('col')->on('tbl2')
        ->onUpdate('cascade')
        ->onDelete('cascade');
    */
});