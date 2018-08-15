<?php
View::template('apps/default_expediente');
class MetradosController extends AppController {
    
    public function crear($partida_id){     
        $Detallemetrados = new Detallemetrados();
        $Partidas = new Partidas();
        $Modulos = new Modulos();
        $this->crear=1;
        $this->modulo=$Modulos->find_first('conditions: codigo="METRADO"');
        $this->partida=$Partidas->find((int)$partida_id);
        $this->codigo_tipo_de_partida=$this->partida->getTipopartidas()->codigo;
        $this->titulo='Crear metrados para la Partida <b>'.$this->partida->nombre.'</b> del Modulo <b>'.$this->modulo->descripcion.'</b>';
        $this->titulo_small='Todos los detalles';
        $this->metrados=$Detallemetrados->find('conditions: partidas_id='.$partida_id);
        $this->totales = $Detallemetrados->totales_partidas($partida_id);
        //$this->expedientes_id=$exp_id;
        //se verifica si se ha enviado via POST los datos
        if (Input::hasPost('detallemetrados')) {
            $obj = new Detallemetrados();
            //Con Foto Cuando el tipo de partida es AC
            if($this->codigo_tipo_de_partida==='AC'){
            if ($obj->saveWithPhoto(Input::post('detallemetrados'))) {
                //Mensaje de éxito y retorna al listado
                Flash::valid('detalle creado');
                return Redirect::toAction('crear/'.$partida_id);
            }
            }else{
                if ($obj->save(Input::post('detallemetrados'))) {
                Flash::valid('detalle creado');
                return Redirect::toAction('crear/'.$partida_id);
            }
            }
            //Si falla se hacen persistentes los datos en el formulario
            Flash::error('Falló Operación');
            $this->detallemetrados = Input::post('detallemetrados');
            return;
        }
       
    }
    public function editar($partida_id, $id){
        View::select('crear');  
        $Detallemetrados = new Detallemetrados();
        $Partidas = new Partidas();
        $Modulos = new Modulos();
        $this->crear=0;
        $this->modulo=$Modulos->find_first('conditions: codigo="METRADO"');
        $this->partida=$Partidas->find((int)$partida_id);
        $this->codigo_tipo_de_partida=$this->partida->getTipopartidas()->codigo;
        $this->titulo='Crear metrados para la Partida <b>'.$this->partida->nombre.'</b> del Modulo <b>'.$this->modulo->descripcion.'</b>';
        $this->titulo_small='Todos los detalles';
        $this->metrados=$Detallemetrados->find('conditions: partidas_id='.$partida_id);
        $this->totales = $Detallemetrados->totales_partidas($partida_id);
        $this->detallemetrados = $Detallemetrados->find((int) $id);
        if (Input::hasPost('detallemetrados')) {
            if ($this->detallemetrados->save(Input::post('detallemetrados'))) {
                Flash::valid('detalle actualizado');
                return Redirect::toAction('crear/'.$partida_id);
            }
            //Flash::error('Falló Operación');
            $this->detallemetrados = Input::post('detallemetrados');
            return;
            //return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);          
        }
    }
    public function update_photo($partida_id, int $id)//validación 'int' con php7
    {
        $Detallemetrados = new Detallemetrados();
        $Partidas = new Partidas();
        $Modulos = new Modulos();
        $this->crear=0;
        $this->modulo=$Modulos->find_first('conditions: codigo="METRADO"');
        $this->partida=$Partidas->find((int)$partida_id);
        $this->titulo='Actualizar la imagen de <b>'.$this->partida->nombre.'</b> del Modulo <b>'.$this->modulo->descripcion.'</b>';
        $this->titulo_small='';
       
        $this->detallemetrados = $Detallemetrados->find((int) $id);
        //se verifica si se ha enviado via POST los datos
        if (Input::hasPost('detallemetrados')) {

            if(file_exists('img/upload/'.$this->detallemetrados->imagen)){
                unlink('img/upload/'.$this->detallemetrados->imagen);
            }
            //Si falla al intentar actualizar
            if ($this->detallemetrados->updatePhoto()) {
                //Mensaje de éxito y retorna al listado
                Flash::valid('Foto actualizada');
                return Redirect::toAction('crear/'.$partida_id);
            }
            //se hacen persistentes los datos en el formulario
            //$this->detallemetrados = Input::post('detallemetrados');
            return Redirect::toAction('update_photo/'.$partida_id.'/'.$id);
        }
    }

    public function delete_potho($partida_id, int $id){
        $Detallemetrados = new Detallemetrados();
        $Partidas = new Partidas();
        $detallemetrados = $Detallemetrados->find((int) $id);
        if(file_exists('img/upload/'.$detallemetrados->imagen)){
            unlink('img/upload/'.$detallemetrados->imagen);
            $detallemetrados->imagen='';
            $detallemetrados->save();
        }


        return Redirect::toAction('update_photo/'.$partida_id.'/'.$id);
    }


    public function terminar($exp_id,$mod_id,$bloc_id,$pres_id){    
        //View::select('crear');  
        if (Input::hasPost('partida')) {

            $obj = new Partidas();
            $datos = Input::post('partida');
            $datos['detallemetrados']=base64_encode($datos['detallemetrados']);
            print_r($datos);
            if (!$obj->save($datos)) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->partidas = $obj;
                return;
            }
            
            return Redirect::to('apps/expediente/generar/'.$exp_id.'/'.$mod_id.'/'.$bloc_id.'/'.$pres_id);          
        }
    }
}
?>