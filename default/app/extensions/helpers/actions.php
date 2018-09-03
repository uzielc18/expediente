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
	public function getActions($controller,$arrayLinks)
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
}
?>
