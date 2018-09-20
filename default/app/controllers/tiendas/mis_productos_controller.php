<?php 
/**
 * 
 */
View::template('apps/default_app');
class MisProductosController extends AppController
{
	public function index(){
		
	}
    public function listar($page=1){
    	$this->titulo='Mis productos';
        $MisProductos= new Preciosempresas();
        $per_page=10;
        $this->results=$MisProductos->getMisProductos($per_page, $page);
    }

    public function crear(){
    	$this->titulo='Crear producto';
    }
}
?>