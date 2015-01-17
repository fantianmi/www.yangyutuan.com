<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pay Page</title>
</head>
<body>
<form name="receiveNotificationForm">

	<?php 
			$orderID = $_REQUEST["orderID"];
			$resultCode = $_REQUEST["resultCode"];
			$stateCode = $_REQUEST["stateCode"];
			$orderAmount = $_REQUEST["orderAmount"];
			$payAmount = $_REQUEST["payAmount"];
			$acquiringTime = $_REQUEST["acquiringTime"];
			$completeTime = $_REQUEST["completeTime"];
			$orderNo = $_REQUEST["orderNo"];
			$partnerID = $_REQUEST["partnerID"];
			$remark = $_REQUEST["remark"];
			$charset = $_REQUEST["charset"];
			$signType = $_REQUEST["signType"];
			$signMsg = $_REQUEST["signMsg"];
			$src = "orderID=".$orderID."&resultCode=".$resultCode."&stateCode=".$stateCode."&orderAmount=".$orderAmount."&payAmount=".$payAmount."&acquiringTime=".$acquiringTime."&completeTime=".$completeTime."&orderNo=".$orderNo."&partnerID=".$partnerID."&remark=".$remark."&charset=".$charset."&signType=".$signType;

			if($_REQUEST["charset"] == 1)
				$charset = "UTF8";

			if(2 == $signType) //md5验签
			{
				$pkey = "30819f300d06092a864886f70d010101050003818d003081890281810099193fcf0b934f63b8279b50a012bf40c8ec9197400bbace92b04c674edd03496f330b30a7185cee12bc7e8f9a079ac263e64f63591b09f2479b46928a719f1a053f215393db54a344dc833d8e4789064e7c4c3a99c79a8faec33203f586ece2976b78eb9500600bcd7d8d114904b692d31b87732d287f04d5afdde5040252bf0203010001";
				$src = $src."&pkey=".$pkey;
				$ret2 = ($signMsg == md5($src));
			}

      //商户进行必要的后续处理： 如果"验签成功"（即 $ret2的值为1），则进一步处理商户对应的业务逻辑（要注意并发控制，并避免在接收后台通知时重复处理）； 如果"验签失败"，商户检查原因，或者与新生支付支持人员联系。
      
      
	?>

	<input type="hidden" id="result"  value="<?php echo $ret2?>">	

<?php
require_once(dirname(__FILE__) . '/app.php');

if($ret2 != '1'){
	die;
}
?>
<script type="text/javascript">
	window.location.href = "<?php echo '/order/pay.php?orderID='.$orderID; ?>";
	</script>

	<center>
			<h2>商户接收支付结果前台通知</h2>
			<table border="1" width="60%">
				<tr>
					<td width="15%" align="right">商户订单号：</td>
					<td align="left">
						<?php echo $_REQUEST['orderID'] ?>
					 </td>
				</tr>
				<tr>
					<td width="15%" align="right">处理结果码：</td>
					<td align="left">
						<?php echo $_REQUEST['resultCode'] ?>
					 </td>
				</tr>
				<tr>
					<td width="15%" align="right">状态码：</td>
					<td align="left">
						<?php echo $_REQUEST['stateCode'] ?>
					 </td>
				</tr>	
				<tr>
					<td width="15%" align="right">商户订单金额：</td>
					<td align="left">
						<?php echo $_REQUEST['orderAmount'] ?>
					 </td>
				</tr>
				<tr>
					<td width="15%" align="right">实际支付金额：</td>
					<td align="left">
						<?php echo $_REQUEST['payAmount'] ?>
					 </td>
				</tr>				
				<tr>
					<td width="15%" align="right">收单时间：</td>
					<td align="left">
						<?php echo $_REQUEST['acquiringTime'] ?>
					 </td>
				</tr>
				<tr>
					<td width="15%" align="right">处理完成时间：</td>
					<td align="left">
						<?php echo $_REQUEST['completeTime'] ?>
					 </td>
				</tr>				
				<tr>
					<td width="15%" align="right">支付流水号：</td>
					<td align="left">
						<?php echo $_REQUEST['orderNo'] ?>
					 </td>
				</tr>
				<tr>
					<td width="15%" align="right">商户ID：</td>
					<td align="left">
						<?php echo $_REQUEST['partnerID'] ?>
					 </td>
				</tr>							
				<tr>
					<td width="15%" align="right">扩展字段：</td>
					<td align="left">
						<?php echo $_REQUEST['remark'] ?>
					 </td>
				</tr>
				<tr>
					<td width="15%" align="right">编码方式：</td>
					<td align="left">
						<?php echo $_REQUEST['charset'] ?>
					 </td>
				</tr>						
				<tr>
					<td width="15%" align="right">签名类型：</td>
					<td align="left">
						<?php echo $_REQUEST['signType'] ?>
					 </td>
				</tr>
				<tr>
					<td width="15%" align="right">签名字符串：</td>
					<td align="left">
						<?php echo $_REQUEST['signMsg'] ?>
					 </td>
				</tr>			
				<tr>
					<td width="15%" align="right">验签结果：</td>
					<td align="left" style='color:<?php echo 1 == $ret2 ?  "blue" : "red" ?>;'>
					  <?php echo 1 == $ret2 ? "验签成功。" : "验签失败！" ?>
					</td>
				</tr>							
			</table>
	</center>		
	
</form>

</body>
</html>
