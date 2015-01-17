<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8"><meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">

<script src="style/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="style/common_css_0_6c6ef1d.css"><link rel="stylesheet" type="text/css" href="style/user_css_2_01d9c40.css"></head>
<link rel="stylesheet" type="text/css" href="style/list_css_0_6f15796.css">





<body mon="position=user_home">

<?php include template("m_header");?>


<article class="p-user-home" mon="action=click">
<div class="user-info-wrap">
<a class="user-info" href="#" mon="type=userinfo">
<div class="name"><?php echo $login_user['username']; ?></div>
<div class="remain-money">
帐号余额：<?php echo moneyit($login_user['money']); ?>元
</div>
</a>
</div>
<div class="phone-text phone-base">
绑定手机：<?php echo $login_user['mobile']; ?>
</div>

<div class="phone-text phone-base">
消费次数：<?php echo $consume_times; ?>次
</div>

<section class="list-links" mon="type=list">
<a class="local" href="mycoupon.php" mon="content=local">我的团购券</a>
<a class="logistic" href="myorder.php" mon="content=logistic">我的订单</a>
<a class="lottery" href="myflow.php" mon="content=lottery">收支记录</a>
</section>
</article>

<?php include template("m_footer");?>


</body></html>
<!--12068731930244764682053011-->