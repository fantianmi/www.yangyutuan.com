<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8"><meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">

<title>提交订单</title>

<script src="style/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="style/order_css_0_ef5d9bb.css">

<link rel="stylesheet" type="text/css" href="style/common_css_0_6c6ef1d.css">

<link rel="stylesheet" type="text/css" href="style/list_css_0_6f15796.css">

<script>alog('speed.set', 'ht',new Date);</script>

</head>




<body mon="position=pay_submission">

<?php include template("m_header");?>

<section class="order-info">
<ul>


<li class="order-common-item">
<dt>应付金额</dt>
<dd><span style="font-size:22px; font-weight:bold; color:#F00;"><?php echo $currency; ?><?php echo moneyit($order['origin']); ?> 元</span></dd>
</li>





<li class="order-button">





			<?php if($login_user['money'] > $order['origin']){?> 

			<form id="order-pay-credit-form" method="post">
				  
					<input type="hidden" name="order_id" value="<?php echo $order_id; ?>" />
				<input type="hidden" name="service" value="credit" />
				<input type="submit" class="order-common-button submit_ye"  name="buy"  value=" " />
					   
					  </form>
			<?php } else { ?>      

			<?php }?>

			<!-- <div style="height:20px;"></div>
			
			   <?php echo $payhtml; ?> -->
			<div style="margin-top:5px;">
				<form action="<?php echo $url; ?>" method="post">
                    <input type="hidden" name="service" value="<?php echo $service; ?>" />
					<input type="hidden" name="partnerId" value="<?php echo $partnerId; ?>" />
					<input type="hidden" name="orderNo" value="<?php echo $orderNo; ?>" />
					<input type="hidden" name="sellerUserId" value="<?php echo $sellerUserId; ?>" />
					<input type="hidden" name="tradeAmount" value="<?php echo $tradeAmount; ?>" />
					<input type="hidden" name="goodsClauses" value="<?php echo $goodsClauses; ?>" />
					<input type="hidden" name="sign" value="<?php echo $sign; ?>" />
					<input type="hidden" name="signType" value="<?php echo $signType; ?>" />
					<input type="hidden" name="notifyUrl" value="<?php echo $notifyUrl; ?>" />
					<input type="hidden" name="returnUrl" value="<?php echo $returnUrl; ?>" />
					<input type="hidden" name="tradeName" value="<?php echo $tradeName; ?>" />
					<input type="hidden" name="httpPost" value="<?php echo $httpPost; ?>" />
					<input type="hidden" name="outOrderNo" value="<?php echo $outOrderNo; ?>" />
					<input type="submit" style="font-size:26px;" class="order-common-button"   value="更多方式支付" />
        		</form>
			</div>
			<!-- <div style="height:20px;"></div>
					 <form id="order-pay-credit-form" method="post" action="tenpay/payRequest.php" target="_blank">
					<section class="submit-box">
					<p class="c-submit ">
						  <input type="hidden" name="order_id" value="<?php echo $order_id; ?>" />
						  <input type="hidden" name="service" value="credit" />
						  <input type="submit" class="order-common-button submit_tenpay"  name="buy"  value=" " />
						</p>
						</section>
					  </form>
			                      
			                        <div style="height:20px;"></div>
					 <form id="order-pay-credit-form" method="get" action="wxpay/js_api_call.php">
					<section class="submit-box">
					<p class="c-submit ">
						  <input type="hidden" name="order_id" value="<?php echo $order_id; ?>" />
						  <input type="submit" class="order-common-button submit_tenpay"  name="buy"  value=" " />
						</p>
						</section>
					  </form> -->
			</li>


			</ul>
			</section>
			</form>
<?php include template("m_footer");?>

</body></html>
