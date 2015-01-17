<?php include template("manage_header");?>

<div id="bdw" class="bdw">
<?php include template("manage_left_menu");?>
<div class="right_main">
<div id="bd" class="cf">
<div id="coupons">
	<div class="dashboard" id="dashboard">
		<ul><?php echo mcurrent_coupon('paycard'); ?></ul>
	</div>
	<div id="content" class="clear mainwide">
        <div class="clear box">
            
            <div class="box-content">
                <div class="head">
					<h2>充值卡</h2>
					<ul class="filter">
						<li><form method="get">充值密码：<input type="text" name="tid" value="<?php echo htmlspecialchars($tid); ?>" class="h-input" />&nbsp;状态：<select name="state"><?php echo Utility::Option($usage, $state, '所有'); ?></select>&nbsp;<input type="submit" value="筛选" class="formbutton"  style="padding:1px 6px;"/>&nbsp;<input type="submit" name="download" value="下载" class="formbutton"  style="padding:1px 6px;"/><form></li>
					</ul>
				</div>
                <div class="sect">
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
					<tr><th width="200">充值密码</th><th width="60">面额</th><th width="200">充值时间</th><th width="200">有效期限</th><th width="100">状态</th><th width="100">充值用户</th><th width="100">操作</th></tr>
					<?php if(is_array($cards)){foreach($cards AS $index=>$one) { ?>
					<tr <?php echo $index%2?'':'class="alt"'; ?> id="team-list-id-<?php echo $one['id']; ?>">
						<td><?php echo $one['id']; ?></td>
						<td nowrap><?php echo moneyit($one['value']); ?></td>
						<td nowrap><?php if($one['consume']=='Y'){?><?php echo date('Y-m-d',$one['recharge_time']); ?><?php } else { ?>未使用<?php }?></td>
						<td nowrap><?php echo date('Y-m-d',$one['expire_time']); ?></td>
						<td nowrap><?php echo $one['consume']=='Y' ? '已用':'未用'; ?></td>                       
                                                <td nowrap><?php echo $users[$one['user_id']]['username']; ?></td>
						<td class="op" nowrap><a href="/ajax/manage.php?action=paycardremove&id=<?php echo $one['id']; ?>" class="ajaxlink" ask="确定删除本张充值卡？">删除</a>&nbsp;</td>
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
