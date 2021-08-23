<?php
    class Session {

        // Les attributs de notre session
        private $attributs;

        // constructeur
        // Par défaut notre $attribut sera vide
        // Si il y a des valeurs en session réccupération de
        // ces valeurs
        public function __construct(){
            if(isset($_SESSION['session'])){
                $this->attributs = $_SESSION;
            }else{
                $this->attributs = [];
            }
        }


        // Fonction appelé implicitement quand on cherche à
        // asigner une valeur à un attribut dont on a pas accès
        // (privé inexistant ...);
        // TODO A chaque fois qu'elle est appelé vous allez ajoute
        // un élément dans votre tableau attributs
        public function __set($name, $value){
            $this->attributs[$name]=$value;
        }

        // Vous affichez la valeur de $attribut[$name]
        public function __get($name){
            if (isset($this->attributs[$name])){
                return $this->attributs[$name];
            }else{
                $this->attributs['error']='impossible de trouver l\'attribut '.$name;
            }
        }

        // Fonction qui affiche l'état de votre session
        public function displaySession(){
            var_dump($this->attributs);
        }

        // Sauvegarde notre attribut $attribut dans notre session
        public function __destruct(){
            $_SESSION['session']=$this->attributs;
        }
    }
?>