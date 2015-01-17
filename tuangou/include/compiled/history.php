 <div class="side history" id="history">
  <div class="title"><span class="floatleft">浏览历史</span><a href="javascript:;" class="floatright empty" onClick="ClearHistory();">清空</a></div>
  <div class="list">
  
  
   <?php if($history_team){?>
    <?php if(is_array($history_team)){foreach($history_team AS $index=>$one) { ?>
  <div class="box">
       <ul>
        <li>
         <div class="pi floatleft"><a href="/team.php?id=<?php echo $one['id']; ?>" target="_blank"><img src="<?php echo team_image($one['image']); ?>" width="65" height="41"></a></div>
         <div class="ti floatleft"><a href="/team.php?id=<?php echo $one['id']; ?>" target="_blank" title="<?php echo $one['title']; ?>"><span>[<?php echo get_area_name($one['area_id']); ?>]</span><?php echo mb_strimwidth($one['title'],0,30,'...'); ?></a></div>
         <div class="pr floatleft"><b class="fee red"><?php echo $currency; ?><?php echo moneyit($one['team_price']); ?></b><b class="exfee"><?php echo $currency; ?><?php echo moneyit($one['market_price']); ?></b></div>
         
        </li>
       </ul>
    </div>
    <?php }}?>
  
   <?php } else { ?>
  
      <div class="box">
       <ul>
        <li class="tips">尚未有浏览记录，<a href="/index.php">去逛逛</a></li>
       </ul>
    </div>
     <?php }?> 
      </div>
 </div>
    </div>