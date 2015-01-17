<?php
require_once(dirname(dirname(dirname(__FILE__))) . '/app.php');

need_manager();

$id = abs(intval($_GET['id']));
$movie = $emovie = Table::Fetch('movie', $id);
$allmtypes = DB::LimitQuery('mtype', array(
	'order' => 'ORDER BY id DESC',
));
if ( is_get() && empty($movie) ) {
	$movie = array();
	$movie['id'] = 0;
}
else if ( is_post() ) {
	$movie = $_POST;
	$insert = array(
		'image','mtype','duration','director','mainstar','plot','name','release','like','status','edition','region','shortdes','score','score_integer','score_fractional'
		);
	$movie['like'] = 0;
	$movie['mtype'] = abs(intval($movie['mtype']));
	$movie['edition'] = abs(intval($movie['edition']));
	$movie['region'] = abs(intval($movie['region']));
	$movie['status'] = abs(intval($movie['status']));
	$movie['score'] = abs(floatval ($movie['score']));
	$a = $movie['score'];
    $arr = explode('.',$a);
    $movie['score_integer']=$arr[0];
    if($arr[1]!=null||$arr[1]!=0){
    	$movie['score_fractional']=$arr[1];
    }else{
    	$movie['score_fractional']=0;
    }
	
	$movie['release'] = strtotime($movie['release']);
	$movie['image'] = upload_image('upload_image',$emovie['image'],'team',true);
	//dbx($team);
	$table = new Table('movie', $movie);
	$table->SetStrip('detail', 'systemreview', 'notice');
	
	if ( $movie['id'] && $movie['id'] == $id ) {
		$table->SetPk('id', $id);
		$table->update($insert);
		//json($insert['city_ids'],'alert');
		Session::Set('notice', '编辑电影信息成功');
		redirect( WEB_ROOT . "/manage/movie/index.php");
	} 
	else if ( $movie['id'] ) {
		Session::Set('error', '非法编辑');
		redirect( WEB_ROOT . "/manage/movie/index.php");
	}
	if ( $table->insert($insert) ) {
		Session::Set('notice', '新建电影成功');
		redirect( WEB_ROOT . "/manage/movie/index.php");
	}
	else {
		Session::Set('error', '编辑电影失败');
		redirect(null);
	}
}
include template('manage_movie_edit');
