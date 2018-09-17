<?php 
/**
 * 
 */
class MiempresaController extends AppController
{
	public function ver(){
		$Aclempresas =  new Aclempresas ();
		$this->tienda=$Aclempresas->find((int) Auth::get('aclempresas_id'));
	}
}
?>