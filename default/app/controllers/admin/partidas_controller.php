<?php 
View::template('backend/backend');
class PartidasController extends ScaffoldController
{
	public $model='partidas';
	public $columns='id,nombre,metrado,costo,parcial,estado,rendimiento';
}
?>