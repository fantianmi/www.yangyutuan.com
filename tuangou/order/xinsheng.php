<?php
var_dump($_POST);
require_once(dirname(dirname(__FILE__)) . '/app.php');
$id = $_GET['id'];
$order = Table::Fetch('order', $id);
$serialID      = "bkltech".date("YmdHis");//请求序列号
$team_id        = $order['team_id'];
$re  = Table::Fetch('team',array('team_id'=>$team_id));
$res = '';
foreach ($re as $v) {
	$res = $v['title'];
}
$order['origins'] = preg_replace('/\./','',$order['origin']);
$origins = abs($order['origins']);
$malls = DB::LimitQuery('partner',array('condition'=>array('id'=>$order['partner_id']),'one'=>true));
//客户支付完成后跳转回商户指定的URL
$returnUrl = "http://anjingac.bkltech.com.cn/returnUrl.php";
//通知商户处理结果的通知地址
$noticeUrl = "http://anjingac.bkltech.com.cn/noticeUrl.php";

$mall = $malls['title'];

$url     = "/order2.php";
$times   = date("YmdHis");//订单提交时间
$stime   = $times+10000000000;//失效时间
$ress = DB::LimitQuery('system',array('condition'=>array('id'=>2),'one'=>true));//支付信息，value字段为商户id

if (!$order) { 
	Session::Set('error', '订单不存在');
	redirect( WEB_ROOT . '/index.php' );
}
include template('order_xinsheng');
// var_dump($order);


