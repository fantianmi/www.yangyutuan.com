<?php include template("header");?>


<script type="text/javascript">
$(function(){ 
 
	$(".start_all li").mouseenter(function(){
		$(".start_all li").css("background","url(<?php echo $INI['system']['imgprefix']; ?>/static/0750/css/img/star.png) no-repeat left bottom");
		$(".start_all li").addClass('yes');
		$(this).css("background","url(<?php echo $INI['system']['imgprefix']; ?>/static/0750/css/img/star.png) no-repeat left bottom");
		$(this).nextAll().css("background","url(<?php echo $INI['system']['imgprefix']; ?>/static/0750/css/img/star.png)");
		$(this).nextAll().removeClass('yes');
		var num_li = $(".start_all li.yes").length;
	
		$(".start_all p").html('<input type="hidden" name="comment_grade" value="'+num_li+'" />');
		
        if(num_li == 5){
			  	$("#start_all").html("很满意");
		}else if(num_li == 4){
			    $("#start_all").html("满意");
		}else if(num_li == 3){
			    $("#start_all").html("一般");
		}else if(num_li == 2){
			    $("#start_all").html("不满意");
		}else if(num_li == 1){
			    $("#start_all").html("很不满意");
		}
		
	});
});	
</script>

<?php if(is_array($comment_partner)){foreach($comment_partner AS $index=>$one) { ?>
<script type="text/javascript">
$(function(){ 
 
	$(".start<?php echo $one[id]; ?> li").mouseenter(function(){
		$(".start<?php echo $one[id]; ?> li").css("background","url(<?php echo $INI['system']['imgprefix']; ?>/static/0750/css/img/star.png) no-repeat left bottom");
		$(".start<?php echo $one[id]; ?> li").addClass('yes');
		$(this).css("background","url(<?php echo $INI['system']['imgprefix']; ?>/static/0750/css/img/star.png) no-repeat left bottom");
		$(this).nextAll().css("background","url(<?php echo $INI['system']['imgprefix']; ?>/static/0750/css/img/star.png)");
		$(this).nextAll().removeClass('yes');
		var num_li = $(".start<?php echo $one[id]; ?> li.yes").length;
	
		$(".start<?php echo $one[id]; ?> p").html('<input type="hidden" name="xing[<?php echo $one[id]; ?>]" value="'+num_li+'" />');
		
		if(num_li == 5){
			  	$("#start_<?php echo $one[id]; ?>").html("很满意");
		}else if(num_li == 4){
			    $("#start_<?php echo $one[id]; ?>").html("满意");
		}else if(num_li == 3){
			    $("#start_<?php echo $one[id]; ?>").html("一般");
		}else if(num_li == 2){
			    $("#start_<?php echo $one[id]; ?>").html("不满意");
		}else if(num_li == 1){
			    $("#start_<?php echo $one[id]; ?>").html("很不满意");
		}
		
		
	});
});	
</script>
<?php }}?>  

<script type="text/javascript">
$(function(){ 	
	$("#btn-shaitu").click(function(){
		 $(this).css("display","none");	
		 $("#shaitu").css("display","block");
    });
	
	
 $("#sub").click(function(){
		 var comment_content = $("#comment_content").val();
		 if(comment_content < 8){
			 alert("评价内容不能少于八字字符！");
			 return false;
		 }else{
			 alert("谢谢你的点评！");
		 }
		 return true;
    });
	
	
	
		
});
</script>

