<?php
// 电影相关
define(TAB_MOVIE, 'movie');

class MovieEngine extends BaseEngine{
function getMovieList(){
		$where=array();
		$res=self::objsFromTable(TAB_MOVIE);
		return $res;
	}
}