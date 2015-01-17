<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="ZH-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="edge" />

<?php include template("meta_and_title");?>
<script src="/static/js/index.js" type="text/javascript"></script>

<link rel="icon" href="favicon.ico" type="/image/x-icon" />
<link rel="shortcut icon" href="favicon.ico" type="/image/x-icon" />
<link rel="stylesheet" href="/static/css/index.css" type="text/css" media="screen" charset="utf-8" />
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


<script type="text/javascript">var WEB_ROOT = '<?php echo WEB_ROOT; ?>';</script>
<script type="text/javascript">var LOGINUID= <?php echo abs(intval($login_user_id)); ?>;</script>

<?php echo Session::Get('script',true);; ?>

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
<div id="dialog"></div>
<?php include template("head_ctn");?>

<script type="text/javascript">
$('.ptl .choose a').hover(function(){
	$('.ptl .tl').show();
},function(){});
$('.ptl').hover(function(){},
    function(){
        $('.ptl .tl').hide();
    });
</script>
<div class="content" style="border-top:none;margin-top:20px;">
 <div class="panel p1">
 
<?php if(is_array($goods)){foreach($goods AS $tindex=>$one) { ?>  
 
 <div class="block <?php if($tindex%3 == 2){?>nomarginright<?php }?>">
 
  <div class="blockinside">
  <div class="picture">
          
           <img src="<?php echo team_image($one['image']); ?>" width="342" height="218" /></div>
   <div class="title"><span><?php echo mb_strimwidth($one['title'],0,86,'...'); ?></span></div>
   <div class="price">
    <span class="fee">
     <span class="bf"><?php echo $one['score']; ?></span>
     <span class="symbol">积分</span>
    </span>
    <span class="sale">
       <span class="discount">剩<?php echo $one['number']-$one['consume']; ?></span>
       <span>限兑：<?php echo $one['per_number']; ?></span>
    </span>
    <span style="padding:10px 0 0 20px; line-height:36px; font-size:16px;"><a href="/credit/ajax.php?id=<?php echo $one['id']; ?>&action=exchange" class="ajaxlink" ask="确定使用<?php echo $one['score']; ?>点积分兑换<?php echo $one['title']; ?>吗？">马上兑换</a></span>
    <span class="buyer"><b><?php echo $one['consume']; ?></b>人已兑换</span>
   </div>
   </div>
  </div>
 <?php }}?> 
  
  


	
    </div>
</div>





<?php include template("foot_ctn");?>




</body>
</html>