<?php include template("header");?>
<?php if(is_get()){?>
<div class="sysmsgw" id="sysmsg-error"><div class="sysmsg"><p>此订单尚未完成付款，请重新付款</p><span class="close">关闭</span></div></div>
<?php }?>

<div id="bdw" class="bdw">
<div id="bd" class="cf">
<div id="order-pay">
    <div id="content">
        <div id="deal-buy" class="box">
        
            <div class="box-content">
                <div class="head">
                    <h2>应付总额：<strong class="total-money"><?php echo moneyit($total_money); ?></strong> 元</h2>
                </div>
                <div class="sect">
                    <div style="text-align:left;">
					<?php if($order['service']=='credit'){?>
						<form id="order-pay-credit-form" method="post" sid="<?php echo $order_id; ?>">
							<input type="hidden" name="order_id" value="<?php echo $order_id; ?>" />
							<input type="hidden" name="service" value="credit" />
							<input type="submit" class="formbutton gotopay" value="使用账户余额支付" />
						</form>
					<?php } else { ?>
						<?php echo $payhtml; ?>
					<?php }?>

					<!--  -->
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
                    <input type="submit" class="formbutton gotopay" value="更多支付方式">
        </form>



                        <!--  -->
						<div class="back-to-check"><a href="/order/xinsheng.php?id=<?php echo $order_id; ?>">&raquo; 更多支付方式请点击这里</a></div>
					</div>
				</div>
                
              <!--微信支付代码
               <div class="head">
                    <h2>微信扫描二维码支付</h2>
                </div>
                <div class="sect">
               <style type="text/css">
			   #qrcode img{ width:120px; height:120px;}
			   </style>
                <div align="center" id="qrcode"></div>
                <script src="/static/js/qrcode.js"></script>
	<script>

			var url = "<?php echo $INI['system']['wwwprefix']; ?>/wap/wxpay/js_api_call.php?order_id=<?php echo $order_id; ?>";
			//参数1表示图像大小，取值范围1-10；参数2表示质量，取值范围'L','M','Q','H'
			var qr = qrcode(10, 'L');
			qr.addData(url);
			qr.make();
			var wording=document.createElement('p');
			wording.innerHTML = "扫我，扫我";
			var code=document.createElement('DIV');
			code.innerHTML = qr.createImgTag();
			var element=document.getElementById("qrcode");
			element.appendChild(wording);
			element.appendChild(code);

	</script>
                </div>-->
                <!--微信支付代码-->
                
                
            </div>
          
        </div>
    </div>
</div>
</div> <!-- bd end -->
</div> <!-- bdw end -->

<?php include template("footer");?>
