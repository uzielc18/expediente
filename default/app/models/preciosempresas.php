<?php
class Preciosempresas extends ActiveRecord {

    public function initialize() {
        //relaciones
		//$this->has_many('p','tesdetracciones','tesdetalleingresos','tescheuqesingresos');
		$this->belongs_to('materiales','aclempresas');
    }
    public function getMisProductos($per_page=10, $page=1){
    	/*SELECT DISTINCT materiales.id,materiales.nombre, materiales.descripcion, materiales.codigo, materiales.peso, materiales.estado, materiales.tipomateriales_id, materiales.medidas_id,tipomateriales.nombre, tipomateriales.simbologia, tipomateriales.indice_unificado, materiales.codigo, (select p.precio from preciosempresas as p where p.materiales_id=preciosempresas.materiales_id order by id desc LIMIT 0,1) as ultimo_precio FROM preciosempresas
INNER JOIN materiales ON materiales.id=preciosempresas.materiales_id
INNER JOIN tipomateriales ON tipomateriales.id=materiales.tipomateriales_id*/
    	$campos = 'DISTINCT materiales.id,materiales.nombre, materiales.descripcion, materiales.codigo, materiales.peso, materiales.estado, materiales.tipomateriales_id, materiales.medidas_id,tipomateriales.nombre, tipomateriales.simbologia, tipomateriales.indice_unificado, materiales.codigo';
        $join = 'INNER JOIN materiales ON preciosempresas.materiales_id=materiales.id ';
        $join.= 'INNER JOIN tipomateriales ON tipomateriales.id=materiales.tipomateriales_id ';
        $condiciones = "preciosempresas.aclempresas_id=".Auth::get('aclempresas_id');
        //return $this->paginate_by_sql('preciosempresas','SELECT DISTINCT materiales.id,materiales.nombre, materiales.descripcion, materiales.codigo, materiales.peso, materiales.estado, materiales.tipomateriales_id, materiales.medidas_id,tipomateriales.nombre, tipomateriales.simbologia, tipomateriales.indice_unificado, materiales.codigo, (select p.precio from preciosempresas as p where p.materiales_id=preciosempresas.materiales_id order by id desc LIMIT 0,1) as ultimo_precio FROM preciosempresas INNER JOIN materiales ON materiales.id=preciosempresas.materiales_id INNER JOIN tipomateriales ON tipomateriales.id=materiales.tipomateriales_id','per_page: '.$per_page, 'page: '.$page);
        return $this->paginate($condiciones, "join: $join", "columns: $campos", 'order: materiales.codigo','per_page: '.$per_page, 'page: '.$page);
    	//$this->find();
    }
	
}
?>