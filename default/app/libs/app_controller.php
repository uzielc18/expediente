<?php

/**
 * Todas las controladores heredan de esta clase en un nivel superior
 * por lo tanto los metodos aqui definidos estan disponibles para
 * cualquier controlador.
 *
 * @category Kumbia
 * @package Controller
 * */
// @see Controller nuevo controller
require_once CORE_PATH . 'kumbia/controller.php';

class AppController extends Controller {
public $estados=array('0'=>'Sin uso','1'=>'Activo','2'=>'Inactivo','3'=>'Papelera','9'=>'Privado');
public $meses=array('01'=>'Enero','02'=>'Febrero','03'=>'Marzo','04'=>'Abril','05'=>'Mayo','06'=>'Junio','07'=>'Julio','08'=>'Agosto','09'=>'Septiembre','10'=>'Octubre','11'=>'Noviembre','12'=>'Diciembre');
public $titulo_page = 'Resumen';
public $titulo_small_page = 'Expedietnes, Partidas';
    final protected function initialize()
	{
		
    }

    final protected function finalize() {
        
    }

}