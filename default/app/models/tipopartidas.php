<?php
class Tipopartidas extends ActiveRecord {

    public function initialize() {
        //relaciones
		$this->has_many('partidas');
		//$this->belongs_to('aclusuarios','tesmonedas','tesdatos');
    }
	
}
?>