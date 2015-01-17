<div id="order-pay-dialog" class="order-pay-dialog-c" style="width:580px;">
	<h3><span id="order-pay-dialog-close" class="close" onclick="return X.boxClose();">关闭</span>项目详情</h3>
	<div style="overflow-x:hidden;padding:10px;">
	<table width="96%" align="center" class="coupons-table">
		<tr><td width="80"><b>项目名称：</b></td><td><b><?php echo $team['title']; ?></b></td></tr>
		<tr><td><b>项目时间：</b></td><td>开始：<b><?php echo date('Y-m-d',$team['begin_time']); ?></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;截至：<b><?php echo date('Y-m-d',$team['end_time']); ?></b></td></tr>

		<tr><td><b>当前状态：</b></td><td><span style="color:#F00;font-weight:bold;"><?php echo state_explain($team); ?></span><?php if($team['close_time']&&$team['now_number']>=$team['min_number']&&$team['delivery']!='express'){?>&nbsp;&nbsp;<span style="color:#F8C;font-weight:bold;"><?php if(($team['teamcoupon'])){?>&lt;<?php echo $INI['system']['couponname']; ?>未发完&gt;<?php } else { ?>&lt;<?php echo $INI['system']['couponname']; ?>已发放&gt;<?php }?></span><?php }?></td></tr>
		<tr><td><b>限购数量：</b></td><td>最低：<?php echo $team['min_number']; ?>&nbsp;&nbsp;&nbsp;&nbsp;最高：<?php echo $team['max_number']==0?'无上限':$team['max_number']; ?></td></tr>
		<tr><td><b>项目定价：</b></td><td>市场价格：<b><?php echo moneyit($team['market_price']); ?></b>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目价格：<b><?php echo moneyit($team['team_price']); ?></b>&nbsp;元</td></tr>
		<tr><th colspan="2"><hr/></th></td>
		<tr><td><b>销售城市:</b></td>
			<td>
				<?php if(is_array($allcities)){foreach($allcities AS $index=>$one) { ?>
						<?php if(in_array($one['id'],$team['city_ids'])){?><?php echo $one['name']; ?> <?php }?>
				<?php }}?>
			</td>
		</tr>
		<tr><th colspan="2"><hr/></th></td>
		<tr><td><b>成交情况：</b></td><td><b><?php echo $team['now_number']; ?></b>&nbsp;，实际共&nbsp;<b><?php echo $paycount; ?></b>&nbsp;人购买了&nbsp;<b><?php echo $buycount; ?></b>&nbsp;份
		</td></tr>
		<tr><td><b>支付统计：</b></td><td>在线支付：<b><?php echo moneyit($onlinepay); ?></b>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;余额支付：<b><?php echo moneyit($creditpay); ?></b>&nbsp;元</td></tr>
		<tr><td><b>项目收支：</b></td><td>支付总额：<b><?php echo moneyit($onlinepay+$creditpay); ?></b>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;代金券抵用：<b><?php echo moneyit($cardpay); ?></b>&nbsp;元</td></tr>
	<?php if($team['needline']){?>
		<tr><th colspan="2"><hr/></th></td>
		<tr><td colspan="2">
			<?php if($team['noticesubscribe']){?><button style="padding:0;" id="dialog_subscribe_button_id" onclick="if(confirm('发送邮件过程中，请耐心等待，同意吗？')){this.disabled=true;return X.misc.noticenext(<?php echo $team['id']; ?>,0);}">邮件订阅&nbsp;(<span id="dialog_subscribe_count_id">0</span>/<?php echo $subcount; ?>)</button>&nbsp;<?php }?>
			<?php if($team['noticesmssubscribe']){?><button style="padding:0;" id="dialog_smssubscribe_button_id" onclick="if(confirm('发送短信过程中，请耐心等待，同意吗？')){this.disabled=true;return X.misc.noticenextsms(<?php echo $team['id']; ?>,0);}">短信订阅&nbsp;(<span id="dialog_smssubscribe_count_id">0</span>/<?php echo $smssubcount; ?>)</button>&nbsp;<?php }?>
			<?php if($team['noticesms']){?><button id="dialog_sms_button_id" onclick="if(confirm('发送短信过程中，请耐心等待，同意吗？')){this.disabled=true;return X.misc.noticesms(<?php echo $team['id']; ?>,0);}">短信发券&nbsp;(<span id="dialog_sms_count_id">0</span>/<?php echo $couponcount; ?>)</button>&nbsp;<?php }?>
			<?php if($team['teamcoupon']){?><button onclick="this.disabled=true;return X.manage.teamcoupon(<?php echo $team['id']; ?>);">自动发券&nbsp;(<?php echo $couponcount; ?>/<?php echo $buycount; ?>)</button>&nbsp;<?php }?>
		</td></tr>
	<?php }?>
	</table>
	</div>
</div>
