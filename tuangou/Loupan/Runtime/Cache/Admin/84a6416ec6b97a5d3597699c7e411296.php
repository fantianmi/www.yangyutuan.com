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
var URL = '/Loupan/index.php/Admin/Extend';
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
<div class="pad-10" >
    <form name="searchform" action="" method="get" >
    <table width="100%" cellspacing="0" class="search-form">
        <tbody>
            <tr>
            <td>
            <div class="explain-col">
            	操作时间筛选：         
				<link rel="stylesheet" type="text/css" href="/Loupan/public/js/calendar/calendar-blue.css"/>
            <script type="text/javascript" src="/Loupan/public/js/calendar/calendar.js"></script>
        <input class="date input-text" type="text" name="time_start" id="time_start" size="18" value="<?php echo ($time_start); ?>" />    
                    <script language="javascript" type="text/javascript">
                        Calendar.setup({
                            inputField     :    "time_start",
                            ifFormat       :    "%Y-%m-%d",
                            showsTime      :    "true",
                            timeFormat     :    "24"
                        });
         </script>
                -      
				
        <input class="date input-text" type="text" name="time_end" id="time_end" size="18" value="<?php echo ($time_end); ?>" />    
                    <script language="javascript" type="text/javascript">
                        Calendar.setup({
                            inputField     :    "time_end",
                            ifFormat       :    "%Y-%m-%d",
                            showsTime      :    "true",
                            timeFormat     :    "24"
                        });
         </script> 
                <input type="hidden" name="m" value="Extend" />
                <input type="hidden" name="a" value="adminLog" />&nbsp;&nbsp;
                <input type="submit" name="search" class="button" value="搜索" />
        	</div>
            </td>
            </tr>
        </tbody>
    </table>
    </form>

    <form id="myform" name="myform" action="<?php echo u('Extend/log_delete');?>" method="post" onsubmit="return check();">
    <div class="table-list">
    <table width="100%" cellspacing="0">
        <thead>
            <tr>
                <th width=50>ID</th>
                <th width=25><input type="checkbox" value="" id="check_box" onclick="selectall('id[]');"></th>               
                <th width=100>用户名</th>
                <th>操作记录</th>
                <th width=150>操作时间</th> 
				<th width="80">登陆ip</th>
            </tr>
        </thead>
    	<tbody>
        <?php if(is_array($lists)): $i = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><tr>       
		 	<td align="center"><?php echo ($val["id"]); ?></td> 	
            <td align="center">
           	 <input type="checkbox" value="<?php echo ($val["id"]); ?>" name="id[]">
			</td>          
            <td align="center"><b><?php echo ($val["username"]); ?></b></td>
            <td align="left"><b><?php echo ($val["info"]); ?></b></td>
            <td align="center"><?php echo (date('Y-m-d H:i',$val["add_time"])); ?></td>
            <td align="center"><b><?php echo ($val["ip"]); ?></b></td><?php endforeach; endif; else: echo "" ;endif; ?>
    	</tbody>
    </table>

    <div class="btn">
    	<label for="check_box" style="float:left;"><?php echo (L("select_all")); ?>/<?php echo (L("cancel")); ?></label>
    	<input type="submit" class="button" name="dosubmit" value="<?php echo (L("delete")); ?>" onclick="return confirm('<?php echo (L("sure_delete")); ?>')" style="float:left;margin:0 10px 0 10px;"/>
    	
    	<div id="pages"><?php echo ($page); ?></div>
    </div>

    </div>
    </form>
</div>
<script language="javascript">  
function check(){ 
	var ids='';
	$("input[name='id[]']:checked").each(function(i, n){
			ids += $(n).val() + ',';
	});

	if(ids=='') {
			window.top.art.dialog({content:'请至少选择一条信息',lock:true,width:'200',height:'50',time:1.5},function(){});
			return false;
	} 
	return true;
} 
</body>
</html>