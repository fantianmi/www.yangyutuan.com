<?php


class MovieAction extends CommonAction {
	function movie_list()
	{
		$this->hinfo='
		/**
		*电影信息（可以用于搜索）
		*获取推荐列表
		*请求方式:GET
		*@return maxied 操作结果
		*/';
		$this->_help();
		$movie=new MovieEngine();
		$res=$movie->getMovieList();
		$res=$res?$res:array();
		$data['result'] = array('data'=>$res);
		$this->out($data); 
	}
}
