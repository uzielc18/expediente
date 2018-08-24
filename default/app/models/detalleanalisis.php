<?php
class Detalleanalisis extends ActiveRecord {

    public function initialize() {
        //relaciones
		//$this->has_many('tesletrasingresos','tesdetracciones','tesdetalleingresos','tescheuqesingresos');
		$this->belongs_to('aclusuarios','medidas','materiales');
    }
	public function get_calculoflete(){
		return $this->find_by_sql('select id from calculoflete WHERE detalleanalisis_id='.$this->id.' limit 0,1')->id;
	}
}
?>