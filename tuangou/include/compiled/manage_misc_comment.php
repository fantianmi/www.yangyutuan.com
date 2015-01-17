<?php include template("manage_header");?>

<div id="bdw" class="bdw">
<?php include template("manage_left_menu");?>
<div class="right_main">
<div id="bd" class="cf">
<div id="coupons">
	<div class="dashboard" id="dashboard">
		<ul><?php echo mcurrent_misc('comment'); ?></ul>
	</div>
    <div id="content" class="coupons-box clear mainwide">
		<div class="box clear">
            
            <div class="box-content">
                <div class="head">
                    <h2>订单点评</h2>
                    <ul class="filter">
						<li><form action="/manage/misc/comment.php" method="get">项目ID：<input type="text" name="tid" value="<?php echo abs(intval($tid)); ?>" class="h-input" />&nbsp;内容：<input type="text" name="like" value="<?php echo htmlspecialchars($like); ?>" class="h-input" />&nbsp;&nbsp;<input type="submit" value="筛选" class="formbutton"  style="padding:1px 6px;"/><form></li>
					</ul>
				</div>
                <div class="sect">
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
						<tr>
                            <th width="100" nowrap>用户</th>
                            <th width="320">项目名称</th>
                            <th width="80">满意度</th>
                            <th width="80" nowrap>总体评价</th>
                            <th width="180" nowrap>评价</th>
                            <th width="80" nowrap>图片</th>
                            <th width="150" nowrap>回复</th>
                        </tr>
					<?php if(is_array($orders)){foreach($orders AS $index=>$one) { ?>
						<tr <?php echo $index%2?'':'class="alt"'; ?>>
							<td><?php echo $users[$one['user_id']]['username']; ?></td>
							<td><?php echo $one['team_id']; ?>&nbsp;(<a title="<?php echo $teams[$one['team_id']]['title']; ?>" class="deal-title" href="/team.php?id=<?php echo $one['team_id']; ?>" target="_blank"><?php echo mb_strimwidth($teams[$one['team_id']]['title'],0,40); ?>...</a>)</td>
							<td nowrap><?php if($one['comment_grade_three']=='3'){?>好评<?php } else if($one['comment_grade_three']=='2') { ?>中评<?php } else { ?>差评<?php }?></td>
							<td><?php echo $one['comment_grade']; ?>分</td>
							<td><a title="<?php echo $one['comment_content']; ?>"><?php echo mb_strimwidth($one['comment_content'],0,40); ?>...</a></td>
                            <td>
                              <?php if($one['image1']){?>
                                <a href="#"><img width="20" height="20" src="<?php echo team_image($one['image1']); ?>" /></a>
                              <?php }?>   
                                <?php if($one['image2']){?>
                                <a href="#"><img width="20" height="20" src="<?php echo team_image($one['image2']); ?>" /></a>
                              <?php }?>  
                                <?php if($one['image3']){?>
                                <a href="#"><img width="20" height="20" src="<?php echo team_image($one['image3']); ?>" /></a>
                              <?php }?>  
                                <?php if($one['image4']){?>
                                <a href="#"><img width="20" height="20" src="<?php echo team_image($one['image4']); ?>" /></a>
                              <?php }?>  
                              
                            </td>
                            <td><a title="<?php echo $one['reply_cotent']; ?>"><?php echo mb_strimwidth($one['reply_cotent'],0,40); ?>...</a></td>
						</tr>	
					<?php }}?>
						<tr><td colspan="7"><?php echo $pagestring; ?></td></tr>
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
