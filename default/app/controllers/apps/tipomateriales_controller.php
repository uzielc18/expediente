<?php 
View::template('apps/default_app');
class TipomaterialesController extends AppController
{
	public function index($tipomateriales_id=1,$id=NULL){
		$this->id=$tipomateriales_id;
		$this->titulo="Ingresar Indices Unificados";
		$TipoMateriales = new Tipomateriales();
		$this->tipos = $TipoMateriales->get_principales();
		$this->tipo = $TipoMateriales->find((int)$tipomateriales_id);
		$this->indices = $TipoMateriales->find('conditions: estado=1 AND tipomateriales_id='.$tipomateriales_id);
		if($id)$this->tipomateriales=$TipoMateriales->find((int)$id);
		if (Input::hasPost('tipomateriales')) {
            $obj = new Tipomateriales();
            //En caso que falle la operación de guardar
            if ($obj->save(Input::post('tipomateriales'))) {
                //se hacen persistente los datos en el formulario
                return Redirect::to('apps/tipomateriales/index/'.$obj->tipomateriales_id);
            }else{

                Flash::error('Falló Operación');
                $this->tipomateriales = $obj;
                return;
            }            
        }
	}
	public function crear()
	{
		if (Input::hasPost('tipomateriales')) {
            $obj = new Tipomateriales();
            //En caso que falle la operación de guardar
            if ($obj->save(Input::post('tipomateriales'))) {
                //se hacen persistente los datos en el formulario
                return Redirect::to('apps/tipomateriales/index/'.$obj->tipomateriales_id);
            }else{

                Flash::error('Falló Operación');
                $this->tipomateriales = $obj;
                return;
            }            
        }
	}
	public function editar($tipomateriales_id,$id)
	{
		if (Input::hasPost('tipomateriales')) {
            $obj = new Tipomateriales();
            //En caso que falle la operación de guardar
            if ($obj->save(Input::post('tipomateriales'))) {
                //se hacen persistente los datos en el formulario
                return Redirect::to('apps/tipomateriales/index/'.$obj->tipomateriales_id);
            }else{

                Flash::error('Falló Operación');
                $this->titulopartidas = $obj;
                return;
            }            
        }
	}
    public function borrar($tipomateriales_id,$id){
        try {
            $id = Filter::get($id, 'digits');
            $doc = new Tipomateriales();
            if (!$doc->find_first($id)){ //si no existe el usuario
                Flash::warning("No existe ningun registro con id '{$id}'");
            }else if ($doc->borrar()) {
                Flash::valid("El <b>{$doc->id}</b> el registro esta borrado ahora <b>Borrado</b>...!!!");
            } else {
                Flash::warning('No se pudo borrar el registro!!!');
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Redirect::toAction('index/'.$tipomateriales_id);
    }
}
?>