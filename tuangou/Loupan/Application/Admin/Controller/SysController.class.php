<?php
namespace Admin\Controller;

class SysController extends BaseController{
/*设置公共列表兼修改*/
	public function index(){
		if(IS_POST){
			$info = I('info','','trim');
			$id   = I('id');
			$data = array(
				'info'  =>  $info,
				'ctime' =>  NEW_TIME,
				'id'    =>  $id
			);
			if(M('info')->save($data)){
				$this->success('更新成功！');
			}else{
				$this->error('更新失败！');
			}
		}else{
			$this->info = M('info')->find();
			$this->display();
		}
	}
/*设置幻灯片列表，兼删除*/
	public function indexImg(){
		if(IS_POST){
			$id = I('id');
			if(empty($id)) $this->error('参数错误！');
			$id = implode(",",$id);
			if(M('img')->where("id in({$id})")->delete()){
				$this->success('删除成功！');
			}else{
				$this->error('删除失败！');
			}
		}else{
			$list = M('img')->where("type=1")->select();
			$this->big_menu = array('javascript:window.top.art.dialog({id:\'add\',iframe:\''.U('Sys/addImg').'\', title:\'新增图片\', width:\'600\', height:\'250\', lock:true}, function(){var d = window.top.art.dialog({id:\'add\'}).data.iframe;var form = d.document.getElementById(\'dosubmit\');form.click();return false;}, function(){window.top.art.dialog({id:\'add\'}).close()});void(0);', '新增图片');
			$this->assign('show_header','false');
			$this->assign('list',$list);
			$this->display();
		}
	}
/*新增幻灯片*/
	public function addImg(){
		if(IS_POST){
			if($_FILES['image']['error'] === 0){
				$path = $this->uploadImages("huandengpian");
				$_POST['path'] = "/Uploads".$path[0];
			}
			$_POST['ctime'] = NOW_TIME;
			if(M('img')->add($_POST)){
				$this->success("成功！",'','','add');
			}else{
				$this->error('添加失败了！');
			}
		}else{
			$this->display();
		}
	}
/*编辑幻灯片*/
	public function editImg(){
		if(IS_POST){
			if(M('img')->save($_POST) !== false){
				$this->success('成功!','','','edit');
			}else{
				$this->error('编辑失败！');
			}
		}else{
			$id = I('id');
			$list = M('img')->where("id={$id}")->find();
			$this->assign('list',$list);
			$this->display();
		}
	}

}