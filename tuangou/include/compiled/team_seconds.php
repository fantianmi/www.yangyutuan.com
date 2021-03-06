<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="ZH-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="edge" />

<?php include template("meta_and_title");?>

<link rel="icon" href="favicon.ico" type="/image/x-icon" />
<link rel="shortcut icon" href="favicon.ico" type="/image/x-icon" />
<link href="/static/0750/css/style.css" rel="stylesheet" type="text/css" />
<link href="/static/0750/css/list.css" rel="stylesheet" type="text/css" />
<link href="/static/0750/css/custom.css" rel="stylesheet" type="text/css" />
<link href="/static/0750/css/near.css" rel="stylesheet" type="text/css" />
<link href="/static/0750/css/og.css" rel="stylesheet" type="text/css" />
<link href="/static/0750/css/page.css" rel="stylesheet" type="text/css" />
<link href="/static/0750/css/supplier.css" rel="stylesheet" type="text/css" />
<link href="/static/0750/css/member.css" rel="stylesheet" type="text/css" />
<link href="/static/0750/css/poptips.css" rel="stylesheet" type="text/css" />
<link href="/static/0750/css/hack.css" rel="stylesheet" type="text/css" />
<script src="/static/0750/js/j.js" type="text/javascript"></script>
<script src="/static/0750/js/jquery.jcookie.min.js" type="text/javascript"></script>
<script src="/static/0750/js/history.js" type="text/javascript"></script>
<script src="/static/0750/js/js_lang.js" type="text/javascript"></script>
<script language="JavaScript">
<!--
//指定当前组模块URL地址
var CND_URL = '#';
var HTTP_URL = '#';
var ROOT_PATH = '';
var PUBLIC = 'app/Tpl/0750/Public';
var VAR_MODULE = 'm';
var VAR_ACTION = 'a';
var FANWE_LANG_ID = '1';
var cityID = '25';

//-->
</script>
</head>

<body>

<?php include template("head_ctn");?>

<script type="text/javascript">
$('.ptl .choose a').hover(function(){
	$('.ptl .tl').show();
},function(){});
$('.ptl').hover(function(){},
    function(){
        $('.ptl .tl').hide();
    });
</script>

<div style="height:15px; width:1100px; overflow:hidden;">

</div>
<script type="text/javascript">
$('a input.c').click(function(){
	$('.pricelaw').show();
});
$("a input#min_price").blur(function(){
    var max_price = parseFloat($("a input#max_price").val());
    var min_price = parseFloat($(this).val());
    if(max_price > 0 && min_price > 0 && min_price > max_price)
    {
        $("a input#max_price").val(min_price);
        $(this).val(max_price);
    }
});
$("a input#max_price").blur(function(){
    var min_price = parseFloat($("a input#min_price").val());
    var max_price = parseFloat($(this).val());
    if(max_price > 0 && min_price > 0 && min_price > max_price)
    {
        $("a input#min_price").val(max_price);
        $(this).val(min_price);
    }
});
$('.pricelaw input').click(function(){
    var price_url = "category.php?gid=<?php echo $gid; ?>&sid=<?php echo $sid; ?>&aid=<?php echo $aid; ?>";
    var price_url_p = "";
    var min_price = parseFloat($("a input#min_price").val());
    var max_price = parseFloat($("a input#max_price").val());
    if(min_price > 0)
        price_url_p += "&min_price="+min_price;
    if(max_price > 0)
        price_url_p += "&max_price="+max_price;
	$('.pricelaw').hide();
    if(min_price > 0 || max_price > 0)
        window.location.href = price_url + price_url_p;
    else
    {
        $("a input#min_price").val('');
        $("a input#max_price").val('');
        window.location.href = price_url;
    }
});
$(document).ready(function(){
if('undefined' == typeof(document.body.style.maxHeight)){
}else{
	$("#contorl").scrollFix("top","top");
  }
});
</script><div class="content" style="border-top:none;">
     <div class="panel p1" id="container">
     
     
     
