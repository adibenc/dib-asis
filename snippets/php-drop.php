<?php

Schema::table('tbl', function (Blueprint $table) {
    $table->dropColumn('col');
});
