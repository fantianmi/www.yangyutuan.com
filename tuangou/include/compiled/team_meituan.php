<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="ZH-CN">
<head>
<meta property="qc:admins" content="152727651206451620167633" /
<script type="text/javascript" charset="utf-8" async src="/static/0750/js/contains.js"></script><script type="text/javascript" charset="utf-8" async src="/static/0750/js/taskMgr.js"></script><script type="text/javascript" charset="utf-8" async src="/static/0750/js/views.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="edge">
<meta name="360-site-verification" content="2dadc453e682b674113f25c8a172d39c" />
<?php include template("meta_and_title");?>
<link rel="icon" href="favicon.ico" type="/image/x-icon">
<link rel="shortcut icon" href="favicon.ico" type="/image/x-icon">
<link href="/static/0750/css/style.css" rel="stylesheet" type="text/css">
<link href="/static/0750/css/list.css" rel="stylesheet" type="text/css">
<link href="/static/0750/css/custom.css" rel="stylesheet" type="text/css">
<link href="/static/0750/css/near.css" rel="stylesheet" type="text/css">
<link href="/static/0750/css/og.css" rel="stylesheet" type="text/css">
<link href="/static/0750/css/page.css" rel="stylesheet" type="text/css">
<link href="/static/0750/css/supplier.css" rel="stylesheet" type="text/css">
<link href="/static/0750/css/member.css" rel="stylesheet" type="text/css">
<link href="/static/0750/css/poptips.css" rel="stylesheet" type="text/css">
<link href="/static/0750/css/hack.css" rel="stylesheet" type="text/css">
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
<script type="text/javascript">  
 function browserRedirect() {  
     var sUserAgent = navigator.userAgent.toLowerCase();  
     var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";  
     var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";  
     var bIsMidp = sUserAgent.match(/midp/i) == "midp";  
     var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";  
     var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";  
     var bIsAndroid = sUserAgent.match(/android/i) == "android";  
     var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";  
     var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";  
     if (bIsIpad||bIsIphoneOs||bIsMidp||bIsUc7||bIsUc||bIsAndroid||bIsCE||bIsWM){  
         window.location.href="http://www.yangyutuan.cn/wap/";
     } 
 }  
 browserRedirect();          
</script>
</head>

<body class="xl">
<?php include template("head_ctn");?>
<div class="selector">
 <div class="section">
  <div class="option special">
  <ul>
   <li class="op o1">热门团购</li>
   
   

      <?php if(is_array($hot_cat)){foreach($hot_cat AS $index=>$cat) { ?>
    
        <li class="<?php if($index == 0){?>first_li<?php }?>">
        <a href="/category.php?gid=<?php echo $cat['fid']; ?>&sid=<?php echo $cat['id']; ?>">
        <em class="red"><?php echo $cat['name']; ?></em>
        </a>
        </li>
      <?php }}?> 
   

   
    </ul>
 </div>
   <div class="line"></div>
 <div class="option special">
  <ul>
   <li class="op o2">团购地区</li>
   
   
       <?php if(is_array($area)){foreach($area AS $index=>$one) { ?>
      <li  class="<?php if($index == 0){?>first_li<?php }?>"><a  class="<?php if($index == 0){?>pink<?php }?>"  href="/category.php?aid=<?php echo $one['id']; ?>" class="<?php if($aid){?>focus<?php }?>"><?php echo $one['name']; ?><span><?php echo $one['number']; ?></span></a></li>
    <?php }}?> 
    
       <li class="sp_btn"><a href="/category.php" target="_blank">更多»</a></li>
  </ul>
 </div>
   <div class="line"></div>
  <div class="option special noheight">
   <ul>
    <li class="op o3"><?php echo $INI['system']['abbreviation']; ?>推荐</li>
   </ul>
  </div>
 <div class="banner">
  <div class="bigbanner bb">
  <a class="arrow left" id="left" href="javascript:void(0)" style="display: none;">&lt;</a>
  <a class="arrow right" id="right" href="javascript:void(0)" style="display: none;">&gt;</a>
   <div class="fade">
    <div class="caroufredsel_wrapper" style="display: block; text-align: start; float: none; position: relative; top: auto; right: auto; bottom: auto; left: auto; z-index: auto; width: 714px; height: 230px; margin: 0px; overflow: hidden;">
    
    
    <ul id="scroll" style="text-align: left; float: none; position: absolute; top: 0px; right: auto; bottom: auto; left: 0px; margin: 0px; width: 5712px; height: 230px; opacity: 1; z-index: auto;">
          
          <?php if(is_array($teams_rec)){foreach($teams_rec AS $rindex=>$one) { ?>
            <li>
            <a href="/team.php?id=<?php echo $one['id']; ?>" target="_blank">
            <i class="pos"><?php echo $one['title']; ?></i>
            <i class="mask"></i>
            <img src="<?php echo team_image($one['image']); ?>" width="347" height="230">
            </a>
            </li>
         <?php }}?>
         </ul>
         
       </div>
   </div>
  </div>
 </div>
