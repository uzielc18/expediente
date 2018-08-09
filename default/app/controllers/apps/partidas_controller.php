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
}
?>