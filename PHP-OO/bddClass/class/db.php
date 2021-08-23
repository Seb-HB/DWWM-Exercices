<?php
abstract class Database{

    protected $bdd;

    private $hostName='localhost';
    private $user='root';
    private $password='';
    private $dbName='businesscase';

    public function __construct(){
        $this->bdd= new PDO('mysql:host='.$this->hostName.';dbname='.$this->dbName.';charset=utf8', $this->user, $this->password );
        $this->bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }




}


?>