<script type="text/javascript">
$(document).ready(function(){
	$('#scroll').carouFredSel({
		items: 2,
		prev: '#left',
		next: '#right',
		mousewheel: true,
		scroll: {
            items: 2,
            fx : 'fade',
			pauseOnHover: true
			},
		swipe: {
			onMouse: true,
			onTouch: true
		},
		auto: {
			timeoutDuration: 7000
		}
	});
});
</script>
</div>
  <div class="aside">
    <div class="banner">
   <div class="smallbanner bb sb">
   <a class="arrow left" id="left1" href="javascript:void(0)" style="display: none;">&lt;</a>
   <a class="arrow right" id="right1" href="javascript:void(0)" style="display: none;">&gt;</a>
    <div class="fade">
     <div class="caroufredsel_wrapper" style="display: block; text-align: start; float: none; position: relative; top: auto; right: auto; bottom: auto; left: auto; z-index: auto; width: 195px; height: 223px; margin: 0px; overflow: hidden;"><ul id="scroll1" style="text-align: left; float: none; position: absolute; top: 0px; right: auto; bottom: auto; left: 0px; margin: 0px; width: 975px; height: 223px; z-index: auto;">
        <?php if(is_array($news)){foreach($news AS $index=>$one) { ?>  
          <li><a href="<?php if($one['url']){?><?php echo $one['url']; ?><?php } else { ?>/news.php?id=<?php echo $one['id']; ?><?php }?>" target="_blank"><img src="<?php echo team_image($one['image']); ?>" alt="<?php echo $one['title']; ?>" width="195" height="223"></a></li>
         <?php }}?>  
          </ul></div>
    </div>
   </div>
  </div>
  <style>
  #right_pannel_list li{padding:5px 10px;border-bottom:1px solid #dddddd;border-left: 3px solid #699F00;font-size: 12px !important;}
  #right_pannel_list{}
  #right_menu_pic{height:200px;border-top: 1px solid #dedede}
  </style>
	  <div id="right_menu_pic">
	  <a href="/news.php?id=9" target="_blank" title="我们找牛人，同时生产牛人！"><img src="/static/0750/images/joinus.png" width="195" height="182"></a>
	  </div>
   </div>
<script type="text/javascript">
$(document).ready(function(){
	$('#scroll1').carouFredSel({
		items: 1,
		prev: '#left1',
		next: '#right1',
		mousewheel: true,
		scroll: {
            items: 1,
			pauseOnHover: true
			},
		swipe: {
			onMouse: true,
			onTouch: true
		},
		auto: {
			timeoutDuration: 7000
		}
	});
});
</script>
 </div><div class="content">
 	<div class="wrap">
  <div class="panel ep" id="new_goods">
  <div class="piece" style="height: 282px;">
   <div class="dot">&nbsp;</div>
   <div class="unfixed"><span>今日新单</span></div>
  </div>
  
  
  
  
 <?php if(is_array($teams_day)){foreach($teams_day AS $dindex=>$one) { ?> 

    <div class="block <?php if($dindex == 3){?>nomarginright<?php }?>">
  <div class="blockinside">
   <div class="picture">
               <a href="/team.php?id=<?php echo $one['id']; ?>" target="_blank">
                    <img class="lazy" src="<?php echo team_image($one['image']); ?>" data-original="<?php echo team_image($one['image']); ?>" width="248" height="158" style="display: inline;">
    </a>
   </div>
   <div class="title">
   <a href="/team.php?id=<?php echo $one['id']; ?>" class="supplierName" target="_blank"><em title="商家地址：xxx"><?php echo get_area_name($one['area_id']); ?></em><span><?php echo get_partner_name($one['partner_id']); ?></span></a>
   <a href="/team.php?id=<?php echo $one['id']; ?>" title="<?php echo $one['title']; ?>" class="smalltitle" target="_blank"><span><?php echo $one['title']; ?></span></a></div>
   <div class="price">
    <span class="fee">
     <span class="symbol">￥</span>
     <span class="bf"><?php echo $one['team_price']; ?></span>
    </span>
    <span class="sale">
     <span class="discount"><?php echo team_discount($one); ?>折</span>
     <span class="exfee"><?php echo $currency; ?><?php echo moneyit($one['market_price']); ?></span>
    </span>
       </div>
   </div>
  </div>
 <?php }}?>   
  
  
  
   </div>
 <div class="thispanelmore tpm pinkred" style="width: 978px;"><a href="/category.php" target="_blank">赶快来看看更多的团购吧 »</a></div><script type="text/javascript">
