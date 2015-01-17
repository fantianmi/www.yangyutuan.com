<?php include template("manage_header");?>

<div id="bdw" class="bdw">
<?php include template("manage_left_menu");?>
<div class="right_main">
<div id="bd" class="cf">
<div id="coupons">
	<div class="dashboard" id="dashboard">
		<ul><?php echo mcurrent_order('refund'); ?></ul>
	</div>
    <div id="content" class="coupons-box clear mainwide">
		<div class="box clear">
            
            <div class="box-content">
                <div class="head">
                    <h2>申请退款订单</h2>
				</div>
                <div class="sect">
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
					<tr><th width="30">ID</th><th width="340">项目</th><th width="150">用户</th><th width="40" nowrap>数量</th><th width="50" nowrap>总款</th><th width="50" nowrap>余付</th><th width="50" nowrap>支付</th><th width="50" nowrap>递送</th><th width="50" nowrap>操作</th></tr>
					<?php if(is_array($orders)){foreach($orders AS $index=>$one) { ?>
					<tr <?php echo $index%2?'':'class="alt"'; ?> id="order-list-id-<?php echo $one['id']; ?>">
						<td><?php echo $one['id']; ?></td>
						<td><?php echo $one['team_id']; ?>&nbsp;(<a class="deal-title" href="/team.php?id=<?php echo $one['team_id']; ?>" target="_blank"><?php echo $teams[$one['team_id']]['title']; ?></a>)</td>
						<td><a href="/ajax/manage.php?action=userview&id=<?php echo $one['user_id']; ?>" class="ajaxlink"><?php echo $users[$one['user_id']]['email']; ?><br/><?php echo $users[$one['user_id']]['username']; ?></a><?php if(Utility::IsMobile($users[$one['user_id']]['mobile'])){?>&nbsp;&raquo;&nbsp;<a href="/ajax/misc.php?action=sms&v=<?php echo $users[$one['user_id']]['mobile']; ?>" class="ajaxlink">短信</a><?php }?></td>
						<td><?php echo $one['quantity']; ?></td>
						<td><span class="money"><?php echo $currency; ?></span><?php echo moneyit($one['origin']); ?></td>
						<td><span class="money"><?php echo $currency; ?></span><?php echo moneyit($one['credit']); ?></td>
						<td><span class="money"><?php echo $currency; ?></span><?php echo moneyit($one['money']); ?></td>
						<td><?php echo $option_delivery[$teams[$one['team_id']]['delivery']]; ?><?php echo ($one['express_id']&&$one['express_no'])?'Y':''; ?><?php if($one['express_id']){?><br /><a href="/manage/order/ajax.php?action=smsexpress&id=<?php echo $one['id']; ?>" class="ajaxlink">短信</a><?php }?></td>
						<td class="op" nowrap><a href="/ajax/manage.php?action=refundview&id=<?php echo $one['id']; ?>" class="ajaxlink">详情</a></td>
					</tr>
					<?php }}?>
					<tr><td colspan="9"><?php echo $pagestring; ?></tr>
                    </table>
				</div>
            </div>
           
        </div>
    </div>
</div>
</div> <!-- bd end -->
</div>
</div> <!-- bdw end -->

<?php include template("manage_footer");?>
