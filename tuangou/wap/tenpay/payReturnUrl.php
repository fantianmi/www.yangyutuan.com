<?php
error_reporting(0);
//---------------------------------------------------------
//财付通即时到帐支付页面回调示例，商户按照此文档进行开发即可
//---------------------------------------------------------
require_once ("./classes/ResponseHandler.class.php");
require_once ("./classes/WapResponseHandler.class.php");
require ("config.php");
require_once(dirname(dirname(dirname(__FILE__))) . '/app.php');


/* 创建支付应答对象 */
$resHandler = new WapResponseHandler();
$resHandler->setKey($key);

//判断签名
if($resHandler->isTenpaySign()) {

	//商户订单号
	$bargainor_id = $resHandler->getParameter("bargainor_id");
	//财付通交易单号
	$transaction_id = $resHandler->getParameter("transaction_id");
	//金额,以分为单位
	$total_fee = $resHandler->getParameter("total_fee");
	//支付结果
	$pay_result = $resHandler->getParameter("pay_result");
	$sp_billno = $resHandler->getParameter("sp_billno");
	
	if( "0" == $pay_result  ) {
		
		list($_, $order_id, $city_id, $_) = explode('-', $sp_billno, 4);
			
		$total_fee=$total_fee/100;
		$r3_Amt=number_format($total_fee,2,".","");
			
		$currency = 'CNY';
		$service = 'tenpay';
		$bank ='财付通手机支付';
		ZOrder::OnlineIt($order_id, $sp_billno, $r3_Amt, $currency, $service, $bank);
		redirect(WEB_ROOT . "/waptuan/order.php?id=$order_id");
		exit();
		$string = "<br/>" . "支付成功" . "<br/>";
	} else {
		//当做不成功处理
		$string =  "<br/>" . "支付失败" . "<br/>";
	}
	
} else {
	$string =  "<br/>" . "认证签名失败" . "<br/>";
}

?>
 <!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN"
 "http://www.wapforum.org/DTD/wml_1.1.xml">
    <wml>
     <head>
       <meta http-equiv="Cache-Control" content="max-age=0" forua="true"/>
       <meta http-equiv="Cache-control" content="must-revalidate" />
       <meta http-equiv="Cache-control" content="private" />
       <meta http-equiv="Cache-control" content="no-cache" />
     </head>
     <card id="wappay" title="财付通wap手机支付示例——前台结果">
     <p>
     	<?php echo $string; ?>
     </p>
	</card>
	</wml>     