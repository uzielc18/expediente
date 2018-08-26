<?php
class Detalleanalisis extends ActiveRecord {

    public function initialize() {
        //relaciones
		//$this->has_many('tesletrasingresos','tesdetracciones','tesdetalleingresos','tescheuqesingresos');
		$this->belongs_to('aclusuarios','medidas','materiales');
    }
	public function get_calculoflete(){
		//echo "'select id from calculoflete WHERE detalleanalisis_id='.$this->id.' limit 0,1'";
		$r = $this->find_by_sql('select calculoflete.id as id_unico from calculoflete WHERE detalleanalisis_id='.$this->id.' limit 0,1');
		return $r->id_unico;
	}
}
?>