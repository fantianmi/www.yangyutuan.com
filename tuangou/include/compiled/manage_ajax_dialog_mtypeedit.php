<div id="order-pay-dialog" class="order-pay-dialog-c" style="width:380px;">
	<h3><span id="order-pay-dialog-close" class="close" onclick="return X.boxClose();">关闭</span>编辑分类</h3>
	<div style="overflow-x:hidden;padding:10px;">
<form method="post" action="/manage/mtype/edit.php" class="validator">
	<input type="hidden" name="id" value="<?php echo $mtype['id']; ?>" />
	<table width="96%" class="coupons-table">
		<tr><td width="80" nowrap><b>名称：</b></td><td><input type="text" name="name" value="<?php echo $mtype['name']; ?>" require="true" datatype="require" class="f-input" /></td></tr>
		<tr><td colspan="2" height="10">&nbsp;</td></tr>
		<tr><td></td><td><input type="submit" value="确定" class="formbutton" /></td></tr>
	</table>
</form>
	</div>
</div>
