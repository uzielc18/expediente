<?php
class Detallemetrados extends ActiveRecord {

    public function initialize() {
        //relaciones
		//$this->has_many('tesletrasingresos','tesdetracciones','tesdetalleingresos','tescheuqesingresos');
		$this->belongs_to('modulos','partidas');
    }

}
?>