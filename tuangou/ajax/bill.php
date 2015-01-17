<?php
require_once(dirname(dirname(__FILE__)) . '/app.php');

need_partner();
$partner_id = abs(intval($_SESSION['partner_id']));
$id = abs(intval($_GET['id']));
$login_partner = Table::Fetch('partner', $partner_id);
$action = strval($_GET['action']);

if ( 'bill' == $action) {

          $where = " WHERE tmp.partner_id='$partner_id' AND tmp.consume='Y' AND tmp.is_bill='0'";
		  $sql="SELECT tmp.id,tmp.js_price FROM (SELECT c.*,t.js_price FROM `coupon` AS c INNER JOIN `team` AS t ON c.team_id=t.id) AS tmp ".$where;
		 	//json($sql, 'alert');	
		 $consumeCoupons = DB::GetQueryResult($sql,false);
		 $bill_price = 0;
		 foreach($consumeCoupons as $key=>$val){
		     $bill_price +=($val['js_price']);
			   /* order update */
				Table::UpdateCache('coupon', $val['id'], array(
							'is_bill' => 1,
			    ));
		 }
		 if(!$bill_price){
		     json('申请账单成金额不足', 'alert');
		 }
		$insert = array(
				'partner_id',
				'bill_sn',
				'add_time',
				'price',
				'bill_status',
				'bank_sn',
				'bank_name',
				'name'
		);
		$bill_arr['partner_id'] = $partner_id;
		$bill_arr['bill_sn'] = date('ymdHi');
		$bill_arr['add_time'] = time();
		$bill_arr['price'] = $bill_price;
		$bill_arr['bill_status'] = 0;
		$bill_arr['bank_sn'] = $login_partner['bank_no'];
		$bill_arr['bank_name'] = $login_partner['bank_name'];
		$bill_arr['name'] = $login_partner['bank_user'];
		$table = new Table('partner_bill', $bill_arr);
		//插入
		if ( $table->insert($insert) ) {
			Session::Set('notice', "申请账单成功");
			json('申请提款成功，等待管理员审核','alert');
     	    json(null, 'refresh');
		}
		else {
			Session::Set('error', '申请账单失败');
			redirect(null);
		}

}
if ( 'billdetail' == $action) {
     $bill = Table::Fetch('partner_bill', $id);
	 $html = render('biz_ajax_dialog_billdetail');
	 json($html, 'dialog');
}

