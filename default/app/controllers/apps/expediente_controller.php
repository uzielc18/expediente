<?php
View::template('apps/default_expediente');
class ExpedienteController extends AdminController {
	public function index(){
		$this->titulo='Mis expedientes';
		$Expedientes = new Expedientes();
		$this->expedientes = $Expedientes->get_expedientes_all();
	}
	public function crear(){
		View::template('apps/default_app');	
		$Expedientes = new Expedientes();
		$this->titulo='Expediente nuevo';
		$this->codigo = $Expedientes->get_codigo();
		if (Input::hasPost('expedientes')) {

            $obj = $Expedientes;
            //En caso que falle la operación de guardar
            if (!$obj->save(Input::post('expedientes'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->expedientes = $obj;
                return;
            }

            return Redirect::toAction('index');
        }
	}
	public function editar($id){
	View::select('crear');	
		$Expedientes = new Expedientes();
		$this->titulo='Expediente modificar';
		$this->codigo = $Expedientes->get_codigo();
		if (Input::hasPost('expedientes')) {

            $obj = $Expedientes;
            //En caso que falle la operación de guardar
            if (!$obj->save(Input::post('expedientes'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->expedientes = $obj;
                return;
            }

            return Redirect::toAction('index');
        }

		$this->expedientes = $Expedientes->find((int) $id);
	}
	public function borrar($id, $act=NULL){
		try {
            $id = Filter::get($id, 'digits');
            $doc = new Expedientes();
            if (!$doc->find_first($id)){ //si no existe el usuario
                Flash::warning("No existe ningun registro con id '{$id}'");
            }else if ($doc->borrar()) {
                Flash::valid("El <b>{$doc->id}</b> el registro esta borrado ahora <b>Borrado</b>...!!!");
                Acciones::add("Colocó el registro {$doc->id} como borrado",'Expedientes');
            } else {
                Flash::warning('No se pudo borrar el registro!!!');
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        if(!$act)$act='index';
        return Redirect::toAction($act);
	}
	public function generar($id, $modulo_id=NULL, $bloque_id=NULL, $presupuesto_id=NULL){
		//View::select('crear');
		$this->titulo='Expediente nuevo';
		$Expedientes = new Expedientes();
		$Modulos = new Modulos();
		$Presupuestos = new Presupuestos();
		$Partidas = New Partidas();
		$Detallemetrados = New Detallemetrados();
		$Titulopartidas =  new Titulopartidas();

		/*Obtiene el expedieten princiapl*/
		$this->expediente = $Expedientes->find((int) $id);
		$b_id = $bloque_id ? $bloque_id : $Expedientes->minimum('id', 'conditions: estado=1 AND expedientes_id='.$id);		
		$m_id = $modulo_id ? $modulo_id : 1;
		/*Obtiene los modulos*/
		$this->modulo=$Modulos->find((int)$m_id);
		$this->modulos = $Modulos->find('conditions: estado=1','oreder: id DESC');
		/*Obtiene los bloques del expediente Prencipal*/
		$this->bloques = $Expedientes->find('conditions: estado=1 AND expedientes_id='.$id);
		$this->bloque= False;
		if($b_id){
			$this->bloque = $Expedientes->find((int)$b_id);
			/*Si existe un Bloque el $id = $b_id los detalles a mostrar ahora son del bloqeu seleccionado*/
			$id=$b_id;
		}
		/*Obtiene los sub presupuesto (tabla:Presupuestos)*/
		$p_id = $presupuesto_id ? $presupuesto_id : $Presupuestos->minimum('id', 'conditions: estado=1 AND expedientes_id='.$id);
		$this->presupuestos = $Presupuestos->find('conditions: estado=1 AND expedientes_id='.$id);
		$this->presupuesto = False;
		$this->partidas_nuevo=0;
		if($p_id)$this->partidas_nuevo=$Partidas->count('id','conditions: presupuestos_id='.$p_id);
		$this->array_titulo=[];
		if($p_id){
			$this->partidas = $Partidas;
			$this->array_titulo = $Titulopartidas->get_array_titulos($p_id);
			$this->presupuesto = $Presupuestos->find((int)$p_id);
		}
	}
	public function crear_bloque($exp_id, $modulo_id){		
		$Expedientes = new Expedientes();
		$Presupuestos = new Presupuestos();
		$this->expediente_padre = $expediente_padre =$Expedientes->find((int)$exp_id);
		$this->bloques =$Expedientes->find('conditions: estado=1 AND expedientes_id='.$exp_id);
		$this->id_bloque=0;$this->modulo_id=$modulo_id;
		$this->titulo='Bloque nuevo';
		$this->titulo_small= ' * '.$this->expediente_padre->nombre;
		//$this->codigo = $Expedientes->get_codigo();
		if (Input::hasPost('expedientes')) {

            $obj = Load::model('expedientes');
            //En caso que falle la operación de guardar
            if (!$obj->save(Input::post('expedientes'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->expedientes = $obj;
                return;
            }
            /*AL crear un Bloque nuevo se cpopia todo los datos dependeitens de bloque 1*/
            /*Validar si expiste un solo bloque*/
            $count_expe=$Expedientes->count("expedientes_id=".$expediente_padre->id);
            if($count_expe==1){
            	/*buscar todas las tablas dependientes table=>(presupuestos,partidas,detalleanalisis, detallestecnicos,detallemetrados)*/
            	$Presupuestos->update_all("expedientes_id=".$obj->id,"expedientes_id=".$expediente_padre->id);
            	/*$subpresupuestos = $Presupuestos->find("conditions: expedientes_id=".$expediente_padre->id); */     	

            }elseif($count_expe>1){
            	$exp_min=$Expedientes->minimum('id','conditions: expedientes_id='.$expediente_padre->id);
            	if($Presupuestos->count("expedientes_id=".$exp_min)){
            		/*inicializamos los modelos a copiar*/
            		$Partidas= new Partidas();

            		$subs=$Presupuestos->find('conditions: expedientes_id='.$exp_min);
            		$a_count = count($subs);
            		foreach($subs as $sub){
            			$NewPrespuesto = new Presupuestos();
            			$new_sub=[];
            			$new_sub['codigo']=$sub->codigo;
            			$new_sub['nombre']=$sub->nombre;
            			$new_sub['expedientes_id']=$obj->id;
            			$new_sub['estado']='1';
            			$new_sub['aclusuarios_id']=$sub->aclusuarios_id;
            			if($NewPrespuesto->save($new_sub)){
            				/*Flash::valid("El se copio...!!! new_presupuesto->id--->".$NewPrespuesto->id);*/
	            			/*inicializamos los modelos a copiar*/
	            			
	            			if($Partidas->count('presupuestos_id='.$sub->id)){
	            				
			            		$Detallestecnicos = new Detallestecnicos();
			            		$Detalleanalisis = new Detalleanalisis();
			            		$Detallemetrados = New Detallemetrados();

			            		$pps = $Partidas->find('presupuestos_id='.$sub->id);
			            		foreach ($pps as $pp) {
			            			$NewPartidas = new Partidas();
			            			$new_pp=[];
			            			$new_pp['nombre']=$pp->nombre;
			            			$new_pp['metrado']=$pp->metrado;
			            			$new_pp['parcial']=$pp->parcial;
			            			$new_pp['costo']=$pp->costo;
			            			$new_pp['presupuestos_id']=$NewPrespuesto->id;
			            			$new_pp['titulopartidas_id']=$pp->titulopartidas_id;
			            			$new_pp['medidas_id']=$pp->medidas_id;
			            			$new_pp['estado']=1;
			            			$new_pp['aclusuarios_id']=$pp->aclusuarios_id;
			            			if($NewPartidas->save($new_pp)){
			            				$dts=$Detallestecnicos->find('partidas_id='.$pp->id);
			            				$das=$Detalleanalisis->find('partidas_id='.$pp->id);
			            				$dms=$Detallemetrados->find('partidas_id='.$pp->id);
			            				foreach($dts as $dt){
			            					$Detallestecnicos = new Detallestecnicos();
			            					$new_dt = [];
			            					$new_dt['descripcion']=$dt->descripcion;
			            					$new_dt['partidas_id']=$NewPartidas->id;
			            					$new_dt['estado'] = 1;
			            					$Detallestecnicos->save($new_dt);
			            				}
			            				foreach($das as $da){
			            					$Detalleanalisis= new Detalleanalisis();
			            					$new_da = [];
			            					$new_da['cuadrilla']=$da->cuadrilla;
			            					$new_da['cantidad']=$da->cantidad;
			            					$new_da['precio']=$da->precio;
			            					$new_da['parcial']=$da->parcial;
			            					$new_da['estado']=$da->estado;
			            					$new_da['medidas_id']=$da->medidas_id;
			            					$new_da['materiales_id']=$da->materiales_id;
			            					$new_da['partidas_id']=$NewPartidas->id;
			            					$Detalleanalisis->save($new_da);
			            				}
			            				foreach($dms as $dm){
			            					$Detallemetrados = new Detallemetrados();
			            					$new_dm = [];
			            					$new_dm['nombre']=$dm->nombre;
			            					$new_dm['numero_de_veces']=$dm->numero_de_veces;
			            					$new_dm['largo']=$dm->largo;
			            					$new_dm['ancho']=$dm->ancho;
			            					$new_dm['altura']=$dm->altura;
			            					$new_dm['parcial']=$dm->parcial;
			            					$new_dm['estado']=$dm->estado;
			            					$new_dm['partidas_id']=$NewPartidas->id;
			            					$Detallemetrados->save($new_dm);
			            				}
			            			}
			            		}
	            			}
            			}
            		}
            	}

            }
            return Redirect::toAction('generar/'.$exp_id.'/'.$modulo_id.'/'.$obj->id);
        }
	}
	public function editar_bloque($exp_id=NULL, $modulo_id=NULL, $id){
		View::select('crear_bloque');	
		$Expedientes = new Expedientes();
		$Presupuestos = new Presupuestos();
		$this->expediente_padre = $expediente_padre =$Expedientes->find((int)$exp_id);

		$this->bloques =$Expedientes->find('conditions: estado=1 AND expedientes_id='.$exp_id.' AND id!='.$id);
		$this->id_bloque=$id;$this->modulo_id=$modulo_id;
		$this->titulo='Modificar bloque';
		$this->titulo_small= ' * '.$this->expediente_padre->nombre;
		//$this->codigo = $Expedientes->get_codigo();
		//$this->codigo = $Presupuestos->get_codigo();
		if (Input::hasPost('expedientes')) {

            $obj = $Expedientes;
            //En caso que falle la operación de guardar
            if (!$obj->save(Input::post('expedientes'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->expedientes = $obj;
                return;
            }

            return Redirect::toAction('generar/'.$exp_id.'/'.$modulo_id);
        }

		$this->expedientes = $Expedientes->find((int) $id);
	}
	public function borrar_bloque($exp_id=NULL, $modulo_id=NULL, $id, $act=NULL){
		try {
            $id = Filter::get($id, 'digits');
            $doc = new Expedientes();
            if (!$doc->find_first($id)){ //si no existe el usuario
                Flash::warning("No existe ningun registro con id '{$id}'");
            }else if ($doc->borrar()) {
                Flash::valid("El <b>{$doc->id}</b> el registro esta borrado ahora <b>Borrado</b>...!!!");
                Acciones::add("Colocó el registro {$doc->id} como borrado",'Expedientes');
            } else {
                Flash::warning('No se pudo borrar el registro!!!');
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        if(!$act)$act='index';
        return Redirect::toAction($act.'/'.$exp_id.'/'.$modulo_id);
	}

	public function ordenar($id, $modulo_id=NULL, $bloque_id=NULL, $presupuesto_id=NULL)
	{
		$this->titulo="Oderan las partidas";
		$Expedientes = new Expedientes();
		$Modulos = new Modulos();
		$Presupuestos = new Presupuestos();
		$Partidas = New Partidas();
		$Detallemetrados = New Detallemetrados();
		$Titulopartidas =  new Titulopartidas();

		/*Obtiene el expedieten princiapl*/
		$this->expediente = $Expedientes->find((int) $id);
		$this->modulo=$Modulos->find((int)$m_id);
		$b_id = $bloque_id ? $bloque_id : $Expedientes->minimum('id', 'conditions: estado=1 AND expedientes_id='.$id);		
		$m_id = $modulo_id ? $modulo_id : 1;
		$this->bloque= False;
		if($b_id){
			$this->bloque = $Expedientes->find((int)$b_id);
			/*Si existe un Bloque el $id = $b_id los detalles a mostrar ahora son del bloqeu seleccionado*/
			$id=$b_id;
		}
		/*Obtiene los sub presupuesto (tabla:Presupuestos)*/
		$p_id = $presupuesto_id ? $presupuesto_id : $Presupuestos->minimum('id', 'conditions: estado=1 AND expedientes_id='.$id);
		//$this->presupuestos = $Presupuestos->find('conditions: estado=1 AND expedientes_id='.$id);
		$this->presupuesto = False;
		$this->partidas_nuevo=0;
		if($p_id)$this->partidas_nuevo=$Partidas->count('id','conditions: presupuestos_id='.$p_id);
		$this->array_titulo=[];
		if($p_id){
			$this->partidas = $Partidas;
			$this->array_titulo = $Titulopartidas->get_array_titulos($p_id);
			$this->presupuesto = $Presupuestos->find((int)$p_id);
		}

	}

}

?>