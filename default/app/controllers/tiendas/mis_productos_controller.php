<?php 
/**
 * 
 */
View::template('apps/default_app');
class MisProductosController extends AppController
{
	public function index(){
		
	}
    public function listar(){
    	$this->titulo='Mis productos';
        $MisProductos= new Preciosempresas();
        $this->results=$MisProductos->getMisProductos();
    }
}
?>