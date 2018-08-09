<?php

/**
 * KumbiaPHP web & app Framework
 *
 * LICENSE
 *
 * This source file is subject to the new BSD license that is bundled
 * with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://wiki.kumbiaphp.com/Licencia
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@kumbiaphp.com so we can send you a copy immediately.
 *
 * Flash Es la clase standard para enviar advertencias,
 * informacion y errores a la pantalla
 * 
 * @category   Kumbia
 * @package    Flash 
 * @copyright  Copyright (c) 2005-2009 Kumbia Team (http://www.kumbiaphp.com)
 * @license    http://wiki.kumbiaphp.com/Licencia     New BSD License
 */
class Flash {

    /**
     * Mensajes almacenados en un request
     */
    private static $_contentMsj = array();
        
    /**
     * Setea un mensaje
     *
     * @param string $name Tipo de mensaje y para CSS class='$name'.
     * @param string $msg Mensaje a mostrar
     * @param boolean $audit Indica si el mensaje se almacena como auditoría
     */
    public static function set($name, $msg, $audit=FALSE) {        
        //Verifico si hay mensajes almacenados en sesión por otro request.
        if(self::hasMessage()) {            
            self::$_contentMsj = Session::get('flash_message');                
        }        
        //Guardo el mensaje en el array
        if (isset($_SERVER['SERVER_SOFTWARE'])) {                    
            $tmp_id              = round(1, 5000);
            self::$_contentMsj[] = '<div id="alert-id-'.$tmp_id.'" class="alert alert-block alert-'.$name.'"><button type="button" class="close" data-dismiss="alert"> <i class="fa fa-fw fa-close"></i> </button>'.$msg.'</div>'.PHP_EOL.'<script type="text/javascript">$("#alert-id-'.$tmp_id.'").hide().fadeIn(400).delay(3000).fadeOut(400);</script>';            
        } else {
            self::$_contentMsj[] = $name.': '.Filter::get($msg, 'striptags').PHP_EOL;            
        }        
        //Almaceno los mensajes guardados en una variable de sesión, para mostrar los mensajes provenientes de otro request.
        Session::set('flash_message', self::$_contentMsj);
        //Verifico si el mensaje se almacena como looger
        if($audit) {
            if($name=='success') {
                DwAudit::debug($msg);
            } else if($name=='danger') {
                DwAudit::error($msg);
            } else {
                DwAudit::$name($msg);                
            }
        }            
    }
    
    /**
     * Verifica si tiene mensajes para mostrar.
     *
     * @return bool
     */
    public static function hasMessage() {
        return Session::has('flash_message') ?  TRUE : FALSE;
    }
    
    /**
     * Método para limpiar los mensajes almacenados
     */
    public static function clean() {
        //Reinicio la variable de los mensajes
        self::$_contentMsj = array();
        //Elimino los almacenados en sesión
        Session::delete('flash_message');
    }
    /**
     * Muestra los mensajes
     */
    public static function output() {
        if(Flash::hasMessage()) {
            //Asigno los mensajes almacenados en sesión en una variable temporal
            $tmp = Session::get('flash_message');
            //Recorro los mensajes
            foreach($tmp as $msg) {
                // Imprimo los mensajes
                echo $msg;
            }
            self::clean();
        }
    }
    
    /**
     * Retorna los mensajes cargados como string
     */
    public static function toString() {        
        //Asigno los mensajes almacenados en sesión en una variable temporal
        $tmp = self::hasMessage() ? Session::get('flash_message') : array();
        $msg = array();
        //Recorro los mensajes
        foreach($tmp as $item) {            
            //Limpio los mensajes
            $item  = explode('<script', $item);
            if(!empty($item[0])) {
                $msg[] = str_replace('×', '', Filter::get($item[0], 'striptags'));                
            }
        }
        $flash = Filter::get(ob_get_clean(), 'striptags', 'trim'); //Almaceno los mensajes que hay en el buffer por los echo
        $msg = Filter::get(join('<br />', $msg), 'trim');
        self::clean(); //Limpio los mensajes de la sesión               
        return ($flash) ? $flash.'<br />'.$msg : $msg;        
    }
    /**
     * Carga un mensaje de error
     *
     * @param string $msg
     * @param boolean $autid Indica si se registra el mensaje como una auditoría
     */
    public static function error($msg, $audit=FALSE) {
        self::set('danger',$msg, $audit);          
    }
    /**
     * Carga un mensaje de advertencia en pantalla
     *
     * @param string $msg
     * @param boolean $autid Indica si se registra el mensaje como una auditoría
     */
    public static function warning($msg, $audit=FALSE) {
        self::set('warning',$msg, $audit);
    }
    /**
     * Carga informacion en pantalla
     *
     * @param string $msg
     * @param boolean $autid Indica si se registra el mensaje como una auditoría
     */
    public static function info($msg, $audit=FALSE) {
        self::set('info',$msg, $audit);
    }
    
    /**
     * Carga información de suceso correcto en pantalla
     *
     * @param string $msg
     * @param boolean $autid Indica si se registra el mensaje como una auditoría
     */
    public static function valid($msg, $audit=FALSE) {
        self::set('success',$msg, $audit);
    }    

    /**
     * Visualiza un mensaje flash
     *
     * @param string $name	Para tipo de mensaje y para CSS class='$name'.
     * @param string $text 	Mensaje a mostrar
     */
    public static function show($name, $text) {
        if (isset($_SERVER['SERVER_SOFTWARE'])) {
            echo '<div class="', $name, ' alert flash" data-alert="alert" data-dismiss="alert">
                <a class="close" data-dismiss="alert"  href="#">×</a>', $text, '</div>', PHP_EOL;
        } else {
            echo $name, ': ', strip_tags($text), PHP_EOL;
        }
    }


    
}