<?php if(is_array($teams)){foreach($teams AS $tindex=>$one) { ?>       
     
  <div class="block <?php if($tindex%3 == 2){?>nomarginright<?php }?>">
  <div class="blockinside">
   <div class="picture">
     <!-- 如果是特卖则显示 -->
              <a href="/team.php?id=<?php echo $one['id']; ?>" target="_blank">
               <img class="lazy" src="<?php echo team_image($one['image']); ?>" data-original="<?php echo team_image($one['image']); ?>" width="248" height="158">
    </a>
   </div>
   <div class="title"><a href="/team.php?id=<?php echo $one['id']; ?>" class="supplierName" target="_blank"><em title="商家地址：&#13;&#10;（江门店）跃进路长乐里28号"><?php echo get_area_name($one['area_id']); ?></em><span><?php echo get_partner_name($one['partner_id']); ?></span></a>
   <a href="/team.php?id=<?php echo $one['id']; ?>" target="_blank" title="<?php echo $one['title']; ?>"><span><?php echo $one['title']; ?></span></a>
   </div>
   <div class="price">
    <span class="fee">
     <span class="symbol">￥</span>
     <span class="bf"><?php echo $one['team_price']; ?></span>
    </span>
    <span class="sale">
     <span class="discount"><?php echo team_discount($one); ?>折</span>
     <span class="exfee"><?php echo $currency; ?><?php echo moneyit($one['market_price']); ?></span>
    </span>
    <span class="buyer">
     <b><?php echo $one['now_number']; ?></b>人已购买
    </span>
   </div>
   </div>
   <div class="blocktips">
    <div class="tri tl"></div>
    <div class="td1">
     <i class="it">官方服务承诺</i>
     
      <?php if($one['allowrefund'] == 'Y'){?>
        <i class="i1" title="该团购支持退款">支持退款</i>
      <?php }?>
       
        <?php if($one['credit'] > 0){?>
        <i class="i6" title="购买本团购可以免费获赠0750团购网积分">消费送积分</i>
       <?php }?>
     <?php if($one['allowrefund'] == 'Y'){?>
          <i class="i7" title="  本团无需提前预约，购买即可到店消费">无需预约</i> 
      <?php } else { ?>
         <i class="i7 un" title="本团需要提前预约">需要提前预约</i> 
      <?php }?>
       <?php if($one['weekend'] == 'Y'){?>
     <i class="i8" title="本团周六日通用">周末通用</i>
     <?php }?>
     <?php if($one['loliday'] == 'Y'){?>
     <i class="i9" title="本团在节假日可使用">节假日可使用</i> 
     <?php }?>
     
     <i class="it mark orange">
      <em>团购评分</em>
      <em class="star"><i style="width:<?php echo $one['score']*20; ?>%;"><img src="/static/0750/images/stars.gif" height="12" width="66"></i></em>
      <em><?php echo $one['score']; ?></em>
     </i>
    </div>
    <div class="td2">
     有<b class="red click_count" data-goods_id="7494" data-is_loaded="true" data-up_time="1404717264"><?php echo rand(1,15); ?></b>人正在看此团购
    </div>
   </div>
  </div>
 <?php }}?> 
  
  
  




   </div>
<div class="pageturning">

<?php echo $pagestring; ?>
</div></div>


<?php include template("foot_ctn");?>




<script src="/static/0750/js/owr.js" type="text/javascript"></script>
<script src="/static/0750/js/ie6.js" type="text/javascript"></script><script src="/static/0750/js/js.js" type="text/javascript"></script>
<script src="/static/0750/js/scroll.js" type="text/javascript"></script>
<script src="/static/0750/js/scrollFix.js" type="text/javascript"></script>
<script src="/static/0750/js/scrollStu.js" type="text/javascript"></script>
<script src="/static/0750/js/common.js" type="text/javascript"></script>
<link href="/static/0750/css/birthday.css" rel="stylesheet" type="text/css" />

</body>
</html>