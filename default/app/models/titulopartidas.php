<?php
class Titulopartidas extends ActiveRecord {

    public function initialize() {
        //relaciones
		$this->has_many('partidas','titulopartidas');
		$this->belongs_to('titulopartidas','expedientes','presupuestos');
    }

    public function _codigo_titulo($presupuestos_id,$titulo_id=0){
        $cond = $titulo_id == 0 ? "" : " AND t.titulopartidas_id=".$titulo_id;
        echo $sql="SELECT LPAD((IFNULL(max(t.codigo),0)+1),2,'0') as new_codigo FROM titulopartidas as t WHERE t.presupuestos_id = ".$presupuestos_id.$cond." AND t.estado = 1 AND t.aclusuarios_id=".Auth::get('id');
        $dat = $this->find_by_sql($sql);
        /*$a = $this->maximum('codigo');
        $codigo= $a + 1;
        $padded = str_pad((string)$codigo, 10, "0", STR_PAD_LEFT); */
    	echo $dat->new_codigo;
        return $dat->new_codigo;
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
                $total=$Partidas->sum('parcial','conditions: estado=1 AND titulopartidas_id='.$t->id);
    			$new=array('titulo'=>$t->titulo,'id'=>$t->id,'titulo_id'=>$t->id,'titulopartidas_id'=>$t->titulopartidas_id,'presupuestos_id'=>$t->presupuestos_id,'codigo_titulo'=>$t->codigo,'total_sub'=>$total_sub,'total_partidas'=>$total_partidas,'total'=>$total);
    			if($total_sub){
                    $__sub_titulos=titulos_sub($presupuestos_id,$t->id);
    				$new['subtitulos']=$__sub_titulos;
                    $new['total']=array_sum(array_column($__sub_titulos, 'total'));
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
    public function get_json_titulos($presupuestos_id){
        return json_encode($this->get_array_titulos($presupuestos_id));
    }
    public function get_total($titulo_id,$presupuestos_id){

    }
}
?>