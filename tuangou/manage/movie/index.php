<?php
require_once(dirname(dirname(dirname(__FILE__))) . '/app.php');

need_manager();
$condition = array();
/* filter start */
$movie_status = strval($_GET['movie_status']);
if ($movie_status) { $condition['status'] = $movie_status; }
$movie_id = abs(intval($_GET['movie_id']));
if ($movie_id) {
	$condition['id'] = $movie_id;
} else { $movie_id = null; }
$movie_key = strval($_GET['movie_key']);
if ($movie_key ) {
	$condition[] = "name LIKE '%".mysql_escape_string($movie_key)."%'";
}
/* filter end */

$count = Table::Count('movie', $condition);
list($pagesize, $offset, $pagestring) = pagestring($count, 20);

$movies = DB::LimitQuery('movie', array(
	'condition' => $condition,
	'order' => 'ORDER BY id DESC',
	'size' => $pagesize,
	'offset' => $offset,
));
$mtypes = Table::Fetch('mtype', Utility::GetColumn($movies, 'mtype'));
$selector = 'index';

include template('manage_movie_index');

