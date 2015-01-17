
<form id="order-pay-form" method="post" action="cmpay/cmpay.php" sid="<?php echo $order_id; ?>" target="_blank" >
    <input type="hidden" name="orderId" value="<?php echo $orderId; ?>" />
	<input type="hidden" name="channelType" value="<?php echo $channelType; ?>" />
	<input type="hidden" name="amount" value="<?php echo $amount; ?>" />
	<input type="hidden" name="currency" value="<?php echo $currency; ?>" />
	<input type="hidden" name="productName" value="<?php echo $productName; ?>" />
	<input type="hidden" name="productDesc" value="<?php echo $productDesc; ?>" />
	<input type="hidden" name="productId" value="<?php echo $productId; ?>" />

	<img src="/static/css/i/cmpay.jpg" /><br />
	<input type="submit" class="formbutton gotopay" value="前往手机支付付款" />
</form>
