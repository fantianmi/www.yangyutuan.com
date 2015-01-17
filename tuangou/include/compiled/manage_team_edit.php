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
function changecate(cid) {
	jQuery.get("category.php",{
		'cateid':cid
		},function(data){
			jQuery("#sub_id").load('category.php?cateid='+cid );
		});
}

function changeArea(self,fid,zone){
	jQuery.this=jQuery(self);
	jQuery.get("area.php",{
		'fid':fid,
		'zone':zone
		},function(data){
			jQuery.this.next().html(data);
			if(self.name=='city_id'){
				$this.next().next().html('<option value="">选择商圈</option>');
			}
		});
}

</script>
<script src="/static/acebackend/calendar/js/calendar.js"  type="text/javascript"></script>
<div id="bdw" class="bdw">
<?php include template("manage_left_menu");?>
<div class="right_main">
<div id="bd" class="cf">
<div id="leader">
	<div class="dashboard" id="dashboard">
		<ul><?php echo mcurrent_team('team'); ?></ul>
	</div>
	<div id="content" class="clear mainwide">
        <div class="clear box">

            <div class="box-content">
                <div class="head">
				<?php if($team['id']){?>
					<h2>编辑项目</h2>
					<ul class="filter"><?php echo current_manageteam('edit', $team['id']); ?></ul>
				<?php } else { ?>
					<h2>新建项目</h2>
				<?php }?>
				</div>
                <div class="sect">
				<form id="-user-form" method="post" action="/manage/team/edit.php?id=<?php echo $team['id']; ?>" enctype="multipart/form-data" class="validator">
					<input type="hidden" name="id" value="<?php echo $team['id']; ?>" />
					<div class="wholetip clear"><h3>1、基本信息</h3></div>
					<div class="field">
						<label>项目类型</label>
						<select name="team_type" class="f-input" style="width:160px;" onchange="X.team.changetype(this.options[this.options.selectedIndex].value);"><?php echo Utility::Option($option_teamtype, $team['team_type']); ?></select>
						<select name="group_id" onchange="changecate(this.options[this.options.selectedIndex].value);" class="f-input" style="width:160px;"><?php echo Utility::Option($groups, $team['group_id']); ?></select>
                        <select name="sub_id" class="f-input" id="sub_id" style="width:160px;"><option value="0">选择细分类</option><?php echo Utility::Option($level_groups, $team['sub_id']); ?></select>
					</div>
					<div class="field">
						<label>所属商圈：</label>
						<select name="city_id" id="city_id" require='true' datatype="require" onchange="changeArea(this,this.value,'area')">
							<option value="">选择城市</option>
							<?php if(is_array($allcities)){foreach($allcities AS $index=>$city) { ?>
							<option value="<?php echo $city['id']; ?>"<?php if($city['id']==$team['city_id']){?> selected<?php }?>><?php echo $city['name']; ?></option>
							<?php }}?>
						</select>
						<select name="area_id" id="area_id" datatype="require" onchange="changeArea(this,this.value,'circle')">
							<option value="">选择区域</option>
							<?php echo Utility::Option($areas, $team['area_id']); ?>
						</select>

					</div>
					<div class="field" id="field_limit">
						<label>限制条件</label>
						<select name="conduser" class="f-input" style="width:160px;"><?php echo Utility::Option($option_cond, $team['conduser']); ?></select>
						<select name="buyonce" class="f-input" style="width:160px;"><?php echo Utility::Option($option_buyonce, $team['buyonce']); ?></select>
					</div>
					<div class="field">
						<label>项目标题</label>
						<input type="text" size="30" name="title" id="team-create-title" class="f-input" value="<?php echo htmlspecialchars($team['title']); ?>" datatype="require" require="true" />
					</div>
					<div class="field">
						<label>市场价</label>
						<input type="text" size="10" name="market_price" id="team-create-market-price" class="number" value="<?php echo moneyit($team['market_price']); ?>" datatype="money" require="true" />
						<label>网站价</label>
						<input type="text" size="10" name="team_price" id="team-create-team-price" class="number" value="<?php echo moneyit($team['team_price']); ?>" datatype="double" require="true" />
                        <label>结算价</label>
						<input type="text" size="10" name="js_price" id="team-create-js-price" class="number" value="<?php echo moneyit($team['js_price']); ?>" datatype="double" require="true" />
						<label>虚拟购买</label>
						<input type="text" size="10" name="pre_number" id="team-create-pre_number" class="number" value="<?php echo moneyit($team['pre_number']); ?>" datatype="number" require="true" />
					</div>
					<div class="field">
						<label>最低数量</label>
						<input type="text" size="10" name="min_number" id="team-create-min-number" class="number" value="<?php echo intval($team['min_number']); ?>" maxLength="6" datatype="number" require="true" />
						<label>最高数量</label>
						<input type="text" size="10" name="max_number" id="team-create-max-number" class="number" value="<?php echo intval($team['max_number']); ?>" maxLength="6" datatype="number" require="true" />
						<label>每人限购</label>
						<input type="text" size="10" name="per_number" id="team-create-per-number" class="number" value="<?php echo intval($team['per_number']); ?>" maxLength="6" datatype="number" require="true" />
					        <label>最低购买</label>
						<input type="text" size="10" name="permin_number" id="team-create-per-min-number" class="number" value="<?php echo intval($team['permin_number']); ?>" maxLength="6" datatype="number" require="true" />
                                          	<span class="hint">最低数量必须大于0，最高数量/每人限购：0 表示没最高上限 （产品数|人数 由成团条件决定）</span>
					</div>
					<div class="field">
						<label>开始时间</label>
						<input type="text" size="10" name="begin_time" onFocus="setday(this);"  id="team-create-begin-time" class="date" xd="<?php echo date('Y-m-d', $team['begin_time']); ?>" xt="<?php echo date('H:i:s', $team['begin_time']); ?>" value="<?php echo date('Y-m-d H:i:s', $team['begin_time']); ?>" maxLength="10" />
						<label>结束时间</label>
						<input type="text" size="10" name="end_time"  id="team-create-end-time" onFocus="setday(this);" class="date" xd="<?php echo date('Y-m-d', $team['end_time']); ?>" xt="<?php echo date('H:i:s', $team['end_time']); ?>" value="<?php echo date('Y-m-d H:i:s', $team['end_time']); ?>" maxLength="10" />
						<label><?php echo $INI['system']['couponname']; ?>有效期</label>
						<input type="text" size="10" name="expire_time" onFocus="setday(this);" id="team-create-expire-time" class="number" value="<?php echo date('Y-m-d', $team['expire_time']); ?>" maxLength="10" />
						<span class="hint">时间格式：hh:ii:ss (例：14:05:58)，日期格式：YYYY-MM-DD （例：2010-06-10）</span>
					</div>
					<div class="field">
						<label>允许退款</label>

								<input type="checkbox" class="allowrefund" name="allowrefund" value="Y" <?php if($team['allowrefund']=='Y'){?>checked<?php }?>/>&nbsp;是&nbsp;&nbsp;<span style="font-size:12px;color:#989898;">本项目允许用户发起 申请退款</span>						 
					</div>
                    	<div class="field">
						<label>首页推荐</label>

								<input type="checkbox" class="allowrefund" name="index_rec" value="Y" <?php if($team['index_rec']=='Y'){?>checked<?php }?>/>&nbsp;是&nbsp;&nbsp;<span style="font-size:12px;color:#989898;">首页推荐项目 </span>						 
					</div>
                     	<div class="field">
						<label>免预约</label>

								<input type="checkbox" class="allowrefund" name="free_yuyue" value="Y" <?php if($team['free_yuyue']=='Y'){?>checked<?php }?>/>&nbsp;是&nbsp;&nbsp;					 
					</div>
                    	<div class="field">
						<label>周末通用</label>

								<input type="checkbox" class="allowrefund" name="weekend" value="Y" <?php if($team['weekend']=='Y'){?>checked<?php }?>/>&nbsp;是&nbsp;&nbsp;					 
					</div>
                    	<div class="field">
						<label>节假日通用</label>

								<input type="checkbox" class="allowrefund" name="holiday" value="Y" <?php if($team['holiday']=='Y'){?>checked<?php }?>/>&nbsp;是&nbsp;&nbsp;					 
					</div>
                       	<div class="field">
						<label>无线WIFI</label>

								<input type="checkbox" class="allowrefund" name="wifi" value="Y" <?php if($team['wifi']=='Y'){?>checked<?php }?>/>&nbsp;是&nbsp;&nbsp;					 
					</div>
                       	<div class="field">
						<label>停车位</label>

								<input type="checkbox" class="allowrefund" name="park" value="Y" <?php if($team['park']=='Y'){?>checked<?php }?>/>&nbsp;是&nbsp;&nbsp;					 
					</div>
                       	<div class="field">
						<label>本单评分</label>

								<input type="text"  size="10" name="score" value="<?php if($team['score']){?><?php echo $team['score']; ?><?php } else { ?>5.0<?php }?>" />	
                                <span style="font-size:12px;color:#989898;">填写0.0-5.0之间的数字 </span>								 
					</div>
					</div>
					<!--kxx 增加-->
					<div class="field">
						<label>排序</label>
						<input type="text" size="10" name="sort_order" id="team-create-sort_order" class="number" value="<?php echo $team['sort_order'] ? $team['sort_order'] : 0; ?>" datatype="number"/><span class="inputtip">请填写数字，数值大到小排序，主推团购应设置较大值</span>
					</div>
					<!--xxk-->
					<input type="hidden" name="guarantee" value="Y" />
					<input type="hidden" name="system" value="Y" />
					<div class="wholetip clear"><h3>2、项目信息</h3></div>
					<div class="field">
						<label>商户</label>
						<select name="partner_id"  id="partner_select" datatype="require" require="require" class="f-input" style="width:200px;"><?php echo Utility::Option($partners, $team['partner_id'], '------ 请选择商户 ------'); ?></select>&nbsp;<input type="text" size="30" name="p_id" id="partner_id" class="partner" style="float: left;display:inline;width:200px;border-color: #ccc;border-style: solid;border-width: 1px;font-size: 14px;margin: 3px 15px 0 10px;padding: 5px 4px;" /><span class="inputtip">输入关键字查找,  商户为可选项</span>
					</div>
					<div class="field" id="field_card">
						<label>代金券使用</label>
						<input type="text" size="10" name="card" id="team-create-card" class="number" value="<?php echo moneyit($team['card']); ?>" require="true" datatype="money" />
						<span class="inputtip">可使用代金券最大面额</span>
					</div>
					<div class="field" id="field_card">
						<label>邀请返利</label>
						<input type="text" size="10" name="bonus" id="team-create-bonus" class="number" value="<?php echo moneyit($team['bonus']); ?>" require="true" datatype="money" />
						<span class="inputtip">邀请好友参与本单商品购买时的返利金额</span>
					</div>
					<div class="field">
						<label>商品名称</label>
						<input type="text" size="30" name="product" id="team-create-product" class="f-input" value="<?php echo $team['product']; ?>" datatype="require" require="true" />
					</div>
					<div class="field">
						<label>购买必选项</label>
						<input type="text" size="30" name="condbuy" id="team-create-condbuy" class="f-input" value="<?php echo $team['condbuy']; ?>" />
						<span class="hint">格式如：{黄色}{绿色}{红色}@{大号}{中号}{小号}@{男款}{女款}，分组使用@符号分隔 , 用户购买的必选项</span>
					</div>
					<div class="field">
						<label>商品图片1</label>
						<input type="file" size="30" name="upload_image" id="team-create-image" class="f-input" />
						<?php if($team['image']){?><span class="hint"><?php echo team_image($team['image']); ?></span><?php }?>
					</div>
					<div class="field">
						<label>商品图片2</label>
						<input type="file" size="30" name="upload_image1" id="team-create-image1" class="f-input" />
						<?php if($team['image1']){?><span class="hint" id="team_image_1"><?php echo team_image($team['image1']); ?>&nbsp;&nbsp;<a href="javascript:;" onclick="X.team.imageremove(<?php echo $team['id']; ?>, 1);">删除</a></span><?php }?>
					</div>
					<div class="field">
						<label>商品图片3</label>
						<input type="file" size="30" name="upload_image2" id="team-create-image2" class="f-input" />
						<?php if($team['image2']){?><span class="hint" id="team_image_2"><?php echo team_image($team['image2']); ?>&nbsp;&nbsp;<a href="javascript:;" onclick="X.team.imageremove(<?php echo $team['id']; ?>, 2);">删除</a></span><?php }?>
					</div>
					<div class="field">
						<label>商品图片4</label>
						<input type="file" size="30" name="upload_image3" id="team-create-image3" class="f-input" />
						<?php if($team['image2']){?><span class="hint" id="team_image_3"><?php echo team_image($team['image3']); ?>&nbsp;&nbsp;<a href="javascript:;" onclick="X.team.imageremove(<?php echo $team['id']; ?>, 3);">删除</a></span><?php }?>
					</div>
					<div class="field">
						<label>商品图片5</label>
						<input type="file" size="30" name="upload_image4" id="team-create-image4" class="f-input" />
						<?php if($team['image2']){?><span class="hint" id="team_image_4"><?php echo team_image($team['image4']); ?>&nbsp;&nbsp;<a href="javascript:;" onclick="X.team.imageremove(<?php echo $team['id']; ?>, 4);">删除</a></span><?php }?>
					</div>
					<div class="field">
						<label>FLV视频短片</label>
						<input type="text" size="30" name="flv" id="team-create-flv" class="f-input" value="<?php echo $team['flv']; ?>" />
						<span class="hint">形式如：http://.../video.flv</span>
					</div>
                    <div class="field">
						<label>温馨提示</label>
						<div style="float:left;"><textarea cols="45" rows="5" name="summary" id="team-create-summary" class="f-textarea editor" datatype="require" require="true">
                        <?php if($team['summary']){?>
                        <?php echo htmlspecialchars($team['summary']); ?>
                          <?php } else { ?>
                        <table class="meal_list" width="100%" border="1" cellspacing="0" cellpadding="0">
        <tbody>
        <tr>
        <td width="15%"   height="36">有效期： </td>
        <td width="80%"   height="36">2014年04月11日至2015年02月27日，周末通用，节假日通用；</td>
        </tr>
        <tr>
        <td   height="32">使用时间： </td>
        <td   height="32">11:30-02:30；</td>
        </tr>
        <tr>
        <td   height="32">预约提醒： </td>
        <td   height="32">本单需提前2小时预约，预约电话：2021-888888；</td>
        </tr>
        <tr>
        <td   rowspan="3">使用限制：</td>
        <td   height="32">购买限制：每人不限购买团购券份数； </td>
        </tr>
        <tr>
        <td   height="32">使用限制：每人不限使用份数，每张团购券建议2人使用；仅供堂食，不提供外卖及打包服务； </td>
        </tr>
        <tr>
        <td   height="32">通用规则：团购券不兑现、不找零、不与店内其它优惠同享；</td>
        </tr>
        </tbody>
        </table>
                  <?php }?>        
                        </textarea></div>
                    
                    
					<div class="field">
						<label>团购详情</label>
						<div style="float:left;"><textarea cols="45" rows="5" name="detail" id="team-create-detail" class="f-textarea editor"><?php echo htmlspecialchars($team['detail']); ?></textarea></div>
					</div>
                    
                    	<div class="field">
						<label>手机端详情</label>
						<div style="float:left;"><textarea cols="45" rows="5" name="wap_detail" id="team-create-wap-detail" class="f-textarea editor"><?php echo htmlspecialchars($team['wap_detail']); ?></textarea></div>
					</div>

                    
                    <div class="field">
                            <label>附近的团购</label>
                       <input type="text" size="20" name="fj_team_id" id="team-create-fj_team_id" class="f-input" value="<?php echo $team['fj_team_id']; ?>" />
							<span class="hint">填写商品ID用英文逗号隔开例如：12,65,45,32</span>
                        </div>
          
					<div class="wholetip clear"><h3>3、配送信息</h3></div>
					<div class="field">
						<label>递送方式</label>
						<div style="margin-top:5px;" id="express-zone-div">
							<input type="radio" name="delivery" class="delivery" value="coupon" <?php echo $team['delivery']=='coupon'?'checked':''; ?> />&nbsp;<?php echo $INI['system']['couponname']; ?>&nbsp;
							<!-- <input type="radio" name="delivery" class="delivery" value='voucher' <?php echo $team['delivery']=='voucher'?'checked':''; ?> />&nbsp;商户券&nbsp; -->
						    <!-- <input type="radio" name="delivery" class="delivery" value='express' <?php echo $team['delivery']=='express'?'checked':''; ?> />&nbsp;快递</div> -->
					</div>
					<div id="express-zone-coupon" style="display:<?php echo $team['delivery']=='coupon'?'block':'none'; ?>;">
						<div class="field">
							<label>消费返利</label>
							<input type="text" size="10" name="credit" id="team-create-credit" class="number" value="<?php echo moneyit($team['credit']); ?>" datatype="money" require="true" />
							<span class="inputtip">消费<?php echo $INI['system']['couponname']; ?>时，获得账户余额返利，单位CNY元</span>
						</div>
					</div>
					<div id="express-zone-pickup" style="display:<?php echo $team['delivery']=='pickup'?'block':'none'; ?>;">
						<div class="field">
							<label>联系电话</label>
							<input type="text" size="10" name="mobile" id="team-create-mobile" class="f-input" value="<?php echo $team['mobile']; ?>" />
						</div>
						<div class="field">
							<label>自取地址</label>
							<input type="text" size="10" name="address" id="team-create-address" class="f-input" value="<?php echo $team['address']; ?>" />
						</div>
					</div>
					<div id="express-zone-express" style="display:<?php echo $team['delivery']=='express'?'block':'none'; ?>;">
						<div class="field">
							<label>快递(<a href="/manage/category/index.php?zone=express" target="_blank">编辑</a>)</label>
							<table style="font-size:14px;width:400px;"><tbody>
								<tr>
									<td width="10%"></td>
									<td width="20%">名称</td>
									<td width=>价格<td>
								</tr>
							<?php if(is_array($express)){foreach($express AS $index=>$one) { ?>
								<tr>
									<td><input type="checkbox" name="express_relate[]" value="<?php echo $one['id']; ?>" <?php echo $one['checked']; ?> class="express_relate"  datatype="require" require="true" /></td>
									<td><?php echo $one['name']; ?></td>
									<td><input name="express_price_<?php echo $one['id']; ?>" value="<?php echo $one['relate_data']; ?>"></td>
								</tr>
							<?php }}?>
							</tbody></table>
						</div>
						<div class="field">
							<!-- <label>快递费用</label>
							<input type="text" size="10" name="fare" id="team-create-fare" class="number" value="<?php echo intval($team['fare']); ?>" maxLength="6" datatype="money" require="true" />
							 -->
							<label>免单数量</label>
							<input type="text" size="10" name="farefree" id="team-create-farefree" class="number" value="<?php echo intval($team['farefree']); ?>" maxLength="6" datatype="integer" require="true" />
							<span class="hint">免单数量：-1表示免运费, 0表示不免运费，1表示，购买1件免运费, 2表示，购买2件免运费 ,以此类推</span>
						</div>
						<div class="field">
							<label>配送说明</label>
							<div style="float:left;"><textarea cols="45" rows="5" name="express" id="team-create-express" class="f-textarea"><?php echo $team['express']; ?></textarea></div>
						</div>
					</div>
					<input type="submit" value="好了，提交" name="commit" id="leader-submit" class="formbutton" style="margin:10px 0 0 120px;"/>
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
