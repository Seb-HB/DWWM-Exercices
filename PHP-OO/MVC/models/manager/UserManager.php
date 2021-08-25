<?php 
class UserManager extends Database
{

    public function getDetailledListOfUsers() {
        $request=$this->bdd->prepare("SELECT * FROM client");
        $request->execute();
        $retour=$request->fetchAll();
        $users=[];
        foreach($retour as $user) {
            $users[]=new User($user['estFemme'], $user['nom'], $user['prenom'], $user['dateNaissance'],
                    $user['email'], $user['tel'], $user['mdp'], $user['dateInscription'],$user['Id_Client']);
        }
        return $users;
    }

    public function DeleteUser($id){
        $request=$this->bdd->prepare("DELETE * FROM client WHERE id = :id");
        $request->execute([':id' => $id]);
    }

}



?>