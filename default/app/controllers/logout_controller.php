<?php 
class LogoutController extends AdminController {

    public function index($id='') {
		$this->logout();
    }
}
?>