<?php include template("manage_header");?>

<div id="bdw" class="bdw">
<?php include template("manage_left_menu");?>
<div class="right_main">
<div id="bd" class="cf">
<div id="help">
	<div class="dashboard" id="dashboard">
		<ul><?php echo mcurrent_vote('question'); ?></ul>
	</div>
    <div id="content" class="coupons-box clear mainwide">
		<div class="box clear">
            
            <div class="box-content">
                <div class="head">
                    <h2>
						<?php if($action == 'list-all'){?>
							全部问题列表
						<?php } else { ?>
							正在调查问题 列表
						<?php }?>
					</h2>
					<ul class="filter">
						<li>
							<a href="question.php?action=add">添加新问题</a>
						</li>
						<li>
							<?php if($action == 'list-all'){?>
								<a href="question.php?action=list-is_show-1">正在调查问题列表</a>
							<?php } else { ?>
								<a href="question.php?action=list-all">全部问题列表</a>
							<?php }?>
						</li>
					</ul>
				</div>
                <div class="sect">
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
					<tr>
						<th width="40">ID</th>
						<th width="400">标题</th>
						<th width="100">状态</th>
						<th width="100">排序</th>
						<th width="300">操作</th>
					</tr>
					<?php if(!$question_list){?>
					<tr>
						<td colspan=5 align="center">无调查问题</td>
					</tr>
					<?php }?>
					<?php if(is_array($question_list)){foreach($question_list AS $index=>$one) { ?>
					<tr <?php echo $index%2?'':'class="alt"'; ?> id="order-list-id-<?php echo $one['id']; ?>">
						<td><?php echo $one['id']; ?></td>
						<td><?php echo $one['title']; ?></td>
						<td><?php echo $one['is_show'] ? '显示' : '隐藏'; ?></td>
						<td><?php echo $one['order']; ?></td>
						<td class="op">
							<?php echo $one['is_show'] ? '<a href="question.php?action=change_show&id='.$one['id'].'&value=0">隐藏</a>' : '<a href="question.php?action=change_show&id='.$one['id'].'&value=1">显示</a>'; ?>
							<a href="options.php?question_id=<?php echo $one['id']; ?>">选项</a>
							<a href="question.php?action=edit&id=<?php echo $one['id']; ?>">编辑</a>
							<a href="javascript: if(confirm('确认删除？')) window.location.href = 'question.php?action=del&id=<?php echo $one['id']; ?>'">删除</a>
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
