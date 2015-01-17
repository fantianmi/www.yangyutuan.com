<?php include template("manage_html_header");?>
<?php if($INI['system']['editor'] == 'xh'){?>
<script type="text/javascript" src="/static/js/xheditor/xheditor.js"></script>
<?php } else { ?>
<script type="text/javascript" src="/static/js/kindeditor/kindeditor-min.js"></script>
<?php }?> 
<div id="hdw">

<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="background-color: #699F00">
  <TR height=56>
    <TD width=260><span style="font-size: 20px; font-weight: 800; color: #fff">&nbsp;&nbsp;&nbsp;<img src="/static/0750/css/img/manage_logo.png"/></TD>
    <TD style="FONT-WEIGHT: bold; COLOR: #fff; PADDING-TOP: 20px" 
      align=middle>&nbsp;
    </TD>
    <TD align=right width=400>
    <!-- pannel -->
    <span style="color:#fff"><i class="iconfont" style="font-size: 20px">&#xf003e;</i>&nbsp;&nbsp;<?php echo $login_user['username']; ?> &nbsp;&nbsp;</span>
      <A style="COLOR: #fff" 
      href="/index.php" target=main><i class="iconfont" style="font-size: 20px">&#xe61d;</i>&nbsp;&nbsp;查看网站</A> &nbsp;&nbsp; 
      <?php if(is_manager()){?>
      <A style="COLOR: #fff" 
      onclick="if (confirm('确定要退出吗？')) return true; else return false;" 
      href="/manage/logout.php" target=_top><i class="iconfont" style="font-size: 20px">&#x343d;</i>&nbsp;&nbsp;退出系统</A> 
      <?php }?>
      &nbsp;&nbsp;&nbsp;
    <!-- pannel -->
    </TD></TR></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TR bgColor=#478100 height=4>
    <TD></TD></TR></TABLE>
</div>

<?php if($session_notice=Session::Get('notice',true)){?>
<div class="sysmsgw" id="sysmsg-success"><div class="sysmsg"><p><?php echo $session_notice; ?></p><span class="close">关闭</span></div></div> 
<?php }?>
<?php if($session_notice=Session::Get('error',true)){?>
<div class="sysmsgw" id="sysmsg-error"><div class="sysmsg"><p><?php echo $session_notice; ?></p><span class="close">关闭</span></div></div> 
<?php }?>
