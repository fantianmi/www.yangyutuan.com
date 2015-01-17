<?php
require_once(dirname(dirname(dirname(__FILE__))) . '/app.php');

need_manager();
need_auth('market');




$condition = array();
if(abs(intval($_GET['partner_id']))!=0){
	$partner_id = abs(intval($_GET['partner_id']));
	$condition["partner_id"]=$partner_id;
}
if(abs(intval($_GET['bill_sn']))!='0'){
	$bill_sn = abs(intval($_GET['bill_sn']));
	$condition["bill_sn"]=$bill_sn;
}
if(abs(intval($_GET['bill_status']))!=0){
	$bill_status = abs(intval($_GET['bill_status']));
	$condition["bill_status"]=$bill_status;
}
$count = Table::Count('partner_bill', $condition);
list($pagesize, $offset, $pagestring) = pagestring($count, 10);


$partner_bill = DB::LimitQuery('partner_bill', array(
	'condition' => $condition,
	'order' => 'ORDER BY id DESC',
	'size' => $pagesize,
	'offset' => $offset,
));

$option_bill = array(
		'0' => '审核中',
		'1' => '已审核',
		'2' => '已拒绝',
	);
$sql="SELECT * FROM partner";
$partner= DB::GetQueryResult($sql,false);
$partner=Utility::AssColumn($partner, 'id');




include template('manage_partner_bill_list');
