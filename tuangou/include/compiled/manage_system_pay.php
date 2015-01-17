<?php include template("manage_header");?>

<?php include template("manage_left_menu");?>

<script language="javascript">
	function changealitype(type){
		if(type == 'Y'){
			$("#alichange").replaceWith("<span class='inputtip' id='alichange'><a href='https://b.alipay.com/order/pidKey.htm?pid=2088401958539222&product=escrow' target='_bacnk'><font color='red'>获取PID,KEY</font></a> </span>");
		}
		else if(type=='N'){
			$("#alichange").replaceWith("<span class='inputtip' id='alichange'><a href='https://b.alipay.com/order/pidKey.htm?pid=2088401958539222&product=fastpay' target='_bacnk'><font color='red'>获取PID,KEY</font></a> </span>");
		}
		else if(type=='S'){
			$("#alichange").replaceWith("<span class='inputtip' id='alichange'><a href='https://b.alipay.com/order/pidKey.htm?pid=2088401958539222&product=dualpay' target='_bacnk'><font color='red'>获取PID,KEY</font></a> </span>");
		}	
	}

</script>


<?php include template("manage_footer");?>
