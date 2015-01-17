<?php include template("manage_header");?>

<div id="bdw" class="bdw">
     <?php include template("manage_left_menu");?>
    <div class="right_main">
<div id="bd" class="cf">
<div id="coupons">

    <div id="content" class="coupons-box clear mainwide">
		<div class="box clear">
            <div class="box-content">
                <div class="head">
                    <h2>电影管理</h2>
					<ul class="filter">
						<li><?php echo !$movie_status ? '全部' : '<a href="?">全部</a>'; ?></li>
						<li><?php echo $movie_status==1 ? '即将上映' : '<a href="?movie_status=1">即将上映</a>'; ?></li>
						<li><?php echo $movie_status==2 ? '上映中' : '<a href="?movie_status=2">上映中</a>'; ?></li>
						<li><?php echo $movie_status==3 ? '已结束' : '<a href="?movie_status=3">已结束</a>'; ?></li>
					</ul>
				</div>
				<div class="sect" style="padding:0 10px;">
					<form method="get">
					<p style="margin:5px 0;">项目编号：<input type="text" name="movie_id" class="h-input number" value="<?php echo $movie_id; ?>" >&nbsp;&nbsp;关键字：<input type="text" name="team_key" class="h-input text" value="<?php echo $movie_key; ?>" >&nbsp;&nbsp;<input type="submit" value="筛选" class="formbutton"  style="padding:1px 6px;"/></p>
					<form>
				</div>
                <div class="sect">
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
					<tr><th width="40">ID</th><th width="400">项目名称</th><th width="80" nowrap>类别</th><th width="140">操作</th></tr>
					<?php if(is_array($movies)){foreach($movies AS $index=>$one) { ?>
					<?php $oldstatus = $one['status']; ?>
					<tr <?php echo $index%2?'':'class="alt"'; ?> id="team-list-id-<?php echo $one['id']; ?>">
						<td><?php echo $one['id']; ?></a></td>
						<td>
							<?php echo $one['status']==1 ? '[即将上映]' : ''; ?>
							<?php echo $one['status']==2 ? '[上映中]' : ''; ?>
							<?php echo $one['status']==3 ? '[已结束]' : ''; ?>
							<a class="deal-title" href="/team.php?id=<?php echo $one['id']; ?>" target="_blank"><?php echo $one['name']; ?></a>
						</td>
						<td nowrap><?php echo $mtypes[$one['mtype']]['name']; ?></td>
						<td class="op" nowrap><a href="/manage/movie/edit.php?id=<?php echo $one['id']; ?>">编辑</a>｜<a href="/ajax/manage.php?action=movieremove&id=<?php echo $one['id']; ?>" class="ajaxlink" ask="确定删除本电影？" >删除</a></td>
					</tr>
					<?php }}?>
					<tr><td colspan="7"><?php echo $pagestring; ?></tr>
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
