<?php
class Brand
{
    private $id;
    private $name;


   public function __construct($id, $name){
       $this->id = $id;
       $this->name = $name;
   }

   
	/**
	 * 
	 * @return mixed
	 */
	function getId() {
		return $this->id;
	}
	
	/**
	 * 
	 * @param mixed $id 
	 * @return Brand
	 */
	function setId($id): self {
		$this->id = $id;
		return $this;
	}
	/**
	 * 
	 * @return mixed
	 */
	function getName() {
		return $this->name;
	}
	
	/**
	 * 
	 * @param mixed $name 
	 * @return Brand
	 */
	function setName($name): self {
		$this->name = $name;
		return $this;
	}
}

?>