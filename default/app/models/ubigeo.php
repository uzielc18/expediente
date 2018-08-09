<?php
class Ubigeo extends ActiveRecord {

    public function initialize() {
        $this->has_many('expedientes');
    }
    public function get_ubigeo($q){
    	return $this->find_all_by_sql('SELECT ubigeo.*, CONCAT_WS(" ",ubigeo.distrito, ubigeo.provincia, ubigeo.departamento) as resultado FROM ubigeo WHERE ubigeo.distrito like "%'.$q.'%" ORDER BY distrito ASC');
    }
    public function get_resultado(){
    	$a=$this->find_by_sql('SELECT CONCAT_WS(" ",ubigeo.distrito, ubigeo.provincia, ubigeo.departamento) as resultado FROM ubigeo WHERE ubigeo.id='.$this->id);
    	return $a->resultado;
    }
}
?>