<?php
View::template('apps/default_expediente');
class DetallestecnicosController extends AppController {
    
    public function crear($partida_id,$id=0){		
		$Detallestecnicos = new Detallestecnicos();
        $Partidas = new Partidas();
        $Modulos = new Modulos();
        $this->modulo=$Modulos->find_first('conditions: codigo="ESPTEC"');
        $this->partida=$Partidas->find((int)$partida_id);
		$this->titulo='Detalle tecnicos<b>'.$this->partida->nombre.'</b> del Modulo <b>'.$this->modulo->descripcion.'</b>';
        $this->titulo_small='';
        if($id==0){
        	$this->detallestecnicos=$Detallestecnicos->find_first('partidas_id='.$partida_id);
        	if($this->detallestecnicos)return Redirect::toAction('crear/'.$partida_id.'/'.$this->detallestecnicos->id);
        }else{
        	$this->detallestecnicos=$Detallestecnicos->find((int) $id);
        }
		if (Input::hasPost('detallestecnicos')) {

            $obj = new Detallestecnicos();
            if (!$obj->save(Input::post('detallestecnicos'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->detallestecnicos = $obj;
                return;
            }
            //$PP = new Partidas();
            //$PP->save(Input::post('partida'));
            return Redirect::toAction('crear/'.$partida_id.'/'.$obj->id);   
            //return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);          
        }
	}
	public function eliminar($partida_id,$id) {
        $obj = new Detallestecnicos();
        if (!$obj->delete($id)) {
            Flash::error('Falló Operación');
        }
        //enrutando al index para listar los articulos
        Flash::error('Detalle eliminado');
        Redirect::toAction('crear/'.$partida_id.'/0');
    }

    public function terminar($exp_id,$mod_id,$bloc_id,$pres_id){    
        //View::select('crear');  
        if (Input::hasPost('partida')) {

            $obj = new Partidas();
            $datos = Input::post('partida');
            $datos['detallestecnicos']=$datos['detallestecnicos'];
            print_r($datos);
            if (!$obj->save($datos)) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->partidas = $obj;
                return;
            }
            
            return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);          
        }
    }
}
?>