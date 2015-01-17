<?php
namespace Home\Controller;

class DemoController extends CommonController {
/*客户带访*/
	public function daifang(){
		// /Uploads/Editor/20150107/54aca5df0f58e.jpg
		$path = dirname($_SERVER['SCRIPT_FILENAME']);
		echo $path;
		$this->display();
	}
}