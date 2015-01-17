<?php include template("header");?>

<div class="content detailpage dp supplierList supplierDetail" style="border-top:none;">
 <div class="section atFront dl">
    <div class="info">
   <div class="sn"><span class="n"><?php echo $partner['title']; ?></span></div>
   <div class="inside">
    <div class="ir">
     <img src="<?php echo team_image($partner['image']); ?>" width="400" height="267" />    </div>
    <div class="il">
     <p class="pos"><i><img src="/static/0750/images/stars.gif" width="88" height="16" /><em style="width:<?php if($partner['comment_num']>0){?><?php echo $partner['reputation']; ?>%<?php } else { ?>100<?php }?>%;"></em></i><span class="points"><b class="orange">5.0</b>分<a href="#comment">查看消费评价</a></span></p>
 <p class="pune"><?php echo $partner['other']; ?></p>
     <p class="services">
      <em class="floatleft">配套服务：</em>
      <em class="options">
       <a href="javascript:;" class="noSupport" title="该商家不提供免费WIFI网络"><i class="s_1"></i><span>WIFI网络</span></a>
       <a href="javascript:;" class="noSupport" title="该商家不提供免费提车场"><i class="s_2"></i><span>停车场</span></a>
       <a href="javascript:;" class="noSupport" title="该商家不提供独立包间"><i class="s_5"></i><span>独立包间</span></a>
             </em>
     </p>
    </div>
   </div>
  </div>
 </div>
 <div class="panel p1 dl" style="width:805px;">
  <div class="infoInside">
   <div class="inside tap map" id="address">
    <div class="contorl">
     <ul>
      <li><a href="javascript:;" class="active">商家地图</a></li>
     </ul>
    </div>
    <div class="add" id="map" style="height:228px;position:relative;">
        <?php if($partner['longlat']){?>
       <?php include template("block_block_partnermap");?><?php }?>
    </div>
    <div class="map_selector">
     <ul>
          <li class="firstLi" id="map_info_0">
       <p class="sn active"><?php echo $partner['title']; ?></p>
       <div class="a_content"><p class="address">地址：<?php echo $partner['address']; ?></p>
       <p>营业时间：<?php echo $partner['yy_time']; ?>‎</p>
       <p>联系电话：<?php echo $partner['phone']; ?></p></div>
      </li>

                </ul>
    </div>
   </div>
   <div class="inside tap products" id="goods">
    <div class="contorl">
     <ul>
      <li><a href="javascript:;" class="active">进行中的团购</a></li>
      <li><a href="javascript:;">往期团购</a></li>
     </ul>
    </div>
    <div class="list l new">
    	<div class="loop__panel">
        
        
        
      <?php if(is_array($teams)){foreach($teams AS $index=>$one) { ?>  
          <div class="panel">
      <ul>
       <li>
        <div class="img">
         <img src="<?php echo team_image($one['image']); ?>" width="128" height="81" />
        </div>
        <div class="title">
         <a class="t" href="/team.php?id=<?php echo $one['id']; ?>" title="" target="_blank"><?php echo mb_strimwidth($one['title'],0,86,'...'); ?></a>
         <div class="base">
          <span class="floatleft"><i><img src="/static/0750/images/stars.gif" width="88" height="16"><em style="width:100%;"></em></i></span>
          <span class="floatright">已售<?php echo $one['now_number']; ?>份</span>
         </div>
        </div>
        <div class="price"><em>￥<span><?php echo moneyit($one['team_price']); ?></span></em><i>原价<?php echo moneyit($one['market_price']); ?></i></div>
        <div class="btn"><a href="/team.php?id=<?php echo $one['id']; ?>" target="_blank">购买</a></div>
       </li>
      </ul>
     </div>
     <?php }}?>
     
    
          	</div>
    </div>
    <div class="list l old" style="display:none;">
     	<div class="loop__panel">
         
          <?php if(is_array($teams_old)){foreach($teams_old AS $index=>$one) { ?>  
          <div class="panel">
      <ul>
       <li>
        <div class="img">
         <img src="<?php echo team_image($one['image']); ?>" width="128" height="81" />
        </div>
        <div class="title">
         <a class="t" href="/team.php?id=<?php echo $one['id']; ?>" title="" target="_blank"><?php echo mb_strimwidth($one['title'],0,86,'...'); ?></a>
         <div class="base">
          <span class="floatleft"><i><img src="/static/0750/images/stars.gif" width="88" height="16"><em style="width:100%;"></em></i></span>
          <span class="floatright">已售<?php echo $one['now_number']; ?>份</span>
         </div>
        </div>
        <div class="price"><em>￥<span><?php echo moneyit($one['team_price']); ?></span></em><i>原价<?php echo moneyit($one['market_price']); ?></i></div>
        <div class="btn"><a href="/team.php?id=<?php echo $one['id']; ?>" target="_blank">购买</a></div>
       </li>
      </ul>
     </div>
     <?php }}?>

       
  
          	</div>
    </div>
   </div>
      <div class="inside tap" id="comment">
    <div class="contorl">
     <ul>
      <li><a href="javascript:;" class="active" id="discuss">门店消费评价</a></li>
     </ul>
    </div>
    <div class="list">
     <div class="user-reviews-st" id="user-reviews-st"><span class="urst-left"><b>全部评价</b></span><span class="urst-right"><label><input checked="checked" type="checkbox" id="is_content">有内容的评价</label><a href="javascript:void(0);" class="focus orderby" data-order="" title="按默认排序">默认</a><a href="javascript:void(0);" class="timeOff orderby" data-order="time" title="按时间由新到旧排序">按时间</a></span></div>
     <div class="user-reviews-c" id="user-reviews-c" data-supplier_id="494">
     
  
  <?php if(empty($comments)){?>
							还没有用户对当前商家做出点评。
							<?php } else { ?>
							<?php if(is_array($comments)){foreach($comments AS $k=>$v) { ?>	   
  <ul class="urc-panel">
   <li><div class="urc-left"><span class="user-name"><?php echo $users[$v['user_id']]['username']; ?></span><span class="user-level"><img src="/static/0750/images/1.gif" /><img src="/static/0750/images/1.gif" /></span><span class="date"><?php echo date('Y-m-d',$v['create_time']); ?></span></div>
     <div class="star urc-right" rel="5">
     </div>
   </li>
   <li><?php echo $v['comment']; ?></li>
         <li><span class="shopId">
         	<?php if($v['grade'] == 'A'){?>
     满意
    <?php } else if($v['grade'] == 'P') { ?>
    一般
    <?php } else if($v['grade'] == 'F') { ?>
    失望 
    <?php }?></span></li>
  </ul>
  
<?php }}?>
<?php }?>


