<?php include template("manage_header");?>

<div id="bdw" class="bdw">
<?php include template("manage_left_menu");?>
<div class="right_main">
<div id="bd" class="cf">
<div id="partner">
	<div class="dashboard" id="dashboard">
		<ul><?php echo mcurrent_system('sms'); ?></ul>
	</div>
	<div id="content" class="clear mainwide">
        <div class="clear box">
            
            <div class="box-content">
                <div class="head"><h2>短信配置</h2></div>
                <div class="sect">
                    <form method="post">
						<div class="wholetip clear"><h3>1、基本信息</h3></div>
                       <div class="field">
                            <label>短信平台地址</label>
                            <input type="smsaddress" size="30" name="sms[smsapi]" class="f-input" value="<?php echo $INI['sms']['smsapi']; ?>" style="width:200px;" />
                            <span class="inputtip">
                               此处填写第三方短信平台发送api中的网址如：<br />
                            api：http://www.smsbao.com/sms?u=USERNAME&p=PASSWORD&m=PHONE&c=CONTENT <br />
                            就填写www.smsbao.com即可<br />
                            http://sdk.entinfo.cn:8060/z_mdsmssend.aspx这样开头的<br>
                            就填写sdk.entinfo.cn即可
                            </span>
                        </div>

                        <div class="field">
                            <label>短信用户</label>
                            <input type="text" size="30" name="sms[user]" class="f-input" value="<?php echo $INI['sms']['user']; ?>" style="width:200px;" /><span class="inputtip">此处填写第三方短信平台的用户名</span>
                        </div>
                        <div class="field">
                            <label>短信密码</label>
                            <input type="password" size="30" name="sms[pass]" class="f-input" value="<?php echo $INI['sms']['pass']; ?>" style="width:200px;" /><span class="inputtip">此处填写第三方短信平台的密码</span>
                        </div>
                          <div class="field">
                            <label>签名</label>
                            <input type="text"" size="30" name="sms[token]" class="f-input" value="<?php echo $INI['sms']['token']; ?>" style="width:200px;" /><span class="inputtip">此处填写第三方短信平台的签名</span>
                        </div>
                        <div class="field">
                            <label>点发频率</label>
                            <input type="text" size="30" name="sms[interval]" class="number" value="<?php echo abs(intval($INI['sms']['interval'])); ?>"/>
                            <span class="inputtip">用户联系点击短信发送的，时间间隔限制，管理员点发不受此限制，建议：60-300s</span>
                        </div>
                        <div class="field">
                            <label>发送次数</label>
                            <input type="text" size="30" name="sms[numbers]" class="number" value="<?php echo abs(intval($INI['sms']['numbers'])); ?>"/>
                            <span class="inputtip">用户购买订单后每张<?php echo $INI['system']['couponname']; ?>最多发送次数，建议：5次</span>
                        </div>
                        <div class="act">
                            <input type="submit" value="保存" name="commit" class="formbutton"/>
                        </div>
                    </form>
                </div>
            </div>
           
        </div>
	</div>

<div id="sidebar">
</div>

</div>
</div> <!-- bd end -->
</div>
</div> <!-- bdw end -->

<?php include template("manage_footer");?>
