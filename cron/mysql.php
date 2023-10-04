<?php

include '../config.php';
class MySQL{
    private $conBD = null;
    public function _construct() {
        global $usuario, $passbd, $ipBD;

        $this->usuario = $usuario;
        $this->passbd = $passbd;
        $this->ipBD = $ipBD; 
    }

        public function conBDOB(){
            $this->conBDOB = new mysqli($this->ipBD,  $this->usuario = $usuario, $this->passbd = $passbd)
        }

}