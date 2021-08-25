<?php 
class Category
{
    private $id;
    private $name;
    private $idCatParent;

    public function __construct($id, $name , $idCatParent = null){
        $this->id = $id;
        $this->name = $name;
        $this->idCatParent = $idCatParent;
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
	 * @return Category
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
	 * @return Category
	 */
	function setName($name): self {
		$this->name = $name;
		return $this;
	}
	
	/**
	 * 
	 * @return mixed
	 */
	function getIdCatParent() {
		return $this->idCatParent;
	}
	
	/**
	 * 
	 * @param mixed $idCatParent 
	 * @return Category
	 */
	function setIdCatParent($idCatParent): self {
		$this->idCatParent = $idCatParent;
		return $this;
	}
}
?>