<?php
require_once(dirname(dirname(__FILE__)) . '/app.php');

need_login(true);

if (is_post()) {
	$order_id = abs(intval($_POST['order_id']));
} else {
	$order_id = $id = abs(intval($_GET['id']));
}
if(!$order_id || !($order = Table::Fetch('order', $order_id))) {
	redirect( 'index.php');
}
/*--------------------------------------------------*/
function create_id() {
    $randId = '';
    for ($i = 0; $i < 16; $i++){
        $randId .= mt_rand(0,9);
    }
    return $randId;
}

/*--------------------------------------------------*/
/* generator unique pay_id */
if (! ($order['pay_id'] 
			&& (preg_match('#-(\d+)-(\d+)-#', $order['pay_id'], $m) 
				&& ( $m[1] == $order['id'] && $m[2] == $order['quantity']) )
	  )) {
	$randid = strtolower(Utility::GenSecret(4, Utility::CHAR_WORD));
	$pay_id = "go-{$order['id']}-{$order['quantity']}-{$randid}";
	Table::UpdateCache('order', $order['id'], array(
				'pay_id' => $pay_id,
				));
	$order['pay_id'] = $pay_id;
}
/* end */

/**/
$result  = mysql_query("select pay_id,team_id,quantity,origin,price from `order` where id ={$order_id}");
$list    = mysql_fetch_assoc($result);
$origin  = $list['origin'];
$quantity = $list['quantity'];
$pay_id  = $list['pay_id'];
$team    = mysql_query("select title from team where id={$list['team_id']}");
$team_title = mysql_fetch_assoc($team);
$title   = $team_title['title'];
/*赋值*/
$url     = "http://openapi.yijifu.net/gateway.html";
$service = "commonTradePay";
$partnerId = '20140411020055684571';
$orderNo = create_id().$pay_id;//订单号
$outOrderNo = $pay_id;
$sellerUserId = '20140411020055684571';
$tradeAmount = $origin;//总价
$signType = "MD5";
$notifyUrl = 'http://www.yangyutuan.cn/ztapp/api.php/Xinsheng/noticeUrl';//后台回调post方式通知结果
$returnUrl = 'http://www.yangyutuan.cn/wap/myorder.php';//客户跳转get方式通知结果
$tradeName = $title;
$httpPost = 'httpPost';
$goodsClauses = '[{\'name\':\''.$title.'\',\'price\':\''.$list['price'].'\',\'quantity\':\''.$quantity.'\'}]';
$signs = "goodsClauses={$goodsClauses}&httpPost=httpPost&notifyUrl={$notifyUrl}&orderNo={$orderNo}&outOrderNo={$outOrderNo}&partnerId=20140411020055684571&returnUrl={$returnUrl}&sellerUserId=20140411020055684571&service={$service}&signType=MD5&tradeAmount={$tradeAmount}&tradeName={$tradeName}c9cef22553af973d4b04a012f9cb8ea8";
$sign = md5($signs);
/**/

//payed order
if ( $order['state'] == 'pay' ) {  
	Session::Set('notice', '本单已支付成功');
	redirect("team.php?id={$order['team_id']}");
}

/* credit pay */
if ( $_POST['action'] == 'redirect' ) {
	redirect($_POST['reqUrl']);
}



$team = Table::Fetch('team', $order['team_id']);



$pay_callback = "pay_team_{$order['service']}";


if ( $_POST['service'] == 'credit' ) {

	if ( $order['origin'] > $login_user['money'] ) {
		Table::Delete('order', $order_id);
		redirect('index.php');
	}
	
	
	Table::UpdateCache('order', $order_id, array(
				'service' => 'credit',
				'money' => 0,
				'state' => 'pay',
				'credit' => $order['origin'],
                'pay_time' => time(),
				));
	$order = Table::FetchForce('order', $order_id);
	ZTeam::BuyOne($order);
	Session::Set('notice', '购买成功');
	redirect("order.php?id={$order_id}");
}

elseif ( function_exists($pay_callback) ) {
    include_once('wapalipay/alipay_wap.php');
	
	$config = array(
	     'partner'=>$INI['alipay']['mid'],
		 'key'=>$INI['alipay']['sec'],
		 'alipay'=>$INI['alipay']['acc'],
		 'url'=>$INI['system']['wwwprefix'],
		 'title'=>mb_substr(strip_tags($team['title']),0,128,'UTF-8'),	 
	);
	
	 $pay_obj    = new alipay_wap;
	 $payhtml    = $pay_obj->get_code($order,$config);
	 
	 die(include template('m_pay'));
}
else if ( $order['service'] == 'credit' ) {
	$total_money = $order['origin'];
	die(include template('m_pay'));
} 
else {
	Session::Set('error', '无合适的支付方式或余额不足');
	redirect( WEB_ROOT. "/wap/index.php");
}





die(include template('m_pay'));
