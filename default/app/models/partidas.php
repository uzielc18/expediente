<?php
class Partidas extends ActiveRecord {

    public function initialize() {
        //relaciones
		$this->has_many('detallemetrados','detalleanalisis','detallestecnicos');
		$this->belongs_to('titulopartidas','medidas','presupuestos','tipopartidas');
    }
	/*@id recibe el id del presupuesto*/
	public function get_titulos_partidas_all($id,$titulo){
		$sql='SELECT t.codigo as codigo_titulo, t.id as titulo_id, t.titulo as titulo, p.*, (SELECT count(PR.id) FROM partidas as PR WHERE PR.titulopartidas_id=p.titulopartidas_id AND p.presupuestos_id=PR.presupuestos_id) as total_partidas FROM partidas as p INNER JOIN titulopartidas as t ON t.id=p.titulopartidas_id AND t.presupuestos_id=p.presupuestos_id WHERE p.titulopartidas_id='.$titulo.' AND p.presupuestos_id='.$id.' ORDER BY  codigo_titulo, titulo_id, p.id DESC';
		return $this->find_all_by_sql($sql);
	}
	public function get_titulos_sin_partidas_all($id){
		$sql='SELECT t.codigo as codigo_titulo, t.id as titulo_id, t.titulopartidas_id as subtitulos_id, t.titulo as titulo, p.id,(SELECT count(SUBT.id) FROM titulopartidas as SUBT WHERE SUBT.titulopartidas_id=t.id AND t.presupuestos_id=SUBT.presupuestos_id) as total_subtitulos FROM titulopartidas as t LEFT JOIN partidas as p ON p.estado=1 AND p.titulopartidas_id=t.id AND t.presupuestos_id='.$id.' WHERE t.estado=1 AND p.id is null ORDER BY codigo_titulo, subtitulos_id, titulo_id,p.id DESC';
		return $this->find_all_by_sql($sql);

	}
	public function get_correcto($id,$tabla='detallemetrados'){
		return $this->find_by_sql("SELECT if(max(partidas.fecha_in)>max(".$tabla.".fecha_in) AND max(partidas.fecha_in)>max(".$tabla.".fecha_at),TRUE,FALSE) correcto,max(partidas.fecha_in) as fecha_partida,max(".$tabla.".fecha_in) as fecha_detalle_in,max(".$tabla.".fecha_at) as fecha_detalle_at FROM partidas INNER JOIN ".$tabla." ON ".$tabla.".partidas_id = partidas.id WHERE partidas.id=".$id)->correcto;
	}
}
?>