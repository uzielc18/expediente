<?php 
View::template('backend/backend');
class AcldatosController extends ScaffoldController
{
	public $model='acldatos';
	public $columns='id,nombre,appaterno,apmaterno,dni';
}
?>