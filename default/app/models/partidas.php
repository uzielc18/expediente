<?php
class Partidas extends ActiveRecord {

    public function initialize() {
        //relaciones
		$this->has_many('detallemetrados','detalleanalisis','detallestecnicos');
		$this->belongs_to('titulopartidas','medidas','presupuestos');
    }
	/*@id recibe el id del presupuesto*/
	public function get_titulos_partidas_all($id,$titulo){
		$sql='SELECT t.codigo as codigo_titulo, t.id as titulo_id, t.titulo as titulo, p.*, (SELECT count(PR.id) FROM partidas as PR WHERE PR.titulopartidas_id=p.titulopartidas_id AND p.presupuestos_id=PR.presupuestos_id) as total_partidas, (select IF(sum(detallemetrados.parcial) IS NULL,0,sum(detallemetrados.parcial)) from detallemetrados WHERE detallemetrados.partidas_id=p.id) as metrado_parcial FROM partidas as p INNER JOIN titulopartidas as t ON t.id=p.titulopartidas_id AND t.presupuestos_id=p.presupuestos_id WHERE p.titulopartidas_id='.$titulo.' AND p.presupuestos_id='.$id.' ORDER BY  codigo_titulo, titulo_id, p.id DESC';
		return $this->find_all_by_sql($sql);
	}
	public function get_titulos_sin_partidas_all($id){
		$sql='SELECT t.codigo as codigo_titulo, t.id as titulo_id, t.titulopartidas_id as subtitulos_id, t.titulo as titulo, p.id,(SELECT count(SUBT.id) FROM titulopartidas as SUBT WHERE SUBT.titulopartidas_id=t.id AND t.presupuestos_id=SUBT.presupuestos_id) as total_subtitulos, (select IF(sum(detallemetrados.parcial) IS NULL,0,sum(detallemetrados.parcial)) from detallemetrados WHERE detallemetrados.partidas_id=p.id) as metrado_parcial FROM titulopartidas as t LEFT JOIN partidas as p ON p.estado=1 AND p.titulopartidas_id=t.id AND t.presupuestos_id='.$id.' WHERE t.estado=1 AND p.id is null ORDER BY codigo_titulo, subtitulos_id, titulo_id,p.id DESC';
		return $this->find_all_by_sql($sql);

	}

	public function get_tabla_detalle_metrados(){
		$detalle=$this->find_all_by_sql('SELECT * FROM detallemetrados WHERE partidas_id='.$this->id);
		$table = "<table class=\"table\"><thead><tr>";
        $table.= "<th align=\"left\">Nombre</th><th align=\"right\">Nº veces</th><th align=\"right\">Largo</th><th align=\"right\">Ancho</th><th align=\"right\"> Altura</th><th align=\"right\">Parcial</th>";
        $table.="</tr></thead><tbody>";
        foreach($detalle as $d){
        	$table.="<tr><td>".$d->nombre."</td><td align=\"right\">".$d->numero_de_veces."</td><td align=\"right\">".$d->largo."</td><td align=\"right\">".$d->ancho."</td><td align=\"right\">".$d->alto."</td><td align=\"right\">".$d->parcial."</td></tr>";
        }
        $table.="</tbody></table>";                  
        return $table;                
	}
}
?>