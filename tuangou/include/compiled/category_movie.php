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
<link href="static/slider/movie/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="static/slider/movie/js/zzsc.js"></script>
<?php include template("head_ctn");?>
<!-- 代码 开始 -->
<div class="recommend-movies">
<div class="option-switch">
     <h3 class="option-switch__option">
                     <a class="link-arrow--right" href="#" target="_blank" gaevent="movieindex/hotmovie/all">全部<i class="F-glob F-glob-caret-right-small"></i></a>
         <span>正在热映</span>
     </h3>
 </div>
<div class="recommend-movies__slides-w ui-slider">
  <div id="playBox" style="margin: 0px;overflow: visible;">
    <div class="pre"></div>
    <div class="next"></div>
    <div class="smalltitle">
      <ul class="smalltitleul">
      </ul>
    </div>
    <ul class="oUlplay">
       <?php if(is_array($hotmovies)){foreach($hotmovies AS $index=>$one) { ?>
       <?php echo $index%5==0?'<li>':''; ?>
       <div class="reco-movieinfo" ><a href="/movie.php?mid=<?php echo $one['id']; ?>" target="_blank" title="<?php echo $one['id']; ?>" class="reco-movieinfo__cover">
       <img class="" width="170" height="254" src="<?php echo team_image($one['image']); ?>" />
          <div class="reco-movieinfo__name" >
              <h3><?php echo $one['name']; ?></h3>
               <span><?php echo $one['shortdes']; ?></span>
          </div><strong class="rates"><?php echo $one['score_integer']; ?><strong class="rates-point">.<?php echo $one['score_fractional']; ?></strong></strong></a><a href="/movie.php?mid=<?php echo $one['id']; ?>" target="_blank" title="<?php echo $one['name']; ?>" class="btn">购票</a>
        </div>
        <?php echo $index%5==4?'</li>':''; ?>
    	<?php }}?>   
    	</li>
    </ul>
  </div>
</div>
</div>
<!-- 代码 结束 -->
<!-- theater list -->
<div class="content">
	<!-- content _head -->
	<div class="content__head">
        <div class="hot-cinemas" >
            <div class="hot-cinemas__filter cf">
                <h2 class="hot-cinemas__filter__title"><span class="hot-label">热门</span>电影院</h2>
                <ul class="filter-list">
                    <li class="filter-list__item more-cinema" id="yui_3_16_0_1_1418718574065_809">
                        <a href="/dianying/cinemalist" target="_blank" gaevent="movieindex/hotcinema/area/all" id="yui_3_16_0_1_1418718574065_810">全部影院
                            <span class="tri"></span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="component-cinema-list mt-component--booted">
           		<?php if(is_array($hottheater)){foreach($hottheater AS $index=>$one) { ?>
		        <div id="J-cinema-info-list" class="cinema-info__list">
		            <div class="J-cinema-item cinema-item cf" id="J-cinema-item-2730">
		    			<div class="cinema-item__block cinema-item__block--detail">
		        		<h4 class="J-cinema-label cinema-item__label">
		            	<a class="link--black__green" href="/partner.php?id=<?php echo $one['id']; ?>" target="_blank"><?php echo $one['title']; ?></a>
		                 <span class="promotion-tag">特惠</span></h4>
					        <dl class="cinema-info-row cinema-info-row--addr cf">
					            <dt class="cinema-info-row__label">地址：</dt>
					            <dd class="cinema-info-row__value"> <?php echo mb_strimwidth($one['address'],0,33,'...','UTF-8'); ?></dd>
					            <dd class="cinema-info-row__promotion"></dd>
					        </dl>
			            </div>
					    <div class="cinema-item__block cinema-item__block--feature">
					            <p class="cinema-feature cinema-feature__text">&nbsp;</p>
					    </div>
					    <div class="cinema-item__block cinema-item__block--button">
					        <div class="btn-block btn-block--buy cf">
					             <p class="btn-block__price"><em class="btn-block__price__tag f4"><span class="tag">¥</span><?php echo get_team_price($one['id']); ?></em>起&nbsp;</p>
					               <a class="btn btn-small btn-block--buy__btn" target="_blank"  href="/partner.php?id=<?php echo $one['id']; ?>">团购购票</a>
					        </div>
			            </div>
					</div>
				</div>
		    	<?php }}?>
				<!-- list  -->
			</div>
		</div>    
	</div>
	<!-- content _head -->
	<!-- content slider -->
	<div id="sidebar">
        <div class="side-single">
            <div class="inner-blk side-rank-deals side-rank-movies">
                <h3>即将上映</h3>
                <div class="J-side-movie-wrapper">
	                <ul class="hot-movies">
	                <?php if(is_array($comingmovies)){foreach($comingmovies AS $index=>$one) { ?>
			        <li class="cf">
	                    <a href="#" title="<?php echo $one['id']; ?>" target="_blank" ><img src="<?php echo team_image($one['image']); ?>" width="61" height="81"></a>
	                    <div class="info-content">
	                        <h4 class="title"><a href="/movie.php?mid=<?php echo $one['id']; ?>" title="<?php echo $one['name']; ?>" target="_blank" ><?php echo $one['name']; ?></a></h4>
	                        <p class="description">“<?php echo $one['shortdes']; ?>”</p>
	                        <p class="release"> <?php echo date('Y.m.d',$one['release']); ?>上映</p>
	                    </div>
	                </li>
			    	<?php }}?>   
	                </ul>
                </div>
            </div>
        </div>    
     </div>
	<!-- content slider -->
