<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title></title>
</head>
<body>
	<form action="<?php echo ($url); ?>" method="post" name="orderForm">
		<input type="text" name="service" value="<?php echo ($service); ?>" /><br />
		<input type="text" name="partnerId" value="<?php echo ($partnerId); ?>" /><br />
		<input type="text" name="orderNo" value="<?php echo ($orderNo); ?>" /><br />
		<input type="text" name="sellerUserId" value="<?php echo ($sellerUserId); ?>" /><br />
		<input type="text" name="tradeAmount" value="<?php echo ($tradeAmount); ?>" /><br />
		<input type="text" name="partnerUserId" value="<?php echo ($partnerUserId); ?>" /><br />
		<input type="text" name="sign" value="<?php echo ($sign); ?>" /><br />
		<input type="text" name="signType" value="<?php echo ($signType); ?>" /><br />
		<input type="text" name="notifyUrl" value="<?php echo ($notifyUrl); ?>" /><br />
		<input type="text" name="returnUrl" value="<?php echo ($returnUrl); ?>" /><br />
		<input type="text" name="tradeName" value="<?php echo ($tradeName); ?>" /><br />
		<input type="text" name="protocol" value="<?php echo ($protocol); ?>" /><br />

		<input type="submit" value="提交" />
	</form>

<script type="text/javascript">

  document.orderForm.submit();

</script>
</body>
</html>