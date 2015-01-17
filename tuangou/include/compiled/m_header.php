<style type="text/css">
.j-category,.j-area,.j-order,.w-sort__mask{ display:none;}
.cblock{ display:block;}
</style>
<script src="style/jquery-1.9.1.min.js"></script>
<header class="w-index-header" mon="type=header">
<a id="city" class="city" href="#" mon="content=city">
<?php echo $city['name']; ?>
</a>
<div class="arrow-down"></div>
<a class="user" href="my.php" mon="content=user">
我的</a>
<div style="text-align:center; line-height:40px; font-size:18px; font-weight:bold; color:#FFF;">
<?php echo $pagetitle; ?>
</div>
</header>

<!--城市-->
<section id="city_list" class="j-area w-sort__2col" mon="action=click"  style="min-height:100px; z-index:100">
<ul class="nav j-nav" mon="type=mainArea">
<?php 

/*城市列表*/

$shangquan = DB::LimitQuery('category', array(
	'condition' => array(
		'zone' => 'city',
		'display' => 'Y',
),
	'order' => 'ORDER BY sort_order DESC',
));

; ?>

     <?php if(($shangquan)){?>	
       <?php if(is_array($shangquan)){foreach($shangquan AS $one_sq) { ?>
         <?php 
              $daytime = time();
              $one_sq_id = $one_sq['id'];
              $condition_ev56_s3 = " city_id = $one_sq_id and  end_time > $daytime and begin_time <  $daytime";
              $ev56_num_3 = Table::Count('team', $condition_ev56_s3);
		 ; ?>

<li class="s-has-sub" data-count="<?php echo $ev56_num_3; ?>"><a href="index.php?city=<?php echo $one_sq['id']; ?>"><?php echo $one_sq['name']; ?></a></li>

<?php }}?>

<?php }?>
</ul>

</section>
<!--城市-->

<script type="text/javascript">

$(document).ready(function() {

	$("#city").click(function(){
		 $("#city_list").toggleClass("cblock").siblings().removeClass("cblock");
		 //alert($("#city_list").attr("class"));	
		  if($("#city_list").attr("class") == "j-area w-sort__2col cblock"){
		      $(".w-sort__mask").addClass("cblock")  
		  }else{
			  $(".w-sort__mask").removeClass("cblock");
		  }
	});
	
});


</script>