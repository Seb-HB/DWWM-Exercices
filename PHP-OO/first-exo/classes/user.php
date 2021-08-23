<?php
class user{

    private $username;
    private $firstname;
    private $lastname;
    private $password;

    public function __construct( $username, $firstname, $lastname, $password){
        $this->username = $username;
        $this->firstname = $firstname;
        $this->lastname = $lastname;
        $this->password = $password;
    }

    public function getUsername(){
        return $this->username;
    }

    public function setUsername($username){
        $this->username = $username;
    }

    public function getFirstname(){
        return $this->firstname;
    }
    public function setFirstname($firstname){
        $this->firstname = $firstname;
    }
    public function getLastname(){
        return $this->lastname;
    }
    public function setLastname($lastname){
        $this->lastname = $lastname;
    }





    /**
     * Get the value of password
     */ 
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * Set the value of password
     *
     * @return  self
     */ 
    public function setPassword($password)
    {
        $this->password = $password;

        return $this;
    }
}

?>