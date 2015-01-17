<?php include template("manage_header");?>

<div id="bdw" class="bdw">
<?php include template("manage_left_menu");?>
<div class="right_main">
<div id="bd" class="cf">
<div id="coupons">
	<div class="dashboard" id="dashboard">
		<ul></ul>
	</div>
    <div id="content" class="coupons-box clear mainwide">
		<div class="box clear">
            
            <div class="box-content">
                <div class="head">
                    <h2>全部分类</h2>
                    <ul class="filter">
						<li><a href="/ajax/manage.php?action=mtypeedit" class="ajaxlink">新建分类</a></li>
					</ul>
				</div>
                <div class="sect">
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
					<tr><th width="40">ID</th><th width="500">名称</th><th width="140">操作</th></tr>
					<?php if(is_array($mtypes)){foreach($mtypes AS $index=>$one) { ?>
					<tr <?php echo $index%2?'':'class="alt"'; ?> id="team-list-id-<?php echo $one['id']; ?>">
						<td><?php echo $one['id']; ?></a></td>
						<td>
							<?php echo $one['name']; ?>
						</td>
						<td class="op" nowrap><a href="/ajax/manage.php?action=mtypeedit&id=<?php echo $one['id']; ?>" class="ajaxlink">编辑</a>｜<a href="/ajax/manage.php?action=mtyperemove&id=<?php echo $one['id']; ?>" class="ajaxlink" ask="确定删除这个分类吗？" >删除</a></td>
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
