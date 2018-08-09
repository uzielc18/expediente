<?php
class Expedientes extends ActiveRecord {

    public function initialize() {
        //relaciones
		$this->has_many('expedientes');
		$this->belongs_to('tipoexpedientes','ubigeo','aclempresas','expedientes');
    }

    public function getTipoExp(){
    	$campos = 'tipoexpedientes.*';
        $join = 'INNER JOIN tipoexpedientes ON tipoexpedientes.id = expedientes.tipoexpedientes_id AND expedientes.estado = 1 ';
        $condiciones='expedientes.expedientes_id IS NULL AND expedientes.estado!=3 AND expedientes.aclusuarios_id='.Auth::get('id');
        $agrupar_por = 'expedientes.tipoexpedientes_id';
        
        return $this->find($condiciones, "join: $join", "columns: $campos", 'order: tipoexpedientes.nombre', "group: $agrupar_por");
    }
    public function get_expedientes_all(){
    	$campos = 'expedientes.'. join(',expedientes.', $this->fields) . ',tipoexpedientes.id as tipo_id, tipoexpedientes.nombre as tipo_nombre';
        $join = 'INNER JOIN tipoexpedientes ON tipoexpedientes.id = expedientes.tipoexpedientes_id AND expedientes.estado = 1 AND expedientes.expedientes_id is null';
        $condiciones='expedientes.estado!=3 AND  expedientes.aclusuarios_id='.Auth::get('id');
        $val = $this->find($condiciones, "join: $join", "columns: $campos", "order: tipoexpedientes.id, expedientes.expedientes_id DESC");
        return $val;
    }
    public function get_bloques(){
        return $this->find('conditions: estado=1 AND expedientes_id='.$this->id,'columns: nombre');
    }
    public function get_codigo(){
        $a = $this->maximum('codigo_expediente');
        $codigo= $a + 1;
        return (int)$codigo; 
    }
	
}
?>