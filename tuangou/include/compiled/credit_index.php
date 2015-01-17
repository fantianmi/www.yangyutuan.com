<?php include template("header");?>

<div id="bdw" class="bdw">
<div id="bd" class="cf">
<div id="credit">
	<div class="dashboard" id="dashboard">
		<ul><?php echo current_account('/account/settings.php'); ?></ul>
	</div>
    <div id="content">
		<div class="box clear">
          
            <div class="box-content">
                <div class="head">
                    <h2>账户余额</h2>
					<ul class="filter">
						<li><a href="/account/settings.php">帐户设置</a></li>
						<li class="current"><a href="/credit/index.php">帐户余额</a></li>
						<li><a href="/account/myask.php">我的问答</a></li>   
						<li><a href="/account/setbinds.php">手机绑定</a></li>
						<li><a href="/account/setaddress.php">收货地址</a></li>
					</ul>
                </div>
                <div class="sect">
					<p class="charge">充值到<?php echo $INI['system']['abbreviation']; ?>账户，方便抢购！ <span>&raquo;</span> <a href="/credit/charge.php">立即充值</a></p>
					<h3 class="credit-title">当前的账户余额是 <strong><?php echo moneyit($login_user['money']); ?></strong> 元</h3>
					<table id="order-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
						<tr><th width="120">时间</th><th width="auto">详情</th><th width="50">收支</th><th width="70">金额(元)</th></tr>
						<?php if(is_array($flows)){foreach($flows AS $index=>$one) { ?>
						<tr <?php echo $index%2?'':'class="alt"'; ?>><td style="text-align:left;"><?php echo date('Y-m-d H:i', $one['create_time']); ?></td><td><?php echo ZFlow::Explain($one); ?></td><td class="<?php echo $one['direction']; ?>"><?php echo $one['direction']=='income'?'收入':'支出'; ?></td><td><?php echo moneyit($one['money']); ?></td></tr>
						<?php }}?>
						<tr><td colspan="4"><?php echo $pagestring; ?></td></tr>
                    </table>
				</div>
            </div>
         
        </div>
    </div>
    <div id="sidebar">
		<?php include template("block_side_credit");?>
		<?php include template("block_side_credittip");?>
        
         <?php include template("block_side_chargebycard");?>
           
    </div>
</div>

</div> <!-- bd end -->
</div> <!-- bdw end -->

<?php include template("footer");?>
