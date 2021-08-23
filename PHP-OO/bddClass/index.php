<?php
require 'class/db.php';
require 'class/interfaces/crud.php';
require 'class/user.php';
require 'class/managers/userManager.php';


$userInt=new UserManager;
$user=$userInt->getOneUser(2);
var_dump($user);

$user=$userInt->getUserByChamp('nom', 'Fouvet');
var_dump($user);
?>