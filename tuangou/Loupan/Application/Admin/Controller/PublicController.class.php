<?php
// +----------------------------------------------------------------------
// | 爱书很多年
// +----------------------------------------------------------------------
// | provide by ：tecphp.com
// +----------------------------------------------------------------------
// | Author: 84386590@qq.com
// +----------------------------------------------------------------------
namespace Admin\Controller;

class PublicController extends BaseController
{
	// 菜单页面
	public function menu(){
		//显示菜单项
		$id	=	intval($_REQUEST['tag'])==0?6:intval($_REQUEST['tag']);
		$menu  = array();
		$role_id = D('admin')->where('id='.$_SESSION['admin_info']['id'])->getField('role_id');
		$node_ids_res = D("access")->where("role_id=".$role_id)->field("node_id")->select();
		
		$node_ids = array();
		foreach ($node_ids_res as $row) {
			array_push($node_ids,$row['node_id']);
		}
		//读取数据库模块列表生成菜单项
		$node    =   M("node");
		$where = "auth_type<>2 AND status=1 AND is_show=0 AND group_id=".$id;
		if ($_SESSION['admin_info']['id']!=1){ 
			$where .= " AND id in(select node_id from `".C('DB_PREFIX')."access` where role_id='$role_id') ";
		}
		$list	=$node->where($where)->field('id,action,action_name,module,module_name,data')->order('sort DESC')->select();

		foreach($list as $key=>$action) {
			$data_arg = array();
			if ($action['data']){
				$data_arr = explode('&', $action['data']);
				foreach ($data_arr as $data_one) {
					$data_one_arr = explode('=', $data_one);
					$data_arg[$data_one_arr[0]] = $data_one_arr[1];
				}
			}
			$action['url'] = U($action['module'].'/'.$action['action'], $data_arg);
			if ($action['action']) {
				$menu[$action['module']]['navs'][] = $action;
			}
			$menu[$action['module']]['name']	= $action['module_name'];
			$menu[$action['module']]['id']	= $action['id'];
		}
		$this->assign('menu',$menu);
		$this->display('left');
	}

	/**	 
	 * 读取该用户的所有权限
	 */
	public function getUserAccess ($role_id){
		$access_mod = M('access');
		$access_list = $access_mod->where("role_id='$role_id'")->field('node_id')->select();
		$res = '';
		foreach ($access_list as $node_id){

		}
	}

	/**	 
	 * 后台主页
	 */
	public function main()
	{
		$security_info=array();
		if(is_dir(ROOT_PATH."/install")){
			$security_info[]="强烈建议删除安装文件夹,点击<a href='".u('Public/deleteInstall')."'>【删除】</a>";
		}
		if(APP_DEBUG==true){
			$security_info[]="强烈建议您网站上线后，建议关闭 DEBUG （前台错误提示）";
		}	
		if(count($security_info)<=0){
			$this->assign('no_security_info',0);
		}
		else{
			$this->assign('no_security_info',1);
		}	
		$this->assign('security_info',$security_info);
        $disk_space = @disk_free_space(".")/pow(1024,2);
		$server_info = array( 	
            '操作系统'=>PHP_OS,
            '运行环境'=>$_SERVER["SERVER_SOFTWARE"],	
            '上传附件限制'=>ini_get('upload_max_filesize'),
            '执行时间限制'=>ini_get('max_execution_time').'秒',		
            '服务器域名/IP'=>$_SERVER['SERVER_NAME'].' [ '.gethostbyname($_SERVER['SERVER_NAME']).' ]',
            '剩余空间'=>round($disk_space < 1024 ? $disk_space:$disk_space/1024 ,2).($disk_space<1024?'M':'G'),
		);
        $this->assign('set',$this->setting);
		$this->assign('server_info',$server_info);	
 
		$this->display();
	}
	public function login()
	{
		$admin_mod=M('admin');
		if ($_POST) {
			$username = $_POST['username'] && trim($_POST['username']) ? trim($_POST['username']) : '';
			$password = $_POST['password'] && trim($_POST['password']) ? trim($_POST['password']) : '';
			if (!$username || !$password) {
				redirect(U('Public/login'));
			}
			$verify = I('verify');
			/*对验证码进行验证*/
        	if(!check_verify($verify)){
                $this->error('验证码输入错误！');
            }
			//生成认证条件
			$map  = array();
			// 支持使用绑定帐号登录
			$map['user_name']	= $username;
			$map["status"]	=	array('gt',0);			
			$admin_info=$admin_mod->where("user_name='$username'")->find();

			//使用用户名、密码和状态的方式进行认证
			if(false === $admin_info || $admin_info['status'] == 0) {
				$this->error('帐号不存在或已禁用！');
			}else {
				if($admin_info['password'] != md5($password)) {
					$this->error('账号或密码错误！');
				}

				$_SESSION['admin_info'] =$admin_info;

				$this->success('登录成功！',U('Index/index'));
				exit;
			}
		}
		$this->assign('set',$this->setting);
		$this->display();
	}
	//退出登录
	public function logout()
	{
		if(isset($_SESSION['admin_info'])) {
			unset($_SESSION['admin_info']);		
			$this->success('退出登录成功！',U('Public/login'));
		}else {
			$this->redirect('Public/login');
		}
	}
 	//验证码
    public function verify(){
    	$config = array(
			'fontSize'=>50,
			'length'=>1,
			'imageW'=>480,
			'fontttf'=>'5.ttf'
		);
		$Verify = new \Think\Verify($config);
		$Verify->entry(1);
    }

	public function deleteInstall(){ 
		import("ORG.Io.Dir");
		$dir = new Dir; 
		$dir->delDir(ROOT_PATH."/install");
		@unlink(ROOT_PATH.'/install.php');
		if(!is_dir(ROOT_PATH."/install")){
			$this->success(L('operation_success'));
		}
	}
}
?>