<div id="bdw" class="bdw">
<div id="bd" class="cf">
<div id="referrals">
	<div class="dashboard" id="dashboard">
		<ul><?php echo current_account('/order/index.php'); ?></ul>
	</div>
    <div id="content" class="invites refers">
        <div class="box clear">

            <div class="box-content">
                <div class="head">
					<h2>点评本单</h2>
					
				</div>
                <form method="post" action="#" enctype="multipart/form-data">
                <div class="order_comment">
                    <div class="item-rate-info">
                           <div class="item-detail">
                                <a class="item-d-img" target="_blank" href="/team.php?id=<?php echo $team['id']; ?>" data-spm-anchor-id="a1z0b.2.1000328.1">
                                <img width="160" height="100" src="<?php echo team_image($team['image']); ?>">
                                </a>
                                <div class="item-title">
                                <a target="_blank" href="/team.php?id=<?php echo $team['id']; ?>"><?php echo $team['title']; ?></a>
                                </div>
                          </div>
                    </div>
                    
                    <div class="item-rate-main">
                                <div class="item-rate-act">
                                      <div class="rate-control">
                                            <ul>
                                                <li class="good rate-checked">
                                                     <label>
                                                <input checked="checked" class="good-rate" type="radio" value="3" name="comment_grade_three"><i class="icon icon-rank icon-good"></i>
                                                </label>
                                                </li>
                                                <li class="normal">
                                            
<label>
<input class="noraml-rate" type="radio" value="2" name="comment_grade_three">
<i class="icon icon-rank icon-normal"></i>

</label>

                                                </li>
                                                <li class="bad">
                                                  <label for="">
<input id="" class="bad-rate" type="radio" value="1" name="comment_grade_three">
<i class="icon icon-rank icon-bad"></i>
</label>
                                                </li>
                                            </ul>
                                        </div>
                                </div>
                                <div class="rate-msg-box">
                                   <textarea class="rate-msg" id="comment_content"  maxlength="500" name="comment_content"></textarea>
                                </div>
                                <div class="share-selector">
                                </div>
                    
                    
                    </div>
                    
                    <div style="clear:both;"></div>
                </div>
                <div class="order_comment">
                     <div class="item-rate-info"><h2 class="dsr-title">晒图限4张</h2></div>
                     <div class="item-rate-main">
                     <div class="btn-shaitu" id="btn-shaitu">点击显示上传图片</div>
                     <ul id="shaitu" class="shaitu" style="display:none">
        <li><input style="margin-top:5px;" type="file" size="30" name="upload_image1" id="team-create-image1"/></li>
        <li><input style="margin-top:5px;"  type="file" size="30" name="upload_image2" id="team-create-image2"/></li>
        <li><input style="margin-top:5px;"  type="file" size="30" name="upload_image3" id="team-create-image3"/></li>
        <li><input style="margin-top:5px;"  type="file" size="30" name="upload_image4" id="team-create-image4"/></li>
                     </ul>
                     </div>
                </div>
                
                <div class="order_comment">
                      <div class="item-rate-info"><h2 class="dsr-title">店铺动态评分</h2></div>
                     
                      <div class="item-rate-main start_us">
                             <div style="height:30px;">
                                <div class="text">总体评价： </div> 
                                <ul class="start_all">
                                  <li></li> <li></li> <li></li> <li></li> <li></li> 
                                  <p></p>
                                </ul>
                                <span id="start_all"></span>
                                <div style="clear:both"></div>
                            </div>
                      <?php if(is_array($comment_partner)){foreach($comment_partner AS $index=>$one) { ?>
                            <div style="height:30px;">
                                <div class="text"><?php echo $one['name']; ?>：</div> 
                                <ul class="start<?php echo $one[id]; ?>">
                                  <li></li> <li></li> <li></li> <li></li> <li></li>
                                  <p></p>
                                </ul>
                                <span id="start_<?php echo $one['id']; ?>"></span>
                                <div style="clear:both"></div>
                            </div>
                       <?php }}?>     
                            
                           
                      </div>
                </div> 
                
                <div class="btn_comment"><input id="sub" type="submit" value="发表评论" class="formbutton"/></div>
               </form>
            </div>
 
        </div>
    </div>
    <div id="sidebar">
		<?php include template("block_side_invitenotice");?>
    </div>
</div>
</div> <!-- bd end -->

</div> <!-- bdw end -->

<?php include template("footer");?>
