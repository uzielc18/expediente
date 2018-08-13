<?php
class Materiales extends ActiveRecord {

    public function initialize() {
        //relaciones
		$this->has_many('detallemetrados');
		//$this->belongs_to('aclusuarios','tesmonedas','tesdatos');
    }
	
}
?>