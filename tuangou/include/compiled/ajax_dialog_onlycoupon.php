<div id="order-pay-dialog" class="order-pay-dialog-c" style="width:380px;">
<h3><span id="order-pay-dialog-close" class="close" onclick="return X.boxClose();">关闭</span><?php echo $INI['system']['couponname']; ?>验证及消费登记</h3>
	<p class="info" id="coupon-dialog-display-id">请您输入<?php echo $INI['system']['couponname']; ?>编号<br/>进行操作</p>
	<p class="notice"><?php echo $INI['system']['couponname']; ?>编号：<input id="coupon-dialog-input-id" type="text" name="id" class="f-input" style="text-transform:uppercase;" maxLength="14" onkeyup="X.coupon.dialoginputkeyup(this);" /></p>
	<p class="act"><input id="coupon-dialog-query" class="formbutton" value="查询" name="query" type="submit" onclick="return X.coupon.dialogquery();"/>&nbsp;&nbsp;&nbsp;<input id="coupon-dialog-consume" name="consume" class="formbutton" value="消费" type="submit" onclick="X.onlycoupon.couponconsume();" ask="每张<?php echo $INI['system']['couponname']; ?>只能消费一次，确定消费吗？"/></p>
</div>

<script type="text/javascript">
X.onlycoupon = {};
X.onlycoupon.couponconsume = function() {
	var id = jQuery('#coupon-dialog-input-id').attr('value');
	if (id) { 
		var ask = jQuery('#coupon-dialog-consume').attr('ask');
		return confirm(ask) && !X.get(WEB_ROOT + '/ajax/coupon.php?action=consume&id='+encodeURIComponent(id)); 
	}
}
</script>
