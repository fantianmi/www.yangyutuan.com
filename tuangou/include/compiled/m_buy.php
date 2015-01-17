<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8"><meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">

<title>百度洋芋团-提交订单</title>

<link rel="stylesheet" type="text/css" href="style/list_css_0_6f15796.css">

<link rel="stylesheet" type="text/css" href="style/order_css_0_ef5d9bb.css">
<link rel="stylesheet" type="text/css" href="style/common_css_0_6c6ef1d.css">

<script>alog('speed.set', 'ht',new Date);</script>

</head>








<body mon="position=pay_submission">

<?php include template("m_header");?>

<?php $notice = Session::Get('notice', true); ?>
<?php if($notice){?>
<header style="background:#00FFCC" class="w-header" mon="type=header" style="margin-top:5px;">
<div class="text" id="okMsg" ><?php echo $notice; ?></div>
</header>
<?php }?>
<?php $error = Session::Get('error', true); ?>
<?php if($error){?>
<header style="background:#000" class="w-header" mon="type=header" style="margin-top:5px;">
<div class="text" id="okMsg" ><?php echo $error; ?></div>
</header>
<?php }?>










<form class="p-submission" id="j-order-form-refresh" method="post" action="buy.php?id=<?php echo $team['id']; ?>">
<input type="hidden" name="id" value="<?php echo $team['id']; ?>" />
<section class="order-info">
<ul>

<li class="order-title">
<div class="short-title"><?php echo $partner['title']; ?><?php echo mb_strimwidth($team['team_jybt'],0, 20,'...'); ?></div>
<div class="sub-title"></div>
</li>

<li class="order-common-item">
<dt>单价</dt>
<dd><?php echo $currency; ?><?php echo moneyit($team['team_price']); ?></dd>
</li>





<div class="no-combo">
<li class="j-product-number order-number" data-buylimit="50">
<div class="product-number-changed">
<span id="jian" class="j-linkage order-btn minus minus-disabled"></span>

<input class="j-number" id="quantity" type="text" name="quantity" value="1" <?php echo $team['per_number']==1 ? 'readonly':''; ?> />

<span id="jia" class="j-linkage order-btn plus plus-active"></span>
</div>
<div class="deal-options-title">数量</div>
</li>
</div>


<section class="w-public-phone">


 <?php if($team['delivery']=='express'){?>
           
               <li class="order-common-item">
                <dt>配送信息</dt>
                <dd></dd>
                </li>
                
                
                
                   <li class="order-common-item">
                <dt>收件人</dt>
                <dd><input type="text" name="realname" id="settings-realname" class="f-input" value="<?php echo $def['0']['name']; ?>" /></dd>
                </li>
                
                  <li class="order-common-item">
                <dt>手机号</dt>
                <dd><input type="text" name="mobile" id="settings-mobile" class="number" value="<?php echo $def['0']['mobile']; ?>" maxLength="11" style="width:85px; min-width:85px;" /></dd>
                </li>
                
                
                  <li class="order-common-item">
                <dt>收件地址</dt>
                <dd><input type="text" name="address" id="settings-address" class="f-input" value="<?php echo $def['0']['province']; ?><?php echo $def['0']['area']; ?><?php echo $def['0']['city']; ?><?php echo $def['0']['street']; ?>"/></dd>
                </li>
                
                
                 <!-- <li class="order-common-item">
                <dt>支付方式</dt>
                <dd>
				      <input type="radio"  checked="checked"  name="service" value="alipay" >在线支付
                        <input type="radio" name="service" value="hdfk" >货到付款
				</dd>
                </li>-->
                
                
                  <li class="order-common-item">
                <dt>邮编</dt>
                <dd></dd>
                </li>
                
                  <li class="order-common-item">
                <dt>送货时间</dt>
                <dd> <input type="text" name="express_xx" id="settings-address" class="f-input" value=""/></dd>
                </li>
                
 

   <?php } else { ?> 



<li class="order-common-item">
<dt>手机</dt>
<dd><input type="text" size="30" name="mobile" id="settings-mobile" class="number" value="<?php echo $login_user['mobile']; ?>" require="true" datatype="mobile" maxLength="11" style="width:85px; min-width:120px;" /></dd>
</li>


 <?php }?>

</section>




<li class="order-common-title">
<dt>消费提醒</dt>
</li>

<li class="order-consume-tip">
<a href="#"><span>随便退</span>（诚信担保，未消费，随便退）</a>
</li>

<li class="order-button">

<input type="hidden" name="id" value="<?php echo $order['id']; ?>" />
<input type="submit" class="order-common-button btn-submit j-order-submit" name="buy" value="提交订单"/>

</li>

</ul>
</section>
</form>

<?php include template("m_footer");?>

</body></html>

<script type="text/javascript">
     document.getElementById("jia").onclick = function(){
	      document.getElementById("quantity").value++;
	 }
	 
	  document.getElementById("jian").onclick = function(){
		   if(document.getElementById("quantity").value > 1){
	          document.getElementById("quantity").value--;
		   }
	 }

</script>
