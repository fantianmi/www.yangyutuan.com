<?php include template("biz_header");?>

<div id="bdw" class="bdw">
<div id="bd" class="cf">
<div id="coupons">
    <div id="content" class="coupons-box clear mainwide">
		<div class="box clear">
          
            <div class="box-content">
                <div class="head">
                    <h2><?php echo $INI['system']['couponname']; ?>列表</h2>
					<ul class="filter">
						<li><form action="/biz/coupon.php" method="get">项目：(ID号或标题)<input type="text" class="h-input" name="title" value="<?php echo htmlspecialchars($title); ?>" >&nbsp;<input type="submit" value="筛选" class="formbutton"  style="padding:1px 6px;"/>&nbsp;券编号：<input type="text" class="h-input" name="coupon" value="<?php echo htmlspecialchars($coupon); ?>" >&nbsp;<select name="state"><?php echo Utility::Option($option_state, $state, '--所有--'); ?></select><input type="submit" value="筛选" class="formbutton"  style="padding:1px 6px;"/><form></li>
					</ul>
				</div>
                <div class="sect">
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
						<tr><th width="100" nowrap>编号</th><th width="450">项目名称</th><th width="160">购买者</th><th width="60" nowrap>密码</th><th width="100" nowrap>有效日期</th><th width="160">状态</th></tr>
					<?php if(is_array($coupons)){foreach($coupons AS $index=>$one) { ?>
						<tr <?php echo $index%2?'':'class="alt"'; ?>>
							<td><?php echo $one['id']; ?></td>
							<td><?php echo $one['team_id']; ?>&nbsp;(<a class="deal-title" href="/team.php?id=<?php echo $one['team_id']; ?>" target="_blank"><?php echo $teams[$one['team_id']]['title']; ?></a>)</td>
							<td nowrap><?php echo $users[$one['user_id']]['email']; ?><br/><?php echo $users[$one['user_id']]['username']; ?></td>
							<td><?php if(abs(intval($INI['system']['partnerdown']))){?><?php echo $one['secret']; ?><?php } else { ?>******<?php }?></td>
							<td nowrap><?php echo date('Y-m-d', $one['expire_time']); ?></td>
							<td nowrap><?php if($one['consume']=='Y'){?>已消费<br/><?php echo date('Y-m-d H:i', $one['consume_time']); ?><?php } else if($one['expire_time']<time()) { ?>已过期<?php } else { ?>有效<?php }?></td>
						</tr>	
					<?php }}?>
						<tr><td colspan="6"><?php echo $pagestring; ?></td></tr>
                    </table>
				</div>
            </div>
         
        </div>
    </div>
</div>
</div> <!-- bd end -->
</div> <!-- bdw end -->


<?php include template("biz_footer");?>

