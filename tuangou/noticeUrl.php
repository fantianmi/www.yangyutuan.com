<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pay Page</title>
</head>
<body>
<form name="noticeUrlHdlForm">

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
		require_once(dirname(__FILE__) . '/app.php');
	   	 if($ret2 == 1){
	    	mysql_query("update `order` set state='pay' where pay_id='{$orderID}'");
	    	}

			//记录接收到的参数到服务器本地文件
	    @$fp = fopen("noticeLog.txt","w");
	    
	    if(!$fp){
	        echo "system error";
	        exit();
	    }else {
	        $fileData = "orderID：".$_REQUEST['orderID']."\r\n";
	        fwrite($fp,$fileData);
	        $fileData = "resultCode：".$_REQUEST['resultCode']."\r\n";
	        fwrite($fp,$fileData);
	        $fileData = "stateCode：".$_REQUEST['stateCode']."\r\n";
	        fwrite($fp,$fileData);
	        $fileData = "orderAmount：".$_REQUEST['orderAmount']."\r\n";
	        fwrite($fp,$fileData);
	        $fileData = "payAmount：".$_REQUEST['payAmount']."\r\n";
	        fwrite($fp,$fileData);
	        $fileData = "acquiringTime：".$_REQUEST['acquiringTime']."\r\n";
	        fwrite($fp,$fileData);
	        $fileData = "completeTime：".$_REQUEST['completeTime']."\r\n";
	        fwrite($fp,$fileData);
	        $fileData = "orderNo：".$_REQUEST['orderNo']."\r\n";
	        fwrite($fp,$fileData);
	        $fileData = "partnerID：".$_REQUEST['partnerID']."\r\n";
	        fwrite($fp,$fileData);
	        $fileData = "remark：".$_REQUEST['remark']."\r\n";
	        fwrite($fp,$fileData);
	        $fileData = "charset：".$_REQUEST['charset']."\r\n";
	        fwrite($fp,$fileData);
	        $fileData = "signType：".$_REQUEST['signType']."\r\n";
	        fwrite($fp,$fileData);
	        $fileData = "signMsg：".$_REQUEST['signMsg']."\r\n";
	        fwrite($fp,$fileData);
	        $fileData = "验签结果：".(1 == $ret2 ? "验签成功。" : "验签失败！");
	        fwrite($fp,$fileData);	        
	        fclose($fp);
	    }
	    
	    //商户进行必要的后续处理： 如果"验签成功"（即 $ret2的值为1），则进一步处理商户对应的业务逻辑（要注意并发控制，并避免在接收前台通知时重复处理）； 如果"验签失败"，商户检查原因，或者与新生支付支持人员联系。

			
	?>
	
</form>

</body>
</html>
