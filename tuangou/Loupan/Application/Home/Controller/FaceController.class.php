<?php
namespace Home\Controller;

class FaceController extends CommonController {
/*客户带访接口*/
	public function daifang(){
		$pid = I('pid');
		if(empty($pid)) exit(err(100));
		$_POST['create_time'] = NOW_TIME;
		$_POST['type']        = 1;
		if(M('liucheng')->add($_POST)){
			echo suc();
		}else{
			echo err();
		}
	}
}
