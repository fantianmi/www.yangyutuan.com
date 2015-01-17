<?php include template("header");?>

<div id="bdw" class="bdw">
<div id="bd" class="cf">
<div id="reset">
    <div id="content">
        <div class="box">
            <div class="box-top"></div>
            <div class="box-content">
                <div class="head"><h2>重设密码</h2></div>
                <div class="sect">
					<form method="post" action="/account/reset.php?code=<?php echo $code; ?>">
                    <div class="field email">
                        <label class="f-label" for="reset-password">新密码</label>
                        <input type="password" name="password" value="" id="reset-password" class="f-input" maxlength="32" />
                        <span class="hint">最少 4 个字符</span>
                    </div>
                    <div class="field email">
                        <label class="f-label" for="reset-password2">重复密码</label>
                        <input type="password" name="password2" value="" id="reset-password2" class="f-input" maxlength="32" />
                    </div>
                    <div class="act">
                        <input type="hidden" name="code" value="<?php echo $code; ?>" />
                        <input type="submit" class="formbutton" value="重设密码" />
                    </div>
                    </form>
				</div>
            </div>
            <div class="box-bottom"></div>
        </div>
    </div>
    <div id="sidebar">
    </div>
</div>
 
</div> <!-- bd end -->
</div> <!-- bdw end -->

<?php include template("footer");?> 
