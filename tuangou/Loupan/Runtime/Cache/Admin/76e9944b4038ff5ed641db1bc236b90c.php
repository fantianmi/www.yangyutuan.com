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
    <form action="" method="post" name="myform" id="myform" >
        <input type="hidden" name="id" value="<?php echo ($id); ?>" />
        <table width="100%" cellpadding="2" cellspacing="1" class="table_form">
            <tr>
                <th>状态 :</th>
                <td><input type="radio" name="status" value="1" 
                    <?php if($status == 1): ?>checked<?php endif; ?>
                    >&nbsp;启用&nbsp;&nbsp;&nbsp; <input type="radio" name="status" value="0" 
                    <?php if($status == 0): ?>checked<?php endif; ?>
                    >&nbsp;禁用</td>
            </tr>
        </table>
        <input type="submit" id="dosubmit" class="dialog" value="">
    </form>
</div>
</body></html>