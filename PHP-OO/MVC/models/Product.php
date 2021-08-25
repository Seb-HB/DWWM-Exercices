<?php 
class Product
{
    private $id;
    private $brand;
    private $refClients;
    private $Categories;
    private $name;
    private $description;
    private $price;
    private $color;
    private $size;
    private $img;

    public function __construct(Brand $brand, $refClients, $Categories, $name,$description,$price,$img, $color=null,$size=null, $id=null) {
        $this->id = $id;
        $this->brand = $brand;
        $this->refClients = $refClients;
        $this->Categories = $Categories;
        $this->name = $name;
        $this->description = $description;
        $this->price = $price;
        $this->color = $color;
        $this->size = $size;
        $this->img = $img;
    }


}

?>