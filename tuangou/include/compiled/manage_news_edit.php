<?php include template("manage_header");?>

<div id="bdw" class="bdw">
<?php include template("manage_left_menu");?>
<div class="right_main">
<div id="bd" class="cf">
<div id="leader">
	<div class="dashboard" id="dashboard">
		<ul><?php echo mcurrent_news('news'); ?></ul>
	</div>
	<div id="content" class="clear mainwide">
        <div class="clear box">
            <div class="box-content">
                <div class="head">
				<?php if($news['id']){?>
					<h2>编辑新闻</h2>
					<ul class="filter"><?php echo current_managenews('edit', $news['id']); ?></ul>
				<?php } else { ?>
					<h2>新建新闻</h2>
				<?php }?>
				</div>
                <div class="sect">
				<form id="-user-form" method="post" action="/manage/news/edit.php?id=<?php echo $news['id']; ?>" enctype="multipart/form-data" class="validator">
					<input type="hidden" name="id" value="<?php echo $news['id']; ?>" />
					<div class="field">
						<label>新闻标题</label>
						<input type="text" size="30" name="title" id="team-create-title" class="f-input" value="<?php echo htmlspecialchars($news['title']); ?>" datatype="require" require="true" />
					</div>
                    	<div class="field">
						<label>图片</label>
						<input type="file" size="30" name="upload_image" id="team-create-image" class="f-input" />
						<?php if($news['image']){?><span class="hint"><?php echo team_image($news['image']); ?></span><?php }?>
					</div>
					<div class="field">
						<label>新闻时间</label>
						<input type="text" size="10" name="begin_time" id="team-create-begin-time" class="date" xd="<?php echo date('Y-m-d', $news['begin_time']); ?>" xt="<?php echo date('H:i:s', $news['begin_time']); ?>" value="<?php echo date('Y-m-d H:i:s', $news['begin_time']); ?>" maxLength="10" />
					</div>
					<div class="field">
						<label>新闻内容</label>
						<div style="float:left;"><textarea cols="45" rows="5" name="detail" id="team-create-detail" class="f-textarea editor"><?php echo htmlspecialchars($news['detail']); ?></textarea></div>
					</div>
					
				<div class="field">
						<label>链接</label>
						<input type="text" size="30" name="url" id="team-create-title" class="f-input" value="<?php echo $news['url']; ?>" />
                       <span class="hint">如果此处添加链接，文章将链接到改地址,(链接格式：http://www.xxxx.com)</span>				
				</div>
                    
                     	<div class="field">
						<label>首页滚动</label>

								<input type="checkbox" class="allowrefund" name="is_index" value="Y" <?php if($news['is_index']=='Y'){?>checked<?php }?>/>&nbsp;是&nbsp;&nbsp;					 
					</div>
                         	<div class="field">
						<label>是否显示</label>

								<input type="checkbox" class="allowrefund" name="display" value="Y" <?php if($news['display']=='Y'){?>checked<?php }?>/>&nbsp;是&nbsp;&nbsp;					 
					</div>
                    
                    	<div class="field">
						<label>排序</label>
						<input type="text" size="5" name="sort_order" id="team-create-title" class="date" value="<?php echo $news['sort_order']; ?>"/>
					</div>
                    
                    
					</div>
					<div class="field"><input type="submit" value="提交" name="commit" id="leader-submit" class="formbutton" style="margin:10px 0 0 120px;"/></div>
				</form>
                </div>
            </div>
        </div>
	</div>
</div>
</div> <!-- bd end -->
</div>
</div> <!-- bdw end -->
<script type="text/javascript">
window.x_init_hook_teamchangetype = function(){
	X.team.changetype("<?php echo $team['team_type']; ?>");
};
window.x_init_hook_page = function() {
	X.team.imageremovecall = function(v) {
		jQuery('#team_image_'+v).remove();
	};
	X.team.imageremove = function(id, v) {
		return !X.get(WEB_ROOT + '/ajax/misc.php?action=imageremove&id='+id+'&v='+v);
	};
};
</script>
<?php include template("manage_footer");?>
