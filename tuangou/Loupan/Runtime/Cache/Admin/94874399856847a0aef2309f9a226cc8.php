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
var URL = '/Loupan/index.php/Admin/Setting';
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
<form id="myform" name="myform" action="<?php echo u('Setting/edit');?>" enctype="multipart/form-data" method="post">
  <div class="pad-10">
    <div class="col-tab">
      <ul class="tabBut cu-li">
        <li id="tab_setting_1" class="on" onclick="SwapTab('setting','on','',3,1);"><?php echo L('site_info');?></li>	
		<li id="tab_setting_2" onclick="SwapTab('setting','on','',3,2);"><?php echo L('mail_info');?></li>		       
		<li id="tab_setting_3" onclick="SwapTab('setting','on','',3,3);"><?php echo L('site_status');?></li>		
      </ul>      
      <div id="div_setting_1" class="contentList pad-10">
          <table width="100%" cellpadding="2" cellspacing="1" class="table_form">
            <tr>
              <th width="120"><?php echo L('site_name');?> :</th>
              <td><input type="text" name="site[site_name]" size="80" value="<?php echo ($set["site_name"]); ?>"></td>
            </tr>
            <tr>
              <th width="120"><?php echo L('site_domain');?> :</th>
              <td><input type="text" name="site[site_domain]" size="80" value="<?php echo ($set["site_domain"]); ?>"></td>
            </tr>    
			<tr>
              <th><?php echo L('site_title');?>:</th>
              <td><input type="text" name="site[site_title]" size="80" value="<?php echo ($set["site_title"]); ?>"></td>
            </tr>
            <tr>
              <th><?php echo L('site_keyword');?> :</th>
              <td><input type="text" name="site[site_keyword]" size="80" value="<?php echo ($set["site_keyword"]); ?>"></td>
            </tr>
            <tr>
              <th><?php echo L('site_description');?> :</th>
              <td><textarea rows="3" cols="80" name="site[site_description]"><?php echo ($set["site_description"]); ?></textarea></td>
            </tr> 
			<tr>
              <th><?php echo L('site_logo');?> :</th>
              <td>              	
				<input type="file" name="img" id="img" class="input-text" size=21 />
				<?php if($set['site_logo'] != ''): ?><img src="<?php echo ($set['site_logo']); ?>" style="max-height:64px;" /><?php endif; ?>
			  </td>
            </tr> 
			<tr>
              <th width="120"><?php echo L('check_code');?> :</th>
              <td>
                <input type="radio" <?php if($set["check_code"] == '1'): ?>checked="checked"<?php endif; ?> onclick="" value="1" name="site[check_code]" /> 开启 &nbsp;&nbsp;
                <input type="radio" <?php if($set["check_code"] == '0'): ?>checked="checked"<?php endif; ?> onclick="" value="0" name="site[check_code]" /> 关闭 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				
              </td>
            </tr>  
            <tr>
              <th><?php echo L('site_icp');?> :</th>
              <td><input type="text" name="site[site_icp]" size='80' id="site_icp" class="input-text" value="<?php echo ($set["site_icp"]); ?>"></td>
            </tr>
            <tr>
              <th><?php echo L('logout_time');?> :</th>
              <td><input type="text" name="site[logout_time]" id="logout_time" class="input-text" value="<?php echo ($set["logout_time"]); ?>"> 秒</td>
            </tr>
            <tr>
              	<th><?php echo L('statistics_code');?> :</th>
              	<td>
                    <textarea rows="3" cols="80" name="site[statistics_code]" id="statistics_code"><?php echo ($set["statistics_code"]); ?></textarea>
            	</td>
        	</tr>
			<tr>
              	<th><?php echo L('site_share');?> :</th>
              	<td>
                    <textarea rows="3" cols="80" name="site[site_share]" id="site_share"><?php echo ($set["site_share"]); ?></textarea>
            	</td>
        	</tr>			
        </table>
      </div>	
      <div id="div_setting_2" class="contentList pad-10 hidden">
		<table width="100%" cellpadding="2" cellspacing="1" class="table_form">   
        <tr>
          <th width="120"><?php echo L('mail_smtp');?>：</th>
          <td>
              <input type="text" name="site[mail_smtp]" id="mail_smtp" class="input-text" size="40" value="<?php echo ($set["mail_smtp"]); ?>"> 	                
          </td>
        </tr>
			  <tr>
              <th width="120"><?php echo L('mail_port');?>：</th>
              <td>
                <input type="text" name="site[mail_port]" id="mail_port" class="input-text" size="40" value="<?php echo ($set["mail_port"]); ?>">                
              </td>
            </tr> 
        <tr>
              <th width="120"><?php echo L('MAIL_USERNAME');?>：</th>
              <td>
                <input type="text" name="site[mail_username]" id="mail_username" class="input-text" size="40" value="<?php echo ($set["mail_username"]); ?>">               
              </td>
            </tr>     
			  <tr>
              <th width="120"><?php echo L('mail_password');?>：</th>
              <td>
                <input type="password" name="site[mail_password]" id="mail_password" class="input-text" size="40" value="<?php echo ($set["mail_password"]); ?>">
				               
              </td>
            </tr>     
			<tr>
              <th width="120"><?php echo L('mail_fromname');?>：</th>
              <td>
                <input type="text" name="site[mail_fromname]" id="mail_fromname" class="input-text" size="40" value="<?php echo ($set["mail_fromname"]); ?>">               
              </td>
            </tr> 
         </table>   
      </div> 
      <div id="div_setting_3" class="contentList pad-10 hidden">
      	<table width="100%" cellpadding="2" cellspacing="1" class="table_form">       
            <tr>
              <th width="120"><?php echo L('site_status');?> :</th>
              <td>
                <input type="radio" <?php if($set["site_status"] == '1'): ?>checked="checked"<?php endif; ?> onclick="" value="1" name="site[site_status]"> 开启 &nbsp;&nbsp;
                <input type="radio" <?php if($set["site_status"] == '0'): ?>checked="checked"<?php endif; ?> onclick="" value="0" name="site[site_status]"> 关闭 &nbsp;&nbsp;
              </td>
            </tr>
            <tr>
              <th><?php echo L('closed_reason');?> :</th>
              <td><textarea rows="4" cols="80" name="site[closed_reason]"><?php echo ($set["closed_reason"]); ?></textarea></td>
            </tr>
         </table>      
      </div>
      <div class="bk15"></div>
      <div class="btn">
      	<input type="submit" value="<?php echo (L("submit")); ?>" onclick="return submitFrom();" name="dosubmit" class="button" id="dosubmit">
		
	  </div>
    </div>
  </div>

</form>

<script type="text/javascript">
function SwapTab(name,cls_show,cls_hide,cnt,cur){
    for(i=1;i<=cnt;i++){
		if(i==cur){
			 $('#div_'+name+'_'+i).show();
			 $('#tab_'+name+'_'+i).attr('class',cls_show);
		}else{
			 $('#div_'+name+'_'+i).hide();
			 $('#tab_'+name+'_'+i).attr('class',cls_hide);
		}
	}
}
function sendMall(){
	var lang_add = "正在发送邮件";
	window.top.art.dialog({id:'sendmall'}).close();
	window.top.art.dialog({
		title:lang_add,
		id:'sendmall',
		iframe:'?m=Setting&a=sendAllMail',width:'430',height:'180'
	})
}
</script>

</body></html>