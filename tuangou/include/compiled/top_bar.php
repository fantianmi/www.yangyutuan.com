<div class="topbar">
  <div class="inside">
   <div class="leftbar">
    <ul>
     <li class="mobile"><a href="#" >下载<?php echo $INI['system']['abbreviation']; ?>APP</a>
      <div class="showmenu" style="display: none;">
       <div class="version">
        <div class="c ct"><a href="http://www.yangyutuan.cn/download/"  target="_blank">android版</a></div>
        <div class="c ct"><a href="http://www.yangyutuan.cn/download/"  target="_blank">ios版</a></div>
       </div>
      </div>
     </li>
     <li>当前城市[<?php echo $city['name']; ?>] <a href="/city.php">切换城市</a></li>
     <li class="yline"><?php echo $INI['system']['abbreviation']; ?>，团就对了</li>
    </ul>
   </div>
   <div class="rightbar">
    <ul>
    
    <?php if($login_user){?>
            
            <li class="user"><span title="GPYgNQrqHz"><?php if($_SESSION['ali_token']){?>
				<?php echo mb_strimwidth($login_user['realname'],0,10); ?>！
                <?php } else { ?>
				<?php echo mb_strimwidth($login_user['username'],0,10); ?>！
				<?php }?></span><a class="exit" href="/account/logout.php">注销</a></li>
     <li class="member"><a href="javascript:;" class="dot">我的<?php echo $INI['system']['abbreviation']; ?></a>
      <div class="showmenu" style="display: none;">
              <a href="/order/index.php">我的订单</a>
       <a href="/account/comment.php">我的评价</a>
       <a href="/account/collect.php">我的收藏</a>
       <a href="/credit/index.php">账户余额</a>
       <a href="/credit/charge.php">账户充值</a>
       <a href="/account/settings.php">账户设置</a>
       <a href="/coupon/index.php">代金券</a>
            </div>
     </li>
     

     <li class="diy"><a href="/account/collect.php" class="dot">我的收藏</a>
     
<?php 
$collect_list = DB::LimitQuery('collect', array(
	'condition' => array('user_id'=>$_SESSION[user_id]),
	'order' => 'ORDER BY team_id DESC, id ASC',
	'size' => 8,
));

; ?> 
 
      <div class="showmenu myco" style="display: none;">
      
                     
                       <?php if($collect_list){?>
                       <?php if(is_array($collect_list)){foreach($collect_list AS $tindex=>$one) { ?>  
                         <div class="mc">
                                <div class="pi">
                                <a target="_blank" href="/team.php?id=<?php echo $one['team_id']; ?>">
                                <img width="65" height="41" src="<?php echo team_image($one['image']); ?>">
                                </a>
                                </div>
                                <div class="ti">
                                <a target="_blank" href="/team.php?id=<?php echo $one['team_id']; ?>">
                                   <?php echo $one['title']; ?>
                                </a>
                                </div>
                                <div class="pr">
                                <b class="fee"><?php echo $currency; ?><?php echo moneyit($one['team_price']); ?></b>
                                </div>
                            </div>
                     
                   <?php }}?>  
                
                          <div class="mc mcmore">
                               <a target="_blank" href="/account/collect.php">查看更多我收藏的</a>
                            </div>
          <?php } else { ?>
                             <div class="mc mcmore">
                             尚未有收藏记录，<a href="/index.php">去逛逛</a>
                            </div>
                            
                             <?php }?>
            </div>
     </li>
     
            
            
            
            
		<?php } else { ?>
        
        
          <li class="user"><a class="orange" href="/account/login.php">登录</a>|<a href="/account/signup.php">注册</a></li>
     <li class="member"><a class="dot" href="javascript:;">我的<?php echo $INI['system']['abbreviation']; ?></a>
      <div class="showmenu" style="display: none;">
              <!-- 未登录显示 -->
       <a class="orange" href="/account/login.php">亲，请先登录</a>
       <!-- //-->
             </div>
     </li>
     <li class="diy"><a class="dot" href="javascript:;">我的收藏</a>
      <div class="showmenu myco" style="display: none;">
              <div class="mc mcmore"><a class="orange" href="/account/login.php">亲，请先登录</a></div>
              </div>
     </li>
		<?php }?>
     <li class="supplier"><a href="/biz" target="_blank" class="dot">我是商家</a>
          </li>
     <li class="more"><a href="javascript:;" class="dot">更多</a>
      <div class="showmenu" style="display: none;">
       <a href="javascript:AddFavorite();">收藏<?php echo $INI['system']['abbreviation']; ?></a>
       <a href="/news.php?id=16" target="_blank">关于我们</a>
       <a href="/download/" target="_blank">手机端下载</a>
       <a href="/news.php?id=5" target="_blank">如何购买</a>
       <a href="/news.php?id=6" target="_blank">常见问题</a>
       <a href="/news.php?id=10" target="_blank">联系我们</a>
       <a href="/news.php?id=7" target="_blank">我要退款</a>
      </div>
     </li>
    </ul>
   </div>
  </div>
 </div>