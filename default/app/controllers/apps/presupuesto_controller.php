<?php
View::template('apps/default_expediente');
class PresupuestoController extends AppController {
	
	public function crear($exp_id=NULL, $mod_id=NULL, $bloq_id=NULL){		
		$Presupuestos = new Presupuestos();
		$this->titulo='Presupuesto nuevo';
		$this->expedientes_id= $bloq_id ? $bloq_id : $exp_id;
        $this->modulo_id=$mod_id;
        $this->bloque_id=$bloq_id;
        $this->presupuestos_all=$Presupuestos->find('conditions: estado=1 AND expedientes_id='.$this->expedientes_id);
        $this->id_presupuesto=0;
		//$this->codigo = $Presupuestos->get_codigo();
		if (Input::hasPost('presupuestos')) {

            $obj = Load::model('presupuestos');
            //En caso que falle la operación de guardar
            if (!$obj->save(Input::post('presupuestos'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->presupuestos = $obj;
                return;
            }

            return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$obj->id);
        }
	}
	public function editar($exp_id=NULL, $mod_id=NULL, $bloq_id=NULL,$id){
	   View::select('crear');	
		$Presupuestos = new Presupuestos();
        $this->expedientes_id= $bloq_id ? $bloq_id : $exp_id;
        $this->modulo_id=$mod_id;
        $this->bloque_id=$bloq_id;        
        $this->presupuestos_all=$Presupuestos->find('conditions: id!='.$id.' AND estado=1 AND expedientes_id='.$this->expedientes_id);
		$this->titulo='Presupuesto modificar';
        $this->id_presupuesto=$id;
		//$this->codigo = $Presupuestos->get_codigo();
		if (Input::hasPost('presupuestos')) {

            $obj = $Presupuestos;
            //En caso que falle la operación de guardar
            if (!$obj->save(Input::post('presupuestos'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->presupuestos = $obj;
                return;
            }

            return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloq_id.'/'.$obj->id);
        }

		$this->presupuestos = $Presupuestos->find((int) $id);
        $this->titulo.=' '.$this->presupuestos->getExpedientes()->nombre;
	}

    public function borrar($exp_id=NULL, $mod_id=NULL, $bloq_id=NULL,$id, $act=NULL,$id_presupuesto){
        try {
            $id = Filter::get($id, 'digits');
            $doc = new Presupuestos();
            if (!$doc->find_first($id)){ //si no existe el usuario
                Flash::warning("No existe ningun registro con id '{$id}'");
            }else if ($doc->borrar()) {
                Flash::valid("El <b>{$doc->id}</b> el registro esta <b>Borrado</b>...!!!");
                Acciones::add("Colocó el registro {$doc->id} como borrado",'Expedientes');
            } else {
                Flash::warning('No se pudo borrar el registro!!!');
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        if(!$act)$act='index';
        return Redirect::toAction($act.'/'.$exp_id.'/'.$mod_id.'/'.$bloq_id.'/'.$id_presupuesto);
    }

    public function crear_predeterminados($exp_id)
    {
        $Presupuestos = new Presupuestos();
        if($Presupuestos->count('estado=1 AND expedientes_id='.$exp_id)==0){
            $Aclconfiguraciones = new Aclconfiguraciones();
            $presupuestos_default = $Aclconfiguraciones->find_first('conditions: variable="presupuestos" AND estado=1');
            $pres_array=explode(',',$presupuestos_default->valor);
            foreach ($pres_array as $key => $value) {
               $obj = new Presupuestos();
               $pres=[];
               $pres['codigo']= '0'.($key+1);
               $pres['nombre']= $value;
               $pres['expedientes_id']= $exp_id;
               $pres['estado']= 1;
               $pres['aclusuarios_id']= Auth::get('id');
               $obj->save($pres);
            }
            Flash::info('Presupuestos creados');
            return Redirect::to('apps/expediente/generar/'.$exp_id);
        }else{
            Flash::info('Este expediente ya tiene presupuestos creados');
            return Redirect::to('apps/expediente/generar/'.$exp_id);
        }
    }
}
?>