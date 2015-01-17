<?php include template("header");?>

<div id="bdw" class="bdw">
<div id="bd" class="cf">
<div id="about">
	<div id="content" class="about">
		<div class="box clear"> 
            <div class="box-top"></div>
            <div class="box-content">
                <div class="head"><h2>选择你所在的城市</h2></div>
                <div class="sect">
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
					<?php if(is_array($cities)){foreach($cities AS $letter=>$ones) { ?>	
					<tr><td valign="top"><b><?php echo $letter; ?></b></td>
					<td valign="top"><p class="city_list" style="margin:0;"><?php if(is_array($ones)){foreach($ones AS $one) { ?><a href="/city.php?ename=<?php echo $one['ename']; ?>"><?php echo $one['name']; ?></a><?php }}?></p></td></tr>
					<?php }}?>
					</table>
                </div>
            </div>
            <div class="box-bottom"></div>
        </div>
	</div>
	<div id="sidebar">
		<?php include template("block_side_business");?>
	</div>
</div>
</div> <!-- bd end -->
</div> <!-- bdw end -->

<?php include template("footer");?>
