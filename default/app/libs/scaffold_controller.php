<?php

class ScaffoldController extends AdminController {

    public $scaffold = 'kumbia';
    
    public function index($page=1) {

         $this->{$this->model} = Load::model($this->model);
         $conditions='1=1';
         if(Input::hasPost($this->model))
         {  
            $conditions='';
            $val=Input::post($this->model);
            $n=0;
            foreach ($val as $key => $value) 
            {
               if(!empty($value)){
                    $n++;
                    $AND = $n==1 ? '' : ' AND ';
                    $conditions.= $AND.$key.'='.$value;
                }
            }
         }
        if($this->columns){
            $this->results = Load::model($this->model)->paginate("conditions: $conditions","columns: $this->columns","page: $page", 'order: estado DESC');
            $this->columns_view = explode(",", $this->columns);
        }else{
            $this->results = Load::model($this->model)->paginate("conditions: $conditions","page: $page", 'order: estado DESC');
            if($this->results->items)$this->columns_view = current($this->results->items)->fields;
        }
		
    }

    /**
     * Crea un Registro
     */
    public function crear() {
        if (Input::hasPost($this->model)) {

            $obj = Load::model($this->model);
            //En caso que falle la operación de guardar
            if (!$obj->save(Input::post($this->model))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->{$this->model} = $obj;
                return;
            }

            return Redirect::toAction('index');
        }
        // Solo es necesario para el autoForm
        $this->{$this->model} = Load::model($this->model);
    }

    /**
     * Edita un Registro
     */
    public function editar($id) {
        View::select('crear');
        //se verifica si se ha enviado via POST los datos
        if (Input::hasPost($this->model)){
            $obj = Load::model($this->model);
            if (!$obj->update(Input::post($this->model))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->{$this->model} = Input::post($this->model);
            }else{
                return Redirect::toAction('index');
            }
        }

        //Aplicando la autocarga de objeto, para comenzar la edición
        $this->{$this->model} = Load::model($this->model)->find((int) $id);
    }

    /**
     * Borra un Registro
     */
    public function eliminar($id) {
        if (!Load::model($this->model)->delete((int) $id)) {
            Flash::error('Falló Operación');
        }
        //enrutando al index para listar los articulos
        Redirect::toAction('index');
    }
    public function eliminar_estado_all() {
        if (!Load::model($this->model)->delete('estado=3')) {
            Flash::error('Falló Operación');
        }
        //enrutando al index para listar los articulos
        Redirect::toAction('index');
    }
    public function borrar($id){
        try {
            $id = Filter::get($id, 'digits');
            $doc = Load::model($this->model);
            if (!$doc->find_first($id)){ //si no existe el usuario
                Flash::warning("No existe ningun registro con id '{$id}'");
            }else if ($doc->borrar()) {
                Flash::valid("El <b>{$doc->id}</b> el registro esta borrado ahora <b>Borrado</b>...!!!");
                Acciones::add("Colocó el registro {$doc->id} como borrado", $this->model);
            } else {
                Flash::warning('No se pudo borrar el registro!!!');
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Redirect::toAction('index');
    }

    /**
     * Ver un Registro
     */
    public function ver($id) {
        $this->result = Load::model($this->model)->find_first((int) $id);
    }
	public function activar($id) {
        try {
            $id = Filter::get($id, 'digits');
            $doc = Load::model($this->model);
            if (!$doc->find_first($id)){ //si no existe el usuario
                Flash::warning("No existe ningun registro con id '{$id}'");
            }else if ($doc->activar()) {
                Flash::valid("El <b>{$doc->id}</b> el registro esta activo ahora <b>Activo</b>...!!!");
                Acciones::add("Colocó el registro {$doc->id} como activo", $this->model);
            } else {
                Flash::warning('No se pudo Activar el almacen!!!');
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Redirect::toAction('index');
    }
	public function desactivar($id) {
        try {
            $id = Filter::get($id, 'digits');
            $doc = Load::model($this->model);
            if (!$doc->find_first($id)){ //si no existe el usuario
                Flash::warning("No existe ningun registro con id '{$id}'");
            }else if ($doc->desactivar()) {
                Flash::valid("El registro  <b>{$doc->id}</b> Esta ahora <b>Inactivo</b>...!!!");
                Acciones::add("Colocó el registro {$doc->id} como inactivo", $this->model);
            } else {
                Flash::warning('No se Pudo Desactivar el registro...!!!');
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Redirect::toAction('index');
    }

}
