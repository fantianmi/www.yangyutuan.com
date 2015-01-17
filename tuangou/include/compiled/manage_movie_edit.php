<?php include template("manage_header");?>
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
<script src="/static/acebackend/calendar/js/calendar.js"  type="text/javascript"></script>
<div id="bdw" class="bdw">
<?php include template("manage_left_menu");?>
<div class="right_main">
<div id="bd" class="cf">
<div id="leader">
	<div class="dashboard" id="dashboard">
	</div>
	<div id="content" class="clear mainwide">
        <div class="clear box">

            <div class="box-content">
                <div class="head">
				<?php if($team['id']){?>
					<h2>编辑项目</h2>
					<ul class="filter"><?php echo current_manageteam('edit', $team['id']); ?></ul>
				<?php } else { ?>
					<h2>新建电影</h2>
				<?php }?>
				</div>
                <div class="sect">
				<form id="-user-form" method="post" action="/manage/movie/edit.php?id=<?php echo $movie['id']; ?>" enctype="multipart/form-data" class="validator">
					<input type="hidden" name="id" value="<?php echo $movie['id']; ?>" />
					<div class="field">
						<label>类型</label>
						<select name="mtype" id="mtype" require='true' datatype="require" >
							<?php if(is_array($allmtypes)){foreach($allmtypes AS $index=>$mtype) { ?>
							<option value="<?php echo $mtype['id']; ?>"<?php if($mtype['id']==$movie['mtype']){?> selected<?php }?>><?php echo $mtype['name']; ?></option>
							<?php }}?>
						</select>
					</div>
					<div class="field">
						<label>状态：</label>
						<select name="status" id="city_id" require='true' datatype="require" >
							<option value="1"  <?php if(1==$movie['status']){?> selected<?php }?>>即将上映</option>
							<option value="2"  <?php if(2==$movie['status']){?> selected<?php }?>>上映中</option>
							<option value="3"  <?php if(3==$movie['status']){?> selected<?php }?>>已结束</option>
						</select>
					</div>
					<div class="field">
						<label>海报</label>
						<input type="file" size="30" name="upload_image" id="team-create-image" class="f-input" value="$movie['image']"/>
						<?php if($movie['image']){?><span class="hint"><img src="<?php echo team_image($movie['image']); ?>"></span><?php }?>
					</div>
					<div class="field">
						<label>电影名</label>
						<input type="text" size="30" name="name"  id="team-create-title" class="f-input" value="<?php echo htmlspecialchars($movie['name']); ?>" datatype="require" require="true" />
					</div>
					<div class="field">
						<label>上映时间</label>
						<input type="text" size="10" name="release" onFocus="setday(this);"  id="team-create-begin-time" class="date" xd="<?php echo date('Y-m-d', $movie['release']); ?>" xt="<?php echo date('H:i:s', $movie['release']); ?>" value="<?php echo date('Y-m-d H:i:s', $movie['release']); ?>" maxLength="10" />
					</div>
					<div class="field">
						<label>打分</label>
						<input type="text" size="10" name="score"  value="<?php echo htmlspecialchars($movie['score']); ?>"  maxLength="10"  placeholder="请输入0~10范围内的数，如7.2"/>
					</div>
					<div class="field">
						<label>版本</label>
						<select name="edition" id="edition" require='true' datatype="require">
							<option value="1"  <?php if(1==$movie['edition']){?> selected<?php }?>>2D</option>
							<option value="2"  <?php if(2==$movie['edition']){?> selected<?php }?>>3D</option>
							<option value="3"  <?php if(3==$movie['edition']){?> selected<?php }?>>4D</option>
						</select>
					</div>
					<div class="field">
						<label>地区</label>
						<select name="region" id="region" require='true' datatype="require">
							<option value="1"  <?php if(1==$movie['region']){?> selected<?php }?>>大陆</option>
							<option value="2"  <?php if(2==$movie['region']){?> selected<?php }?>>港台</option>
							<option value="3"  <?php if(3==$movie['region']){?> selected<?php }?>>欧美</option>
							<option value="4"  <?php if(4==$movie['region']){?> selected<?php }?>>日韩</option>
							<option value="5"  <?php if(5==$movie['region']){?> selected<?php }?>>其它</option>
						</select>
					</div>
					<div class="field">
						<label>影片长度</label>
						<input type="text" size="30" name="duration"  id="team-create-title" class="f-input" value="<?php echo htmlspecialchars($movie['duration']); ?>" datatype="require" require="true" />
					</div>
					<div class="field">
						<label>导演</label>
						<input type="text" size="30" name="director"  id="team-create-title" class="f-input" value="<?php echo htmlspecialchars($movie['director']); ?>" datatype="require" require="true" />
					</div>
					<div class="field">
						<label>主演</label>
						<input type="text" size="30" name="mainstar"  id="team-create-title" class="f-input" value="<?php echo htmlspecialchars($movie['mainstar']); ?>" datatype="require" require="true" />
					</div>
					<div class="field">
						<label>一句话简介</label>
						<input type="text" size="30" name="shortdes"  id="team-create-title" class="f-input" value="<?php echo htmlspecialchars($movie['shortdes']); ?>" datatype="require" require="true" maxLength="40" />
					</div>
					<div class="field">
						<label>简介</label>
						<div style="float:left;"><textarea cols="45" rows="5" name="plot" id="team-create-detail" class="f-textarea editor"><?php echo htmlspecialchars($movie['plot']); ?></textarea></div>
					</div>
					<div class="field">
						<label></label>
						<input type="submit" value="好了，提交" name="commit" id="leader-submit" class="formbutton" style="margin:10px 0 0 120px;"/>
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
