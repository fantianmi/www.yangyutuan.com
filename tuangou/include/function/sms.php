<?php

/**
 * sms ronglian
 */
class REST {
	private $AccountSid;
	private $AccountToken;
	private $AppId;
	private $ServerIP;
	private $ServerPort;
	private $SoftVersion;
	private $Batch; //时间戳
	private $BodyType = "xml"; //包体格式，可填值：json 、xml
	private $enabeLog = true; //日志开关。可填值：true、
	private $Filename = "./log.txt"; //日志文件
	private $Handle;
	function __construct($ServerIP, $ServerPort, $SoftVersion) {
		$this->Batch = date("YmdHis");
		$this->ServerIP = $ServerIP;
		$this->ServerPort = $ServerPort;
		$this->SoftVersion = $SoftVersion;
		$this->Handle = fopen($this->Filename, 'a');
	}

	/**
	 * 设置主帐号
	 * 
	 * @param AccountSid 主帐号
	 * @param AccountToken 主帐号Token
	 */
	function setAccount($AccountSid, $AccountToken) {
		$this->AccountSid = $AccountSid;
		$this->AccountToken = $AccountToken;
	}

	/**
	 * 设置应用ID
	 * 
	 * @param AppId 应用ID
	 */
	function setAppId($AppId) {
		$this->AppId = $AppId;
	}

	/**
	 * 打印日志
	 * 
	 * @param log 日志内容
	 */
	function showlog($log) {
		if ($this->enabeLog) {
			fwrite($this->Handle, $log . "\n");
		}
	}

	/**
	 * 发起HTTPS请求
	 */
	function curl_post($url, $data, $header, $post = 1) {
		//初始化curl
		$ch = curl_init();
		//参数设置  
		$res = curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_POST, $post);
		if ($post)
			curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
		$result = curl_exec($ch);
		//连接失败
		if ($result == FALSE) {
			if ($this->BodyType == 'json') {
				$result = "{\"statusCode\":\"172001\",\"statusMsg\":\"网络错误\"}";
			} else {
				$result = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><Response><statusCode>172001</statusCode><statusMsg>网络错误</statusMsg></Response>";
			}
		}
		curl_close($ch);
		return $result;
	}

	/**
	 * 发送模板短信
	 * @param to 短信接收彿手机号码集合,用英文逗号分开
	 * @param datas 内容数据
	 * @param $tempId 模板Id
	 */
	function sendTemplateSMS($to, $datas, $tempId) {
		//主帐号鉴权信息验证，对必选参数进行判空。
		$auth = $this->accAuth();
		if ($auth != "") {
			json($auth->statusCode, "alert");
			return $auth;
		}
		// 拼接请求包体
		if ($this->BodyType == "json") {
			$data = "";
			for ($i = 0; $i < count($datas); $i++) {
				$data = $data . "'" . $datas[$i] . "',";
			}
			$body = "{'to':'$to','templateId':'$tempId','appId':'$this->AppId','datas':[" . $data . "]}";
		} else {
			$data = "";
			for ($i = 0; $i < count($datas); $i++) {
				$data = $data . "<data>" . $datas[$i] . "</data>";
			}
			$body = "<TemplateSMS>
			                    <to>$to</to> 
			                    <appId>$this->AppId</appId>
			                    <templateId>$tempId</templateId>
			                    <datas>" . $data . "</datas>
			                  </TemplateSMS>";
		}

		$this->showlog("request body = " . $body);
		// 大写的sig参数 
		$sig = strtoupper(md5($this->AccountSid . $this->AccountToken . $this->Batch));
		// 生成请求URL        
		$url = "https://$this->ServerIP:$this->ServerPort/$this->SoftVersion/Accounts/$this->AccountSid/SMS/TemplateSMS?sig=$sig";
		$this->showlog("request url = " . $url);
		// 生成授权：主帐户Id + 英文冒号 + 时间戳。
		$authen = base64_encode($this->AccountSid . ":" . $this->Batch);
		// 生成包头  
		$header = array (
			"Accept:application/$this->BodyType",
			"Content-Type:application/$this->BodyType;charset=utf-8",
			"Authorization:$authen"
		);
		// 发送请求
		$result = $this->curl_post($url, $body, $header);
		$this->showlog("response body = " . $result);
		if ($this->BodyType == "json") { //JSON格式
			$datas = json_decode($result);
		} else { //xml格式
			$datas = simplexml_load_string(trim($result, " \t\n\r"));
		}
		//  if($datas == FALSE){
		//            $datas = new stdClass();
		//            $datas->statusCode = '172003';
		//            $datas->statusMsg = '返回包体错误'; 
		//        }
		//重新装填数据
		if ($datas->statusCode == 0) {
			if ($this->BodyType == "json") {
				$datas->TemplateSMS = $datas->templateSMS;
				unset ($datas->templateSMS);
			}
		}
		return $datas;
	}

	/**
	  * 主帐号鉴权
	  */
	function accAuth() {
		if ($this->ServerIP == "") {
			$data = new stdClass();
			$data->statusCode = '172004';
			$data->statusMsg = 'IP为空';
			return $data;
		}
		if ($this->ServerPort <= 0) {
			$data = new stdClass();
			$data->statusCode = '172005';
			$data->statusMsg = '端口错误（小于等于0）';
			return $data;
		}
		if ($this->SoftVersion == "") {
			$data = new stdClass();
			$data->statusCode = '172013';
			$data->statusMsg = '版本号为空';
			return $data;
		}
		if ($this->AccountSid == "") {
			$data = new stdClass();
			$data->statusCode = '172006';
			$data->statusMsg = '主帐号为空';
			return $data;
		}
		if ($this->AccountToken == "") {
			$data = new stdClass();
			$data->statusCode = '172007';
			$data->statusMsg = '主帐号令牌为空';
			return $data;
		}
		if ($this->AppId == "") {
			$data = new stdClass();
			$data->statusCode = '172012';
			$data->statusMsg = '应用ID为空';
			return $data;
		}
	}
}
/*****************************************************************************************/
/**
 * 发送模板短信
 * @param to 手机号码集合,用英文逗号分开
 * @param datas 内容数据 格式为数组 例如：array('Marry','Alon')，如不需替换请填 null
 * @param $tempId 模板Id,测试应用和未上线应用使用测试模板请填写1，正式应用上线后填写已申请审核通过的模板ID
 */
