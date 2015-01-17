<?php include template("header");?>

<div id="bdw" class="bdw">
<div id="bd" class="cf">
<div id="account-charge">
    <div id="content">
        <div class="box">
            <div class="box-top"></div>
            <div class="box-content">
                <div class="head"><h2>充值</h2></div>
                <div class="sect">
                    <div class="charge">
                        <form id="account-charge-form" action="/order/charge.php" method="post" class="validator">
                            <p>请输入充值金额：</p>
                            <p class="number">
                                <input type="text" maxlength="6" class="f-text" name="money" require="true" datatype="money" value="<?php echo $money; ?>" /> 元 （不支持小数，最低 1 元）
                            </p>
                            <p id="account-charge-tip" class="tip" style="visibility:hidden;"></p>
                            <div class="choose">
                                <p class="choose-pay-type">请选择支付方式：</p>
                                <ul class="typelist">
								<?php if($_SESSION['ali_token']){?>
								        <li><input id="check-alipay" type="radio" name="paytype" value="alipay" <?php echo $ordercheck['alipay']; ?> /><label for="check-alipay" class="alipay">支付宝交易，推荐淘宝用户使用</label></li>
                                 <?php } else { ?>
									<?php if($INI['paypal']['mid']){?>
										<li><input id="check-paypal" type="radio" name="paytype" value="paypal" <?php echo $ordercheck['paypal']; ?> /><label for="check-paypal" class="paypal">PayPal, Recommended</label></li>
									<?php }?>
									<?php if($INI['alipay']['mid']){?>
										<li><input id="check-alipay" type="radio" name="paytype" value="alipay" <?php echo $ordercheck['alipay']; ?> /><label for="check-alipay" class="alipay">支付宝交易，推荐淘宝用户使用</label></li>
									<?php }?>
									<?php if($INI['tenpay']['mid']){?>
										<li><input id="check-tenpay" type="radio" name="paytype" value="tenpay" <?php echo $ordercheck['tenpay']; ?> /><label for="check-tenpay" class="tenpay">财付通交易，推荐QQ用户使用</label></li>
									<?php }?>
                                                                                                           <?php if($INI['sdopay']['mid']){?>
										<li><input id="check-sdopay" type="radio" name="paytype" value="sdopay" <?php echo $ordercheck['sdopay']; ?> /><label for="check-sdopay" class="sdopay">盛付通交易，推荐盛大一卡通用户使用</label></li>
									<?php }?>
									<?php if($INI['yeepay']['mid']){?>
										<li><input id="check-bill" type="radio" name="paytype" value="yeepay" <?php echo $ordercheck['bill']; ?> /><label for="check-yeepay" class="yeepay">易宝支付</label></li>
									<?php }?>
									<?php if($INI['bill']['mid']){?>
										<li><input id="check-bill" type="radio" name="paytype" value="bill" <?php echo $ordercheck['bill']; ?> /><label for="check-bill" class="bill">快钱交易</label></li>
									<?php }?>
									<?php if($INI['chinabank']['mid']){?>
										<li><input id="check-chinabank" type="radio" name="paytype" value="chinabank" <?php echo $ordercheck['chinabank']; ?> /><label for="check-chinabank" class="chinabank">支持招商、工行、建行、中行等主流银行的网银支付</label></li>
									<?php }?>
                                                                                                           <?php if($INI['cmpay']['mid']){?>
										<li><input id="check-cmpay" type="radio" name="paytype" value="cmpay" <?php echo $ordercheck['cmpay']; ?> /><label for="check-cmpay" class="cmpay">手机号就是您的支付账户，中国移动为您提供随时随地随身的支付服务！</label></li>
									<?php }?>
                                    <?php if($INI['gopay']['mid']){?>
										<li><input id="check-gopay" type="radio" name="paytype" value="gopay" <?php echo $ordercheck['gopay']; ?> /><label for="check-gopay" class="gopay">国家级电子支付平台，超低费率，安全保证。</label></li>
									<?php }?>
                                </ul>

		<?php if($INI['tenpay']['mid']&&'Y'==$INI['tenpay']['direct']){?>
					<div id="paybank">
						<?php if(is_array($paybank)){foreach($paybank AS $one) { ?>
						<p><input id="check-<?php echo $one; ?>" type="radio" name="paytype" value="<?php echo $one; ?>" /><label for="check-<?php echo $one; ?>" class="<?php echo $one; ?>"></label></p>
						<?php }}?>
					</div>  
		<?php }?>

		<?php if($INI['sdopay']['mid']&&'Y'==$INI['sdopay']['direct']&&'N'==$INI['tenpay']['direct']){?>
					<div id="paybank">
						<?php if(is_array($sdopaybank)){foreach($sdopaybank AS $one=>$sid) { ?>
						<p><input id="check-<?php echo $one; ?>" type="radio" name="paytype" value="<?php echo $sid; ?>" /><label for="check-<?php echo $one; ?>" class="<?php echo $one; ?>"></label></p>
						<?php }}?>
					</div>  
		<?php }?>

		<?php if($INI['yeepay']['mid']&&'Y'==$INI['yeepay']['direct']&&'N'==$INI['tenpay']['direct']&&'N'==$INI['sdopay']['direct']){?>
					<div id="paybank">
						<?php if(is_array($yeepaybank)){foreach($yeepaybank AS $one=>$pid) { ?>
						<p><input id="check-<?php echo $one; ?>" type="radio" name="paytype" value="<?php echo $pid; ?>" /><label for="check-<?php echo $one; ?>" class="<?php echo $one; ?>"></label></p>
						<?php }}?>
					</div>  
		<?php }?>
        <?php if($INI['gopay']['mid']&&'Y'==$INI['gopay']['direct']&&'N'==$INI['tenpay']['direct']&&'N'==$INI['sdopay']['direct']&&'N'==$INI['yeepay']['direct']){?>
					<div id="paybank">
						<?php if(is_array($gopaybank)){foreach($gopaybank AS $one=>$gid) { ?>
						<p><input id="check-<?php echo $one; ?>" type="radio" name="paytype" value="<?php echo $gid; ?>" /><label for="check-<?php echo $one; ?>" class="<?php echo $one; ?>"></label></p>
						<?php }}?>
					</div>  
		<?php }?>
		<?php }?>

		

                            </div>
                            <div class="clear"></div>
                            <p class="commit">
                                <input type="submit" value="确定，去付款" class="formbutton" />
                            </p>
                        </form>
                    </div>
                </div>
            </div>
            <div class="box-bottom"></div>
        </div>
    </div>
</div>
</div> <!-- bd end -->
</div> <!-- bdw end -->

<?php include template("footer");?>
