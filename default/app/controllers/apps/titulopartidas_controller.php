<?php
View::template('apps/default_expediente');
class TitulopartidasController extends AppController {
	
	public function crear($exp_id=NULL, $mod_id=NULL, $bloc_id=NULL, $pres_id=NULL,$titulopartidas_id=NULL){		
		$Titulopartidas = new Titulopartidas();
        $Presupuestos = new Presupuestos();
        $pres = $Presupuestos->find((int) $pres_id);
        $TITULO=$titulopartidas_id ? $Titulopartidas->find((int) $titulopartidas_id):NULL;
		$this->titulo='Titulo nuevo para el presupuesto <b>'.$pres->nombre.'</b> del <b>'.$pres->getExpedientes()->nombre.'</b>';
        $this->titulo_small=$titulopartidas_id ? 'Subtitulo de '.$TITULO->titulo:'Titulo principal';
		$this->expedientes_id=$exp_id;
		$this->titulopartidas_id=$titulopartidas_id;
        $this->codigo = $Titulopartidas->_codigo_titulo($pres_id,$titulopartidas_id);
		$this->presupuestos_id = $pres_id;
		if (Input::hasPost('titulopartidas')) {

            $obj = new Titulopartidas();
            //En caso que falle la operación de guardar
            if ($obj->save(Input::post('titulopartidas'))) {
                //se hacen persistente los datos en el formulario
                return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);
            }else{

                Flash::error('Falló Operación');
                $this->titulopartidas = $obj;
                return;
            }            
        }
	}
	public function editar($exp_id=NULL, $mod_id=NULL, $bloc_id=NULL, $pres_id=NULL, $id){	
		$Titulopartidas = new Titulopartidas();
        $Partidas = new Partidas();
		$this->titulo='Titulo partidas editar';
        $this->titulo_small='Si este titulo no lo creo uds se creara uno nuevo y se actualizara las partidas dependientes de ella';
        $this->expedientes_id=$exp_id;
        //$this->modulos_id=$mod_id;
        $this->presupuestos_id = $pres_id;
		//$this->codigo = $Presupuestos->get_codigo();
		if (Input::hasPost('titulopartidas')) {

            $obj = $Titulopartidas;
            //En caso que falle la operación de guardar
            if (!$obj->save(Input::post('titulopartidas'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->titulopartidas = $obj;
                return;
            }
            if($obj->aclusuarios_id!=Auth::get('id')){
                $Partidas->update_all("titulopartidas_id=".$obj->id,"titulopartidas_id=".$id);
            }
            return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);
        }
        $this->titulo_superior=False;
		$this->titulopartidas = $Titulopartidas->find((int) $id);
        if($this->titulopartidas->titulopartidas_id){
            $this->titulo_superior=$Titulopartidas->find((int) $this->titulopartidas->titulopartidas_id);

        }
	}
    public function borrar($exp_id=NULL, $mod_id=NULL, $bloc_id=NULL, $pres_id=NULL, $id){
        try {
            $id = Filter::get($id, 'digits');
            $doc = new Titulopartidas();
            if (!$doc->find_first($id)){ //si no existe el usuario
                Flash::warning("No existe ningun registro con id '{$id}'");
            }else if ($doc->borrar()) {
                Flash::valid("El <b>{$doc->id}</b> el registro esta borrado ahora <b>Borrado</b>...!!!");
                Acciones::add("Colocó el registro {$doc->id} como borrado",'Titulopartidas');
            } else {
                Flash::warning('No se pudo borrar el registro!!!');
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
         return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);
    }
}
?>