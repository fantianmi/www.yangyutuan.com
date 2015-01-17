<?php include template("header");?>
<div id="dialog"></div>
<div id="bdw" class="bdw">
<div id="bd" class="cf">
<div id="coupons">
	<div class="dashboard" id="dashboard">
		<ul><?php echo current_account('/account/collect.php'); ?></ul>
	</div>
    <div id="content" class="coupons-box clear">
		<div class="box clear">
            <div class="box-content">
                <div class="head">
                    <h2>我的收藏</h2>
				</div>
                <div class="sect">
				    <?php if($selector=='index' || $selector=='pay' || $selector=='unpay' || $selector=='' ){?>
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
						<tr><th width="380">项目标题</th><th width="100">时间</th><th width="60">价格</th><th width="80">操作</th></tr>
					<?php if(is_array($orders)){foreach($orders AS $index=>$one) { ?>
						<tr <?php echo $index%2?'':'class="alt"'; ?>>
							<td style="text-align:left;"><a class="deal-title"><?php echo $one['title']; ?></a></td>
							<td><?php echo date('Y-m-d',$one['time']); ?></td>
							<td><?php echo $one['team_price']; ?></td>
							<td class="op"><a href="/ajax/order.php?action=delcollect&id=<?php echo $one['id']; ?>" class="ajaxlink" ask="确定取消收藏吗？">取消收藏</a></td>
						</tr>
					<?php }}?>
						<tr><td colspan="5"><?php echo $pagestring; ?></td></tr>
                    </table>		
					<?php } else { ?>
                    <table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
						<tr><th width="380">项目名称</th><th width="60">数量</th><th width="60">总价</th><th width="60">状态</th><th width="80">操作</th></tr>
					<?php if(is_array($orders)){foreach($orders AS $index=>$one) { ?>
						<tr <?php echo $index%2?'':'class="alt"'; ?>>
							<td style="text-align:left;"><a class="deal-title" href="/team.php?id=<?php echo $one['team_id']; ?>" target="_blank"><?php echo $teams[$one['team_id']]['title']; ?></a></td>
							<td><?php echo $one['quantity']; ?></td>
							<td><span class="money"><?php echo $currency; ?></span><?php echo moneyit($one['origin']); ?></td>
							<td>已付款</td>
							<td class="op"><?php if(($one['rstate']=='askrefund')){?>退款审核中<?php } else if($one['rstate']=='normal') { ?><a href="/ajax/refund.php?action=askrefund&id=<?php echo $one['id']; ?>" class="ajaxlink">申请退款</a>
							<?php } else if($one['rstate']=='berefund') { ?>退款成功<?php } else if($one['rstate']=='norefund') { ?>退款失败<?php }?></td>
						</tr>
					<?php }}?>
						<tr><td colspan="5"><?php echo $pagestring; ?></td></tr>
                    </table>
					<?php }?>
				</div>
            </div>
        </div>
    </div>
    <div id="sidebar">
		<?php include template("block_side_aboutorder");?>
    </div>
</div>

</div> <!-- bd end -->
</div> <!-- bdw end -->

<?php include template("footer");?>
