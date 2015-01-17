<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<link href="/Loupan/Public/Admin/css/style.css" rel="stylesheet" type="text/css"/>
<link href="/Loupan/Public/Admin/css/dialog.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript" src="/Loupan/Public/Admin/js/jquery/jquery-1.7.min.js"></script>
<script language="javascript" type="text/javascript" src="/Loupan/Public/Admin/js/jquery/plugins/formvalidator.js"></script>
<script language="javascript" type="text/javascript" src="/Loupan/Public/Admin/js/jquery/plugins/formvalidatorregex.js"></script>

<script language="javascript" type="text/javascript" src="/Loupan/Public/Admin/js/admin_common.js"></script>
<script language="javascript" type="text/javascript" src="/Loupan/Public/Admin/js/dialog.js"></script>
<script language="javascript" type="text/javascript" src="/Loupan/Public/Admin/js/iColorPicker.js"></script>

<script language="javascript">
var URL = '/Loupan/index.php/Admin/Public';
var ROOT_PATH = '/Loupan';
var APP	 =	 '/Loupan/index.php';
var lang_please_select = "<?php echo (L("please_select")); ?>";
var def=<?php echo ($def); ?>;
$(function($){
	$("#ajax_loading").ajaxStart(function(){
		$(this).show();
	}).ajaxSuccess(function(){
		$(this).hide();
	});
});

$(document).click(function (){
	window.parent.maxtime = "<?php echo ($setting['logout_time']); ?>";
	
});
</script>
<title><?php echo (L("website_manage")); ?></title>
</head>
<body>
<div id="ajax_loading">提交请求中，请稍候...</div>
<?php if($show_header != false): if(($sub_menu != '') OR ($big_menu != '')): ?><div class="subnav">
    <div class="content-menu ib-a blue line-x">
    	<?php if(!empty($big_menu)): ?><a class="add fb" href="<?php echo ($big_menu["0"]); ?>"><em><?php echo ($big_menu["1"]); ?></em></a><?php endif; ?>
    </div>
</div><?php endif; endif; ?>
<link href="/Loupan/Public/Admin/css/main.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
$(function(){	
	$(".main_con").hover(
			  function () {
			    $(this).css("background","#ffffcc");
			  },
			  function () {
			    $(this).css("background","#ffffff");
			  }
	);
})
</script>
<div style="padding:10px; overflow:hidden;">
	<div class="main_top" style="clear:both;">			
		<?php if($no_security_info == 1): ?><h4>安全提示</h4>	
			 <?php if(is_array($security_info)): $i = 0; $__LIST__ = $security_info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><p class="red" style="font-size:14px;">※　<?php echo ($v); ?></p><?php endforeach; endif; else: echo "" ;endif; endif; ?>	
		<h4>网站无法显示</h4>	
		<p class="green">网站以前正常显示，现在无法显示请清除缓存试试，【<a href="javascript:void(0);" onclick="$.get('/Loupan/cc.php');alert('缓存清理成功。')"><?php echo (L("flush_cache")); ?></a>】</p>
		
	</div>
	<div style="width:99%;" class="fl">
		<div class="main_con fl">
			<h6>版权信息</h6>
			<div class="content">
								
				<p>开发与支持团队：爱书很多年</p>
				<p>UI/美工设计：爱书很多年</p>				
				<div class="hr">			
				</div>		 
			</div>
		</div>		
		<div class="main_con fl">
			<h6>配置信息</h6>
			<div class="content">				
				<?php if(is_array($server_info)): $i = 0; $__LIST__ = $server_info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><p><?php echo ($key); ?> : <?php echo ($v); ?></p><?php endforeach; endif; else: echo "" ;endif; ?>
				<div class="hr">			
				</div>					
			
			</div>
		</div>		
	</div> 
</div>
</body>
</html>