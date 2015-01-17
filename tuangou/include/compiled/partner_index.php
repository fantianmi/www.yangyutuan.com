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
<div class="selector listpage">
      <div class="option">
  <ul class="listblock lb1">
   <li class="op o3">商家分类</li>
  </ul>
  <ul class="listblock lb2">
  
  <li><a href="/partner/index.php" class="<?php if(!$group_id){?>focus<?php }?>">全部分类</a>
<?php if(is_array($cat_partner)){foreach($cat_partner AS $index=>$one) { ?>
      <li><a href="/partner/index.php?gid=<?php echo $one['id']; ?>" class="<?php if($group_id == $one['id']){?>focus<?php }?>"><?php echo $one['name']; ?><span><?php echo $one['number']; ?></span></a></li>
 <?php }}?>      
      </ul>
 </div>
   <div class="line"></div>
   <div class="option">
  <ul class="listblock lb1">
   <li class="op o2">选择地区</li>
  </ul>
  <ul class="listblock lb2">
      <li><a href="/partner/index.php?gid=<?php echo $gid; ?>" class="<?php if(!$aid){?>focus<?php }?>">全部</a></li>
   <?php if(is_array($area)){foreach($area AS $index=>$one) { ?>
      <li><a href="/partner/index.php?gid=<?php echo $gid; ?>&aid=<?php echo $one['id']; ?>" class="<?php if($aid==$one['id']){?>focus<?php }?>"><?php echo $one['name']; ?><span><?php echo $one['number']; ?></span></a></li>
    <?php }}?>   
   
     </ul>
 </div>
  </div>
<div style="height:75px; width:1100px; overflow:visible;">
 <div class="listcontorl" id="contorl">
 
     <a href="/partner/index.php?gid=<?php echo $gid; ?>&aid=<?php echo $aid; ?>" class="<?php if(!$sc){?>active<?php }?>" title="按默认排序">默认</a>
  
    <a href="/partner/index.php?gid=<?php echo $gid; ?>&aid=<?php echo $aid; ?>&sc=sell" class="nor <?php if($sc == 'sell'){?>active<?php }?>" title="按销量由高到低排序"><span>销量</span><i></i></a>
    <a href="/partner/index.php?gid=<?php echo $gid; ?>&aid=<?php echo $aid; ?>&sc=new" class="nor <?php if($sc == 'new'){?>active<?php }?>" title="按发布时间由新到旧排序"><span>发布时间</span><i></i></a>
    <a href="/partner/index.php?gid=<?php echo $gid; ?>&aid=<?php echo $aid; ?>&sc=rate" class="nor addborder <?php if($sc == 'rate'){?>active<?php }?>" title="按好评率由高到低排序"><span>好评率</span><i></i></a>


   </div>
</div>
<div class="content detailpage dp supplierList" style="border-top:none;">
 <div class="panel p1 dl">
 
 
 
 <?php if(is_array($partners)){foreach($partners AS $index=>$one) { ?>
    <div class="loop__panel">
     <div class="panel borderTop">
      <div class="s_pic"><a href="/partner.php?id=<?php echo $one['id']; ?>" target="_blank"><img src="<?php echo team_image($one['image']); ?>" /></a></div>
      <div class="ss">
       <div class="s sn sm"><span><a href="/partner.php?id=<?php echo $one['id']; ?>" target="_blank"><?php echo $one['title']; ?></a></span><i class="num"><a href="#" target="_blank"><?php echo $one['comment_num']; ?>消费评价</a></i><i><img src="/static/0750/images/stars.gif" width="88" height="16" /><em style="width:<?php if($one['comment_num']>0){?><?php echo $one['reputation']; ?>%<?php } else { ?>100<?php }?>%;"></em></i></div>
       <div class="s sa sb"><span>地址：<?php echo mb_strimwidth($one['address'],0,33,'...','UTF-8'); ?> 电话：<?php echo $one['phone']; ?></span><i>最近<?php echo get_coupon_num($on['id']); ?>人到店消费</i></div>
       <div class="s st"><span class="floatleft">类别：<a href="#" target="_blank"><?php echo get_group_name($one['group_id']); ?></a><i></i></span><span class="floatright">
       <a href="/partner.php?id=<?php echo $one['id']; ?>" title="点击查看团购" target="_blank">有<?php echo get_team_num($one['id']); ?>个团购在线</a></span></div>
      </div>
     </div>
     </div>
  <?php }}?>   
     
     
       
    <div class="pageturning"><?php echo $pagestring; ?></div> </div>
    
    
    
 <div class="pd" style="float:left;">
  <div class="right">
            <div class="deal">
    <div class="title">今日新单</div>
    <div class="list">
    
     <?php if(is_array($teams_day)){foreach($teams_day AS $dindex=>$one) { ?> 
    
                <div class="box">
    <p><a href="/team.php?id=<?php echo $one['id']; ?>" title="<?php echo $one['title']; ?>" target="_blank"><img src="<?php echo team_image($one['image']); ?>" width="236" height="150" /></a></p>
    <p class="t"><a target="_blank" href="/team.php?id=<?php echo $one['id']; ?>" title="<?php echo $one['title']; ?>"><?php echo $one['title']; ?></a></p>
    <p class="price"><span class="floatleft"><b class="red">&yen;<?php echo $one['team_price']; ?></b> 原价<?php echo $currency; ?><?php echo moneyit($one['market_price']); ?></span><span class="floatright"><span class="orange"><?php echo $one['now_number']; ?></span>人团购</span></p>
    </div>
    
    <?php }}?>   
    
    
 
                </div>
    </div>
 <?php include template("deal_cs");?>
    </div>
 </div>
  </div>
