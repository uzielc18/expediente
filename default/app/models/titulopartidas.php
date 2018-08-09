<?php
class Titulopartidas extends ActiveRecord {

    public function initialize() {
        //relaciones
		$this->has_many('partidas','titulopartidas');
		$this->belongs_to('titulopartidas','expedientes','presupuestos');
    }

    public function _codigo_titulo($presupuestos_id){
    	$sql = $this->find_by_sql("SELECT LPAD((max(t.codigo)+1),2,'0') as new_codigo FROM titulopartidas as t WHERE t.presupuestos_id = ".$presupuestos_id." AND t.aclusuarios_id=".Auth::get('id'));
    	return $sql->new_codigo;
    }
    public function get_array_titulos($presupuestos_id)
    {
    	function titulos_sub($presupuestos_id,$id=null){
    		$titulos=[];
    		$Titulopartidas = new Titulopartidas();
    		$Partidas = new Partidas();
    		$ts = $id ? $Titulopartidas->find('conditions: estado=1 AND  titulopartidas_id = '.$id.' AND presupuestos_id='.$presupuestos_id.' ORDER BY codigo') : $Titulopartidas->find('conditions: estado=1 AND titulopartidas_id is null AND  presupuestos_id='.$presupuestos_id.' ORDER BY codigo');
    		$n=0;
    		foreach ($ts as $t) {
    			$total_sub=$Titulopartidas->count('estado=1 AND titulopartidas_id='.$t->id);
    			$total_partidas=$Partidas->count('estado=1 AND titulopartidas_id='.$t->id);
    			$new=array('titulo'=>$t->titulo,'id'=>$t->id,'titulo_id'=>$t->id,'titulopartidas_id'=>$t->titulopartidas_id,'presupuestos_id'=>$t->presupuestos_id,'codigo_titulo'=>$t->codigo,'total_sub'=>$total_sub,'total_partidas'=>$total_partidas);
    			if($total_sub){
    				$new['subtitulos']=titulos_sub($presupuestos_id,$t->id);
    			}else{
    				$new['subtitulos']=array();
    			}
    			$titulos[$n]=$new;
    			$n++;
    		}
    		return $titulos;

    	}
    	return titulos_sub($presupuestos_id,NUll);
    	
    }
}
?>