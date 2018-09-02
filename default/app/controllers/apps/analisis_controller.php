<?php
View::template('apps/default_expediente');
class AnalisisController extends AppController {
	
	public function crear($partida_id){		
		$Detalleanalisis = new Detalleanalisis();
        $Partidas = new Partidas();
        $Modulos = new Modulos();
        $Tipomateriales = new Tipomateriales();
        $this->modulo=$Modulos->find_first('conditions: codigo="ACU"');
        $this->partida=$Partidas->find((int)$partida_id);
		$this->titulo='Analisis de costos unitarios <b>'.$this->partida->nombre.'</b> del Modulo <b>'.$this->modulo->descripcion.'</b>';
        $this->titulo_small='Todos los detalles';
        $this->analisis=$Detalleanalisis->find('conditions: partidas_id='.$partida_id);
		$this->tipos=$Tipomateriales->find("conditions: tipomateriales_id is null");
        $this->total_parcial_partida=$Detalleanalisis->sum('parcial','conditions: partidas_id='.$partida_id);
        //$this->expedientes_id=$exp_id;
		if (Input::hasPost('detalleanalisis')) {

            $obj = new Detalleanalisis();
            if (!$obj->save(Input::post('detalleanalisis'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->detalleanalisis = $obj;
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
		$Detalleanalisis = new Detalleanalisis();
        $Partidas = new Partidas();
        $Modulos = new Modulos();
        $Tipomateriales = new Tipomateriales();
        $this->modulo=$Modulos->find_first('conditions: codigo="ACU"');
        $this->partida=$Partidas->find((int)$partida_id);
        $this->titulo='Crear analisis para la Partida <b>'.$this->partida->nombre.'</b> del Modulo <b>'.$this->modulo->descripcion.'</b>';
        $this->titulo_small='Todos los detalles';
        $this->analisis=$Detalleanalisis->find('conditions: partidas_id='.$partida_id);        
        $this->tipos=$Tipomateriales->find("conditions: tipomateriales_id is null");
        $this->total_parcial_partida=$Detalleanalisis->sum('parcial','conditions: partidas_id='.$partida_id);
        //$this->expedientes_id=$exp_id;
        if (Input::hasPost('detalleanalisis')) {

            $obj = new Detalleanalisis();
            if (!$obj->save(Input::post('detalleanalisis'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->detalleanalisis = $obj;
                return;
            }
            $PP = new Partidas();
            $PP->save(Input::post('partida'));
            Flash::valid('Correcto');
            return Redirect::toAction('crear/'.$partida_id);   
            //return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);          
        }

		$this->detalleanalisis = $Detalleanalisis->find((int) $id);
	}

    public function eliminar_analisis($partida_id,$id) {
        $obj = new Detalleanalisis();
        $cc = new Calculoflete();
        $cc->delete_all('detalleanalisis_id='.$id);
        if (!$obj->delete($id)) {
            Flash::error('Falló Operación');
        }
        //enrutando al index para listar los articulos
        Flash::error('Detalle eliminado');
        Redirect::toAction('crear/'.$partida_id);
    }
    public function eliminar_flete($partida_id,$id){
        $obj = new Calculoflete();
        if (!$obj->delete($id)) {
            Flash::error('Falló Operación');
        }
        //enrutando al index para listar los articulos
        Flash::error('Analisis de felte eliminado');
        Redirect::toAction('crear/'.$partida_id);
    }
    public function terminar($exp_id,$mod_id,$bloc_id,$pres_id){    
        //View::select('crear');  
        if (Input::hasPost('partida')) {

            $obj = new Partidas();
            $datos = Input::post('partida');
            $datos['detalleanalisis']=base64_encode($datos['detalleanalisis']);
            $datos['parcial']=$datos['metrado']*$datos['costo'];
            if (!$obj->save($datos)) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->partidas = $obj;
                return;
            }
            
            return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);          
        }
    }

    public function calcular_flete($partida_id, $detalleanalisis_id,$id=0){
        $Detalleanalisis = new Detalleanalisis();
        $Partidas = new Partidas();
        $Modulos = new Modulos();
        $Materiales = new Materiales();
        $Calculoflete = new Calculoflete();
        if(!$Calculoflete->exists($id)){
            if($Calculoflete->exists('detalleanalisis_id='.$detalleanalisis_id)){
                $id=$Calculoflete->find_by_detalleanalisis_id($detalleanalisis_id)->id;
            }else{
                $id=0;
            }
            }        
        $this->id=$id;
        if($id!=0)$this->calculoflete=$Calculoflete->find((int) $id);
        $this->detalleanalisis_id=$detalleanalisis_id;
        $this->modulo=$Modulos->find_first('conditions: codigo="ACU"');
        $this->partida=$Partidas->find((int)$partida_id);
        $this->titulo='Calcular el flete para <b>'.$this->partida->getPresupuestos()->nombre.'</b> del Modulo <b>'.$this->modulo->descripcion.'</b>';
        $this->detalleanalisis=$Detalleanalisis->find((int) $detalleanalisis_id);
        //$Materiales->getMaterialesPresupuesto($this->partida->presupuestos_id);
        $this->array=json_encode($Materiales->getMaterialesPresupuesto($this->partida->presupuestos_id));
        if (Input::hasPost('calculoflete')) {
            $obj = new Calculoflete();            
            $datos = Input::post('calculoflete');
            $datos['totaltn'] = ($datos['totalkg']/1000);
            if(!$obj->save($datos)) {
                    Flash::error('Falló Operación');
                    //se hacen persistente los datos en el formulario
                    $this->calculoflete = $obj;
                    return;
                }else{
                return Redirect::to('apps/analisis/calcular_flete/'.$partida_id.'/'.$detalleanalisis_id.'/'.$obj->id);   
            }
        }

    }
    public function eliminar_calculo_flete($partida_id, $detalleanalisis_id,$id){
        $obj = new Calculoflete();
        if (!$obj->delete($id)) {
            Flash::error('Falló Operación');
        }
        //enrutando al index para listar los articulos
        Redirect::toAction('calcular_flete/'.$partida_id.'/'.$detalleanalisis_id);
    }
    public function terminar_flete($partida_id)
    {
        $dd = new Detalleanalisis();
        $cc = new Calculoflete();
        $cc->save(Input::post('calculoflete'));
        $dd->save(Input::post('detalleanalisis'));
        return Redirect::toAction('crear/'.$partida_id);    
    }
}
?>