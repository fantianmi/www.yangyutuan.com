<?php include template("header");?>
<div id="dialog"></div>
<div id="bdw" class="bdw">
<div id="bd" class="cf">
<div id="coupons">
	<div class="dashboard" id="dashboard">
		<ul><?php echo current_account('/account/comment.php'); ?></ul>
	</div>
    <div id="content" class="coupons-box clear">
		<div class="box clear">
            <div class="box-content">
                <div class="head">
                    <h2>我的评价</h2>
				</div>
                <div class="sect">
				  
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
						<tr><th width="190">项目</th><th width="190">内容</th><th width="100">时间</th><th width="60">状态</th><th width="80">操作</th></tr>
					<?php if(is_array($orders)){foreach($orders AS $index=>$one) { ?>
						<tr <?php echo $index%2?'':'class="alt"'; ?>>
                            <td style="text-align:left;"><a href="/team.php?id=<?php echo $one['team_id']; ?>" class="deal-title"><?php echo mb_strimwidth($teams[$one['team_id']]['title'],0,55); ?></a></td>
							<td style="text-align:left;"><a class="deal-title"><?php echo mb_strimwidth($one['comment_content'],0,50); ?></a></td>
							<td><?php echo date('Y-m-d',$one['add_time']); ?></td>
							<td>
                                <?php if($one['comment_grade_three'] == 3){?>
                                   好评
                                <?php } else if($one['comment_grade_three'] == 2) { ?>
                                   中评
                                <?php } else { ?>
                                   差评
                                <?php }?>
                                
                            </td>
							<td class="op">
                            
                           <a href="/order/view.php?id=<?php echo $one['order_id']; ?>">详情</a>
                          </td>
						</tr>
					<?php }}?>
						<tr><td colspan="5"><?php echo $pagestring; ?></td></tr>
                    </table>		
					
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
