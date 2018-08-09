<?php
View::template('apps/default_app');
class UsuariosController extends AdminController {
    
    protected function before_filter() {
        if ( Input::isAjax() ){
			View::response('view');
            //View::select(NULL, NULL);
        }
    }

    public function perfil() {
        try {

            $usr = new Aclusuarios();
			$dat= new Acldatos();
            $this->usuario1 = $usr->find_first(Auth::get('id'));
			$this->datos = $dat->find_first('conditions: id='.Auth::get('acldatos_id'));
            if (Input::hasPost('usuario1')) {
                if ($usr->update(Input::post('usuario1'))) {
                    Flash::valid('Datos Actualizados Correctamente');
                    $this->usuario1 = $usr;
                }
				if (Input::hasPost('datos')) {
					$dat->fnacimiento=Input::post('anio').'-'.Input::post('mes').'-'.Input::post('dia');
					$dat->nombre=$usr->nombres;
                if ($dat->update(Input::post('datos'))) {
                    Flash::valid('Datos Actualizados Correctamente');
                    $this->datos = $dat;
                }
				}
            } else if (Input::hasPost('usuario2')) {
                if ($usr->cambiar_clave(Input::post('usuario2'))) {
                    Flash::valid('Clave Actualizada Correctamente');
                    $this->usuario1 = $usr;
                }
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

}
