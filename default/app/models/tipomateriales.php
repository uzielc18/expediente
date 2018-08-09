<?php
class Tipomateriales extends ActiveRecord {

    public function initialize() {
        //relaciones
		$this->has_many('tipomateriales','materiales');
		$this->belongs_to('tipomateriales');
    }

    public function get_principales()
    {
    	return $this->find('conditions: tipomateriales_id is null');
    }
	
}
?>