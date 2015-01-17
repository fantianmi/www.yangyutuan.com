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
                    	<input type='button' class="button" id='btn1' value='数据库列表' /> &nbsp;&nbsp;
                        <input type='button' class='button' id='btn2' value='已备份数据sql文件' />
                	</div>
                </td>
            </tr>
        </tbody>
    </table>
    </form>

    
    <form class="btn1" name="myform" action="" method="post" onsubmit="return check();">
    <table width="100%" cellspacing="0" class="search-form"> 
        <tr> 
            <td> 
                <div class="explain-col">
                    数据库使用总大小：<?php echo ($total); ?> 
                    <input type="submit" class="button" name="dosubmit" value="开始备份数据库"  style="margin:0 10px 0 100px;"/>
                </div> 
            </td> 
        </tr> 
    </table>    
    
    <div class="table-list">
    <table width="100%" cellspacing="0">
        <thead>
            <tr> 
                <th width=25><input type="checkbox" value="" id="check_box" onclick="selectall('table[]');"></th> 
                <th>表名</th>
                <th>类型</th>
                <th>编码</th> 
				<th>记录数</th>
                <th>使用空间</th>
                <th>碎片</th>
                <th>操作</th>
            </tr>
        </thead>
    	<tbody>
        <?php if(is_array($tables)): $i = 0; $__LIST__ = $tables;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><tr>        
            <td align="center">
           	 <input type="checkbox" value="<?php echo ($val["Name"]); ?>" name="table[]">
			</td>          
            <td align="center"><?php echo ($val["Name"]); ?></td>
            <td align="center"><?php echo ($val["Engine"]); ?></td>
            <td align="center"><?php echo ($val["Collation"]); ?></td>
            <td align="center"><?php echo ($val["Rows"]); ?></td>
            <td align="center"><?php echo ($val["size"]); ?></td>
            <td align="center"><?php echo ($val["Data_free"]); ?></td>
            <td align="center">
                <a href="<?php echo U('Extend/optimizeData', array('table'=>$val['Name']));?>" class='blue'>优化</a> |
                <a href="<?php echo U('Extend/repairData', array('table'=>$val['Name']));?>" class='blue'>修复</a>
            </td><?php endforeach; endif; else: echo "" ;endif; ?>
    	</tbody>
    </table>

    <div class="btn22">
    	<label for="check_box" style="float:left;"><?php echo (L("select_all")); ?>/<?php echo (L("cancel")); ?></label> 
    </div>

    </div>
    </form>

    
    <form class="btn2" style='display:none'>
        <div class="table-list">
            <table width="100%" cellspacing="0">
                <thead>
                    <tr>  
                        <th>文件名称</th>
                        <th>文件大小</th>
                        <th>备份时间</th>  
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                <?php if(is_array($sqlinfo)): $i = 0; $__LIST__ = $sqlinfo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><tr>                
                    <td align="center"><?php echo ($val["filename"]); ?></td>
                    <td align="center"><?php echo ($val["filesize"]); ?></td>
                    <td align="center"><?php echo ($val["maketime"]); ?></td> 
                    <td align="center">
                        <a href="/Loupan/Data/Sql/<?php echo ($val["filename"]); ?>" class='blue'>下载</a> |
                        <a href="<?php echo U('Extend/delData', array('sql'=>$val['filename']));?>" class='blue' onclick="if(!confirm('确认删除次备份文件吗？')){return false;}">删除</a>
                    </td><?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table> 
        </div>
    </form>    
</div>
<script language="javascript">  
function check(){ 
	var ids='';
	$("input[name='table[]']:checked").each(function(i, n){
			ids += $(n).val() + ',';
	});

	if(ids=='') {
			window.top.art.dialog({content:'选择要备份的数据表',lock:true,width:'200',height:'50',time:1.5},function(){});
			return false;
	} 
	return true;
} 

$("#btn1").click(function (){
    $(".btn1").show();
    $(".btn2").hide();
});
$("#btn2").click(function (){
    $(".btn1").hide();
    $(".btn2").show();
});
</script>
</body>
</html>