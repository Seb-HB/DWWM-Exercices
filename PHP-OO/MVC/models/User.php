<?php
class User  {
    private $id;
    private $estFemme;
    private $nom;
    private $prenom;
    private $dateNaissance;
    private $email;
    private $tel;
    private $mdp;
    private $dateinscription;



    public function __construct($estFemme, $nom, $prenom, $dateNaissance, $email, $tel, $mdp, $dateinscription=null, $id=null){
        $this->estFemme = $estFemme;
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->dateNaissance = $dateNaissance;
        $this->email = $email;
        $this->tel = $tel;
        $this->mdp = $mdp;
        $this->dateinscription = $dateinscription;
        $this->id = $id;
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
	 * @return User
	 */
	function setId($id): self {
		$this->id = $id;
		return $this;
	}
	
	/**
	 * 
	 * @return mixed
	 */
	function getEstFemme() {
		return $this->estFemme;
	}
	
	/**
	 * 
	 * @param mixed $estFemme 
	 * @return User
	 */
	function setEstFemme($estFemme): self {
		$this->estFemme = $estFemme;
		return $this;
	}
	
	/**
	 * 
	 * @return mixed
	 */
	function getNom() {
		return $this->nom;
	}
	
	/**
	 * 
	 * @param mixed $nom 
	 * @return User
	 */
	function setNom($nom): self {
		$this->nom = $nom;
		return $this;
	}
	
	/**
	 * 
	 * @return mixed
	 */
	function getPrenom() {
		return $this->prenom;
	}
	
	/**
	 * 
	 * @param mixed $prenom 
	 * @return User
	 */
	function setPrenom($prenom): self {
		$this->prenom = $prenom;
		return $this;
	}
	
	/**
	 * 
	 * @return mixed
	 */
	function getDateNaissance() {
		return $this->dateNaissance;
	}
	
	/**
	 * 
	 * @param mixed $dateNaissance 
	 * @return User
	 */
	function setDateNaissance($dateNaissance): self {
		$this->dateNaissance = $dateNaissance;
		return $this;
	}
	
	/**
	 * 
	 * @return mixed
	 */
	function getEmail() {
		return $this->email;
	}
	
	/**
	 * 
	 * @param mixed $email 
	 * @return User
	 */
	function setEmail($email): self {
		$this->email = $email;
		return $this;
	}
	
	/**
	 * 
	 * @return mixed
	 */
	function getTel() {
		return $this->tel;
	}
	
	/**
	 * 
	 * @param mixed $tel 
	 * @return User
	 */
	function setTel($tel): self {
		$this->tel = $tel;
		return $this;
	}
	
	/**
	 * 
	 * @return mixed
	 */
	function getMdp() {
		return $this->mdp;
	}
	
	/**
	 * 
	 * @param mixed $mdp 
	 * @return User
	 */
	function setMdp($mdp): self {
		$this->mdp = $mdp;
		return $this;
	}
	
	/**
	 * 
	 * @return mixed
	 */
	function getDateinscription() {
		return $this->dateinscription;
	}
	
	/**
	 * 
	 * @param mixed $dateinscription 
	 * @return User
	 */
	function setDateinscription($dateinscription): self {
		$this->dateinscription = $dateinscription;
		return $this;
	}
}


?>