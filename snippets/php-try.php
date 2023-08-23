<?php

try{

    self::success("Ok", [
        "tilang" => $tilang,
        "status" => $status,
        "ambil" => $ambil,
    ]);
}catch(\Exception $e){
    self::userFail($e->getMessage(), $data);
}