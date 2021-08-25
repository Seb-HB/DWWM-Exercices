<?php 

class UserController
{
   private $userManager;
   private $user;


   public function __construct(){
       $this->userManager = new UserManager;
       $this->user = new User;
   }

}


$userManager = new UserManager;
$usersDetails= $userManager->getDetailledListOfUsers();





?>