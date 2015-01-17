<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<link href="/WhereReadyNews/Public/Admin/css/style.css" rel="stylesheet" type="text/css"/>
<link href="/WhereReadyNews/Public/Admin/css/dialog.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript" src="/WhereReadyNews/Public/Admin/js/jquery/jquery-1.7.min.js"></script>
<script language="javascript" type="text/javascript" src="/WhereReadyNews/Public/Admin/js/jquery/plugins/formvalidator.js"></script>
<script language="javascript" type="text/javascript" src="/WhereReadyNews/Public/Admin/js/jquery/plugins/formvalidatorregex.js"></script>

<script language="javascript" type="text/javascript" src="/WhereReadyNews/Public/Admin/js/admin_common.js"></script>
<script language="javascript" type="text/javascript" src="/WhereReadyNews/Public/Admin/js/dialog.js"></script>
<script language="javascript" type="text/javascript" src="/WhereReadyNews/Public/Admin/js/iColorPicker.js"></script>

<script language="javascript">
var URL = '/WhereReadyNews/index.php/Admin/Addons';
var ROOT_PATH = '/WhereReadyNews';
var APP	 =	 '/WhereReadyNews/index.php';
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
<div class="pad_10">
<form action="<?php echo u('Adboard/add');?>" method="post" name="myform" id="myform" >
<table width="100%" cellpadding="2" cellspacing="1" class="table_form">
	<tr> 
      <th width="80">广告位名称 :</th>
      <td><input type="text" name="name" id="name" class="input-text" size="30"></td>
    </tr>
    <tr> 
      <th width="80">广告位类型 :</th>
      <td>
        <select name="type">
        	<?php if(is_array($adboard_types)): $key = 0; $__LIST__ = $adboard_types;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($key % 2 );++$key;?><option value="<?php echo ($val["alias"]); ?>"><?php echo ($val["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
        </select> 
      </td>
    </tr>
    <tr> 
      <th>广告位尺寸 :</th>
      <td>宽 : <input type="text" name="width" id="width" class="input-text" size="6" value="300" onkeyup="value=value.replace(/[^\d]/g,'')"onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"> px&nbsp;&nbsp;&nbsp;&nbsp;高 : <input type="text" name="height" id="height" class="input-text" size="6" value="300" onkeyup="value=value.replace(/[^\d]/g,'')"onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"> px</td>
    </tr>
    <tr> 
      <th>广告位说明 :</th>
      <td><textarea rows="4" cols="45" class="input-textarea" id="description" name="description"></textarea></td>
    </tr>
    <tr>
      <th>状态 :</th>
      <td>
      	<select name="status">
        	<option value="0">关闭</option>
            <option value="1" selected="selected">开启</option>
        </select> 
      </td>
    </tr>
</table>

<input type="submit" name="dosubmit" id="dosubmit" class="dialog" value="">
</form>
<script type="text/javascript">
	$(function(){
		$.formValidator.initConfig({formid:"myform",autotip:true,onerror:function(msg,obj){window.top.art.dialog({content:msg,lock:true,width:'250',height:'50'}, function(){this.close();$(obj).focus();})}});
		
		$("#name").formValidator({onshow:"不能为空",onfocus:"不能为空"}).inputValidator({min:1,onerror:"请填写广告名称"});
	})
</script>
</div>
</body>
</html>