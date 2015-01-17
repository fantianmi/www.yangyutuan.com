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
<div class="pad-10" >
    <div class="table-list">
    <table width="100%" cellspacing="0">
        <thead>
            <tr>
                <th width="25">编号</th>
                <th width=10><input type="checkbox" value="" id="check_box" onclick="selectall('id[]');"></th>
                <th width=35>名称</th>
				<th width=35>标识</th>							
				<th width=150>描述</th>					
				<th width=30>作者</th>
				<th width=30>版本</th> 			
                <th width=30>状态</th>
				<th width=30>操作</th>
            </tr>
        </thead>
    	<tbody>
        <?php if(is_array($list)): $k = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($k % 2 );++$k;?><tr>
            	<td align="center"><?php echo ($val["id"]); ?></td>
                <td align="center"><input type="checkbox" value="<?php echo ($val["id"]); ?>" name="id[]"></td>
                <td align="center"><a href="javascript:void(0);"><em class="blue"><?php echo ($val["title"]); ?></em></a></td>		   
                <td align="center"><?php echo ($val["name"]); ?></td>
                <td align="center"><?php echo ($val["description"]); ?></td>
    		 	<td  align="center"><?php echo ($val["author"]); ?></td>
    		    <td  align="center"><?php echo ($val["version"]); ?></td>
                <td align="center" <?php if($val['status']): ?>style="color:green"<?php else: ?>style="color:red"<?php endif; ?>><?php if($val['status']): ?>启用<?php else: ?>禁用<?php endif; ?></td>
    		   <td align="center"><a href="javascript:edit(<?php echo ($val["id"]); ?>,'<?php echo ($val["name"]); ?>')">编辑</a></td>
            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
    	</tbody>
    </table>
    <div class="btn">
    	<label for="check_box" style="float:left;">全选/取消</label>
    	<input type="submit" class="button" name="dosubmit" value="<?php echo (L("delete")); ?>" onclick="return confirm('<?php echo (L("sure_delete")); ?>')" style="float:left;margin:0 10px 0 10px;"/>
    	<div id="pages"><?php echo ($page); ?></div>
    </div>
    </div>
</div>

<script language="javascript">
function edit(id, name) {
	var lang_edit = "<?php echo (L("edit")); ?>";
	window.top.art.dialog({id:'edit'}).close();
	window.top.art.dialog({title:lang_edit+'--'+name,id:'edit',iframe:'/WhereReadyNews/index.php/Admin/Addons/editAddons/id/'+id,width:'420',height:'200'}, 
		function(){
			var d = window.top.art.dialog({id:'edit'}).data.iframe;
			d.document.getElementById('dosubmit').click();
			return false;
		}, 
		function(){
			window.top.art.dialog({id:'edit'}).close();
		}
	);
}
function status(id,type){
    $.get("<?php echo u('User/status');?>", { id: id, type: type }, function(jsondata){
		var return_data  = eval("("+jsondata+")");
		$("#"+type+"_"+id+" img").attr('src', '/WhereReadyNews/statics/images/status_'+return_data+'.gif')
	}); 
}
</script>
</body>
</html>