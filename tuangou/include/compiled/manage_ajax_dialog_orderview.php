<div id="order-pay-dialog" class="order-pay-dialog-c" style="width:600px;">
	<h3><span id="order-pay-dialog-close" class="close" onclick="return X.boxClose();">关闭</span></h3>
	<div style="overflow-x:hidden;padding:10px;" id="dialog-order-id" oid="<?php echo $order['id']; ?>">
	<table width="96%" align="center" class="coupons-table">
		<tr><td width="80"><b>用户信息：</b></td><td><?php echo $user['username']; ?> / <?php echo $user['email']; ?></td></tr>
		<tr><td><b>项目名称：</b></td><td><?php echo $team['title']; ?></td></tr>
		<tr><td><b>购买数量：</b></td><td><?php echo $order['quantity']; ?></td></tr>
	<?php if($order['condbuy']){?>
		<tr><td><b>购买选项：</b></td><td><?php echo $order['condbuy']; ?></td></tr>
	<?php }?>
		<tr><td><b>付款状态：</b></td><td><?php echo $paystate[$order['state']]; ?></td></tr>
		<tr><td><b>交易单号：</b></td><td><?php echo $order['pay_id']; ?></td></tr>
		<tr><td><b>支付序号：</b></td><td><?php echo $order['buy_id']; ?></td></tr>
		<tr><td><b>付款明细：</b></td><td><?php if($order['credit']){?>余额支付 <b><?php echo moneyit($order['credit']); ?></b> 元<?php }?>&nbsp;<?php if($order['service']!='credit'&&$order['money']){?><?php echo $payservice[$order['service']]; ?>支付 <b><?php echo moneyit($order['money']); ?></b> 元<?php }?><?php if($order['card_id']){?>&nbsp;代金券：<b><?php echo moneyit($order['card']); ?></b> 元<?php }?></td></tr>
		<tr><td><b>订购时间：</b></td><td><?php echo date('Y-m-d H:i', $order['create_time']); ?> / <?php echo date('Y-m-d H:i', $order['pay_time']); ?></td></tr>
		<tr><td><b>订单来源：</b></td><td><?php echo $order['referer']['referer']; ?></td></tr>
	
	<?php if($order['mobile']){?>
		<tr><td><b>联系手机：</b></td><td><?php echo $order['mobile']; ?></td></tr>
	<?php }?>
	
	<?php if($user['qq']){?>
		<tr><td><b>QQ：</b></td><td><?php echo $user['qq']; ?></td></tr>
	<?php }?>

	<?php if($user['msn']){?>
		<tr><td><b>MSN：</b></td><td><?php echo $user['msn']; ?></td></tr>
	<?php }?>
	<?php if($order['remark']){?>
		<tr><td width="80"><b>买家留言：</b></td><td><?php echo htmlspecialchars($order['remark']); ?></td></tr>
	<?php }?>
	<?php if($team['delivery']=='coupon'){?>
	<tr><td><b>订单状态：</b></td>
		<td>
		<?php if(is_array($coupons)){foreach($coupons AS $index=>$one) { ?>
		<?php echo $one['id']; ?> &nbsp;&nbsp;<?php if($one['consume']=='Y'){?><font color="green">已消费</font><?php } else { ?><font color="red">未消费</font><?php }?>
		<br />
		<?php }}?>
		</td>
	</tr>
	<?php }?>
	<br />
	    <tr><td width="80"><b>订单备注：</b></td><td><textarea style="width:180px;height:80px;" id="dialog_order_remark"><?php echo htmlspecialchars($order['adminremark']); ?></textarea><input type="submit" value="确定" onclick="return X.manage.orderremark();"/></td></tr>

	<?php if($team['delivery']=='express'){?>
		<tr><th colspan="2"><hr/></th></td>
		<tr><td width="100"><b>收件人：</b></td><td><?php echo $order['realname']; ?></td></tr>
		<tr><td><b>手机号码：</b></td><td><?php echo $order['mobile']; ?></td></tr>
		<tr><td><b>收件邮编：</b></td><td><?php echo $order['zipcode']; ?></td></tr>
		<tr><td><b>收件地址：</b></td><td><?php echo $order['address']; ?></td></tr>
		<tr><td><b>收件时间：</b></td><td><?php echo $order['express_xx']; ?></td></tr>
		<tr><td><b>快递公司id：</b></td><td><?php echo $order['express_id']; ?></td></tr>
		<tr><td><b>快递公司：</b></td><td><?php echo $order['express_name']; ?></td></tr>
		<tr><th colspan="2"><hr/></th></td>
		<tr><td><b>快递信息：</b></td><td><select name="express_id" id="order-dialog-select-id"><?php echo Utility::Option($option_express, $order['express_id'], '请选择快递'); ?></select>&nbsp;<input type="text" name="in" id="order-dialog-input-id" value="<?php echo $order['express_no']; ?>" style="width:150px;" maxLength="32" />&nbsp;&nbsp;<input type="submit" value="确定" onclick="return X.manage.orderexpress();"/></td></tr>
	<?php }?>

	<?php if($order['state']=='pay'){?>
		<tr><th colspan="2"><hr/></th></td>
		<tr><td><b>退款处理：</b></td><td><select name="refund" id="order-dialog-refund-id"><?php echo Utility::Option($option_refund, '', '请选择退款方式'); ?></select>&nbsp;<input type="submit" value="确定" onclick="return X.manage.orderrefund();"/></td></tr>
	<?php }?>

	</table>
	</div>
</div>

