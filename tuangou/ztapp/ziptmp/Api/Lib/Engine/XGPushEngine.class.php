<?php

class XGPushEngine extends BaseEngine{
	
	private $tab;
	private $db;

	function __construct(){
		$this->tab='app_xgpushusers';
		$this->db=M($this->tab);
		$this->initialize();
	}

	function initialize(){
		$this->createTab();
	}

	function record($id,$plat='unkonwn',$tag=''){
		$data['id']=$id;
		$data['platform']=$plat;
		$data['tag']=$tag;
		return $this->db->add($data);
	}

	function createTab(){
// 表的结构 `app_xgpushusers`
		$tab=$this->tab;
		$tab=mysql_real_escape_string($tab);
		$sql=<<<flag
CREATE TABLE IF NOT EXISTS `$tab` (
  `id` varchar(50) NOT NULL,
  `platform` enum('unkonwn','ios','android') NOT NULL,
  `tag` varchar(50) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
flag;
	$this->db->query($sql);
	}

}