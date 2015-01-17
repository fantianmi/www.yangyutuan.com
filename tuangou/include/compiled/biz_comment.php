<?php include template("biz_header");?>

<div id="bdw" class="bdw">
<div id="bd" class="cf">
<div id="coupons">
    <div id="content" class="coupons-box clear mainwide">
		<div class="box clear">

            <div class="box-content">
                <div class="head">
                    <h2>用户点评</h2>
					<ul class="filter">
						<li><form action="/biz/comment.php" method="get">项目：<input type="text" class="h-input" name="title" value="<?php echo htmlspecialchars($title); ?>" >&nbsp;<input type="submit" value="筛选" class="formbutton"  style="padding:1px 6px;"/>&nbsp;<select name="grad"><?php echo Utility::Option($option_grad, $grad, '--所有--'); ?></select><input type="submit" value="筛选" class="formbutton"  style="padding:1px 6px;"/><form></li>
					</ul>
                    
				</div>	 
                <div class="sect" style="padding:0 10px;">

				    <div class="all_intro" style="text-indent:28px; line-height:30px;">
                    <a href="/biz/comment.php">全部评价</a> 　　
                    <a href="/biz/comment.php?act=reply">未回复</a>
                    </div>
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
						<tr>
                            <th width="100" nowrap>用户</th>
                            <th width="450">项目名称</th>
                            <th width="80">满意度</th>
                            <th width="80" nowrap>总体评价</th>
                            <th width="180" nowrap>评价</th>
                            <th width="80" nowrap>图片</th>
                            <th width="50" nowrap>操作</th>
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
                            <td>
                            
                            <?php if($one['reply_cotent']){?>
                               <a class="ajaxlink" href="/ajax/comment.php?action=comment&id=<?php echo $one['id']; ?>">查看</a>
                            <?php } else { ?>
                               <a class="ajaxlink" href="/ajax/comment.php?action=comment&id=<?php echo $one['id']; ?>">回复</a>
                            <?php }?>
                            
                            </td>
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
