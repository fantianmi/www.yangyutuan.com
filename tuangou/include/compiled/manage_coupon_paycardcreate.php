<?php include template("manage_header");?>

<div id="bdw" class="bdw">
<?php include template("manage_left_menu");?>
<div class="right_main">
<div id="bd" class="cf">
<div id="coupons">
	<div class="dashboard" id="dashboard">
		<ul><?php echo mcurrent_coupon('paycardcreate'); ?></ul>
	</div>
	<div id="content" class="clear mainwide">
        <div class="clear box">
            
            <div class="box-content">
                <div class="head">
					<h2>新建充值卡</h2>
				</div>
                <div class="sect">
                    <form id="login-user-form" method="post" class="validator">
					<input type="hidden" name="id" value="<?php echo $paycard['id']; ?>" />
                        <div class="field">
                            <label>充值卡金额</label>
                            <input type="text" size="30" name="money" id="card-create-money" class="number" value="<?php echo $paycard['money']; ?>" datatype="number" require="true" /><span class="inputtip">面额单位为元CNY（人民币元）</span>
                        </div>
                        <div class="field">
                            <label>生成数量</label>
                            <input type="text" size="30" name="quantity" id="card-create-quantity" class="number" value="<?php echo abs(intval($paycard['quantity'])); ?>" datatype="number" require="true" /><span class="inputtip">一次最多生成1000张，可重复生成</span>
                        </div>
                        <div class="field">
                            <label>过期日期</label>
                            <input type="text" size="30" name="expire_time" id="card-create-endtime" class="number" value="<?php echo date('Y-m-d', $paycard['expire_time']); ?>" datatype="date" require="true" />
						</div>
                        <div class="act">
                            <input type="submit" value="生成" name="commit" id="partner-submit" class="formbutton"/>
                        </div>
					</form>
                </div>
            </div>
           
        </div>
	</div>

<div id="sidebar">
</div>

</div>
</div> <!-- bd end -->
</div>
</div> <!-- bdw end -->

<?php include template("manage_footer");?>
