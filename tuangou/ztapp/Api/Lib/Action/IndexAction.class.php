<?php

class IndexAction extends CommonAction {
    public function index(){

    	if(IS_POST){
    		Utils::log2db('index/index/post','post:'.json_encode($_POST).'get:'.json_encode($_GET));
			$action=new PayReturnAction;
    		//如果是银联回来的
			if(isset($_POST['MerId'])&&isset($_POST['Signature'])&&isset($_POST['MerOrderId'])){
				//银联
				// Utils::log2db('通知商户请求报文:'.json_encode($_POST));
				$action->notifyUmspay();
				return;
			}else if(isset($_POST["notify_data"])){//如果是支付宝回来的
				$action->notifyAlipay();
				return;
			}else if($_GET['partner']&&$_GET['partner']==C('wechatPayPartner')){//微信支付
				$action->notifyWeChatpay();
				return;
			}else if($_POST['orderNumber']&&$_POST['sysReserved']){//中国银联
				$action->notifyUpmppay();
				return;
			}
		}else{//财付通
			Utils::log2db('index/index/post','post:'.json_encode($_POST).'get:'.json_encode($_GET));
			if(isset($_GET['sp_billno'])){
				PayReturnAction::notifyTenpay();
				return;
			}
		}

		if (!APP_DEBUG)return;
		header('Content-Type:text/html; charset=utf-8');
		echo '<html>';
		echo '<body>';
		echo '<pre/>';
	    echo 'Api列表:<br/>';
	    echo '|-<a href='.__APP__.'?s=/User>/User</a> ：用户相关<br/>';
	    echo '|  |-<a>/register</a> ：注册<br/>';
	    echo '|  |-<a>/mobileVerify</a> ：获取手机验证码,检测注册码合法性<br/>';	    
	    echo '|  |-<a>/login</a> ：登录<br/>';
		echo '|  |-<a>/isLogin</a> ：检测登录<br/>';
	    echo '|  |-<a>/logout</a> ：登出<br/>';
	    echo '|  |-<a>/getCoupon</a> ：获取自己的团购优惠券<br/>';
	    echo '|  |-<a>/getOrder</a> ：获取自己的订单<br/>';
	    echo '|<br/>';
	    echo '|-<a href='.__APP__.'?s=/Tuan>/Tuan</a> ：团购相关<br/>';
	    echo '|  |-<a>/typeList</a> ：获取类型列表<br/>';
		echo '|  |-<a>/cityList</a> ：得到城市列表<br/>';
	    echo '|  |-<a>/goodsList</a> ：团购列表<br/>';
	    echo '|  |-<a>/goodById</a> ：单个团购详情<br/>';
	    echo '|  |-<a>/buy</a> ：购买接口<br/>';
		echo '|  |-<a>/detail_mobile</a> ：获取详情接口<br/>';
		echo '|  |-<a>/hotKeys</a> ：搜索推荐关键字<br/>';
	    echo '|<br/>';
	    echo '|-<a href='.__APP__.'?s=/Partner>/Partner</a> ：商户相关<br/>';
	    echo '|  |-<a>/login</a> ：登录<br/>';
	    echo '|  |-<a>/logout</a> ：登出<br/>';
	    echo '|  |-<a>/verifyCoupon</a> ：验证优惠卷有效性<br/>';
	    echo '|  |-<a>/很长的地址，自己看吧</a> ：优惠卷消费<br/>';
	    echo '|<br/>';
		echo '|-<a href='.__APP__.'?s=/Pages>/Pages</a> ：页面<br/>';
	    echo '|  |-<a>/help</a> ：帮助<br/>';
	    echo '|<br/>';
		echo '|-<a href='.__APP__.'?s=/Index/checkUpdate&ver=1.2>/Index/checkUpdate</a> ：检测更新<br/>';
	    echo '|  |-<a href='.__APP__.'?s=/Index/checkUpdate&help>/help</a> ：帮助<br/>';
	    echo '|<br/>';
		echo '|-<a href='.__APP__.'?s=/Index/appConfig>/Index/appConfig</a> ：APP全局配置<br/>';
	    echo '|  |-<a href='.__APP__.'?s=/Index/appConfig&help>/help</a> ：帮助<br/>';
	    echo '|<br/>';
		echo '|-<a href='.__APP__.'?s=/Upload>/Upload</a> 上传<br/>';
	    echo '|  |-<a href='.__APP__.'?s=/Upload/XgPush&help>/XGPush</a> ：信鸽Push<br/>';
	    echo '|<br/>';
	    echo '|-<a href='.__APP__.'?s=/Test&thin>/Test</a> ：自动化测试<br/>';
		echo '</body>';
		echo '</html>';
    }

/**
输出app配置信息
*/
    function sysinfo(){
    	$data['version']=APP_VERSION;
    	$data['isWin']=(bool)IS_WIN;
    	$data['site']=Utils::siteName();
    	$data['host']=Utils::host();
    	$data['verifyOtherCoupon']=(bool)C('verifyOtherCoupon');
    	$data['onlycoupon']=isYES(Utils::SystemConfig('option.onlycoupon'));
    	$this->succReturn($data);
    }


    function checkUpdate(){
    	$this->hinfo='
    	/**
        *检测更新
        *	ver:当前app版本,格式 xx.xx.xx or xx.xx 例如 1.02 or 1.0.2
        *			
        *	
        *请求方式:GET
        *@return html 操作结果
		*/';

		$this->_help();
		$confg;
		if (isIOS()) {
			$confg=C('AppUpdateIos');
		}else{
			$confg=C('AppUpdateAndroid');
		}

		$verApp=Utils::getFloatVersion(I('ver'));
		$verOnline=Utils::getFloatVersion($confg['ver']);
		$data['update']=false;
		if ($verApp<$verOnline) {
			$data['update']=true;
			$data['description']=$confg;
		}
		$this->succReturn($data,'dic');
    }

    function appConfig(){
    	$this->hinfo='
    	/**
        *获取app全局配置数据
        *	SYSPlat:平台 ios传ios，android：传android		
        *	
        *请求方式:GET
        *@return 操作结果
		*/';

		$this->_help();
		$xgPushAppId = C('XgPushAppId');
		$xgPushAppKey = C('XgPushAppKey');
		$confi['.ignore']=NULL;

		$confi['version']=APP_VERSION;
    	$confi['isWin']=(bool)IS_WIN;
    	$confi['site']=Utils::siteName();
    	$confi['host']=Utils::host();

		if ($xgPushAppId&&$xgPushAppKey) {
			$confi['XgPush']["AppId"]=$xgPushAppId;
			$confi['XgPush']["AppKey"]=$xgPushAppKey;
		}
		$this->succReturn($confi);
    }
}
