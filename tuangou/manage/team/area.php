<?php
require_once(dirname(dirname(dirname(__FILE__))) . '/app.php');
need_manager();
need_auth('team');


$fid = $_GET["fid"];
$zone = $_GET["zone"];

$condition = array(
	'zone' => 'area',
	'display' => 'Y',
);
if ($fid) { 
	$condition[] = " fid = ".$fid ;
}
$cate = DB::LimitQuery('category', array(
	'condition' => $condition,
	'order' => 'ORDER BY id DESC',
));
if(!$cate) die('<option value="0">暂无细分类</option>');
$cates = Utility::OptionArray($cate, 'id', 'name');
die (Utility::Option($cates));