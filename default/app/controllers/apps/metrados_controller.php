<?php
View::template('apps/default_expediente');
class MetradosController extends AppController {
	
	public function crear($partida_id){		
		$Detallemetrados = new Detallemetrados();
        $Partidas = new Partidas();
        $Modulos = new Modulos();
        $this->modulo=$Modulos->find_first('conditions: codigo="METRADO"');
        $this->partida=$Partidas->find((int)$partida_id);
		$this->titulo='Crear metrados para la Partida <b>'.$this->partida->nombre.'</b> del Modulo <b>'.$this->modulo->descripcion.'</b>';
        $this->titulo_small='Todos los detalles';
        $this->metrados=$Detallemetrados->find('conditions: partidas_id='.$partida_id);
		//$this->expedientes_id=$exp_id;
		//se verifica si se ha enviado via POST los datos
        if (Input::hasPost('detallemetrados')) {
            $obj = new Detallemetrados();
            //En caso que falle la operación de guardar
            if ($obj->saveWithPhoto(Input::post('detallemetrados'))) {
                //Mensaje de éxito y retorna al listado
                Flash::valid('detalle creado');
                return Redirect::toAction('crear/'.$partida_id);
            }
            //Si falla se hacen persistentes los datos en el formulario
            Flash::error('Falló Operación');
            $this->detallemetrados = Input::post('detallemetrados');
            return;
        }
       
	}
	public function editar($partida_id, $id){
	    View::select('crear');	
		$Detallemetrados = new Detallemetrados();
        $Partidas = new Partidas();
        $Modulos = new Modulos();
        $this->modulo=$Modulos->find_first('conditions: codigo="METRADO"');
        $this->partida=$Partidas->find((int)$partida_id);
        $this->titulo='Crear metrados para la Partida <b>'.$this->partida->nombre.'</b> del Modulo <b>'.$this->modulo->descripcion.'</b>';
        $this->titulo_small='Todos los detalles';
        $this->metrados=$Detallemetrados->find('conditions: partidas_id='.$partida_id);
        $this->detallemetrados = $Detallemetrados->find((int) $id);
        if (Input::hasPost('detallemetrados')) {
            if ($this->detallemetrados->save(Input::post('detallemetrados'))) {
                Flash::valid('detalle creado Sin imagen');
                return Redirect::toAction('crear/'.$partida_id);
            }
            //Flash::error('Falló Operación');
            $this->detallemetrados = Input::post('detallemetrados');
            return;
            //return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);          
        }
	}

    public function terminar($exp_id,$mod_id,$bloc_id,$pres_id){    
        //View::select('crear');  
        if (Input::hasPost('partida')) {

            $obj = new Partidas();
            if (!$obj->save(Input::post('partida'))) {
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