<div class="urc-pages">
<?php echo $pagestring; ?>
</div>
       </div>
    </div>
   </div>
   <div class="inside tap thesimilar">
    <div class="contorl">
     <ul>
      <li><a href="javascript:;" class="active">推荐团购</a></li>
     </ul>
    </div>
    <div class="loop__panel">
    
    
    <?php if(is_array($teams_rec)){foreach($teams_rec AS $rindex=>$one) { ?>
          <div class="tips_pr">
      <div class="sn">
       <span><a href="/team.php?id=<?php echo $one['id']; ?>" title="<?php echo $one['title']; ?>" target="_blank"><img src="<?php echo team_image($one['image']); ?>" width="218" height="145" />
       <em><?php echo mb_strimwidth($one['title'],0,66,'...'); ?></em></a></span>
      </div>
      <div class="st">
       <span class="floatleft">团购价<b class="orange"><?php echo moneyit($one['team_price']); ?></b>元</span><span class="floatright">已售<b class="orange"><?php echo $one['now_number']; ?></b>份</span>
      </div>
     </div>
  <?php }}?>   

     

       	</div>
   </div>
  </div>
 </div>
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

<?php include template("footer");?>


<script type="text/javascript">
	$('.tap .contorl ul li a').click(function(){
	var index = $(this).parent('li').index();
	var ex = $(this).parents('.tap').index();
	if(index==0){
	$('.tap:eq('+ex+') .l').hide();
	$(this).parent('li').siblings('li').find('a').removeClass('active');
	$(this).addClass('active');
	$('.tap:eq('+ex+') .new').show();
	}else{
	$('.tap:eq('+ex+') .l').hide();
	$(this).parent('li').siblings('li').find('a').removeClass('active');
	$(this).addClass('active');
	$('.tap:eq('+ex+') .old').show();
	}
	});
	$('.supplierDetail .infoInside .picture').hover(function(){
	$(this).find('span.s_h').show();
	},function(){
	$(this).find('span.s_h').hide();
	});
</script>
