<?php
class Preciosempresas extends ActiveRecord {

    public function initialize() {
        //relaciones
		//$this->has_many('p','tesdetracciones','tesdetalleingresos','tescheuqesingresos');
		$this->belongs_to('materiales','aclempresas');
    }
    public function getMisProductos($per_page, $page,$tipomateriales_id){
    	
    	$campos = 'DISTINCT materiales.id,materiales.nombre, materiales.descripcion, materiales.codigo, materiales.peso, materiales.estado, materiales.tipomateriales_id, materiales.medidas_id,tipomateriales.nombre as tipo_nombre, tipomateriales.simbologia, tipomateriales.indice_unificado, materiales.codigo';
        $join = 'INNER JOIN materiales ON preciosempresas.materiales_id=materiales.id ';
        $join.= 'INNER JOIN tipomateriales ON tipomateriales.id=materiales.tipomateriales_id';
        $condiciones = "preciosempresas.aclempresas_id=".Auth::get('aclempresas_id');
        
        return $this->paginate($condiciones, "join: $join", "columns: $campos", 'order: materiales.codigo','per_page: '.$per_page, 'page: '.$page);
    	//$this->find();
    }
    public function getMisTipoMateriales($id_tipo_materiales)
    {
    	$campos = 'DISTINCT tipomateriales.id as id, tipomateriales.nombre as nombre, tipomateriales.simbologia, tipomateriales.indice_unificado';
        $join = 'INNER JOIN materiales ON preciosempresas.materiales_id=materiales.id ';
        $join.= 'INNER JOIN tipomateriales ON tipomateriales.id=materiales.tipomateriales_id AND tipomateriales.tipomateriales_id = '.$id_tipo_materiales;
        $condiciones = "preciosempresas.aclempresas_id=".Auth::get('aclempresas_id');
        
        return $this->find($condiciones, "join: $join", "columns: $campos");
    }
	
}
?>