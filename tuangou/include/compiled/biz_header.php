<?php include template("biz_html_header");?>
<script type="text/javascript" src="/static/js/xheditor/xheditor.js"></script>
<div id="hdw">
    <div class="biztop" style="background:none;">
          <div id="bd" class="cf">
              <h3 style="color:#666;"><img src="/static/0750/css/img/logo_shanghu.jpg" /></h3>
              
              <p><a style="color:#666;" href="/index.php"><?php echo $INI['system']['abbreviation']; ?>首页</a>
              
                            
              </p>
          </div>
          
    </div>
</div>


<div style=" margin-top:10px; margin-bottom:10px; line-height:42px; background:#699F00">

<div id="hd">
    <ul class="nav cf" style="float:left">
    
    <?php echo current_biz(); ?><?php if(is_partner()){?><li><a id="verify-coupon-id" href="javascript:;">消费登记</a></li><?php }?>
    

    
    </ul>
    <ul class="nav cf" style="float:right">
           <?php if(is_partner()){?>
                            <li>欢迎您，<?php echo $login_partner['title']; ?>！</li>
                            <li><a href="/biz/logout.php">退出</a></li>
                            <?php }?>
    </ul>
  <div style="clear:both"></div>
</div>

</div>

<?php if($session_notice=Session::Get('notice',true)){?>
<div class="sysmsgw" id="sysmsg-success"><div class="sysmsg"><p><?php echo $session_notice; ?></p><span class="close">关闭</span></div></div> 
<?php }?>
<?php if($session_notice=Session::Get('error',true)){?>
<div class="sysmsgw" id="sysmsg-error"><div class="sysmsg"><p><?php echo $session_notice; ?></p><span class="close">关闭</span></div></div> 
<?php }?>
