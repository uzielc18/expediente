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
		$this->codigo_new=$Materiales->get_codigo($indices_id);
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
		$this->codigo_new=$this->materiales->codigo;

	}
	public function resultados(){
	 	View::template(NULL); 
		//$this->data[] = [];
		$q=$_GET['q'];
		$obj = new Materiales();
		$results = $obj->find('conditions: (descripcion like "%'.$q.'%") or (nombre like "%'.$q.'%") or (codigo like "%'.$q.'%") AND estado=1');
		foreach ($results as $value)
		{
			$id = $value->id;
			$name=$value->getCodigoCompleto()." ".$value->nombre;
			$json = array();
			$json['id'] = $id;
			$json['name'] = $name;
			$this->data[] = $json;
		}

	}
	public function get_new_codigo($tipo){
		View::template(NULL); 
		$Materiales = new Materiales();
		$this->new_codigo=$Materiales->get_codigo($tipo);
	}
}
?>