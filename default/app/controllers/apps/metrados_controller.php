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
		if (Input::hasPost('detallemetrados')) {

            $obj = new Detallemetrados();
            if (!$obj->save(Input::post('detallemetrados'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->detallemetrados = $obj;
                return;
            }
            
            return Redirect::toAction('crear/'.$partida_id);   
            //return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);          
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
        //$this->expedientes_id=$exp_id;
        if (Input::hasPost('detallemetrados')) {

            $obj = new Detallemetrados();
            if (!$obj->save(Input::post('detallemetrados'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->detallemetrados = $obj;
                return;
            }
            
            return Redirect::toAction('crear/'.$partida_id);   
            //return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);          
        }

		$this->detallemetrados = $Detallemetrados->find((int) $id);
	}

    public function terminar($exp_id,$mod_id,$bloc_id,$pres_id){    
        View::select('crear');  
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