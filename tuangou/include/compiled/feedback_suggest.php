<?php include template("header");?>

<div class="content detailpage dp article">
 <div class="productDetail pd">
  <div class="left">
   <div class="initwhite">
    <div class="locate">你现在的位置 :  <a href="/index.php"><?php echo $INI['system']['abbreviation']; ?>首页</a> > &gt; 意见反馈</div>
    <div class="text">
     <form method="post" id="consult-add-form" action="/feedback/suggest.php" name="message">
     <table width="770" border="0" align="center" cellspacing="0" cellpadding="0" class="upload">
      <tbody><tr>
       <td width="15%" valign="middle" height="48">您的称呼</td>
       <td width="40%" valign="middle"><input type="text" value="<?php echo $login_user['username']; ?>" id="user_name" name="title" size="30" tabindex="1"></td>
       <td width="45%" valign="middle" class="tips">必填，请留下全名或者姓氏加先生/女士</td>
      </tr>
      <tr>
       <td valign="middle" height="48">联系方式</td>
       <td valign="middle"><input type="text" value="" id="title" name="contact" size="30" tabindex="2" value="<?php echo $login_user['email']; ?>"></td>
       <td valign="middle" class="tips">必填，请留下您的手机、QQ号或邮箱，方便联系</td>
      </tr>
      <tr>
       <td valign="top" height="95">意见内容</td>
       <td valign="middle"><textarea name="content" rows="5" cols="60"></textarea></td>
       <td valign="top" class="tips">必填，填写您的意见</td>
      </tr>
      <tr>
       <td valign="middle" height="48" colspan="3"><input type="submit" class="btn" value="提交意见">
      <input type="hidden" value="Message" name="m">
      <input type="hidden" value="addFeedback" name="a">
       </td>
      </tr>
     </tbody></table>
     </form>
<script>
$('table.upload input[type=text] ,table.upload textarea').width($('table.upload tr td:eq(1)').width()-25);
</script>
    </div>
   </div>
  </div>
  
  <div class="right">
  
  <?php include template("deal_cs");?>
  
    </div>
  
  
 </div>
</div>

<?php include template("footer");?>