</div>
<!-- theater list -->


<script type="text/javascript">
$('.ptl .choose a').hover(function(){
	$('.ptl .tl').show();
},function(){});
$('.ptl').hover(function(){},
    function(){
        $('.ptl .tl').hide();
    });
</script>
<div class="selector listpage" style="border:1px solid #dedede">
   <div class="option">
    <ul class="listblock lb1">
    <li class="op o1">热门团购</li>
    </ul>
    <ul class="listblock lb2">
      <?php if(is_array($hot_cat)){foreach($hot_cat AS $index=>$cat) { ?>
        <li>
        <a href="/category.php?gid=<?php echo $cat['fid']; ?>&sid=<?php echo $cat['id']; ?>">
        <em class="red"><?php echo $cat['name']; ?></em>
        </a>
        </li>
      <?php }}?> 
    </ul>
    </div>

 <div class="line"></div>
     <div class="option">
  <ul class="listblock lb1">
   <li class="op o3">团购分类</li>
  </ul>
  <ul class="listblock lb2">
   <li><a href="/category.php?gid=<?php echo $gid; ?>"   class="<?php if(!$sid){?>focus<?php }?>">全部分类</a>
   
   <?php if(is_array($cates)){foreach($cates AS $index=>$one) { ?>
         <?php if($gid){?>
           <li><a href="/category.php?gid=<?php echo $gid; ?>&sid=<?php echo $one['id']; ?>" class="<?php if($sid == $one['id']){?>focus<?php }?>"><?php echo $one['name']; ?><span><?php echo $one['number']; ?></span></a></li>
         <?php } else { ?>
            <li><a href="/category.php?gid=<?php echo $one['id']; ?>"><?php echo $one['name']; ?><span><?php echo $one['number']; ?></span></a></li>
         <?php }?>
   <?php }}?>
     
    </ul>
 </div>
   <div class="line"></div>
   <div class="option">
  <ul class="listblock lb1">
   <li class="op o2">选择地区</li>
  </ul>
  <ul class="listblock lb2">
      <li><a href="/category.php?gid=<?php echo $gid; ?>&sid=<?php echo $sid; ?>" class="<?php if(!$aid){?>focus<?php }?>">全部</a></li>
   
   <?php if(is_array($area)){foreach($area AS $index=>$one) { ?>
      <li><a href="/category.php?gid=<?php echo $gid; ?>&sid=<?php echo $sid; ?>&aid=<?php echo $one['id']; ?>" class="<?php if($aid==$one['id']){?>focus<?php }?>"><?php echo $one['name']; ?><span><?php echo $one['number']; ?></span></a></li>
    <?php }}?>   

      
    </ul>
 </div>
   </div>
