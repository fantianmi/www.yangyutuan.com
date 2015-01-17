<div class="head">
 <?php include template("top_bar");?>
 <div class="inside">
  <div class="centre">
   <div class="logo_style">
   </div>
   
   
   <div class="clear"></div>
   <div class="logo"><a href="/index.php"><?php echo $INI['system']['abbreviation']; ?></a></div>
   <div class="city-info"><h2 style="padding-bottom: 5px;font-weight: 600;font-size: 18px;color:#464646"><?php echo $city['name']; ?></h2><a class="city-info__toggle" href="/city.php">切换城市</a></div>
      <div class="search">
      
      <div class="select">
<a class="tg focus" href="javascript:;">团购</a>
<a class="sj" href="javascript:;">商家</a>
</div>

    <div class="input">
     <form action="/search.php" method="POST" id="search_form">
     <div class="sp">
      <input type="text" class="tg" name="keywords" placeholder="请输入要搜索的团购名称" value="">
     </div>
     <div class="sb"><input type="submit" value="搜索"><input type="hidden" name="m" value="Goods"><input type="hidden" name="a" value="showall"></div>
     </form>
    </div>
    
    <div class="keyword">
        <a title="搜索 建材" href="/category.php?keywords=建材">建材</a>
        <a title="搜索 电影" href="/category.php?keywords=电影">电影</a>
        <a title="搜索 自助餐" href="/category.php?keywords=自助餐">自助餐</a>
        <a title="搜索 韩国烧烤" href="/category.php?keywords=韩国烧烤">韩国烧烤</a>
        <a title="搜索 酒店" href="/category.php?keywords=酒店">酒店</a>
        <a title="搜索 温泉" href="/category.php?keywords=温泉">温泉</a>
        <a title="搜索 米线" href="/category.php?keywords=米线">米线</a>
    </div>

   </div>
   <div class="code">
   	<img src="/static/0750/css/img/commitment.png"/>
    </div>

  </div>
 </div>
  <div class="navigation">
  <div class="inside">
  
<!--导航分类代码 -->
<?php 
$categorys = get_categorys();
; ?> 


   <div class="product-type-list ptl">
    <div class="choose"><a href="/index.php">全部分类</a></div>
    <div class="type-list tl" style="display:<?php if($request_uri == 'index'){?>block<?php } else { ?>none<?php }?>;">
     <ul>
     
     
     
     
     <?php if(is_array($categorys)){foreach($categorys AS $index=>$cat) { ?>
            <li class="tl<?php echo $index + 1; ?>">
       <div class="gt"></div>       <div class="panel">
        <div class="ntype"><a href="/category.php?gid=<?php echo $cat['id']; ?>" class="n"><?php echo $cat['name']; ?></a></div>
        <div class="nkey">
        
          <?php if(is_array($cat['fcat'])){foreach($cat['fcat'] AS $findex=>$fcat) { ?>
            <?php if($findex < 3){?>
           <a href="/category.php?gid=<?php echo $cat['id']; ?>&sid=<?php echo $fcat['id']; ?>"><?php echo $fcat['name']; ?></a>
             <?php }?>
         <?php }}?>
        
        </div>      
        
         </div>
       <div class="showmenu" style="display: none;">
        <div class="this-type-all tta">
         <p class="t"><?php echo $cat['name']; ?></p>
         <p class="ty">
         <?php if(is_array($cat['fcat'])){foreach($cat['fcat'] AS $findex=>$fcat) { ?>
        <a href="/category.php?gid=<?php echo $cat['id']; ?>&sid=<?php echo $fcat['id']; ?>"><?php echo $fcat['name']; ?></a>
         
          <?php }}?>
         
         </p>
         <p class="hr"></p>                
          </div>
       </div>      </li>
       <?php }}?>   
           </ul>
    </div>
   </div>
   
   
<?php if($request_uri != 'index'){?>     
  <script type="text/javascript">

$(document).ready(function(){	  
	  
  $('.product-type-list').on('mouseover',function(){

  $(this).find('.type-list').show();
  
  });

  $('.product-type-list').on('mouseleave',function(){
  
  
  $(this).find('.type-list').hide();
  
  });
 }); 
</script>
<?php }?>  

   
   
   
   <div class="nav">
    <ul>
     <li><a href="/"  id="shouye">首页</a></li>
     <li><a href="/partner/" id="partner">商家列表</a></li>
     <li><a href="/team/seconds.php" id="seconds">限时抢购</a></li>
     <li><a href="http://waimai.yangyutuan.cn" target="_blank">洋芋外卖</a></li>
     <li><a href="/feedback/suggest.php" id="feedback">你说我团</a></li>
     <li class="history"><a href="javascript:;">浏览历史</a>
      <div class="showmenu" style="display: none;">
       <ul>
       <?php if($history_team){?>
       
        <?php if(is_array($history_team)){foreach($history_team AS $index=>$one) { ?>
              <li>
         <div class="picture"><a href="/team.php?id=<?php echo $one['id']; ?>" target="_blank"><img src="<?php echo team_image($one['image']); ?>" width="65" height="41"/></a></div>
         <div class="title"><a href="/team.php?id=<?php echo $one['id']; ?>" target="_blank" title="<?php echo $one['title']; ?>"><span>[<?php echo get_area_name($one['area_id']); ?>]</span><?php echo mb_strimwidth($one['title'],0,38,'...'); ?></a></div>
         <div class="price"><b class="fee"><?php echo $currency; ?><?php echo moneyit($one['team_price']); ?></b><b class="exfee"><?php echo $currency; ?><?php echo moneyit($one['market_price']); ?></b></div>
        </li>
         <?php }}?>
         <li class="tips">
         <a href="javascript:;" onclick="ClearHistory();">清空浏览历史</a>
        </li>
       <?php } else { ?>
       
        <li class="tips">
         尚未有浏览记录，<a href="/index.php">去逛逛</a>
        </li>
        <?php }?> 
        
              </ul>
      </div>
     </li>
    </ul>
   </div>
  </div>
 </div>
 </div>
 
 <script>
 var thisSLoc = self.location.href;
 if(thisSLoc.indexOf("partner")>=0){
	 $("#partner").addClass("focus");
 }
 else if(thisSLoc.indexOf("seconds")>=0){
	 $("#seconds").addClass("focus");
 }
 else if(thisSLoc.indexOf("feedback")>=0){
	 $("#feedback").addClass("focus");
 }else{
	 $("#shouye").addClass("focus");
 }
 </script>
 

 <?php if($session_notice=Session::Get('error',true)){?>
 <div class="section" style="background:url(../static/0750/css/img/error.gif) no-repeat #FFF 12px center; text-indent:18px;margin: 0px auto; width: 1062px; padding:10px 18px; border:#ddd solid 1px;">
       
          <div style="color:#F00;"><?php echo $session_notice; ?></div>
     
 </div>     
<?php }?>  


 
 