<link rel="stylesheet" href="/static/0750/css/og.css" />
<script type="text/javascript" src="/static/0750/js/often_location_dev.js"></script>
<div class="oftengo" id="haunt_sethauntpop">
 <div class="pos">
  <p class="t"><img src="/static/0750/images/fun.png" width="50" height="49" />告诉我你经常去哪儿吧，我帮你去找好团购...</p>
  <p class="set">设置你常去的商圈：<b class="red">注意：最多只能同时选6个商圈</b></p>
  <p class="setted">点击下方标签添加常去地点~</p>
  <ul class="option place_here" id="haunt_haunts"></ul>
  <p class="setting">选择地区：<select id="haunt_areas"></select></p>
  <ul class="option here_place" id="haunt_areasBusiness">
  </ul>
  <p class="btn"><a href="javascript:;" class="ok" id="haunt_confirm">确定</a><a href="javascript:;" class="close"  id="haunt_cancel">关闭</a></p>
 </div>
 <div class="pos_bg"></div>
 <div class="mask"></div>
</div>
<script type="text/javascript">
var areasData = {"1":{"id":"1","name":"\u84ec\u6c5f\u533a","sub_district":{"1":{"areaId":"1","name":"\u5730\u738b"},"2":{"areaId":"2","name":"\u76ca\u534e"},"5":{"areaId":"5","name":"\u4e1c\u534e"},"6":{"areaId":"6","name":"\u5317\u90ca"},"10":{"areaId":"10","name":"\u767d\u77f3"},"34":{"areaId":"34","name":"\u65b0\u4e4b\u57ce"},"38":{"areaId":"38","name":"\u6f6e\u83b2"},"45":{"areaId":"45","name":"\u767d\u6c99"},"46":{"areaId":"46","name":"\u8377\u5858"}}},"2":{"id":"2","name":"\u6c5f\u6d77\u533a","sub_district":{"13":{"areaId":"13","name":"\u6c5f\u6d77"}}},"4":{"id":"4","name":"\u65b0\u4f1a\u533a","sub_district":{"21":{"areaId":"21","name":"\u6b65\u884c\u8857"},"22":{"areaId":"22","name":"\u4e16\u7eaa\u5e7f\u573a"},"23":{"areaId":"23","name":"\u534e\u6da6\u4e07\u5bb6"},"24":{"areaId":"24","name":"\u572d\u5cf0\u5c71"},"26":{"areaId":"26","name":"\u5927\u6da6\u53d1"},"32":{"areaId":"32","name":"\u5176\u5b83"}}},"11":{"id":"11","name":"\u5f00\u5e73\u5e02","sub_district":{"28":{"areaId":"28","name":"\u5f00\u5e73\u5546\u5708"}}},"12":{"id":"12","name":"\u9e64\u5c71\u5e02","sub_district":{"30":{"areaId":"30","name":"\u9e64\u5c71\u5546\u5708"}}},"13":{"id":"13","name":"\u53f0\u5c71\u5e02","sub_district":{"31":{"areaId":"31","name":"\u53f0\u5c71\u5546\u5708"}}},"15":{"id":"15","name":"\u6069\u5e73\u5e02","sub_district":{"29":{"areaId":"29","name":"\u6069\u5e73\u5546\u5708"}}},"14":{"id":"14","name":"\u975e\u4e94\u9091\u5730\u533a","sub_district":{"47":{"areaId":"47","name":"\u975e\u4e94\u9091\u5546\u5708"}}}};
$(function(){
Haunt.init();
$('.oftengo .close').click(function(){
$('.oftengo').hide();
$('html').removeClass('hash');})});
if($.browser.msie&&$.browser.version=="6.0"){$(window).resize(function(){resize()});}
function resize(){var w=$(window).width();var h=$(window).height()}function getPageSize(){var xScroll,yScroll;if(window.innerHeight&&window.scrollMaxY){xScroll=window.innerWidth+window.scrollMaxX;yScroll=window.innerHeight+window.scrollMaxY}else if(document.body.scrollHeight>document.body.offsetHeight){xScroll=document.body.scrollWidth;yScroll=document.body.scrollHeight}else{xScroll=document.body.offsetWidth;yScroll=document.body.offsetHeight}var windowWidth,windowHeight;if(self.innerHeight){if(document.documentElement.clientWidth){windowWidth=document.documentElement.clientWidth}else{windowWidth=self.innerWidth}windowHeight=self.innerHeight}else if(document.documentElement&&document.documentElement.clientHeight){windowWidth=document.documentElement.clientWidth;windowHeight=document.documentElement.clientHeight}else if(document.body){windowWidth=document.body.clientWidth;windowHeight=document.body.clientHeight}if(yScroll<windowHeight){pageHeight=windowHeight}else{pageHeight=yScroll}if(xScroll<windowWidth){pageWidth=xScroll}else{pageWidth=windowWidth}arrayPageSize=new Array(pageWidth,pageHeight,windowWidth,windowHeight);return arrayPageSize}
</script>

<script src="/static/0750/js/owr.js" type="text/javascript"></script>
<script type="text/javascript">
var _fn=function(){
$(window).width()<=1280?$("body").addClass("small"):$("body").removeClass("small")};
$(document).ready(function(){
_fn(),owr0750tuan.add(_fn).add(_fn).remove(_fn);});
</script>




<?php include template("foot_ctn");?>


</body>
</html>