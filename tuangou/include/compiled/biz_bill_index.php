<?php include template("biz_header");?>
<style type="text/css">
table{ font-size:16px;}
.sect p{ line-height:26px; padding-left:20px;}
.line_p{ border-bottom:#699F00 solid 1px; padding:10px;}
.line_p a{ border:#0C6 solid 1px; margin:5px; padding:5px;}
.line_p a.cur{ background:#ff3300;color:#FFF;}
</style>
<div id="bdw" class="bdw">
<div id="bd" class="cf">
<div id="coupons">
    <div id="content" class="coupons-box clear mainwide">
		
            <div class="box-content">
                <div class="head" style="padding-bottom:10px;">
                   <p class="line_p">
                    <a href="/biz/bill_index.php" class="cur">财务统计</a>
                    <a href="/biz/bill_list.php">自提结款</a>
                   </p>
                   
                   <div>
                       <table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
					<tr>
                    <td align="center" width="200"><b>余额</b></td>
                    <td align="center" width="200"><b>总销售额</b></td>
                    <td align="center" width="200"><b>已提款</b></td>
                    </tr>
					
					<tr>
						<td align="center" style="color:#F00; font-weight:bold;"><?php echo $yue_price; ?></td>
						<td align="center" style="color:#F00; font-weight:bold;"><?php echo $all_bill_price; ?></td>
						<td align="center" style="color:#F00; font-weight:bold;"><?php echo $bill_price; ?></td>
					</tr>
					<!--{/loop}-->
					<tr><td colspan="6"><?php echo $pagestring; ?></tr>
                    </table>
                   </div>
                   <p>小提示：</p>
				</div>
                <div class="sect">
					 <p>
                            1.总销售额为：自您店铺商品上线到今日为止总销售金额 <br />

                            2.已提款为：已经结算的所有款项总和 <br />
                            
                            3.余额=总销售额-已提款-已退款 <br />
                     </p>
				</div>
            </div>
            
        </div>
    </div>
</div>
</div> <!-- bd end -->
</div> <!-- bdw end -->

<?php include template("biz_footer");?>
