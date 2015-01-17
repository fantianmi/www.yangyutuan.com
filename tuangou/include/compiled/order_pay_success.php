<?php include template("header");?>
<div id="bdw" class="bdw">
<div id="bd" class="cf">
<div id="content">
    <div id="order-pay-return" class="box">
        
        <div class="box-content">
			<div class="success"><h2>您的订单，支付成功了！</h2> </div>
            <div class="sect">
                 <p class="info">温馨提示：优惠券请留意手机信息</p>
				 <?php if($order['zipcode']=='' && $team['now_number'] >= $team['min_number']){?>
				 <div class="coupon-tip">
                        <div class="tipped cf">
                            <div class="coupon-status cf">
                                <div class="check">
                                    <a class="coupon-see-button" hidefocus="true" href="/coupon/index.php" title="查看我的<?php echo $INI['system']['couponname']; ?>">查看<?php echo $INI['system']['couponname']; ?></a>
                                    <p class="tip"><a href="/order/index.php">查看订单</a></p>
                                </div>
                                <p class="coupon-sms">如果有优惠劵的商品，<?php if($order['mobile']){?>已将<?php echo $INI['system']['couponname']; ?>密码发送到手机：<strong><?php echo $order['mobile']; ?></strong><?php } else { ?>已将<?php echo $INI['system']['couponname']; ?>密码发送到您注册信息的手机<?php }?></p>
                                <p class="tip">凭<?php echo $INI['system']['couponname']; ?>密码，即可去商家处享受超值服务！</p>
                            </div>
                            <h4>没收到短信？您可以：</h4>
                            <ul class="no-sms-tip cf">
                                <li class="delay pngfix">再等待一会<p>短信可能延迟</p></li>
                                <li class="coupon pngfix"><a href="/coupon/index.php">查看<?php echo $INI['system']['couponname']; ?></a><p>下载、打印或重发<?php echo $INI['system']['couponname']; ?>短信</p></li>
                                <li class="mobile pngfix">手机访问<?php echo $INI['system']['mobileurl']; ?><p>手机也能查看<?php echo $INI['system']['couponname']; ?></p></li>
                                <li class="consult pngfix"><a href="/team/ask.php?id=<?php echo $order['team_id']; ?>#post">在线提问</a><p>让我们的客服人员来帮您</p></li>
                            </ul>
				     </div>
                   </div>
                   <?php }?>
              </div>
		</div>
		
	</div>
</div>
<div id="side">
</div>
</div> <!-- bd end -->
</div> <!-- bdw end -->

<?php include template("footer");?>
