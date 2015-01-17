<?php include template("header");?>

<div id="bdw" class="bdw">
<div id="bd" class="cf">
<div id="coupons">
	<div class="dashboard" id="dashboard">
		<ul><?php echo current_account('/coupon/index.php'); ?></ul>
	</div>
    <div id="content" class="coupons-box clear">
		<div class="box clear">

            <div class="box-content">
                <div class="head">
                    <h2>我的<?php echo $INI['system']['couponname']; ?></h2>
                    <ul class="filter">
						<li class="label">分类: </li>
						<?php echo current_coupon_sub('consume'); ?>
					</ul>
				</div>
                <div class="sect">
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
						<tr><th width="400">项目名称</th><th width="100" nowrap><?php echo $INI['system']['couponname']; ?>编号</th><th width="100" nowrap>消费日期</th></tr>
					<?php if(is_array($coupons)){foreach($coupons AS $index=>$one) { ?>
						<tr <?php echo $index%2?'':'class="alt"'; ?>>
							<td><a class="deal-title" href="/team.php?id=<?php echo $one['team_id']; ?>" target="_blank"><?php echo $teams[$one['team_id']]['title']; ?></a></td>
							<td><?php echo $one['id']; ?></td>
							<td><?php echo date('Y-m-d', $one['consume_time']); ?></td>
						</tr>	
					<?php }}?>
						<tr><td colspan="3"><?php echo $pagestring; ?></td></tr>
                    </table>
				</div>
            </div>
  
        </div>
    </div>
    <div id="sidebar">
		<?php include template("block_side_aboutcoupon");?>
    </div>
</div>
</div> <!-- bd end -->
</div> <!-- bdw end -->

<?php include template("footer");?>
