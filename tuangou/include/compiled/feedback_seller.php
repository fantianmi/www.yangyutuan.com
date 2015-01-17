<?php include template("header");?>

<div class="content detailpage dp article">
 <div class="productDetail pd">
  <div class="left">
   <div class="initwhite">
    <div class="locate">你现在的位置 : <a href="/"><?php echo $INI['system']['abbreviation']; ?>首页</a> &gt; 提供团购信息</div>
    <div class="text">
     <form name="message" action="/index.php" id="seller_msg" method="post">
     <table width="770" border="0" align="center" cellspacing="0" cellpadding="0" class="upload">
      <tbody><tr>
       <td width="15%" valign="middle" height="48">您的称呼</td>
       <td width="40%" valign="middle"><input type="text" tabindex="1" size="30" name="user_name" id="user_name" value="" style="width: 412px;"></td>
       <td width="45%" valign="middle" class="tips">必填，请留下全名或者姓氏加先生/女士</td>
      </tr>
      <tr>
       <td valign="middle" height="48">联系方式</td>
       <td valign="middle"><input type="text" tabindex="2" size="30" name="title" id="title" value="" style="width: 412px;"></td>
       <td valign="middle" class="tips">必填，请留下您的手机、QQ号或邮箱，方便联系</td>
      </tr>
      <tr>
       <td valign="middle" height="48">团购信息</td>
       <td valign="middle"><textarea cols="60" rows="5" name="content" id="content" style="width: 412px;"></textarea></td>
       <td valign="middle" class="tips">必填，填写你需要团购的内容，简单介绍一下你的商铺或商品</td>
      </tr>
      <tr>
       <td valign="middle" height="48">团购商家名称</td>
       <td valign="middle"><input type="text" tabindex="2" size="30" name="groupon_seller_name" id="groupon_seller_name" value="" style="width: 412px;"></td>
       <td valign="middle" class="tips">必填，填写商家名称，如店招</td>
      </tr>
      <tr>
       <td valign="top" height="95">团购物品</td>
       <td valign="middle"><textarea cols="60" rows="5" name="groupon_goods" id="groupon_goods" style="width: 412px;"></textarea></td>
       <td valign="top" class="tips">必填，列出你需要团购的商品名称</td>
      </tr>
            <tr>
       <td valign="middle" height="48" colspan="3"><input type="submit" value="提交审核" class="btn">
      <input type="hidden" name="m" value="Message">
      <input type="hidden" name="a" value="addSellerMsg">
       </td>
      </tr>
     </tbody></table>
     </form>
    <script type="text/javascript">
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
