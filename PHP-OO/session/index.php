<?php 
session_start();
require 'session.php';
$session=new Session;

$contenuSession=$session->attributs; // je passe par __GET car attributs est en privé et pas de getter

// si je crée un getter dans la classe session
$contenuSession=$session->getattributs(); // je passe par mon getter




?>