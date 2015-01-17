<?php include template("header");?>


<div id="bdw" class="bdw">
<div id="bd" class="cf">
<div id="order-pay">
    <div id="content">
        <div id="deal-buy" class="box">
        
            <div class="box-content">
                <div class="head">
                    <h2>应付总额：<strong class="total-money"><?php echo $order['origin']; ?></strong> 元</h2>
                </div>
                <div class="sect">
                    <div style="text-align:left;">

                        <!--  -->
                        <form action="<?php echo $url; ?>" method="post">
                    <input type="hidden" name="URL" size="50" value="https://www.hnapay.com/website/pay.htm">
<input type="hidden" name="version" value="2.6">
<input type="hidden" name="serialID" value="<?php echo $serialID; ?>">
<input type="hidden" name="submitTime" value="<?php echo $times; ?>" id="submitTime"> 
<input type="hidden" name="failureTime" value="<?php echo $stime; ?>" id="failureTime"> <input type="hidden" name="customerIP" value=''>
<input type="hidden" size="80" name="orderDetails" value="<?php echo $order['pay_id']; ?>,<?php echo $origins; ?>,<?php echo $mall; ?>,<?php echo $res; ?>,<?php echo $order['quantity']; ?>">
                    
<input type="hidden" id='totalAmount' name="totalAmount" value="<?php echo $origins; ?>">
<input type="hidden" name="type" value='1000'><input type="hidden" name="buyerMarked" value="">
<input type="hidden" name="payType" value='ALL'><input type="hidden" name="orgCode">
<input type="hidden" name="currencyCode" value='1'> <input type="hidden" name="directFlag" value='0'><input type="hidden" name="borrowingMarked" value='0'> 
<input type="hidden" name="couponFlag" value='1'>
<input type="hidden" name="platformID"> <input type="hidden" name="returnUrl" value="<?php echo $returnUrl; ?>"><input type="hidden" name="noticeUrl" value="<?php echo $noticeUrl; ?>"> <input type="hidden" name="partnerID" value="<?php echo $ress['value']; ?>"><input type="hidden" name="remark" value='扩展字段'><input type="hidden" name="charset" value='1'><input type="hidden" name="signType" value='2'>
<input type="hidden" name="signMsg" value="version=2.6&serialID=<?php echo $serialID; ?>&submitTime=<?php echo $times; ?>&failureTime=<?php echo $stime; ?>&customerIP=&orderDetails=<?php echo $order['pay_id']; ?>,<?php echo $origins; ?>,<?php echo $mall; ?>,<?php echo $res; ?>,<?php echo $order['quantity']; ?>&totalAmount=<?php echo $origins; ?>&type=1000&buyerMarked=&payType=ALL&orgCode=&currencyCode=1&directFlag=0&borrowingMarked=0&couponFlag=1&platformID=&returnUrl=<?php echo $returnUrl; ?>&noticeUrl=<?php echo $noticeUrl; ?>&partnerID=<?php echo $ress['value']; ?>&remark=扩展字段&charset=1&signType=2" > 
                    <input type="submit" class="formbutton gotopay" value="更多支付">
        </form>



                        <!--  -->






                    </div>
                </div>
                
                
            </div>
          
        </div>
    </div>
</div>
</div> <!-- bd end -->
</div> <!-- bdw end -->

<?php include template("footer");?>
