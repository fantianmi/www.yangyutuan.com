<?php
namespace Admin\Controller;

class ProjectController extends BaseController{
/*项目管理首页*/
	public function index(){
		if(IS_POST){
			$id = I('id');
			if(empty($id)) $this->error('参数错误！');
			$id = implode(",",$id);
			if(M('project')->where("id in({$id})")->delete()){
				$this->success('删除成功！');
			}else{
				$this->error('删除失败！');
			}
		}else{
			$showSize = 20;
			$list  = M('project')->order(array('order','ctime'=>'desc'))->page($_GET['p'].','.$showSize)->select();
			$count = M('project')->count();
			$page       = new \Think\Page($count,$showSize);// 实例化分页类 
			$show       = $page->show();// 分页显示输出
			$this->assign('page',$show);
			$this->assign('list',$list);
			$this->big_menu = array('javascript:window.top.art.dialog({id:\'add\',iframe:\''.U('Project/add').'\', title:\'新增项目\', width:\'400\', height:\'200\', lock:true}, function(){var d = window.top.art.dialog({id:\'add\'}).data.iframe;var form = d.document.getElementById(\'dosubmit\');form.click();return false;}, function(){window.top.art.dialog({id:\'add\'}).close()});void(0);', '新增项目');
			$this->assign('show_header','false');
			$this->display();
		}
	}
/*新增项目*/
	public function add(){
		if(IS_POST){
			$_POST['ctime'] = NOW_TIME;
			if(empty($_POST['name'])) $this->error('项目名称不能为空！');
			if(M('project')->add($_POST)){
				$this->success('成功！','','','add');
			}else{
				$this->error('新增失败！');
			}
		}else{
			// $this->assign('title','');
			$this->display();
		}
	}
/*编辑项目*/
	public function edit(){
		if(IS_POST){
			if(M('project')->save($_POST) !== false){
				$this->success('成功！','','','edit');
			}else{
				$this->error('编辑失败！');
			}
		}else{
			$id = I('id');
			if(empty($id)) $this->error('参数错误！');
			$list = M('project')->where("id={$id}")->find();
			$this->assign('list',$list);
			$this->display('add');
		}
	}
/*改变排序的方法*/
	public function setOrder(){
		$order = I('order');
		$id    = I('id');
		$data  = array(
			'id'    => $id,
			'order' => $order
		);
		if(M('project')->save($data)){
			$this->ajaxReturn($order);
		}else{
			$this->ajaxReturn(false);
		}
	}
}