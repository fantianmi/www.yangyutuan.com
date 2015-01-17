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






<body mon="position=order_list_local" id="orders">

<?php include template("m_header");?>

             <menu>
      <ul>
       <li gaevent="InnerLink|Click|touch/orders/list/paid" ><a href="myorder.php">订单</a></li><!--
                    --><li gaevent="InnerLink|Click|touch/orders/list/unpaid"  ><a href="mycoupon.php">团购卷</a></li><!--
                    -->
     </ul>
            </menu>
            
         

<h2>团购项目</h2>
<li style="color:#F00">订单状态：交易成功</li>

<li>项目名称：  <?php $partner_id = $team['partner_id'];$partner = Table::Fetch('partner',$partner_id);; ?>
                <a href="#"><?php echo $partner['title']; ?><?php echo mb_strimwidth($team['team_jybt'],0, 34,'...'); ?></a></li>
<li>订单编号：<?php echo $order['id']; ?></li>
<li>下单时间：<?php echo date('Y-m-d H:i:s',$order['create_time']); ?></li>
<li>付款时间：<?php echo date('Y-m-d H:i:s', $order['pay_time']); ?></li>

<h2>订单信息</h2>
<li>项目单价：<?php echo moneyit($order['price']); ?></li>
<li>购买数量：<?php echo $order['quantity']; ?></li>
<li>代金券抵：<?php echo moneyit($order['card']); ?></li>
<li>快递费用：<?php echo $express?moneyit($team['fare']):0; ?></li>
<li>总计费用：<?php echo moneyit($order['origin']); ?></li>

<h2><?php echo $INI['system']['couponname']; ?> (共<?php echo count($coupons); ?>张)</h2>

<?php if($team['delivery']=='coupon'){?>
<table cellspacing="0" cellpadding="0" border="0" class="data-table">
    <tr>
      <td align="right">      <?php if(empty($coupons)){?><?php echo $INI['system']['couponname']; ?>将在团购成功后，由系统自动发放<?php }?><?php if(is_array($coupons)){foreach($coupons AS $one) { ?><li><?php echo $one['id']; ?> - <?php echo $one['secret']; ?></li><?php }}?>    </tr>
    <tr>
      <td align="right">       </tr>
</table>
<?php } else if($team['delivery']=='express') { ?>
<table cellspacing="0" cellpadding="0" border="0" class="data-table">
    <tr>
        <td align="right">快递：</td>
	<?php if($order['express_id']){?>
        <td><?php echo $option_express[$order['express_id']]; ?>：<?php echo $order['express_no']; ?></td>
	<?php } else { ?>
        <td class="other-coupon">请耐心等待发货</td>
	<?php }?>
    </tr>
    <tr>
        <td align="right">收件人：</td>
        <td><?php echo $order['realname']; ?></td>
    </tr>
    <tr>
        <td align="right">收件地址：</td>
        <td><?php echo $order['address']; ?></td>
    </tr>
    <tr>
        <td align="right">手机号码：</td>
        <td><?php echo $order['mobile']; ?></td>
    </tr>
</table>
<?php } else if($team['delivery']=='pickup') { ?>

<?php }?>

<?php include template("m_footer");?>
</body>

</html>
