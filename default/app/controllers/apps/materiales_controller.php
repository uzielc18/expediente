<?php 
View::template('apps/default_app');
class MaterialesController extends AppController{
	public function index($tipomateriales_id=1,$indices_id=NULL){
		$this->titulo="Administracion de materiales";
		$this->id=$tipomateriales_id;
		$TipoMateriales = new Tipomateriales();
		$Materiales = new Materiales();
		$this->tipos = $TipoMateriales->get_principales();
		$this->tipo = $TipoMateriales->find((int)$tipomateriales_id);
		$this->indices = $TipoMateriales->find('conditions: estado=1 AND tipomateriales_id='.$tipomateriales_id);
		$this->indice = false;
		if($indices_id){
			$this->indice = $TipoMateriales->find((int)$indices_id);
			$this->materiales=$Materiales->find('conditions: estado=1 AND tipomateriales_id='.$indices_id);
		}
	}

	public function crear($tipomateriales_id,$indices_id)
	{
		$this->titulo="Crear materiales nuevos";
		$Materiales = new Materiales();		
		$TipoMateriales = new Tipomateriales();		
		$this->tipo = $TipoMateriales->find((int)$tipomateriales_id);
		$this->indices_id = $indices_id;
		if (Input::hasPost('materiales')) {

            $obj = $Materiales;
            //En caso que falle la operación de guardar
            if (!$obj->save(Input::post('materiales'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->materiales = $obj;
                return;
            }

            return Redirect::to('apps/materiales/index/'.$tipomateriales_id.'/'.$indices_id.'#');
        }

	}

	public function editar($tipomateriales_id,$indices_id,$id)
	{
		View::select("crear");
		$this->titulo="Editar Materiales";
		$Materiales = new Materiales();		
		$TipoMateriales = new Tipomateriales();		
		$this->tipo = $TipoMateriales->find((int)$tipomateriales_id);
		$this->indices_id = $indices_id;
		if (Input::hasPost('materiales')) {

            $obj = $Materiales;
            //En caso que falle la operación de guardar
            if (!$obj->save(Input::post('materiales'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->materiales = $obj;
                return;
            }

            return Redirect::to('apps/materiales/index/'.$tipomateriales_id.'/'.$indices_id.'#');
        }

        $this->materiales = $Materiales->find((int) $id);

	}
}
?>