<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 扩展控制器
 * 用于调度各个扩展的URL访问需求
 */
class AddonsController extends BaseController{
    protected $addons = null;
/*插件列表*/
    public function index(){
        $list       =   D('Addons')->getList();
        $request    =   (array)I('request.');
        $total      =   $list? count($list) : 1 ;
        $listRows   =   15;
        $page       =   new \Think\Page($total, $listRows, $request);
        $voList     =   array_slice($list, $page->firstRow, $page->listRows);
        $p          =   $page->show();
        // $this->big_menu = array('javascript:window.top.art.dialog({id:\'add\',iframe:\''.U('Addons/addAddons').'\', title:\'创建插件\', width:\'600\', height:\'500\', lock:true}, function(){var d = window.top.art.dialog({id:\'add\'}).data.iframe;var form = d.document.getElementById(\'dosubmit\');form.click();return false;}, function(){window.top.art.dialog({id:\'add\'}).close()});void(0);', '创建插件');
        // $this->assign('show_header','false');
        $this->assign('list', $voList);
        $this->assign('page', $p);
        $this->display();
    }
/*常见插件*/
    public function addAddons(){
        $this->display('add');
    }
/*编辑插件*/
    public function editAddons(){
        if(IS_POST){
            $id     = I('id');
            $status = I('status');
            if(empty($id)) $this->error('非法操作！');
            $data   = array('id'=>$id,'status'=>$status);
            if(M('addons')->save($data)){
                $this->success('编辑成功！','','','edit');
            }else{
                $this->error('编辑失败！');
            }
        }else{
            $id = I('id');
            if(empty($id)) $this->error('非法操作！');
            $status = M('addons')->where("id={$id}")->getField('status');
            $this->assign('status',$status);
            $this->assign('id',$id);
            $this->display('edit');
        }
    }

    public function execute($_addons = null, $_controller = null, $_action = null){
        if(C('URL_CASE_INSENSITIVE')){
            $_addons = ucfirst(parse_name($_addons, 1));
            $_controller = parse_name($_controller,1);
        }

        $TMPL_PARSE_STRING = C('TMPL_PARSE_STRING');
        $TMPL_PARSE_STRING['__ADDONROOT__'] = __ROOT__ . "/Addons/{$_addons}";
        C('TMPL_PARSE_STRING', $TMPL_PARSE_STRING);

        if(!empty($_addons) && !empty($_controller) && !empty($_action)){
            $Addons = A("Addons://{$_addons}/{$_controller}")->$_action();
        } else {
            $this->error('没有指定插件名称，控制器或操作！');
        }
    }

}
