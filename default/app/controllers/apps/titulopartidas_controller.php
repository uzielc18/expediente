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
        $this->codigo = $Titulopartidas->_codigo_titulo($pres_id);
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

		$this->titulopartidas = $Titulopartidas->find((int) $id);
	}
}
?>