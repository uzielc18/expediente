<?php 
View::template('apps/default_app');
class MisProductosController extends AppController
{
	public function index(){
		
	}
    public function listar($tipomateriales_id=1,$indices_id=0,$page=1){
    	//View::select('/tiendas/materiales/index');
    	$this->titulo="Administracion de materiales";
		$this->id=$tipomateriales_id;
		$TipoMateriales = new Tipomateriales();
		//$Materiales = new Materiales();
		$MisProductos= new Preciosempresas();
		$this->tipos = $TipoMateriales->get_principales();
		$this->tipo = $TipoMateriales->find((int)$tipomateriales_id);
		$this->indices = $MisProductos->getMisTipoMateriales($tipomateriales_id);
		$this->indice = false;
		if($indices_id){
			$this->indice = $TipoMateriales->find((int)$indices_id);
			$per_page=10;
			$this->materiales=$MisProductos->getMisProductos($per_page, $page,$indices_id);
			
	    	$this->titulo='Mis productos';
	        //$per_page=10;
	        //$this->results=$MisProductos->getMisProductos($per_page, $page);
    	}
    }

    public function crear($tipomateriales_id,$indices_id=0,$id=0)
	{
		$this->titulo="Crear productos nuevos";
		$Materiales = new Materiales();
		$Preciosempresas= new Preciosempresas();

		$this->indices_id = $indices_id;
		$this->id=$id;
		if($id!=0){
			$this->materiales=$Materiales->find((int) $id);
			$id_max=$Preciosempresas->maximum("id", 'conditions: materiales_id='.$id);
			$this->preciosempresas=$Preciosempresas->find_first($id_max);
			$this->indices_id = $this->materiales->tipomateriales_id;
		}
		$TipoMateriales = new Tipomateriales();		
		$this->tipo = $TipoMateriales->find((int)$tipomateriales_id);
		$this->codigo_new = $indices_id ? $Materiales->get_codigo($indices_id): '1';
		if (Input::hasPost('materiales')) {

            $obj = $Materiales;
            //En caso que falle la operación de guardar
            if (!$obj->save(Input::post('materiales'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->materiales = $obj;
                return;
            }else{
            	$p_obj=$Preciosempresas;
            	$new_obj=Input::post('preciosempresas');
            	$new_obj['aclempresas_id']=Auth::get('aclempresas_id');
            	$new_obj['materiales_id']=$obj->id;
            	$new_obj['precio']=$obj->precio;
            	if (!$p_obj->save($new_obj)) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->materiales = $obj;
                return;
            	}
            }

            return Redirect::toAction('listar/'.$tipomateriales_id.'/'.$indices_id.'#');
        }

	}

	public function editar($tipomateriales_id,$indices_id,$id)
	{
		View::select("crear");
		$this->titulo="Editar Materiales";
		$Materiales = new Materiales();
		$Preciosempresas= new Preciosempresas();	
		$TipoMateriales = new Tipomateriales();
		$this->id=$id;	
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
            }else{
            	$p_obj=$Preciosempresas;
            	$new_obj=Input::post('preciosempresas');
            	$new_obj['precio']=$obj->precio;
            	if (!$p_obj->save($new_obj)) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->materiales = $obj;
                return;
            	}
            }

            return Redirect::toAction('listar/'.$tipomateriales_id.'/'.$indices_id.'#');
        }

        $this->materiales = $Materiales->find((int) $id);
		$id_max=$Preciosempresas->maximum("id", 'conditions: materiales_id='.$id);
		$this->preciosempresas=$Preciosempresas->find_first($id_max);
		$this->codigo_new=$this->materiales->codigo;

	}
	public function lista_precios($id_material){
		View::template('ajax');
		$Preciosempresas= new Preciosempresas();
		$Materiales = new Materiales();
		$this->material = $Materiales->find((int) $id_material);
		$this->precios=$Preciosempresas->find('conditions: materiales_id='.$id_material);
	}
}
?>