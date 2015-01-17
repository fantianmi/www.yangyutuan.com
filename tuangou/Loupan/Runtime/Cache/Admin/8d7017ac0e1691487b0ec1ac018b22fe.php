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
var URL = '/Loupan/index.php/Admin/Sys';
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
    <form id="myform" name="myform" action="" method="post" onsubmit="return check();">
    <div class="table-list">
    <table width="100%" cellspacing="0">
        <thead>
            <tr>
                <th width=50>ID</th>
                <th width=25><input type="checkbox" value="" id="check_box" onclick="selectall('id[]');"></th>               
                <th width=280>图片</th>
                <th width="150">创建时间</th>
                <th width=250>URL</th>
                <th width="40">状态</th>
        <th width="80">编辑</th>
            </tr>
        </thead>
      <tbody>
        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><tr>       
      <td align="center"><a href="<?php echo U('Article/edit', array('id'=>$val['id']));?>"><?php echo ($val["id"]); ?></a></td>   
            <td align="center">
             <input type="checkbox" value="<?php echo ($val["id"]); ?>" name="id[]">
      </td>           
            <td align="center"><img src="/Loupan<?php echo ($val["path"]); ?>" width="50" alt="60"/></td>
            <td align="center"><b><?php echo (date("Y-m-d H:i:s",$val["ctime"])); ?></b></td>
            <td align="center"><b><?php echo ($val["url"]); ?></b></td>
          <td align="center" onclick="status(<?php echo ($val["id"]); ?>,'status')" id="status_<?php echo ($val["id"]); ?>"><img src="/Loupan/Public/Admin/images/status_<?php echo ($val["status"]); ?>.gif" /></td>
      <td align="center"><a href="javascript:edit(<?php echo ($val["id"]); ?>)">编辑</a></td><?php endforeach; endif; else: echo "" ;endif; ?>
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
function edit(id) {
  var lang_edit = "编辑";
  window.top.art.dialog({id:'edit'}).close();
  window.top.art.dialog({title:lang_edit+'--'+name,id:'edit',iframe:'/Loupan/index.php/Admin/Sys/editImg/id/'+id,width:'480',height:'250'}, function(){var d = window.top.art.dialog({id:'edit'}).data.iframe;d.document.getElementById('dosubmit').click();return false;}, function(){window.top.art.dialog({id:'edit'}).close()});
}

var lang_cate_name = "资讯标题";
function check(){
  if($("#myform").attr('action') != '<?php echo u("Article/sort_order");?>') {
    var ids='';
    $("input[name='id[]']:checked").each(function(i, n){
      ids += $(n).val() + ',';
    });

    if(ids=='') {
      window.top.art.dialog({content:lang_please_select+lang_cate_name,lock:true,width:'200',height:'50',time:1.5},function(){});
      return false;
    }
  }
  return true;
}

</script>
</body>
</html>