<div style="height:75px; width:1100px; overflow:visible;">
 <div class="listcontorl" id="contorl">
  <a href="/category.php?gid=<?php echo $gid; ?>&sid=<?php echo $sid; ?>&aid=<?php echo $aid; ?>" class="<?php if(!$sc){?>active<?php }?>" title="按默认排序">默认</a>
  <a href="/category.php?gid=<?php echo $gid; ?>&sid=<?php echo $sid; ?>&aid=<?php echo $aid; ?>&sc=xl" class="nor <?php if($sc == 'xl'){?>active<?php }?>" title="按销量由高到低排序"><span>销量</span><i></i></a>
  <a href="/category.php?gid=<?php echo $gid; ?>&sid=<?php echo $sid; ?>&aid=<?php echo $aid; ?>&sc=new" class="nor <?php if($sc == 'new'){?>active<?php }?>" title="按发布时间由新到旧排序"><span>发布时间</span><i></i></a>
  <a href="/category.php?gid=<?php echo $gid; ?>&sid=<?php echo $sid; ?>&aid=<?php echo $aid; ?>&sc=zhekou" class="nor <?php if($sc == 'zhekou'){?>active<?php }?>" title="按折扣由低到高排序"><span>折扣</span><i></i></a>
  <a href="/category.php?gid=<?php echo $gid; ?>&sid=<?php echo $sid; ?>&aid=<?php echo $aid; ?>&sc=price" class="nor <?php if($sc == 'price'){?>active<?php }?>" title="按价格由低到高排序"><span>价格</span><i></i></a>
  
  <a href="javascript:;" class="nor price addborder"><input type="text" class="c" id="min_price" value="" /><span class="line">-</span><input type="text" class="c" id="max_price" value="" /><span class="pricelaw"><input type="button" value="确定" /></span></a>
  <a href="/category.php?gid=<?php echo $gid; ?>&sid=<?php echo $sid; ?>&aid=<?php echo $aid; ?>&sc=<?php echo $sc; ?>&wifi=1" class="nor nc <?php if($_GET['wifi'] == 1){?>checked<?php } else { ?>uncheck<?php }?>"><i></i><span>无线WIFI</span></a>
  <a href="/category.php?gid=<?php echo $gid; ?>&sid=<?php echo $sid; ?>&aid=<?php echo $aid; ?>&sc=<?php echo $sc; ?>&park=1" class="nor nc  <?php if($_GET['park'] == 1){?>checked<?php } else { ?>uncheck<?php }?>"><i></i><span>停车位</span></a>
  <a href="/category.php?gid=<?php echo $gid; ?>&sid=<?php echo $sid; ?>&aid=<?php echo $aid; ?>&sc=<?php echo $sc; ?>&holiday=1" class="nor nc  <?php if($_GET['holiday'] == 1){?>checked<?php } else { ?>uncheck<?php }?>"><i></i><span>节假日通用</span></a>
  <a href="/category.php?gid=<?php echo $gid; ?>&sid=<?php echo $sid; ?>&aid=<?php echo $aid; ?>&sc=<?php echo $sc; ?>&free_yuyue=1" class="nor nc  <?php if($_GET['free_yuyue'] == 1){?>checked<?php } else { ?>uncheck<?php }?>"><i></i><span>无需预约</span></a>
  <a href="/category.php?gid=<?php echo $gid; ?>&sid=<?php echo $sid; ?>&aid=<?php echo $aid; ?>&sc=<?php echo $sc; ?>&weekend=1" class="nor nc  <?php if($_GET['weekend'] == 1){?>checked<?php } else { ?>uncheck<?php }?>"><i></i><span>周末通用</span></a>

  
  </div>
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