function sendTemplateSMS($to, $datas, $tempId) {
	// 初始化REST SDK
	//主帐号,对应开官网发者主账号下的 ACCOUNT SID
	$accountSid = 'aaf98f894acd9fb8014add60f2f50790';
	//主帐号令牌,对应官网开发者主账号下的 AUTH TOKEN
	$accountToken = 'b19ef44154054060abd7dd1c2c761c82';
	//应用Id，在官网应用列表中点击应用，对应应用详情中的APP ID
	//在开发调试的时候，可以使用官网自动为您分配的测试Demo的APP ID
	$appId = 'aaf98f894acd9fb8014add63ce290798';
	//请求地址
	//沙盒环境（用于应用开发调试）：sandboxapp.cloopen.com
	//生产环境（用户应用上线使用）：app.cloopen.com
	$serverIP = 'app.cloopen.com';
	//请求端口，生产环境和沙盒环境一致
	$serverPort = '8883';
	//REST版本号，在官网文档REST介绍中获得。
	$softVersion = '2013-12-26';
	/*global $accountSid,$accountToken,$appId,$serverIP,$serverPort,$softVersion;*/
	/* json($accountSid."-".$accountToken."-".$serverIP."-".$serverPort."-".$softVersion."-".$appId,"alert");*/
	$rest = new REST($serverIP, $serverPort, $softVersion);
	$rest->setAccount($accountSid, $accountToken);
	$rest->setAppId($appId);

	// 发送模板短信
	/*echo "Sending TemplateSMS to $to <br/>";*/
	$result = $rest->sendTemplateSMS($to, $datas, $tempId);
	return $result;
}

