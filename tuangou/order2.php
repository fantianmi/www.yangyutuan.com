<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pay Page</title>
</head>
<body>
<form action="<?php echo $_REQUEST['URL'] ?>" method="post" name="orderForm">
	<input type="hidden" name="version"  value="<?php echo $_REQUEST['version'] ?>"> 	
	<input type="hidden" name="serialID"  value="<?php echo $_REQUEST['serialID'] ?>">
	<input type="hidden" name="submitTime"  value="<?php echo $_REQUEST['submitTime'] ?>">
	<input type="hidden" name="failureTime"  value="<?php echo $_REQUEST['failureTime'] ?>">
	<input type="hidden" name="customerIP"  value="<?php echo $_REQUEST['customerIP'] ?>">
	<input type="hidden" name="orderDetails"  value="<?php echo $_REQUEST['orderDetails'] ?>">
	<input type="hidden" name="totalAmount"  value="<?php echo $_REQUEST['totalAmount'] ?>">
	<input type="hidden" name="type"  value="<?php echo $_REQUEST['type'] ?>">
	<input type="hidden" name="buyerMarked"  value="<?php echo $_REQUEST['buyerMarked'] ?>">
	<input type="hidden" name="payType"  value="<?php echo $_REQUEST['payType'] ?>">
	<input type="hidden" name="orgCode"  value="<?php echo $_REQUEST['orgCode'] ?>">
	<input type="hidden" name="currencyCode"  value="<?php echo $_REQUEST['currencyCode'] ?>">
	<input type="hidden" name="directFlag"  value="<?php echo $_REQUEST['directFlag'] ?>">
	<input type="hidden" name="borrowingMarked"  value="<?php echo $_REQUEST['borrowingMarked'] ?>">
	<input type="hidden" name="couponFlag"  value="<?php echo $_REQUEST['couponFlag'] ?>">
	<input type="hidden" name="platformID"  value="<?php echo $_REQUEST['platformID'] ?>">
	<input type="hidden" name="returnUrl"  value="<?php echo $_REQUEST['returnUrl'] ?>">
	<input type="hidden" name="noticeUrl"  value="<?php echo $_REQUEST['noticeUrl'] ?>">
	<input type="hidden" name="partnerID"  value="<?php echo $_REQUEST['partnerID'] ?>">
	<input type="hidden" name="remark"  value="<?php echo $_REQUEST['remark'] ?>">

	<?php 
		if($_REQUEST['charset'] == 1)
			$charset = "UTF8";
	?>


	<input type="hidden" name="charset"  value="<?php echo $_REQUEST['charset'] ?>">
	
	<?php
			$signType = $_REQUEST['signType'];
			$signMsg = $_REQUEST['signMsg'];

		
			if(2 == $signType)
			{
				$pkey = "30819f300d06092a864886f70d010101050003818d003081890281810099193fcf0b934f63b8279b50a012bf40c8ec9197400bbace92b04c674edd03496f330b30a7185cee12bc7e8f9a079ac263e64f63591b09f2479b46928a719f1a053f215393db54a344dc833d8e4789064e7c4c3a99c79a8faec33203f586ece2976b78eb9500600bcd7d8d114904b692d31b87732d287f04d5afdde5040252bf0203010001";

				$signMsg = $signMsg."&pkey=".$pkey;
				$signMsg =  md5($signMsg);
			}
	

	?>

	<input type="hidden" name="signType"  value="<?php echo $signType ?>">
	<input type="hidden" name="signMsg"   value="<?php echo $signMsg ?>">

</form>

<script type="text/javascript">

  document.orderForm.submit();

</script>
</body>
</html>