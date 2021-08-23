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


}


?>