function sms_send($phone, $datasm,$tempId) {
	global $INI;
	/*if (mb_strlen($content, 'UTF-8') < 10) {
		return '短信长度低于20汉字？长点吧～';
	}
*/
	/* include customsms function */
	/*$smsowner_file = dirname(__FILE__) . '/smsowner.php';*/
	/*if (file_exists($smsowner_file)) {
		require_once ($smsowner_file);
		if (function_exists('sms_send_owner')) {
			return sms_send_owner($phone, $content);
		}
	}*/
	/* end include */
	$smsapi = trim($INI['sms']['smsapi']);
	$token = trim($INI['sms']['token']);
	$user = strval($INI['sms']['user']);
	$pass = strtolower(md5($INI['sms']['pass']));
	if (null == $user)
		return true;
	$content = urlEncode($content);

	/*if($smsapi == 'www.smsbao.com' || $smsapi == 'api.smsbao.com'){
	   $api = "http://{$smsapi}/sms?u={$user}&p={$pass}&m={$phone}&c={$content}";
	}else{
	    //$api = "http://{$smsapi}/sms?user={$user}&pass={$pass}&phones={$phone}&content={$content}";
	     $api = "http://{$smsapi}:8060/z_mdsmssend.aspx?sn={$user}&pwd={$pass}&mobile={$phone}&content={$content}【{$token}】&stime=&rrid=&ext=";
		 $api = "http://{$smsapi}/hy/?uid={$user}&auth={$pass}&mobile={$phone}&msg={$content}&expid=0&encode=utf-8";
	}	*/
	$res = sendTemplateSMS($phone, $datasm,$tempId);
	/*json($res->statusCode."-".$res->dateCreated."-".$res->smsMessageSid,"alert");*/
	if($res->statusCode==112314){
		return "每个号码每天仅限发送10条短信";
	}
	/*$res = Utility::HttpRequest($api);*/
	/*return trim(strval($res))=='+OK' ? true : strval($res);*/
	return true;
}

function sms_secret($mobile, $secret, $enable = true) {
	global $INI;
	$funccode = $enable ? '订阅' : '退订';
	$content = "{$INI['system']['sitename']}，您的手机号：{$mobile} 短信{$funccode}功能认证码：{$secret}。";
	sms_send($mobile, $content);
}

function sms_bind($mobile, $secret) {
	global $INI;
	$content = "{$INI['system']['sitename']}，您的手机号：{$mobile} 绑定码：{$secret}。";
	sms_send($mobile, $content);
}

function sms_usecoupon($coupon, $mobile = null) {
	global $INI;
	$user = Table :: Fetch('user', $coupon['user_id']);
	$order = Table :: Fetch('order', $coupon['order_id']);
	if (!Utility :: IsMobile($mobile)) {
		$mobile = $order['mobile'];
		if (!Utility :: IsMobile($mobile)) {
			$mobile = $user['mobile'];
		}
	}
	$team = Table :: Fetch('team', $coupon['team_id']);
	$coupon['use'] = date('m月d日 H时i分');
	$coupon['name'] = $team['product'];
	$content = render('manage_tpl_usecoupon', array (
		'coupon' => $coupon,
		'user' => $user,
	));
	sms_send($mobile, $content);
}

