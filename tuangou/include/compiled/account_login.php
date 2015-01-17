<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ZH-CN" dir="ltr" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/static/0750/css/login.css" rel="stylesheet" type="text/css" />
<script src="/static/0750/js/j.js" type="text/javascript"></script>
<script src="/static/0750/js/jquery.jcookie.min.js" type="text/javascript"></script>
<script src="/static/0750/js/js_lang.js" type="text/javascript"></script>
<script type="text/javascript">var WEB_ROOT = '<?php echo WEB_ROOT; ?>';</script>
<script type="text/javascript">var LOGINUID= <?php echo abs(intval($login_user_id)); ?>;</script>
<script src="/static/js/index.js" type="text/javascript"></script>
<?php echo Session::Get('script',true);; ?>
<?php include template("meta_and_title");?>

</head>

<body id="login">
<div class="loginPage lp old">
 <div class="logo">
  <a title="返回网首页" class="l" href="/index.php"><?php echo $INI['system']['abbreviation']; ?>团购网-吃喝玩乐，江门人自己的团购网，每天都要来哦</a>
 </div>
 <div class="loginPanel lpl">
   <div class="special">
     <img src="/static/0750/css/img/login_left.jpg"/>
  </div>
  <div class="login">
   <div class="input">
    <ul>
     <li style="margin-top:0;" class="noStyle">账户登录</li>
     
     <?php if($session_notice=Session::Get('error',true)){?>
          <li id="" class="noStyle"><div class="area error"><?php echo $session_notice; ?></div></li>
     <?php }?>
     
     
     <li style="display:none;" id="login_error" class="noStyle"><div class="area error"></div></li>
     <li style="display:none;" id="login_success" class="noStyle"><div class="area success"></div></li>
      <form name="reg_form" action="/account/login.php" method="post" >
       <li><img src="/static/0750/images/user.png" class="img" /><input type="text" name="email" id="login-email-address" class="text" value="" placeholder="可使用 用户账号/邮箱 登录" /></li>
       <li><img src="/static/0750/images/lock.png" class="img" /><input type="password" name="password" id="login-password" placeholder="账户密码" class="text" /></li>
            <li class="noStyle"><div class="area button"><input type="submit" value="登录<?php echo $INI['system']['abbreviation']; ?>" class="loginBtn" id="login-submit" /></div>
        <input type="hidden" name="redirect" value="" />
        <input type="hidden" name="goods_id" value="0" />
        <input type="hidden" name="quantity" value="0" />
        <input type="hidden" name="m" value="User" />
        <input type="hidden" name="a" value="doLogin" /></li>
        </form>
     <li class="noStyle font"><i>还有没有<?php echo $INI['system']['abbreviation']; ?>团购网会员账号？<a href="/account/signup.php">立即注册一个</a></i></li>
         <li class="noStyle font func">
      <p>你也可以使用以下网站账号登录</p>
      
      
      <p style="margin-top:10px;">
      <a href="/thirdpart/qzone/index.php" target="_blank"><img alt="使用QQ账号登录" src="/static/0750/images/Connect_logo_1.png">QQ登录</a>
        <!--{/if}-->
      <?php if(option_yes('sinalogin')){?>
      <a href="/thirdpart/sina/login.php" target="_blank"><em class="sinaweibo"></em>新浪微博账号登录</a>
         <?php }?>
                <?php if(option_yes('qqlogin')){?>
				   <p><a href="/thirdpart/qq/index.php"><img src="/static/css/i/qq.png" /></a></p>
				   <?php }?>
         		   <?php if($INI['alipay']['alifast'] == 'Y'){?>
				   <p><a href="/alifast/auth_authorize.php"><img src="/static/css/i/btn_login_zfbkj.png" /></a></p>
				   <?php }?>
      </p>
     </li>
        </ul>
   </div>
  </div>
 </div>
