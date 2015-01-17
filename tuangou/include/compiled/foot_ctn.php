
<?php if($request_uri != 'index'){?>  
<div class="app_download_tip">
 <div class="rightPos rp">
  <div class="fix">
   <a href="/#APPDOWNLOAD" target="_blank" class="icon">下载{$INI['system']['abbreviation']团购网手机app</a>
  </div>
 </div>
</div>
<?php }?> 

<script>
$(function(){
	$('.birthday a.c_close').click(function(){
		$('.birthday .pos').addClass('closing');
		setTimeout("$('.birthday').hide()",300);
        $.cookie("c_birthday_thi",1,{
				expires: 30,
				path: '/'
			});
	});
});
</script>

<?php include template("side_fixed");?>
<style>
.footer{
box-shadow: 0 1px 20px rgba(0,0,0,.5);
     -moz-user-select: none;
background-color: #666;
color:#fff;
}
.footer .part ul.list li.t {
font-size: 15px;
color: #fff;
}
.footer .part ul.list li {
font-weight: bold;
}
.footer .part ul li {
color: #ccc;
line-height: 2;
}
.footer .part ul.list li a {
margin-left: 5px;
color: #ccc;
font-weight: normal;
}
.footer .part ul.list li a:hover{
color: #fff;
}
</style>
<div class="footer" >
 <div class="inside">
      <div class="part p1">
   <ul class="list">
    <li class="t">用户中心</li>
        <li>·<a href="/news.php?id=5" target="_blank">如何购买</a></li>
        <li>·<a href="/news.php?id=6" target="_blank">常见问题</a></li>
        <li>·<a href="/news.php?id=7" target="_blank">退款服务</a></li>
           </ul>
  </div>
        <div class="part p2">
   <ul class="list">
    <li class="t">关于<?php echo $INI['system']['abbreviation']; ?></li>
        <li>·<a href="/news.php?id=16" target="_blank"><?php echo $INI['system']['abbreviation']; ?></a></li>
        <li>·<a href="/news.php?id=9" target="_blank">招聘岗位</a></li>
            <li>·<a href="/news.php?id=10" target="_blank">联系我们</a></li>
       </ul>
  </div>
        <div class="part p3">
   <div class="code"  style="height:80px;"><img src="/static/0750/images/code1.gif" width="80" height="80"></div>
  </div>
  <div class="part p3">
   <ul class="list">
    <li class="t">商务合作</li>
        <li>·<a href="/news.php?id=17" target="_blank">商家入驻</a></li>
		<li>·<a href="/news.php?id=11" target="_blank">市场合作</a></li>
        <li>·<a href="/news.php?id=12" target="_blank"><?php echo $INI['system']['abbreviation']; ?>优势</a></li>
           </ul>
  </div>
        <div class="part p4">
   <ul class="list">
    <li class="t">购物须知</li>
        <li>·<a href="/news.php?id=14" target="_blank">用户协议</a></li>
        <li>·<a href="/news.php?id=15" target="_blank">隐私申明</a></li>
        <li>·<a href="#" >手机端下载</a></li>
           </ul>
  </div>
      <div class="dd">
  </div>
  <div class="dd copyright">
<p>&copy;<span>滇ICP备14007747号  昭通市昭阳区洋芋团商务服务有限公司  版权所有@2014</p>
   <p>客服热线：<?php echo $INI['system']['kefu_hotline']; ?></p>
  </div>
 </div>
</div>
<script type="text/javascript" src="/static/0750/js/jquery.lazyload.min.js"></script>
<script src="/static/0750/js/owr.js" type="text/javascript"></script>
<script src="/static/0750/js/ie6.js" type="text/javascript"></script><script src="/static/0750/js/js.js" type="text/javascript"></script>
<script src="/static/0750/js/scroll.js" type="text/javascript"></script>
<script src="/static/0750/js/scrollFix.js" type="text/javascript"></script>
<script src="/static/0750/js/scrollStu.js" type="text/javascript"></script>
<script src="/static/0750/js/common.js" type="text/javascript"></script>
<link href="/static/0750/css/birthday.css" rel="stylesheet" type="text/css">
<div class="birthday" style="display: none;">
 <div class="mask"></div>
</div>