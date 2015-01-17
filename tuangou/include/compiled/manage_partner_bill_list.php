<?php include template("manage_header");?>

<div id="bdw" class="bdw">
<?php include template("manage_left_menu");?>
<div class="right_main">
<div id="bd" class="cf">
<div id="coupons">
	<div class="dashboard" id="dashboard">
		<ul><?php echo mcurrent_partner('index'); ?></ul>
	</div>
    <div id="content" class="coupons-box clear mainwide">
		<div class="box clear">
            
            <div class="box-content">
                <div class="head">
                    <h2>账单列表</h2>
					<ul class="filter">
                    <li>
                    <form method="get">商户编号：
                    <input type="text" name="partner_id" class="h-input" value="<?php echo $partner_id; ?>" >
                    &nbsp;&nbsp;&nbsp; 账单号：
                     <input type="text" name="bill_sn" class="h-input" value="<?php echo $bill_sn; ?>" >
                    &nbsp;&nbsp;&nbsp;
                    <select name="bill_status" class="h-input"><?php echo Utility::Option($option_bill, $bill_status,'全部'); ?></select>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="筛选" class="formbutton"  style="padding:1px 6px;"/>
                    <form>
                    </li>
                    </ul>
				</div>
                <div class="sect">
                
                
					<table id="orders-list" cellspacing="0" cellpadding="0" border="0" class="coupons-table">
                    
                    
						<tr><th width="150">商户</th><th width="200">账单号</th><th width="160">申请日期</th><th width="130">结算金额</th><th width="120">状态</th><th width="120">操作</th></tr>
                    
                    
                  <?php if(is_array($partner_bill)){foreach($partner_bill AS $index=>$one) { ?>
					
					<tr <?php echo $index%2?'':'class="alt"'; ?> id="team-list-id-<?php echo $one['id']; ?>">
                        <td><?php echo $partner[$one['partner_id']]['username']; ?></td>
						<td style="text-align:left;"><?php echo $one['bill_sn']; ?></td>
						<td><?php echo date('Y-m-d',$one['add_time']); ?></td>
						<td><?php echo $one['price']; ?></td>
						<td>
                            <?php if($one['bill_status'] == 0){?>
                                 审核中
                             <?php } else if($one['bill_status'] == 1) { ?>
                                 已结算
                             <?php } else { ?>
                                 已拒绝
                             <?php }?>
                        </td>
						<td class="op" nowrap><a href="/ajax/manage.php?action=billdetail&id=<?php echo $one['id']; ?>" class="ajaxlink">详情</a></td>
					</tr>
					<?php }}?>
					<tr><td colspan="8"><?php echo $pagestring; ?></td></tr>
                    </table>
				</div>
            </div>
           
        </div>
    </div>
</div>
</div> <!-- bd end -->
</div>
</div> <!-- bdw end -->

<?php include template("manage_footer");?>
