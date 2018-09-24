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
	public function totalMateriales(){
       return $this->find_by_sql("SELECT count(id) as t FROM materiales WHERE tipomateriales_id=".$this->id)->t;
    }
}
?>