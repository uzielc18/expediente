<?php
class Materiales extends ActiveRecord {

    public function initialize() {
        //relaciones
		$this->has_many('detallemetrados');
		$this->belongs_to('tipomateriales');
    }

    public function get_codigo($tipo=1){
    	$r=$this->maximum('codigo',"conditions: tipomateriales_id=".$tipo);
    	$codigo= $r + 1;
        return (int)$codigo;
    }
	 public function getCodigoCompleto(){
        return $this->getTipomateriales()->indice_unificado.'.'.$this->getTipomateriales()->getTipomateriales()->indice_unificado.'.'.$this->codigo;
        //return 'asdasdasd';
     }
}
?>