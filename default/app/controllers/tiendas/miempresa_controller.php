<?php 
/**
 * 
 */
View::template('apps/default_app');
class MiempresaController extends AppController
{
    public function index(){
        
    }
	public function ver(){
		$Aclempresas =  new Aclempresas ();
		$this->tienda=$Aclempresas->find((int) Auth::get('aclempresas_id'));
		if (Input::hasPost('tienda')) {

            $obj = $Aclempresas;
            //En caso que falle la operación de guardar
            if (!$obj->save(Input::post('tienda'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->tienda = $obj;
                return;
            }
            Flash::valid('Operación correcta');
            return Redirect::toAction('ver');
        }
	}
}
?>