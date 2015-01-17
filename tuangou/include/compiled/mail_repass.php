hi <?php echo $user['username']; ?>,<br />
<br />
您在<?php echo $INI['system']['sitename']; ?>申请了重设密码，请点击下面的链接，然后根据页面提示完成密码重设：<br />
<br />
<a href="<?php echo $INI['system']['wwwprefix']; ?>/account/reset.php?code=<?php echo $user['recode']; ?>"><?php echo $INI['system']['wwwprefix']; ?>/account/reset.php?code=<?php echo $user['recode']; ?></a><br />
<br />
--<br />
<?php echo $INI['system']['sitename']; ?> - 精品团购每一天