var updEndNowTimeV2 = 1404688463;
function updateEndTimeV2()
{
	var time = updEndNowTimeV2;
	$("#new_goods .counter").each(function(i){
		//var endDate =new Date(this.getAttribute("endTime"));
		//var endTime = endDate.getTime();
		var beginTime = $(this).attr("beginTime");
		var lag = (beginTime - time);
		//var lag = (endTime - time);
        //alert(lag);return false;
		if(lag > 0)
		{
			var second = prefixInteger(Math.floor(lag % 60),2);
			var minite = prefixInteger(Math.floor((lag / 60) % 60),2);
			var hour = Math.floor((lag / 3600) % 24);
			var day = Math.floor((lag / 3600) / 24);
			var timeHtml = "" ;
            
            if(day > 0)
                timeHtml += day + "天";
            if(hour > 0)
                timeHtml += hour +"时";
            if(minite > 0)
                timeHtml += minite+"分";
            timeHtml+=second+"秒后开始";
			$(this).html(timeHtml);
		}
		// else
			// $(this).html("已结束");
	});
	updEndNowTimeV2+=1;
	//updEndNowTimeV2+=1000;
	setTimeout(function(){updateEndTimeV2();},1000);
}
function prefixInteger(num, length) {
  return (num / Math.pow(10, length)).toFixed(length).substr(2);
}
updateEndTimeV2();
</script>












<!--------cate------------>
<?php if(is_array($cat_team)){foreach($cat_team AS $cindex=>$cat) { ?>
<?php if($cat['number']> 0){?>   
   <div class="panel ep<?php echo $cindex; ?>">
  <div class="piece" style="height: 691px;">
   <div class="dot">&nbsp;</div>
   <div class="fix"><span><?php echo $cat['name']; ?></span></div>
  </div>
  

<?php if(is_array($cat['teams'])){foreach($cat['teams'] AS $tindex=>$one) { ?>  
  
    <div class="block <?php if($tindex%3 == 2){?>nomarginright<?php }?>">
  <div class="blockinside">
   <div class="picture">
     <!-- 如果是特卖则显示 -->
              <a href="/team.php?id=<?php echo $one['id']; ?>" target="_blank">
               <img class="lazy" src="<?php echo team_image($one['image']); ?>" data-original="<?php echo team_image($one['image']); ?>" width="248" height="158">
    </a>
   </div>
   <div class="title">
   <a href="/team.php?id=<?php echo $one['id']; ?>" class="supplierName" target="_blank"><em><?php echo get_area_name($one['area_id']); ?></em><span><?php echo get_partner_name($one['partner_id']); ?></span></a>
   <a href="/team.php?id=<?php echo $one['id']; ?>" title="<?php echo $one['title']; ?>" target="_blank"><span><?php echo $one['title']; ?></span></a></div>
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
     <?php if($one['free_yuyue'] == 'Y'){?>
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
 <div class="thispanelmore tpm" style="width: 978px;"><a href="/category.php?id=<?php echo $cat['id']; ?>" target="_blank">查看更多<b><?php echo $cat['name']; ?></b>团购 (<?php echo $cat['number']; ?>) »</a></div>
 
 <?php }}?>
 <?php }?> 
<!--------cate------------>

     </div>
    <div class="aside">
 <div class="side appdl" style="margin-bottom:10px;">
  <div class="app_icon"><img src="/static/0750/images/code1.gif" width="50" height="50"></div>
  <div class="app_i">
   <p style="font-size:14px;"><?php echo $INI['system']['abbreviation']; ?>APP</p>
   <p><a href="http://www.yangyutuan.cn/download/" class="gtd"  target="_blank">免费下载</a></p>
  </div>
 </div>
<?php include template("history");?>
</div>
<?php include template("foot_ctn");?>


<?php include template("side_fixed");?>



<script src="/static/0750/js/jquery.lazyload.min.js" type="text/javascript"></script>
<script type="text/javascript">
$("img.lazy").lazyload({
  effect:"fadeIn"
  });
</script>
<script src="/static/0750/js/index_cate_fix.js" type="text/javascript"></script>
<link rel="stylesheet" href="/static/0750/css/og.css">
<script type="text/javascript" src="/static/0750/js/often_location_dev.js"></script>

<div class="birthday" style="display: none;">
 <div class="pos closing">

 </div>
 <div class="mask"></div>
</div>



</body></html>