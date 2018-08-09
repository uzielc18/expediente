<?php 
View::template('backend/backend');
class ConfiguracionesController extends ScaffoldController
{
	public $model='aclconfiguraciones';
	public $columns='id,variable,valor';
}
?>