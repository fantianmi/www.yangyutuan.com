<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
<title>商户详情</title>
<style type="text/css">
.Partner {
	width: 95%;
	margin-right: auto;
	margin-left: auto;
	border: 1px solid #CCC;
	padding: 0px;
	font-size: 14px;
	background-color: #FFF;
}
.Partner ul {
	margin: 0px;
	padding: 0px;
}
.Partner ul li {
	margin: 0px;
	list-style-image: none;
	list-style-type: none;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #CCC;
	padding: 8px;
	display: block;
}
.Partner ul li span {
	float: left;
	background-color: #999;
}
a:link {
	color: #000;
	text-decoration: none;
}
a:visited {
	color: #000;
	text-decoration: none;
}
h3 {
	width: 95%;
	padding-top: 8px;
	padding-bottom: 10px;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	font-family: Arial, Helvetica, sans-serif;
}
</style>
</head>
<body style="background:#eee">


<h3><?php echo ($title); ?></h3>
 
 
 


<div class="Partner">
<ul>        
<?php
if (trim($address)) { echo "<li>$address</li>"; } if (trim($yysj)) { echo "<li>$yysj</li>"; } if (trim($phone)) { echo "<li>$phone</li>"; } if (trim($jtxl)) { echo "<li>$jtxl</li>"; } if (trim($location)) { echo "<li>$location</li>"; } ?>           
</ul>
</div>

</body>
</html>