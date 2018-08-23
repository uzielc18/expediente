<?php
class Materiales extends ActiveRecord {

    public function initialize() {
        //relaciones
		$this->has_many('detallemetrados');
		$this->belongs_to('tipomateriales','medidas');
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

     public function getMaterialesPresupuesto($presupuestos_id){
        return $this->find_all_by_sql("SELECT materiales.id, materiales.nombre, medidas.abr, materiales.codigo, sum(detalleanalisis.cantidad) as cantidad, materiales.peso FROM detalleanalisis INNER JOIN materiales on detalleanalisis.materiales_id=materiales.id INNER JOIN medidas ON medidas.id=materiales.medidas_id INNER JOIN partidas ON partidas.id =detalleanalisis.partidas_id AND partidas.presupuestos_id=".$presupuestos_id." GROUP by detalleanalisis.materiales_id");
     }
}
?>