function sms_coupon($coupon, $mobile = null) {
	global $INI;
	if ($coupon['consume'] == 'Y' || $coupon['expire_time'] < strtotime(date('Y-m-d'))) {
		return $INI['system']['couponname'] . '已失效';
	}

	$user = Table :: Fetch('user', $coupon['user_id']);
	$order = Table :: Fetch('order', $coupon['order_id']);

	if (!Utility :: IsMobile($mobile)) {
		$mobile = $order['mobile'];
		if (!Utility :: IsMobile($mobile)) {
			$mobile = $user['mobile'];
		}
	}
	if (!Utility :: IsMobile($mobile)) {
		return '请设置合法的手机号码，以便接受短信';
	}
	//获得团购项目标题
	$team = Table :: Fetch('team', $coupon['team_id']);
	//获得商家信息
	$partner = Table :: Fetch('partner', $coupon['partner_id']);
	//获得优惠码过期时间
	$coupon['end'] = date('Y-n-j', $coupon['expire_time']);
	//获得优惠码名称
	$coupon['name'] = $team['product'];
	//拼装content
	$content = render('manage_tpl_smscoupon', array (
		'partner' => $partner,
		'coupon' => $coupon,
		'user' => $user,
	));
	$datasms=array(
		$coupon['name'],
		$coupon['id'],
		$coupon['secret'],
		$coupon['end']
	);
	if (true === ($code = sms_send($mobile, $datasms,"11366"))) {
		Table :: UpdateCache('coupon', $coupon['id'], array (
			'sms' => array (
				'`sms` + 1'
			),
			'sms_time' => time(),
		));
		return true;
	}
	return $code;
}
//凭证
function sms_voucher($voucher, $mobile = null) {
	global $INI;
	$user = Table :: Fetch('user', $voucher['user_id']);
	$order = Table :: Fetch('order', $voucher['order_id']);

	if (!Utility :: IsMobile($mobile)) {
		$mobile = $order['mobile'];
		if (!Utility :: IsMobile($mobile)) {
			$mobile = $user['mobile'];
		}
	}
	if (!Utility :: IsMobile($mobile)) {
		return '请设置合法的手机号码，以便接受短信';
	}

	$team = Table :: Fetch('team', $voucher['team_id']);
	$partner = Table :: Fetch('partner', $team['partner_id']);

	$voucher['end'] = date('Y-n-j', $team['expire_time']);
	$voucher['name'] = $team['product'];
	$content = render('manage_tpl_smsvoucher', array (
		'partner' => $partner,
		'voucher' => $voucher,
		'user' => $user,
		
	));

	if (true === ($code = sms_send($mobile, $content))) {
		Table :: UpdateCache('voucher', $voucher['id'], array (
			'sms' => array (
				'`sms` + 1'
			),
			'sms_time' => time(),
			
		));
		return true;
	}
	return $code;
}
//发送快递短信
function sms_express($id, & $flag = null) {
	$order = Table :: Fetch('order', $id);
	$team = Table :: Fetch('team', $order['team_id']);
	if (!$order['express_id']) {
		$flag = 'No express';
		return false;
	}
	$express = Table :: Fetch('category', $order['express_id']);
	$html = render('manage_tpl_smsexpress', array (
		'team' => $team,
		'express_name' => $express['name'],
		'express_no' => $order['express_no'],
		
	));
	$phone = $order['mobile'];
	if (true === ($flag = sms_send($phone, $html))) {
		Table :: UpdateCache('order', $id, array (
			'sms_express' => 'Y',
			
		));
		return true;
	}
	return false;
}

function sms_express_buy($order, $mobile = null) {
	global $INI;
	$user = Table :: Fetch('user', $order['user_id']);
	if (!Utility :: IsMobile($mobile)) {
		$mobile = $order['mobile'];
		if (!Utility :: IsMobile($mobile)) {
			$mobile = $user['mobile'];
		}
	}
	$team = Table :: Fetch('team', $order['team_id']);
	$content = render('manage_tpl_expressbuy', array (
		'expressproduct' => $team['product'],
		
	));
	sms_send($mobile, $content);
}

function sms_buy($order, $mobile = null) {
	global $INI;
	$user = Table :: Fetch('user', $order['user_id']);
	if (!Utility :: IsMobile($mobile)) {
		$mobile = $order['mobile'];
		if (!Utility :: IsMobile($mobile)) {
			$mobile = $user['mobile'];
		}
	}
	$team = Table :: Fetch('team', $order['team_id']);
	$content = render('manage_tpl_buycoupon', array (
		'product' => $team['product'],
		
	));
	sms_send($mobile, $content);
}

function sms_expire($order, $mobile = null) {
	global $INI;
	$user = Table :: Fetch('user', $order['user_id']);
	if (!Utility :: IsMobile($mobile)) {
		$mobile = $order['mobile'];
		if (!Utility :: IsMobile($mobile)) {
			$mobile = $user['mobile'];
		}
	}
	if (!Utility :: IsMobile($mobile)) {
		return '请设置合法的手机号码，以便接受短信';
	}
	$team = Table :: Fetch('team', $order['team_id']);
	$partner = Table :: Fetch('partner', $team['partner_id']);
	$expire = date('Y-m-d', $team['expire_time']);
	$coupon['name'] = $team['product'];
	$content = render('manage_tpl_smsexpire', array (
		'expire' => $expire,
		'team' => $team,
		
	));
	if (true === ($code = sms_send($mobile, $content))) {
		Table :: UpdateCache('team', $order['team_id'], array (
			'send_time' => time(),
			
		));
		return true;
	}
	return $code;
}