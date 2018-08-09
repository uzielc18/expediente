<?php
class Aclempresas extends ActiveRecord {

    public function initialize() {
        //relaciones
		$this->has_many('plareas','aclusuarios','acldatos','expedientes');
		$this->validates_presence_of('nombre', 'message: Debe escribir un <b>Nombre</b>');
		$this->validates_presence_of('razonsocial', 'message: Debe escribir la <b>Razon Social de la Empresa</b>');
		$this->validates_numericality_of('ruc', 'message:Este campo acepta solo numeros');
		//$this->validates_presence_of('ruc', 'message: Debe escribir <b> el Ruc de la Empresa</b>');
		$this->validates_presence_of('telefonos', 'message: Debe escribir el Telefono de la Empresa</b>');
    }
	public function before_validation_on_create() {
        $this->validates_uniqueness_of('ruc', 'message: El <b>Ruc</b> ya está siendo utilizado');
    }
    public function iniciales_personal()
    {
        return $this->find_all_by_sql("SELECT concat_ws('',ucase(left(substring_index(nombre,' ',1),1)),ucase(left(if(substring_index(nombre,' ',1)=substring_index(nombre,' ',-1),'',substring_index(nombre,' ',-1)),1)),ucase(left(appaterno,1)),ucase(left(apmaterno,1))) as abr, nombre FROM `acldatos` WHERE id!= 1 AND id!=38 AND (aclempresas_id=".Session::get('EMPRESAS_ID').' OR aclempresas_id=0) ORDER BY acldatos.nombre ASC');

    }
}
?>