</div>
<script type="text/javascript">
jQuery(function($){
	$("#login-submit").click(function(){
		
		if($.trim($("#login-email-address").val()).length == 0)
		{
			$.showErr("请输入您的 Email/用户账号");
			$("#login-email-address").focus();
			return false;
		}
		
		/*del by chenfq 2010-06-26 可以支持用户名登录
		if(!$.checkEmail($("#login-email-address").val()))
		{
			$.showErr("您输入了错误的 Email 地址");
			$("#login-email-address").focus();
			return false;
		}
		*/
		if(!$.minLength($("#login-password").val(),4,false))
		{
			$.showErr("请输入正确的密码");
			$("#login-password").focus();
			return false;
		}
	});
});
    
        var weixin_login_to = null;
    show_weinxin_qrcode();
    function show_weinxin_qrcode(){
        $.ajax({
            url : ROOT_PATH + "/index.php?m=Ajax&a=weixin_qrcode",
            cache : false,
            type : 'POST',
            dataType : 'json',
            success : function(data)
            {
                if(data.type == 1)
                {
                    if(data.data.img_url)
                    {
                        $("#weixin_qrcode").show().attr("src", data.data.img_url);
                        s_check_weixin_login();
                    }
                }
                else
                    alert(data.msg);
            }
        });
        return false;
    }
    
    
    function s_check_weixin_login()
    {
        clearTimeout(weixin_login_to);
        weixin_login_to = setTimeout(function(){check_weixin_login();},5000);
    }
    
    function check_weixin_login()
    {
        $.ajax({
            url : ROOT_PATH + "/index.php?m=Ajax&a=weixin_check_login",
            cache : false,
            type : 'POST',
            dataType : 'json',
            success : function(data){
                if(data.type == 1) // 已登录
                {
                    window.location.href = ROOT_PATH+"/index.php?m=User&a=login_weixin&redirect="+encodeURIComponent("")+"&goods_id=0";
                }
                else if(data.type == 0)// 未登录
                {
                    s_check_weixin_login();
                }
                else if(data.type == -1)// 二维码失效
                {
                    show_weinxin_qrcode();
                }
            }
        });
    }
    </script>
<div class="foot bdc">
 <p><a href="/about/us.php">关于<?php echo $INI['system']['abbreviation']; ?>团</a>
 <a href="/about/job.php">招兵买马</a>
 <a href="/help/faqs.php">常见问题</a>
 <a href="/about/contact.php">联系我们</a>
 <a href="/about/terms.php">用户协议</a></p>
 
 
<p>&copy;<span>2010</span>&nbsp;<?php echo $INI['system']['sitename']; ?>（<?php echo $INI['system']['abbreviation']; ?>）版权所有&nbsp;<a href="/about/terms.php">使用<?php echo $INI['system']['abbreviation']; ?>前必读</a>&nbsp;<a href="http://www.miibeian.gov.cn/" target="_blank"><?php echo $INI['system']['icp']; ?></a>&nbsp;Powered by <a href="/index.php" target="_blank"><?php echo $INI['system']['abbreviation']; ?></a> software.<?php if($INI['system']['statcode']){?>&nbsp;<?php echo $INI['system']['statcode']; ?><?php }?></p>
</div>
<script type="text/javascript" src="/static/0750/js/common.js"></script>
<script type="text/javascript">
(function($){
    var err_time = null;
    $.showErr = function(val){
        clearTimeout(err_time);
        var login_error = $("#login_error");
        var login_success = $("#login_success");
        login_error.show().find(".area").html(val);
        login_success.hide();
        err_time = setTimeout(function(){login_error.hide();},5000);
    }
    $.showSuccess = function(val){
        clearTimeout(err_time);
        var login_error = $("#login_error");
        var login_success = $("#login_success");
        login_success.show().find(".area").html(val);
        login_error.hide();
        err_time = setTimeout(function(){login_error.hide();},5000);
    }
})(jQuery);
</script>

</body>
</html>