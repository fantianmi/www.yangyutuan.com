<?php
require_once(dirname(dirname(dirname(__FILE__))) . '/app.php');
//require_once(dirname(__FILE__) . '/current.php');

need_manager();
need_auth('admin');

$id = abs(intval($_REQUEST['id']));
$mtype = Table::Fetch('mtype', $id);
$table = new Table('mtype', $_POST);
$uarray = array( 'name'); 

if (!$_POST['name']) {
	Session::Set('error', '名称不能为空');
	redirect(null);
}

if ( $mtype ) {
	if ( $flag = $table->update( $uarray ) ) {
		Session::Set('notice', '编辑分类成功');
	} else {
		Session::Set('error', '编辑分类失败');
	}
} else {
	if ( $flag = $table->insert( $uarray ) ) {
		Session::Set('notice', '新建分类成功');
	} else {
		Session::Set('error', '新建分类失败');
	}
}
option_category($table->zone, true);
redirect(null);

