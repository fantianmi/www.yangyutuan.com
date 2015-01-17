<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="ZH-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/static/0750/css/login.css" rel="stylesheet" type="text/css" />
<script src="/static/0750/js/j.js" type="text/javascript"></script>
<script src="/static/0750/js/jquery.jcookie.min.js" type="text/javascript"></script>
<script src="/static/0750/js/js_lang.js" type="text/javascript"></script>
<script src="/static/js/index.js" type="text/javascript"></script>


<?php include template("meta_and_title");?>



</head>

<body id="login"><div class="loginPage lp bangdingChoose bdc signup su">
 <div class="logo">
  <a href="/index.php" class="l" title=""></a>
 </div>
 <div class="loginPanel lpl">
  <div class="login signThis">
   <div class="input">
    <ul>
     <li class="noStyle signup_selector ss lo" style="margin-top:0;">
      <span>账号注册</span>
            
     </li>
        <form id="signup-user-form" method="post" action="/account/signup.php">
        
       <?php if($session_notice=Session::Get('error',true)){?>
          <li id="" class="noStyle"><div class="area error"><?php echo $session_notice; ?></div></li>
     <?php }?>
     
     
   

    <li class="noStyle lo">
         <div class="area">
            <div class="font">
            <label for="signup-password-confirm">Email</label>
            </div>
            <div class="input"> 
            <input type="text" size="30" name="email" id="signup-email-address" class="f-input" value="<?php echo $_POST['email']; ?>" require="true" datatype="email|ajax" url="<?php echo WEB_ROOT; ?>/ajax/validator.php" vname="signupemail" msg="Email格式不正确|Email已经被注册" /> 
            </div>
        </div>
    </li>
        <li class="noStyle lo">
         <div class="area">
            <div class="font">
            <label for="signup-password-confirm">用户名</label>
            </div>
            <div class="input"> 
             <input type="text" size="30" name="username" id="signup-username" class="f-input" value="<?php echo $_POST['username']; ?>" datatype="limit|ajax" require="true" min="2" max="16" maxLength="16" url="<?php echo WEB_ROOT; ?>/ajax/validator.php" vname="signupname" msg="用户名长度受限|用户名已经被使用" />
            </div>
        </div>
    </li>
    
    
    <li class="noStyle lo">
         <div class="area">
            <div class="font">
            <label for="signup-password-confirm">密码</label>
            </div>
            <div class="input"> 
            <input type="password" size="30" name="password" id="signup-password" class="f-input" require="true" datatype="require" />
            </div>
        </div>
    </li>
    
     <li class="noStyle lo">
         <div class="area">
            <div class="font">
            <label for="signup-password-confirm">确认密码</label>
            </div>
            <div class="input"> 
            <input type="password" size="30" name="password2" id="signup-password-confirm" class="f-input" require="true" datatype="compare" compare="signup-password" />
            </div>
        </div>
    </li> 
    
     <?php if(!option_yes('mobilecode')){?>
         <li class="noStyle lo">
         <div class="area">
            <div class="font">
            <label for="signup-password-confirm">手机号码</label>
            </div>
            <div class="input"> 
            <input type="text" size="30" name="mobile" id="signup-mobile" class="number" require="<?php echo option_yes('needmobile')?'true':'require'; ?>" datatype="mobile|ajax" url="<?php echo WEB_ROOT; ?>/ajax/validator.php" vname="signupmobile" msg="手机号码不正确|手机号码已经被注册" />
            </div>
        </div>
    </li> 
     <?php }?>
    
    	<?php if(option_yes('verifyregister')){?>
						<?php include template("block_block_captcha");?>
	  <?php }?>
    
    <li class="noStyle lo">
         <div class="area">
            <div class="font">
            <label for="signup-password-confirm">所在城市</label>
            </div>
            <div class="input"> 
          <select name="city_id" class="f-city"><?php echo Utility::Option(Utility::OptionArray($allcities,'id','name'), $city['id']); ?><option value='0'>其他</option></select>
            </div>
        </div>


    
    
           <li class="noStyle" style="width:295px;">
        <input type="submit" value="注册" name="commit" id="signup-submit" class="loginBtn" style="border-left:1px solid #3b9028; height:34px; border-right:1px solid #3b9028;"/>
     </li>
   </form>

         <li class="noStyle font func">
      <p>你也可以使用以下网站账号登录</p>
      
      <p style="margin-top:10px;">

      
           <?php if(option_yes('qzonelogin')){?> 
      <a href="/thirdpart/qzone/index.php" target="_blank"><img alt="使用QQ账号登录" src="/static/0750/images/Connect_logo_1.png">QQ登录</a>
        <?php }?>
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
  <div class="chooseType ct signup">
   <p>我已经有<?php echo $INI['system']['abbreviation']; ?>团购网的账号了</p>
   <p><a href="/account/login.php" class="signnow returnLogin">立即登录</a></p>
   <p><span id="red">我忘记密码了，想找回账号</span></p>
   <p><a href="/account/repass.php" class="signnow">立即找回</a></p>
  </div>
 </div>
</div>
<div class="foot bdc">
 <p><a href="/about/us.php">关于<?php echo $INI['system']['abbreviation']; ?>团</a>
 <a href="/about/job.php">招兵买马</a>
 <a href="/help/faqs.php">常见问题</a>
 <a href="/about/contact.php">联系我们</a>
 <a href="/about/terms.php">用户协议</a></p>
<p>&copy;<span>2010</span>&nbsp;<?php echo $INI['system']['sitename']; ?>（<?php echo $INI['system']['abbreviation']; ?>）版权所有&nbsp;<a href="/about/terms.php">使用<?php echo $INI['system']['abbreviation']; ?>前必读</a>&nbsp;<a href="http://www.miibeian.gov.cn/" target="_blank"><?php echo $INI['system']['icp']; ?></a>&nbsp;Powered by <a href="/index.php" target="_blank"><?php echo $INI['system']['abbreviation']; ?></a> software.<?php if($INI['system']['statcode']){?>&nbsp;<?php echo $INI['system']['statcode']; ?><?php }?></p>

</body>
</html>