<?php
public function otpSubmitAndTransfer(){
    $posts = $this->posts();
    preout($posts);
    // todo : handle internal / external
    try{

        self::success("Ok", [
            "data" => [],
        ]);
    }catch(\Exception $e){
        self::userFail($e->getMessage(), [
            "data" => [],
        ]);
    }
}