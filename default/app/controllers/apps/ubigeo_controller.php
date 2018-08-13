<?php
View::template('apps/default_app');
class UbigeoController extends AppController {
	
	public function resultados(){
	 	View::template(NULL);
		$q=$_GET['q'];
		$obj = new Ubigeo();
		$results = $obj->find('conditions: distrito like "%'.$q.'%"');
		foreach ($results as $value)
		{
			$id = $value->id;
			$name=$value->departamento." ".$value->provincia." ".$value->distrito;
			$json = array();
			$json['id'] = $id;
			$json['name'] = $name;
			$this->data[] = $json;
		}

	}
}
?>