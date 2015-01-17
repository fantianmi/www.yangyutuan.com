<?php
require_once(dirname(dirname(dirname(__FILE__))) . '/app.php');

need_manager();
$condition = array();

$t = strval($_GET['t']);

$count=Table::Count('mtype');
list($pagesize,$offset,$pagestring)=pagestring($count, 20);
$mtypes=DB::LimitQuery('mtype', array(
'size' => $pagesize,
'offset' => $offset,
));
include template('manage_mtype_index');

