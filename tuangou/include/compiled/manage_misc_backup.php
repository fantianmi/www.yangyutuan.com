<?php include template("manage_header");?>

<div id="bdw" class="bdw">
<?php include template("manage_left_menu");?>
<div class="right_main">
<div id="bd" class="cf">
<div id="coupons">
	<div class="dashboard" id="dashboard">
		<ul><?php echo mcurrent_misc('backup'); ?></ul>
	</div>
    <div id="content" class="coupons-box clear mainwide">
		<div class="box clear">
            
            <div class="box-content">
                <div class="head">
                    <h2>数据库备份</h2>
                    <ul class="filter">
						<li class="label">分类: </li>
						<?php echo mcurrent_misc_backup('backup'); ?>
					</ul>
				</div>
                <div class="sect">

<form method="post">
<table width="96%" border="0" align="center" class="coupons-table">
    <tr><td width="510px">备份方式：</td><td rowspan="11" valign="top" style="padding-left:20px"><font color="red"><b>提示信息：</b></font><br/>服务器备份目录为 include/data<br/>对于较大的数据表，强烈建议使用分卷备份<br/>只有选择备份到服务器，才能使用分卷备份功能</td></tr>
    <tr><td width="510px"><input type="radio" name="bfzl" value="quanbubiao" checked>备份全部数据<span class="gray">备份全部数据表中的数据到一个备份文件</span></td></tr>
    <tr><td width="510px"><input type="radio" name="bfzl" value="danbiao">备份单张表数据&nbsp;<select name="tablename"><?php echo Utility::Option($option_table, null, '请选择数据表'); ?></select>&nbsp;&nbsp;<span class="gray">备份单独的数据表到备份文件</span></td></tr>
    <tr><td width="510px"><hr style="border:1px dashed; height:1px" color="#DDDDDD"></td></tr>
    <tr><td width="510px">使用分卷备份：</td></tr>
    <tr><td width="510px"><input type="checkbox" name="fenjuan" value="yes">分卷备份 <input name="filesize" type="text" value="512" size="10"> K</td></tr>
    <tr><td width="510px"><hr style="border:1px dashed; height:1px" color="#DDDDDD"></td></tr>
    <tr><td width="510px">选择目标位置：</td></tr>
    <tr><td width="510px"><input type="radio" name="weizhi" value="server" checked>备份到服务器</td></tr><tr class="cells">
    <td width="510px"> <input type="radio" name="weizhi" value="localpc">备份到本地</td></tr>
    <tr><td align='left' width="510px"><input type="hidden" name="action" value="back"><input type="submit" class="formbutton"d="orders-list" value="备 份"></td></tr>
</table>
</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div> <!-- bd end -->
</div>
</div> <!-- bdw end -->
<?php include template("manage_footer");?>
