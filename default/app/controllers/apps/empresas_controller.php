<?php
View::template('apps/default_app');
class EmpresasController extends AppController {
	
	public function resultados(){
	 	View::template(NULL); 
		//$this->data[] = [];
		$q=$_GET['q'];
		$obj = new Aclempresas();
		$results = $obj->find('conditions: nombre like "%'.$q.'%"');
		$n=0;
		foreach ($results as $value)
		{
			$n++;
			//$id=$value->departamento."-".$value->provincia."-".$value->distrito;
			$id = $value->id;
			$name=$value->nombre;
			$json = array();
			$json['id'] = $id;
			$json['name'] = $name;
			$this->data[] = $json;
		}
        if($n==0){
        $json = array();
        $json['id'] = 0;
        $json['name'] = 'Otro Cliente';
        $this->data[]= $json;

        }


	}
}
?>