<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8"><meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<title><?php echo $INI['system']['abbreviation']; ?></title>
<script src="style/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="style/common_css_0_6c6ef1d.css"><link rel="stylesheet" type="text/css" href="style/login_css_0_d77a8ad.css">
</head>
<body mon="position=reg">
<header class="w-header" mon="type=header">
<a class="arrow-wrap" href="javascript:history.back()" mon="content=back">
<span class="arrow-left"></span>
</a>
<a href="#" class="home" mon="content=home"></a>
<div class="text">注册</div>
</header>
<article class="p-reg p-login-common" mon="action=click" id="j-reg">
<form class="content phone-content j-content active" action="/wap/signup.php" method="post">
<div class="code-area">
<div class="input-wrap">
  <input type="text"  name="email" id="signup-email-address" class="common-text" value="<?php echo $_POST['email']; ?>" require="true" datatype="email|ajax" url="<?php echo WEB_ROOT; ?>/ajax/validator.php" vname="signupemail" msg="邮箱格式不正确|邮箱已经被注册"   placeholder="请输入您的邮箱，推荐QQ邮箱"/>
</div>
</div>
<div>
    <input type="text" name="username" id="signup-username" class="common-text" value="<?php echo $_POST['username']; ?>" datatype="limit|ajax" require="true" min="2" max="16" maxLength="16" url="<?php echo WEB_ROOT; ?>/ajax/validator.php" vname="signupname" msg="请填写用户名|用户名已经被使用" placeholder="填写4-16个字符"/>
</div>
<div class="passwd">
<input type="password"  name="password" id="signup-password" class="common-text" require="true" datatype="require"  msg="请填写密码" placeholder="请设置您的密码"/>
</div>
<div class="passwd">
 <input type="password" name="password2" id="signup-password-confirm"  class="common-text" require="true" datatype="compare" compare="signup-password" msg="请再次输入密码" placeholder="请再次输入密码"/>
</div>
</article>
<footer class="p-reg-footer">
<section class="btns clearfix">
<input  class="btn"   type="submit" value="同意以下协议并注册" name="commit" id="signup-submit" />
</form>
</section>
<div class="xieyi">
<a href="wap_help_b.php" class="link">《用户协议》</a>
</div>
</footer>
<?php include template("m_footer");?>
</body></html>
