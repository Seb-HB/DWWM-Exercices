<?php
Class Article{
private $name;
private $quantity;
private $prrice;
private $photo;
private static $className;

public function __construct($name, $quantity, $prrice, $photo){
    $this->name = $name;
    $this->quantity = $quantity;
    $this->prrice = $prrice;
    $this->photo = $photo;
}

public static function getClassName(){
    return self::$className;
}





}


?>