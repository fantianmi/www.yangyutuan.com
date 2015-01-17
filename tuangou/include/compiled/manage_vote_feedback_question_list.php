<?php include template("manage_header");?>

<div id="bdw" class="bdw">
<?php include template("manage_left_menu");?>
<div class="right_main">
<div id="bd" class="cf">
<div id="help">
	<div class="dashboard" id="dashboard">
		<ul><?php echo mcurrent_vote('feedback'); ?></ul>
	</div>
    <div id="content" class="coupons-box clear mainwide">
		<div class="box clear">
            
            <div class="box-content">
                <div class="head">
                    <h2><?php echo $show_all ? '全部问题列表' : '调查中的问题列表'; ?></h2>
					<ul class="filter">
						<li><?php echo $show_all ? '<a href="feedback.php?action=question_list">调查中的问题列表</a>' : '<a href="feedback.php?action=question_list&show_all=1">全部问题列表</a>'; ?></li>
						<li><a href="feedback.php?action=list">详细反馈列表</a></li>
					</ul>
				</div>
                <div class="sect">
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
					<tr>
						<th width="40">ID</th>
						<th width="400">标题</th>
						<th width="100">反馈(人次)</th>
						<th width="100">状态</th>
						<th width="100">排序</th>
						<th width="300">操作</th>
					</tr>
					<?php if(!$question_list){?>
					<tr>
						<td colspan=6 align="center">无调查问题</td>
					</tr>
					<?php }?>
					<?php if(is_array($question_list)){foreach($question_list AS $index=>$one) { ?>
					<tr <?php echo $index%2?'':'class="alt"'; ?> id="order-list-id-<?php echo $one['id']; ?>">
						<td><?php echo $one['id']; ?></td>
						<td><?php echo $one['title']; ?></td>
						<td><?php echo $one['feedback']; ?></td>
						<td><?php echo $one['is_show'] ? '显示' : '隐藏'; ?></td>
						<td><?php echo $one['order']; ?></td>
						<td class="op">
							<a href="feedback.php?action=question_view&question_id=<?php echo $one['id']; ?>">详情</a>
						</td>
					</tr>
					<?php }}?>
					<tr><td colspan="8"><?php echo $pagestring; ?></tr>
                    </table>
				</div>
			</div>
           
        </div>
    </div>
</div>
</div> <!-- bd end -->
</div>
</div> <!-- bdw end -->

<?php include template("footer");?>
