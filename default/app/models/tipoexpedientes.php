<?php
class Tipoexpedientes extends ActiveRecord {

    public function initialize() {
        //relaciones
		$this->has_many('expedientes');
		//$this->belongs_to('aclusuarios','tesmonedas','tesdatos');
    }
	
}
?>