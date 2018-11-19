<?php
View::template('apps/default_expediente');
class PartidasController extends AppController {
	
	public function crear($exp_id=NULL, $mod_id=NULL, $bloc_id=NULL, $pres_id=NULL, $ti_id=NULL){		
		$Partidas = new Partidas();
        $Titulopartidas = new Titulopartidas();
        $this->Titulo = $Titulopartidas->find((int) $ti_id);
		$this->titulo='Partida';
        $this->titulo_small='Creando una partida propia';
		$this->expedientes_id=$exp_id;
		$this->titulopartidas_id=$ti_id;
		$this->presupuestos_id = $pres_id;
		if (Input::hasPost('partidas')) {

            $obj = new Partidas();
            if (!$obj->save(Input::post('partidas'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->partidas = $obj;
                return;
            }
            
            return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);          
        }
	}
	public function editar($exp_id=NULL, $mod_id=NULL, $bloc_id=NULL, $pres_id=NULL, $ti_id=NULL,$id){
	   View::select('crear');	
		$Partidas = new Partidas();
        $Titulopartidas = new Titulopartidas();
        $this->Titulo = $Titulopartidas->find((int) $ti_id);
        $this->titulo='Partida';
        $this->titulo_small='Editar una partida propia';
        $this->expedientes_id=$exp_id;
        $this->titulopartidas_id=$ti_id;
        $this->presupuestos_id = $pres_id;
		//$this->codigo = $Presupuestos->get_codigo();
		if (Input::hasPost('partidas')) {

            $obj = $Partidas;
            //En caso que falle la operación de guardar
            if (!$obj->save(Input::post('partidas'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->partidas = $obj;
                return;
            }

            return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);
        }

		$this->partidas = $Partidas->find((int) $id);
	}

    public function borrar($exp_id=NULL, $mod_id=NULL, $bloc_id=NULL, $pres_id=NULL, $ti_id=NULL,$id){
        try {
            $id = Filter::get($id, 'digits');
            $doc = new Partidas();
            if (!$doc->find_first($id)){ //si no existe el usuario
                Flash::warning("No existe ningun registro con id '{$id}'");
            }else if ($doc->borrar()) {
                Flash::valid("El <b>{$doc->id}</b> el registro esta borrado ahora <b>Borrado</b>...!!!");
                (new Detalleanalisis)->delete_all( " partidas_id = ".$id );
                (new Detallemetrados)->delete_all( " partidas_id = ".$id );
                (new Detallestecnicos)->delete_all( " partidas_id = ".$id  );
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