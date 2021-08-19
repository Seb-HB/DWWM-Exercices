<?php
class Category{

    private $name;
    private $displayOrder;

    public function __construct( $name){
        $this->name = $name;
    }

    public function getName(){
        return $this->name;
    }

    public function setName($name){
        $this->name = $name;
    }

    public function getDiplayOrder(){
        return $this->diplayOrder;
    }
    public function setDiplayOrder($diplayOrder){
        $this->diplayOrder = $diplayOrder;
    }
}

?>