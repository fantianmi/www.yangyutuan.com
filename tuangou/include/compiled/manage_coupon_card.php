<?php include template("manage_header");?>

<div id="bdw" class="bdw">
<?php include template("manage_left_menu");?>
<div class="right_main">
<div id="bd" class="cf">
<div id="coupons">
	<div class="dashboard" id="dashboard">
		<ul><?php echo mcurrent_coupon('card'); ?></ul>
	</div>
	<div id="content" class="clear mainwide">
        <div class="clear box">
            
            <div class="box-content">
                <div class="head">
					<h2>代金券</h2>
					<ul class="filter">
						<li><form method="get">项目ID：<input type="text" name="tid" value="<?php echo htmlspecialchars($tid); ?>" class="h-input" />&nbsp;商户ID：<input type="text" name="pid" value="<?php echo htmlspecialchars($pid); ?>" class="h-input" />&nbsp;代号：<input type="text" name="code" value="<?php echo htmlspecialchars($code); ?>" class="h-input" />&nbsp;状态：<select name="state"><?php echo Utility::Option($usage, $state, '所有'); ?></select>&nbsp;<input type="submit" value="筛选" class="formbutton"  style="padding:1px 6px;"/>&nbsp;<input type="submit" name="download" value="下载" class="formbutton"  style="padding:1px 6px;"/><form></li>
					</ul>
				</div>
                <div class="sect">
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
					<tr><th width="120">ID</th><th width="40">面额</th><th width="120">代号</th><th width="80">有效期限</th><th width="100">状态</th><th width="380">商户名称</th><th width="120">操作</th></tr>
					<?php if(is_array($cards)){foreach($cards AS $index=>$one) { ?>
					<tr <?php echo $index%2?'':'class="alt"'; ?> id="team-list-id-<?php echo $one['id']; ?>">
						<td><?php echo $one['id']; ?></td>
						<td nowrap><?php echo moneyit($one['credit']); ?></td>
						<td nowrap><?php echo $one['code']; ?></td>
						<td nowrap><?php echo date('Y-m-d',$one['begin_time']); ?><br/><?php echo date('Y-m-d',$one['end_time']); ?></td>
						<td nowrap><?php echo $one['consume']=='Y' ? '已用':'未用'; ?><?php if($one['consume']=='Y'){?>&nbsp;(<?php echo $one['team_id']; ?>)<?php }?></td>
						<td><?php echo $one['partner_id']; ?><?php if($one['partner_id']){?>&nbsp;(<?php echo $partners[$one['partner_id']]['title']; ?>)<?php }?></td>
						<td class="op" nowrap><a href="/ajax/manage.php?action=cardremove&id=<?php echo $one['id']; ?>" class="ajaxlink" ask="确定删除本张代金券？">删除</a>&nbsp;|&nbsp;<a href="/ajax/manage.php?action=cardremovezone&id=<?php echo $one['id']; ?>" class="ajaxlink" ask="确定删除本批次代金券？">删除本批</a></td>
					</tr>
					<?php }}?>
					<tr><td colspan="7"><?php echo $pagestring; ?></td></tr>
                    </table>
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
