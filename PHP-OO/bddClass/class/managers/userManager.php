<?php
class UserManager extends Database implements Crud{

    public function getOneUser($id){
        $request=$this->bdd->prepare("SELECT * FROM client WHERE Id_Client = :id");
        $request->execute([':id' => $id]);
        $retour=$request->fetch();
        var_dump($retour);

        $user=new User($retour['estFemme'], $retour['nom'], $retour['prenom'], $retour['dateNaissance'],$retour['email'], $retour['tel'], $retour['mdp'], $retour['dateInscription'],$retour['Id_Client']);
        
        return $user;
    }


    public function getUserByChamp($champ, $value){
        if($champ =='id' || $champ =='Id'){
            $champ='Id_Client';
        }
        $request=$this->bdd->prepare("SELECT * FROM client WHERE ".$champ." = :".$champ);
        $request->execute([':'.$champ => $value]);
        $retour=$request->fetch();

        $user=new User($retour['estFemme'], $retour['nom'], $retour['prenom'], $retour['dateNaissance'],$retour['email'], $retour['tel'], $retour['mdp'], $retour['dateInscription'],$retour['Id_Client']);
        
        return $user;
    }
	/**
	 *
	 * @param mixed $id 
	 *
	 * @return mixed
	 */
	function getOne($id) {
	}
	
	/**
	 *
	 * @return mixed
	 */
	function getAll() {
	}
	
	/**
	 *
	 * @param mixed $object 
	 *
	 * @return mixed
	 */
	function update($object) {
	}
	
	/**
	 *
	 * @param mixed $object 
	 *
	 * @return mixed
	 */
	function insertNew($object) {
	}
	
	/**
	 *
	 * @param mixed $id 
	 *
	 * @return mixed
	 */
	function deleteItem($id) {
	}
}



?>