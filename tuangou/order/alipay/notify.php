<?php
require_once(dirname(dirname(dirname(__FILE__))) . '/app.php');

$_input_charset = 'utf-8';
$partner = $INI['alipay']['mid'];
if(is_user_edit() == true){
$security_code = $INI['alipay']['sec'];
}
$sign_type = 'MD5';
$transport = 'http';

$alipay = new AlipayNotify($partner, $security_code, $sign_type, $_input_charset, $transport);
$verify_result = $alipay->notify_verify();

$out_trade_no = $_POST['out_trade_no']; 
$trade_no = strval($_POST['trade_no']);
$total_fee = $_POST['total_fee'];
@list($_, $order_id, $city_id, $_) = explode('-', $out_trade_no, 4);

if (Table::Fetch('pay', $out_trade_no)) die('success');

if ( $_ == 'charge' ) {
	if ( $verify_result ) {
		if($_POST['trade_status'] == 'TRADE_FINISHED' || $_POST['trade_status'] == 'TRADE_SUCCESS') {
			@list($_, $user_id, $create_time, $_) = explode('-', $out_trade_no, 4);
			ZFlow::CreateFromCharge($total_fee, $user_id, $create_time, 'alipay',$trade_no);
		}
	}
	die('success');
}

$of = fopen('D:\notify1.txt','w');//创建并打开dir.txt
		if($of){
		 fwrite($of,'111');//把执行文件的结果写入txt文件
		}
		
		
if($verify_result) {  


$of2 = fopen('D:\notify2.txt','w');//创建并打开dir.txt
		if($of2){
		 fwrite($of2,'2222');//把执行文件的结果写入txt文件
		}
		
	//$guarantee = strtoupper($INI['alipay']['guarantee']) == 'Y';
	$guaranteewait = strtoupper($INI['alipay']['guaranteesuccess']) == 'N';
	$guarantee = ( $guaranteewait && $_POST['trade_status'] == 'WAIT_SELLER_SEND_GOODS');
	if($_POST['trade_status'] == 'TRADE_FINISHED' || $_POST['trade_status'] == 'TRADE_SUCCESS' || $guarantee) {
		$currency = 'CNY';
		$service = 'alipay';
		$bank = '支付宝';
		ZOrder::OnlineIt($order_id, $out_trade_no, $total_fee, $currency, $service, $bank,$trade_no);
		die('success');
	}
}
die('fail');
