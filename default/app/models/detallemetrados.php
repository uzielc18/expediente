<?php
class Detallemetrados extends ActiveRecord {

    public function initialize() {
        //relaciones
		//$this->has_many('tesletrasingresos','tesdetracciones','tesdetalleingresos','tescheuqesingresos');
		$this->belongs_to('modulos','partidas');
    }

     public function saveWithPhoto($data)
    {
        //Inicia la transacción
        $this->begin();
        //Intenta crear el usuario con los datos pasados
        echo "<pre>";
        print_r($data);
        print_r($_FILES['imagen']);
        echo "</pre>";
        if ($this->create($data)) {
            //Intenta subit y actualizar la foto
             
        	if ($this->updatePhoto()) {
                //Se confirma la transacción
                $this->commit();
                return true;
            }
        }
        //Si alga falla se regresa la transacción
        $this->rollback();
        return false;
    }
    /**
     * Sube y actualiza la foto del usuario.
     *
     * @return boolean|null
     */
    public function updatePhoto()
    {
        //Intenta subir la foto que viene en el campo 'photo'
        if ($photo = $this->uploadPhoto('imagen')) {
            //Modifica el campo photo del usuario y lo intenta actualizar
            $this->imagen = $photo;
            return $this->update();
        }
    }
    /**
     * Sube la foto y retorna el nombre del archivo generado.
     *
     * @param string $imageField Nombre de archivo recibido por POST
     * @return string|false
     */
    public function uploadPhoto($imageField)
    {
        //Usamos el adapter 'image'
        $file = Upload::factory($imageField, 'image');
        $file->setMinSize("262144");//Tamaño minimo del archivo 250 bytes aprox
	    $file->setMaxSize("3048576");//Tamaño maximo del archivo 1 MB
        //le asignamos las extensiones a permitir
        $file->setExtensions(array('jpg', 'png', 'gif', 'jpeg'));
        //Intenta subir el archivo
        if ($file->isUploaded()) {
            //Lo guarda usando un nombre de archivo aleatorio y lo retorna.
            return $file->save($name=$this->id.'-imagen');
        }
        //Si falla al subir
        return false;
    }

}
?>