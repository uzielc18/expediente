<?php
class Presupuestos extends ActiveRecord {

    public function initialize() {
        //relaciones
		$this->has_many('partidas');
		$this->belongs_to('expedientes');
    }
	
    public function cambiar_presupuestos_expedientes($exp_ant_id,$exp_new_id){
    	$this->find_all_by_sql("UPDATE presupuestos SET expedientes_id = ".$exp_new_id." WHERE presupuestos.expedientes_id =".$exp_ant_id);
        return true;
    }
    public function get_total(){
        $a=$this->find_by_sql('SELECT sum(parcial) as total FROM partidas WHERE presupuestos_id ='.$this->id);
        return $a->total;
    }
}
?>