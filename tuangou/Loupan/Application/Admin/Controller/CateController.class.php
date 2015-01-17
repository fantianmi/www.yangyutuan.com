<?php
// +----------------------------------------------------------------------
// | 爱书很多年
// +----------------------------------------------------------------------
// | provide by ：tecphp.com
// +----------------------------------------------------------------------
// | Author: 84386590@qq.com
// +----------------------------------------------------------------------
namespace Admin\Controller;
class CateController extends BaseController{
	//文章分类列表
    function article (){
        $cate_mod = M('cate'); 
    	$result = $cate_mod->where(array('zone'=>'article'))->order('sort_order ASC')->select();
		$lists = cateTree($result);
    	 
    	$this->assign('lists',$lists);
		$big_menu = array('javascript:window.top.art.dialog({id:\'add\',iframe:\''.U('Cate/add',array('zone'=>'article')).'\', title:\''.L('add_cate').'\', width:\'500\', height:\'400\', lock:true}, function(){var d = window.top.art.dialog({id:\'add\'}).data.iframe;var form = d.document.getElementById(\'dosubmit\');form.click();return false;}, function(){window.top.art.dialog({id:\'add\'}).close()});void(0);', L('add_cate'));
		$this->assign('big_menu',$big_menu);
		$this->display();
    }

    //添加分类数据
    function add (){
    	if(isset($_POST['dosubmit'])){
			$cate_mod = M('cate');
	        if( false === $vo = $cate_mod->create() ){
		        $this->error( '创建数据失败' );
		    }
		    if($vo['name']==''){
		    	$this->error('分类名称不能为空');exit;
		    }
		    $result = $cate_mod->where("name='".$vo['name']."' AND pid='".$vo['pid']."'")->count();
		    if($result != 0){
		        $this->error('该分类已经存在');
		    }
			//保存当前数据
		    if ( $cate_mod->add() ){ 
		    	insertAdminLog('添加'.$vo['zone'].'类别--'.$vo['name']);
		    	$this->success(L('operation_success'), '', '', 'add');
			}else{
				$this->error(L('operation_failure'));
			}
    	}else{
    		$cate_mod = D('cate');
    		$zone = I('zone', '', 'trim');
	    	$result = $cate_mod->where(array('zone'=>$zone))->order('sort_order ASC')->select();
	    	$cate_lists = cateTree($result);
 
	    	$this->assign('cate_lists',$cate_lists);
	    	$this->assign('zone', $zone);
	    	$this->assign('show_header', false);
	        $this->display();
    	}

    }

    function delete()
    {
        if((!isset($_GET['id']) || empty($_GET['id'])) && (!isset($_POST['id']) || empty($_POST['id']))) {
            $this->error('请选择要删除的分类！');
		}
		$article_cate_mod = M('cate');
		if (isset($_POST['id']) && is_array($_POST['id'])) {
		    $cate_ids = implode(',', $_POST['id']);
		    insertAdminLog('删除类别--ids：'.$cate_ids);
		    $article_cate_mod->delete($cate_ids);
		} else {

		    $cate_id = intval($_GET['id']);
		    insertAdminLog('删除类别--id：'.$cate_id);
		    $article_cate_mod->delete($cate_id);
		}
		$this->success(L('operation_success'));
    }

    function edit()
    {
    	if(isset($_POST['dosubmit'])){
    		$cate_mod = M('cate');

	    	$old_cate = $cate_mod->where('id='.$_POST['id'])->find();
	        //名称不能重复
	        if ($_POST['name']!=$old_cate['name']) {
	            if ($this->_cate_exists($_POST['name'], $_POST['pid'], $_POST['id'])) {
	            	$this->error('分类名称重复！');exit;
	            }
	        }

	        //获取此分类和他的所有下级分类id
	        $vids = array();
	        $children[] = $old_cate['id'];
	        $vr = $cate_mod->where('pid='.$old_cate['id'])->select();
	        foreach ($vr as $val) {
	            $children[] = $val['id'];
	        }
	        if (in_array($_POST['pid'], $children)) {
	            $this->error('所选择的上级分类不能是当前分类或者当前分类的下级分类！');
	        }

	    	$vo = $cate_mod->create();
			$result = $cate_mod->save();
			if(false !== $result){
				insertAdminLog('编辑类别--id：'.$_POST['id']);
				$this->success(L('operation_success'), '', '', 'edit');
			}else{
				$this->error(L('operation_failure'));
			}
    	}else{
    		$cate_mod = M('cate');
			if( isset($_GET['id']) ){
				$cate_id = isset($_GET['id']) && intval($_GET['id']) ? intval($_GET['id']) : $this->error(L('please_select').L('article_name'));
			}
			$zone = I('zone', '', 'trim');
			$cate_info = $cate_mod->where('id='.$cate_id)->find();

			$result = $cate_mod->where(array('zone'=>$zone))->order('sort_order ASC')->select();
			$cate_list = cateTree($result); 
	    	 
		    $this->assign('cate_list', $cate_list);
			$this->assign('cate_info',$cate_info);
			$this->assign('show_header', false);
			$this->display();
    	}

    }


    private function _cate_exists ($name, $pid, $id=0){
    	$where = "name='".$name."' AND pid='".$pid."'";
    	if( $id&&intval($id) ){
    		$where .= " AND id<>'".$id."'";
    	}
        $result = M('cate')->where($where)->count();
        //echo(M('article_cate')->getLastSql());exit;
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    function sort_order (){
    	$article_cate_mod = M('cate');
		if (isset($_POST['listorders'])) {
            foreach ($_POST['listorders'] as $id=>$sort_order) {
            	$data['sort_order'] = $sort_order;
                $article_cate_mod->where('id='.$id)->save($data);
            }
            $this->success(L('operation_success'));
        }
        $this->error(L('operation_failure'));
    }
    //修改状态
	function status (){
		$article_cate_mod = D('cate');
		$flink_mod = D('flink');
		$id 	= intval($_REQUEST['id']);
		$type 	= trim($_REQUEST['type']);
		$sql 	= "update ".C('DB_PREFIX')."cate set $type=($type+1)%2 where id='$id'";
		$res 	= $article_cate_mod->execute($sql);
		$values = $article_cate_mod->where('id='.$id)->find();
		$this->ajaxReturn($values[$type]);
	}
}
?>