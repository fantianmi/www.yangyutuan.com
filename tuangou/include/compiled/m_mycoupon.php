<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8"><meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">

<script src="style/jquery-1.9.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="style/common_css_0_6c6ef1d.css">
<link rel="stylesheet" type="text/css" href="style/user_css_0_8975013.css">
<link rel="stylesheet" type="text/css" href="style/common_css_1_ad94b5d.css">
<link rel="stylesheet" type="text/css" href="style/list_css_0_6f15796.css">
</head>






<body mon="position=order_list_local">

<?php include template("m_header");?>


<article class="p-order_list_local">


<div class="w-tabs">
<span data-href="mycoupon.php"><a href="mycoupon.php">未消费</a></span>
<span data-href="myorder.php"><a href="myorder.php">已付款</a></span>
<span data-href="mycoupon.php?s=consumed"><a href="mycoupon.php?s=consumed">已消费</a></span>
</div>

<div id="j-goods-container" mon="action=click&amp;type=orderlist">




 <?php if(is_array($coupons)){foreach($coupons AS $index=>$one) { ?>
<section class="w-goods " mon="action=click&amp;type=item">
 <a href="#" mon="query=&amp;page_catg=0&amp;nuomi_order=0&amp;content=item0&amp;dealTinyUrl=swdbwplc&amp;deal_id=964894&amp;nuomi_index=0&amp;pageindex=0" class="clearfix" name="0" id="0">
 <div class="img-wrapper">
 <span class="tag-free-reservation"></span>
 <img style="visibility: visible;" src="<?php echo $INI['system']['imgprefix']; ?>/static/<?php echo $teams[$one['team_id']]['image']; ?>" height="79" width="118">
 </div>
 <ul>
 <li class="title"><span class="store "></span>
 <span class="item-name"><?php echo $teams[$one['team_id']]['team_jybt']; ?></span>
 </li>
 <li class="info">明团券编号:<?php echo $one['id']; ?></li>
 <li class="others">有效日期:<?php echo date('Y-m-d', $one['expire_time']); ?>
 </li>
 </ul>
 </a>
 </section>

<?php }}?>


<?php include template("m_footer");?>


</body></html>
