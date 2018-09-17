<?php
View::template('apps/default_app');
class IndexController extends AdminController {
	
	protected function before_filter() {
        if ( Input::isAjax() ){
			//View::response('view');
        }
    }
    public function index()
	{
	}
	public function bienvenida()
	{}	
}
