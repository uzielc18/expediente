<?php
View::template('apps/default_expediente');
class AnalisisController extends AppController {
	
	public function crear($partida_id){		
		$Detalleanalisis = new Detalleanalisis();
        $Partidas = new Partidas();
        $Modulos = new Modulos();
        $this->modulo=$Modulos->find_first('conditions: codigo="METRADO"');
        $this->partida=$Partidas->find((int)$partida_id);
		$this->titulo='Analisis de costos unitarios <b>'.$this->partida->nombre.'</b> del Modulo <b>'.$this->modulo->descripcion.'</b>';
        $this->titulo_small='Todos los detalles';
        $this->analisis=$Detalleanalisis->find('conditions: partidas_id='.$partida_id);
		//$this->expedientes_id=$exp_id;
		if (Input::hasPost('detalleanalisis')) {

            $obj = new Detalleanalisis();
            if (!$obj->save(Input::post('detalleanalisis'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->detalleanalisis = $obj;
                return;
            }
            
            return Redirect::toAction('crear/'.$partida_id);   
            //return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);          
        }
	}
	public function editar($partida_id, $id){
	    View::select('crear');	
		$Detalleanalisis = new Detalleanalisis();
        $Partidas = new Partidas();
        $Modulos = new Modulos();
        $this->modulo=$Modulos->find_first('conditions: codigo="METRADO"');
        $this->partida=$Partidas->find((int)$partida_id);
        $this->titulo='Crear analisis para la Partida <b>'.$this->partida->nombre.'</b> del Modulo <b>'.$this->modulo->descripcion.'</b>';
        $this->titulo_small='Todos los detalles';
        $this->analisis=$Detalleanalisis->find('conditions: partidas_id='.$partida_id);
        //$this->expedientes_id=$exp_id;
        if (Input::hasPost('detalleanalisis')) {

            $obj = new Detalleanalisis();
            if (!$obj->save(Input::post('detalleanalisis'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->detalleanalisis = $obj;
                return;
            }
            
            return Redirect::toAction('crear/'.$partida_id);   
            //return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);          
        }

		$this->detalleanalisis = $Detalleanalisis->find((int) $id);
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