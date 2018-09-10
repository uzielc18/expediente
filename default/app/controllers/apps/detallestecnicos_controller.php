<?php
View::template('apps/default_expediente');
class MetradosController extends AppController {
    
    public function crear($partida_id){		
		$Detallestecnicos = new Detallestecnicos();
        $Partidas = new Partidas();
        $Modulos = new Modulos();
        $this->modulo=$Modulos->find_first('conditions: codigo="ACU"');
        $this->partida=$Partidas->find((int)$partida_id);
		$this->titulo='Analisis de costos unitarios <b>'.$this->partida->nombre.'</b> del Modulo <b>'.$this->modulo->descripcion.'</b>';
        $this->titulo_small='Todos los detalles';
		if (Input::hasPost('detallestecnicos')) {

            $obj = new Detallestecnicos();
            if (!$obj->save(Input::post('detallestecnicos'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->detallestecnicos = $obj;
                return;
            }
            $PP = new Partidas();
            $PP->save(Input::post('partida'));
            return Redirect::toAction('crear/'.$partida_id);   
            //return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);          
        }
	}
    public function editar($partida_id, $id){
        View::select('crear');  
       $Detallestecnicos = new Detallestecnicos();
        $Partidas = new Partidas();
        $Modulos = new Modulos();
        $this->modulo=$Modulos->find_first('conditions: codigo="ACU"');
        $this->partida=$Partidas->find((int)$partida_id);
		$this->titulo='Analisis de costos unitarios <b>'.$this->partida->nombre.'</b> del Modulo <b>'.$this->modulo->descripcion.'</b>';
        $this->titulo_small='Todos los detalles';
        
		if (Input::hasPost('detallestecnicos')) {

            $obj = new Detallestecnicos();
            if (!$obj->save(Input::post('detallestecnicos'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->detallestecnicos = $obj;
                return;
            }
            $PP = new Partidas();
            $PP->save(Input::post('partida'));
            return Redirect::toAction('crear/'.$partida_id);   
            //return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);          
        }
    }

    public function terminar($exp_id,$mod_id,$bloc_id,$pres_id){    
        //View::select('crear');  
        if (Input::hasPost('partida')) {

            $obj = new Partidas();
            $datos = Input::post('partida');
            $datos['detallemetrados']=base64_encode($datos['detallemetrados']);
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