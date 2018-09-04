<?php 
/**
 * 
 */
class Actions
{
	/**
	 * [getActions description]
	 * @controller [string] [nombre del controlador]
	 * @arrayLinks [Array] [['action'=>'apps/edit/editar','icono'=>'edit','params'=>'1,2,3'],['action'=>'nuevo','icono'=>'plus'],['action'=>'borrar','icono'=>'trash','params'=>'1,2,3'],['action'=>'index','icono'=>'flag','params'=>'1']]
	 * @return [type] [description]
	 * 
	 */
	static function  getActions($controller,$arrayLinks)
	{
		$roles_id=Auth::get('aclroles_id');
		$modulo=Router::get('module');
		$permisos = (new Aclpermisos())->get_permisos_action($roles_id,$modulo,$controller);
		//$datos=[['action'=>'apps/edit/editar','icono'=>'edit','params'=>'1,2,3'],['action'=>'nuevo','icono'=>'plus'],['action'=>'borrar','icono'=>'trash','params'=>'1,2,3'],['action'=>'index','icono'=>'flag','params'=>'1']];
		//
		$datos=$arrayLinks;
				foreach ($datos as $key => $value) {
					
					$ac='';
					if(array_key_exists('action',$value)){
						$ac=$value['action'];
					}
					$ic='';
					if(array_key_exists('icono',$value)){
						$ic=$value['icono'];
					}
					$pr='';
					if(array_key_exists('params',$value)){
						$pr=implode('/',explode(',',$value['params']));
					}
					$f=strpos($ac,"/");
					if($f===false){
						echo Html::linkAction($ac.'/'.$pr,' <i class="fa fa-'.$ic.'" style="font-size:18;"></i>');
					}else{
						echo Html::link($ac.'/'.$pr,' <i class="fa fa-'.$ic.'" style="font-size:18;"></i>');
					}

				}


	}
	/**
     * Crea un enlace usando la constante PUBLIC_PATH, para que siempre funcione.
     *
     * @example <?= Actions::link('usuario/crear','Crear usuario') ?>
     * @example Imprime un enlace para todos los roles
     * @example <?= Actions::link(usuario/crear','Crear usuario', 'class="button"','1,2,3') ?>
     * @example El mismo anterior, pero solo para los roles 1,2,3
     *
     *
     * @param string       $action Ruta a la acción
     * @param string       $text   Texto a mostrar
     * @param string|array $attrs  Atributos adicionales
     * @param string       $roles roles separados por coma o el comodin 
     *
     * @return string
     */
	public static function link($action, $text, $attrs = '',$roles=NULL){
		$roles = $roles ? $roles:'*';
		if($roles==='*'){
			return Html::link($action, $text, $attrs);
		}else{
			$roles=explode(',', $roles);
			if(in_array(Auth::get('aclroles_id'),$roles)){
				return Html::link($action, $text, $attrs);
			}else{
				return '- ';
			}
		}
		
	}
	public static function linkAction($action, $text, $attrs = '',$roles=NULL){
		$roles = $roles ? $roles : '*';
		if($roles==='*'){
			return Html::linkAction($action, $text, $attrs);
		}else{
			$roles=explode(',', $roles);
			if(in_array(Auth::get('aclroles_id'),$roles)){
				return Html::linkAction($action, $text, $attrs);
			}else{
				return '';
			}
		}
		
	}
}
?>
