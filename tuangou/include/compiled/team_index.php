<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="ZH-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="edge" />
<?php include template("meta_and_title");?>
<link rel="icon" href="favicon.ico" type="/image/x-icon" />
<link rel="shortcut icon" href="favicon.ico" type="/image/x-icon" />
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

</head>

<body>
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
 

 <?php if(is_array($teams)){foreach($teams AS $index=>$one) { ?>  
   <div class="block <?php if($index%3 == 2){?>nomarginright<?php }?>">
  <div class="blockinside">
   <div class="picture">
     <!-- 如果是特卖则显示 -->
              <a href="/team.php?id=<?php echo $one['id']; ?>" target="_blank">
               <img src="<?php echo team_image($one['image']); ?>" width="248" height="158" />
    </a>
   </div>
   <div class="title"><a href="/team.php?id=<?php echo $one['id']; ?>" title="" target="_blank"><em><?php echo get_area_name($one['area_id']); ?></em><span><?php echo $one['title']; ?></span></a></div>
   <div class="price">
    <span class="fee">
     <span class="symbol">￥</span>
    <span class="bf"><?php echo $one['team_price']; ?></span>
    </span>
    <span class="sale">
     <span class="discount"><?php echo team_discount($one); ?>折33</span>
     <span class="exfee"><?php echo $currency; ?><?php echo moneyit($one['market_price']); ?></span>
    </span>
    <span class="buyer">
     <b><?php echo $one['now_number']; ?></b>人已购买
    </span>
   </div>
   </div>
     </div>
  <?php }}?>      
     
     
  <div class="pageturning"></div>    </div>
</div>

<?php include template("foot_ctn");?>

</body>
</html>