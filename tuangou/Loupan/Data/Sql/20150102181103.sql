# -----------------------------------------------------------
# Database backup files
# Web: http://tecphp.com
# Time: 2015-01-02 18:11
# ------------------------------------------------------------


#表的结构 wr_access
CREATE TABLE `wr_access` (
  `role_id` int(5) NOT NULL,
  `node_id` int(5) NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `node_id` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
#数据表 wr_access 的数据信息
INSERT INTO `wr_access` VALUES('2','132');
INSERT INTO `wr_access` VALUES('2','131');
INSERT INTO `wr_access` VALUES('2','130');
INSERT INTO `wr_access` VALUES('2','129');
INSERT INTO `wr_access` VALUES('2','128');
INSERT INTO `wr_access` VALUES('2','127');
INSERT INTO `wr_access` VALUES('2','126');
INSERT INTO `wr_access` VALUES('2','110');
INSERT INTO `wr_access` VALUES('2','109');
INSERT INTO `wr_access` VALUES('2','108');
INSERT INTO `wr_access` VALUES('2','107');
INSERT INTO `wr_access` VALUES('2','104');
INSERT INTO `wr_access` VALUES('2','106');
INSERT INTO `wr_access` VALUES('2','105');
INSERT INTO `wr_access` VALUES('2','103');
INSERT INTO `wr_access` VALUES('2','102');
INSERT INTO `wr_access` VALUES('2','101');
INSERT INTO `wr_access` VALUES('2','100');
INSERT INTO `wr_access` VALUES('2','99');
INSERT INTO `wr_access` VALUES('2','51');
INSERT INTO `wr_access` VALUES('2','50');
INSERT INTO `wr_access` VALUES('2','16');
INSERT INTO `wr_access` VALUES('2','15');
INSERT INTO `wr_access` VALUES('2','14');
INSERT INTO `wr_access` VALUES('2','13');
INSERT INTO `wr_access` VALUES('2','12');
INSERT INTO `wr_access` VALUES('2','11');
INSERT INTO `wr_access` VALUES('2','10');
INSERT INTO `wr_access` VALUES('2','9');
INSERT INTO `wr_access` VALUES('2','8');
INSERT INTO `wr_access` VALUES('2','7');
INSERT INTO `wr_access` VALUES('2','6');
INSERT INTO `wr_access` VALUES('2','5');
INSERT INTO `wr_access` VALUES('2','4');
INSERT INTO `wr_access` VALUES('2','3');
INSERT INTO `wr_access` VALUES('2','2');
INSERT INTO `wr_access` VALUES('2','1');
INSERT INTO `wr_access` VALUES('4','1');
INSERT INTO `wr_access` VALUES('4','2');
INSERT INTO `wr_access` VALUES('4','3');
INSERT INTO `wr_access` VALUES('4','4');
INSERT INTO `wr_access` VALUES('4','5');
INSERT INTO `wr_access` VALUES('4','6');
INSERT INTO `wr_access` VALUES('4','7');
INSERT INTO `wr_access` VALUES('4','8');
INSERT INTO `wr_access` VALUES('4','9');
INSERT INTO `wr_access` VALUES('4','10');
INSERT INTO `wr_access` VALUES('4','11');
INSERT INTO `wr_access` VALUES('4','12');
INSERT INTO `wr_access` VALUES('4','13');
INSERT INTO `wr_access` VALUES('4','14');
INSERT INTO `wr_access` VALUES('4','15');
INSERT INTO `wr_access` VALUES('4','16');
INSERT INTO `wr_access` VALUES('4','50');
INSERT INTO `wr_access` VALUES('4','51');
INSERT INTO `wr_access` VALUES('1','127');
INSERT INTO `wr_access` VALUES('1','126');
INSERT INTO `wr_access` VALUES('1','102');


#表的结构 wr_ad
CREATE TABLE `wr_ad` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `board_id` smallint(5) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `start_time` int(10) NOT NULL,
  `end_time` int(10) NOT NULL,
  `clicks` int(10) NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL,
  `ordid` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `board_id` (`board_id`,`start_time`,`end_time`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
#数据表 wr_ad 的数据信息
INSERT INTO `wr_ad` VALUES('6','6','code','phonegap中文网','http://www.phonegap100.com','<script type=\"text/javascript\">alimama_pid=\"mm_30949159_3378420_11349182\";alimama_width=950;alimama_height=90;</script><script src=\"http://a.alimama.cn/inf.js\" type=\"text/javascript\"></script>','1333595088','1365217491','104','1333681516','1','1');
INSERT INTO `wr_ad` VALUES('7','5','image','凡客','','512ad36e181c5.png','1333683143','1365219146','11','1333683151','2','1');
INSERT INTO `wr_ad` VALUES('9','5','text','测试','http://192.168.1.51/wegou_news/uc_client','测试广告','1360598400','1361462400','0','1361773236','0','1');


#表的结构 wr_adboard
CREATE TABLE `wr_adboard` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `width` smallint(5) NOT NULL,
  `height` smallint(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
#数据表 wr_adboard 的数据信息
INSERT INTO `wr_adboard` VALUES('4','详细页横幅','banner','950','100','','1');
INSERT INTO `wr_adboard` VALUES('5','详细页右侧','banner','226','226','','1');
INSERT INTO `wr_adboard` VALUES('6','首页下方横幅','banner','960','100','','1');


#表的结构 wr_admin
CREATE TABLE `wr_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `add_time` int(10) DEFAULT NULL,
  `last_time` int(10) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `role_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
#数据表 wr_admin 的数据信息
INSERT INTO `wr_admin` VALUES('1','admin','0192023a7bbd73250516f069df18b500','1407848436','','1','1');
INSERT INTO `wr_admin` VALUES('2','测试','e10adc3949ba59abbe56e057f20f883e','1407853542','1407853542','1','2');
INSERT INTO `wr_admin` VALUES('4','admin1','0192023a7bbd73250516f069df18b500','1420101399','1420101399','1','1');


#表的结构 wr_admin_log
CREATE TABLE `wr_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
#数据表 wr_admin_log 的数据信息
INSERT INTO `wr_admin_log` VALUES('25','admin','更新数据库缓存','1415543457','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('24','admin','更新全站缓存','1415542866','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('23','admin','更新后台模板','1415542861','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('22','admin','编辑菜单--id：1','1415541667','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('21','admin','编辑菜单--id：1','1415541585','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('20','admin','编辑菜单--id：1','1415541435','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('19','admin','编辑类别--id：10','1415541252','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('18','admin','编辑类别--id：10','1415541247','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('17','admin','删除菜单--ids：109','1415541234','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('16','admin','删除日志--ids：15,14,13,12,11,10,9,8,7,6,5,4,3','1415540792','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('26','admin','更新前台模板','1415543461','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('27','admin','编辑菜单--id：1','1415543496','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('28','admin','编辑菜单--id：1','1415543559','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('29','admin','编辑菜单--id：1','1415543567','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('30','admin','优化数据表 t_article','1419162228','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('31','admin','编辑类别--id：1','1420089635','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('32','admin','添加article类别--测试来的','1420089820','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('33','admin','删除类别--ids：15','1420089826','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('34','admin','添加article类别--123','1420092481','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('35','admin','编辑类别--id：16','1420092515','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('36','admin','编辑类别--id：16','1420092542','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('37','admin','删除类别--ids：16','1420092551','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('38','admin','编辑文章--id：2','1420093485','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('39','admin','编辑文章--id：2','1420093493','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('40','admin','编辑文章--id：2','1420093519','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('41','admin','编辑文章--id：2','1420093540','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('42','admin','编辑文章--id：2','1420093548','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('43','admin','编辑文章--id：2','1420093566','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('44','admin','编辑文章--id：2','1420094225','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('45','admin','编辑文章--id：2','1420094279','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('46','admin','编辑文章--id：2','1420095109','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('47','admin','添加文章--id：3','1420095218','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('48','admin','编辑文章--id：3','1420095237','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('49','admin','编辑文章--id：3','1420095248','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('50','admin','编辑文章--id：3','1420095295','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('51','admin','删除文章--ids：3','1420095328','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('52','admin','添加广告位--草泥马啊','1420096045','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('53','admin','编辑广告位--id：1','1420096128','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('54','admin','编辑广告位--id：1','1420096142','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('55','admin','删除广告位--ids：8','1420096149','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('56','admin','添加广告--糙米','1420096380','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('57','admin','编辑广告--id：11','1420096487','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('58','admin','编辑广告--id：11','1420096493','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('59','admin','编辑广告--id：11','1420096507','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('60','admin','删除广告--ids：11','1420096512','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('61','admin','编辑广告--id：7','1420097491','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('62','admin','优化数据表 wr_article','1420098604','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('63','admin','优化数据表 wr_cate','1420098607','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('64','admin','修复数据表 wr_adboard','1420098650','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('65','admin','备份数据库','1420098825','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('66','admin','备份数据库','1420098882','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('70','admin','删除日志--ids：69','1420099063','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('71','admin','删除备份数据文件','1420099146','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('72','admin','备份数据库','1420099154','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('73','admin','删除备份数据文件','1420099160','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('74','admin','备份数据库','1420099165','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('75','admin','修改网站设置','1420099301','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('76','admin','添加菜单分类--id：33','1420100183','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('77','admin','编辑菜单分类--id：33','1420100237','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('78','admin','编辑菜单分类--id：33','1420100242','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('79','admin','编辑菜单分类--id：33','1420100248','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('80','admin','删除菜单分类--ids：33','1420100251','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('81','admin','添加菜单--id：162','1420100398','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('82','admin','编辑菜单--id：1','1420100498','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('83','admin','编辑菜单--id：1','1420100505','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('84','admin','删除菜单--ids：162','1420100513','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('85','admin','添加导航--id：21','1420100630','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('86','admin','修改导航--id：1','1420100737','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('87','admin','修改导航--id：1','1420100751','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('88','admin','修改导航--id：1','1420100763','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('89','admin','修改导航--id：1','1420100816','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('90','admin','删除导航--ids：21','1420100822','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('91','admin','添加角色--id：4','1420100964','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('92','admin','编辑角色--id：1','1420101013','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('93','admin','编辑角色--id：1','1420101018','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('94','admin','角色授权--角色id：4','1420101026','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('95','admin','添加管理员：测试1212','1420101231','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('96','admin','编辑管理员：测试1212--id：3','1420101290','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('97','admin','编辑管理员：测试12--id：3','1420101311','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('98','admin','删除管理员--ids：3','1420101332','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('99','admin','添加管理员：admin1','1420101399','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('100','admin','删除角色--ids：4','1420101457','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('101','admin','角色授权--角色id：1','1420101549','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('102','admin1','删除文章--ids：2','1420101573','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('103','admin1','添加文章--id：4','1420101612','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('104','admin','角色授权--角色id：1','1420101655','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('105','admin1','编辑文章--id：4','1420101685','127.0.0.1');
INSERT INTO `wr_admin_log` VALUES('106','admin','角色授权--角色id：1','1420175641','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('107','admin','角色授权--角色id：1','1420175770','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('108','admin','角色授权--角色id：1','1420175971','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('109','admin','角色授权--角色id：1','1420175982','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('110','admin','角色授权--角色id：1','1420176411','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('111','admin','编辑菜单--id：1','1420176571','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('112','admin','编辑菜单--id：1','1420176580','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('113','admin','编辑菜单--id：1','1420176586','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('114','admin','编辑菜单--id：1','1420176593','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('115','admin','编辑菜单--id：1','1420176599','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('116','admin','编辑菜单--id：1','1420176614','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('117','admin','编辑菜单--id：1','1420176620','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('118','admin','编辑菜单--id：1','1420176624','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('119','admin','编辑菜单--id：1','1420176628','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('120','admin','编辑菜单--id：1','1420176633','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('121','admin','编辑菜单--id：1','1420176681','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('122','admin','编辑菜单--id：1','1420176687','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('123','admin','添加菜单--id：163','1420176911','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('124','admin','编辑菜单--id：1','1420176938','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('125','admin','添加菜单--id：164','1420176992','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('126','admin','添加菜单--id：165','1420177063','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('127','admin','添加菜单--id：166','1420177099','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('128','admin','添加菜单--id：167','1420177614','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('129','admin','角色授权--角色id：1','1420177649','0.0.0.0');
INSERT INTO `wr_admin_log` VALUES('130','admin','删除备份数据文件','1420193457','0.0.0.0');


#表的结构 wr_article
CREATE TABLE `wr_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` tinyint(4) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `orig` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `abst` varchar(255) NOT NULL,
  `info` mediumtext NOT NULL,
  `add_time` datetime NOT NULL,
  `ordid` tinyint(4) NOT NULL,
  `is_hot` tinyint(1) NOT NULL DEFAULT '0',
  `is_best` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-待审核 1-已审核',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `is_best` (`is_best`),
  KEY `add_time` (`add_time`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
#数据表 wr_article 的数据信息
INSERT INTO `wr_article` VALUES('4','10','dasd','das','','dasd','dasd','dasd','2015-01-01 16:40:12','0','1','1','1','','','');


#表的结构 wr_cate
CREATE TABLE `wr_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `zone` varchar(20) DEFAULT NULL COMMENT '类别标示 如文章类别为article',
  `name` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` smallint(4) unsigned NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
#数据表 wr_cate 的数据信息
INSERT INTO `wr_cate` VALUES('1','article','网站信息','sites','11','1','4','我操123','','');
INSERT INTO `wr_cate` VALUES('5','article','新手入门','rumen','11','1','2','','','');
INSERT INTO `wr_cate` VALUES('9','article','热门活动1','activity','10','1','5','网站在线帮助说明','111111111111111111111','2222222222222222');
INSERT INTO `wr_cate` VALUES('10','article','资讯活动','news','0','1','0','网站资讯0','','');
INSERT INTO `wr_cate` VALUES('11','article','网站帮助','sites','0','1','1','','','');


#表的结构 wr_flink
CREATE TABLE `wr_flink` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) NOT NULL DEFAULT '1',
  `img` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `ordid` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
#数据表 wr_flink 的数据信息
INSERT INTO `wr_flink` VALUES('6','1','/flink/2015-01-01/54a4fad5a1218.jpg','百度','http://www.baidu.com','1','0');
INSERT INTO `wr_flink` VALUES('8','1','/flink/2015-01-01/54a4fac66e123.jpg','hao123','http://www.hao123.com','1','1');


#表的结构 wr_flink_cate
CREATE TABLE `wr_flink_cate` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
#数据表 wr_flink_cate 的数据信息
INSERT INTO `wr_flink_cate` VALUES('1','友情链接');
INSERT INTO `wr_flink_cate` VALUES('2','合作伙伴');


#表的结构 wr_group
CREATE TABLE `wr_group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `title` varchar(50) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
#数据表 wr_group 的数据信息
INSERT INTO `wr_group` VALUES('4','content','内容','1222841259','1407849991','1','3');
INSERT INTO `wr_group` VALUES('1','system','设置','1222841259','1222841259','1','7');
INSERT INTO `wr_group` VALUES('8','member','用户','0','0','1','5');
INSERT INTO `wr_group` VALUES('9','home','我的面板','0','1341386748','1','0');
INSERT INTO `wr_group` VALUES('32','extend','扩展','0','0','1','6');


#表的结构 wr_nav
CREATE TABLE `wr_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort_order` smallint(4) NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-系统 0-自定义',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '导航位置1-顶部 2-底部',
  `in_site` tinyint(1) NOT NULL COMMENT '1-本站内 0-站外',
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` text NOT NULL,
  `seo_desc` text NOT NULL,
  `items_cate_id` int(11) DEFAULT NULL COMMENT '//分类id',
  PRIMARY KEY (`id`),
  KEY `is_show` (`is_show`),
  KEY `type` (`type`),
  KEY `sort_order` (`sort_order`),
  KEY `alias` (`alias`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
#数据表 wr_nav 的数据信息


#表的结构 wr_node
CREATE TABLE `wr_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `module_name` varchar(50) NOT NULL,
  `action` varchar(255) NOT NULL,
  `action_name` varchar(50) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0',
  `auth_type` tinyint(1) NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned DEFAULT '0',
  `often` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-不常用 1-常用',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-不常用 1-常用',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `module` (`module`),
  KEY `auth_type` (`auth_type`),
  KEY `is_show` (`is_show`),
  KEY `group_id` (`group_id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;
#数据表 wr_node 的数据信息
INSERT INTO `wr_node` VALUES('1','Node','菜单列表管理','','','','1','','2','0','1','0','0');
INSERT INTO `wr_node` VALUES('2','Node','菜单列表管理','index','菜单列表','','1','','0','1','1','0','0');
INSERT INTO `wr_node` VALUES('3','Node','菜单列表管理','add','添加菜单','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('4','Node','菜单列表管理','edit','编辑菜单','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('5','Node','菜单列表管理','delete','删除菜单','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('6','Role','角色管理','','','','1','','1','0','1','0','0');
INSERT INTO `wr_node` VALUES('7','Role','角色管理','index','角色管理','','1','','0','1','1','0','0');
INSERT INTO `wr_node` VALUES('8','Role','角色管理','add','添加角色','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('9','Role','角色管理','edit','编辑角色','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('10','Role','角色管理','delete','删除角色','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('11','Role','角色管理','auth','角色授权','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('12','Admin','管理员管理','','','','1','','0','0','1','0','0');
INSERT INTO `wr_node` VALUES('13','Admin','管理员管理','index','管理员列表','','1','','0','1','1','0','0');
INSERT INTO `wr_node` VALUES('14','Admin','管理员管理','add','添加管理员','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('15','Admin','管理员管理','edit','编辑管理员','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('16','Admin','管理员管理','delete','删除管理员','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('50','Setting','网站设置','','','','1','','399','0','1','0','0');
INSERT INTO `wr_node` VALUES('51','Setting','网站设置','index','网站设置','','1','','0','1','1','0','0');
INSERT INTO `wr_node` VALUES('99','Flink','友情链接','','','','1','','4','0','32','0','0');
INSERT INTO `wr_node` VALUES('100','Flink','友情链接','index','友情链接列表','','1','','0','1','32','0','0');
INSERT INTO `wr_node` VALUES('101','Article','内容管理','','内容管理','','1','','999','0','4','0','0');
INSERT INTO `wr_node` VALUES('102','Article','内容管理','index','文章列表','','1','','0','1','4','0','0');
INSERT INTO `wr_node` VALUES('103','Article','内容管理','add','添加文章','','1','','0','1','4','0','0');
INSERT INTO `wr_node` VALUES('104','Cate','类别管理','','','','1','','1000','0','4','0','0');
INSERT INTO `wr_node` VALUES('105','Article','内容管理','edit','编辑文章','','1','','0','2','4','0','0');
INSERT INTO `wr_node` VALUES('106','Article','内容管理','delete','删除文章','','1','','0','2','4','0','0');
INSERT INTO `wr_node` VALUES('107','Cate','类别管理','article','文章类别','','1','','0','1','4','0','0');
INSERT INTO `wr_node` VALUES('108','Cate','类别管理','add','添加分类','','1','','0','2','4','0','0');
INSERT INTO `wr_node` VALUES('110','Cate','类别管理','delete','删除分类','','1','','0','2','4','0','0');
INSERT INTO `wr_node` VALUES('161','Extend','扩展','databaseExport','数据库导出','','1','','0','1','32','0','0');
INSERT INTO `wr_node` VALUES('160','Extend','扩展','log_delete','删除日志','','1','','0','2','32','0','0');
INSERT INTO `wr_node` VALUES('121','Nav','导航管理','','','','1','','2','0','1','0','0');
INSERT INTO `wr_node` VALUES('122','Nav','导航管理','index','导航列表','','1','','0','1','1','0','0');
INSERT INTO `wr_node` VALUES('123','Nav','导航管理','add','添加导航','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('124','Nav','导航管理','edit','编辑导航','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('125','Nav','导航管理','delete','删除导航','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('126','Public','起始页','','','','1','','0','0','9','0','0');
INSERT INTO `wr_node` VALUES('127','Public','起始页','main','后台首页','','1','','0','1','9','0','0');
INSERT INTO `wr_node` VALUES('128','Group','菜单分类管理','','','','1','菜单分类管理','3','0','1','0','0');
INSERT INTO `wr_node` VALUES('129','Group','菜单分类管理','index','分类列表','','1','','0','1','1','0','0');
INSERT INTO `wr_node` VALUES('130','Group','菜单分类管理','add','增加分类','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('131','Group','菜单分类管理','edit','编辑分类','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('132','Group','菜单分类管理','delete','删除分类','','1','','0','2','1','0','0');
INSERT INTO `wr_node` VALUES('159','Extend','扩展','adminLog','后台操作日志','','1','','100','1','32','0','0');
INSERT INTO `wr_node` VALUES('158','Extend','扩展','','','','1','','0','0','32','0','0');
INSERT INTO `wr_node` VALUES('145','Adboard','广告位置','','','','1','','800','0','32','0','0');
INSERT INTO `wr_node` VALUES('146','Adboard','广告位置','index','广告位置','','1','','0','1','32','0','0');
INSERT INTO `wr_node` VALUES('147','Adboard','广告位置','add','添加广告位置','','1','','0','2','32','0','0');
INSERT INTO `wr_node` VALUES('148','Adboard','广告位置','edit','编辑广告位置','','1','','0','2','32','0','0');
INSERT INTO `wr_node` VALUES('149','Adboard','广告位置','delete','删除广告位置','','1','','0','2','32','0','0');
INSERT INTO `wr_node` VALUES('150','Ad','广告管理','','','','1','','3','0','32','0','0');
INSERT INTO `wr_node` VALUES('151','Ad','广告管理','index','广告列表','','1','','799','1','32','0','0');
INSERT INTO `wr_node` VALUES('152','Ad','广告位置','add','添加广告','','1','','0','2','32','0','0');
INSERT INTO `wr_node` VALUES('153','Ad','广告位置','edit','编辑广告','','1','','0','2','32','0','0');
INSERT INTO `wr_node` VALUES('154','Ad','广告位置','delete','删除广告','','1','','0','2','32','0','0');
INSERT INTO `wr_node` VALUES('155','User','会员管理','','','','1','','0','0','8','0','0');
INSERT INTO `wr_node` VALUES('156','User','会员管理','index','会员列表','','1','','0','1','8','0','0');
INSERT INTO `wr_node` VALUES('163','Flink','友情链接','add','添加友情链接','','1','','0','2','32','0','0');
INSERT INTO `wr_node` VALUES('164','Flink','友情链接','edit','编辑友情链接','','1','','0','2','32','0','0');
INSERT INTO `wr_node` VALUES('165','Flink','友情链接','del','删除友情链接','','1','','0','2','32','0','0');


#表的结构 wr_role
CREATE TABLE `wr_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
#数据表 wr_role 的数据信息
INSERT INTO `wr_role` VALUES('1','管理员','1','管理员1','1208784792','1254325558');
INSERT INTO `wr_role` VALUES('2','编辑','1','编辑','1208784792','1254325558');


#表的结构 wr_setting
CREATE TABLE `wr_setting` (
  `name` varchar(100) NOT NULL,
  `data` text NOT NULL,
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
#数据表 wr_setting 的数据信息
INSERT INTO `wr_setting` VALUES('site_name','爱书很多年0');
INSERT INTO `wr_setting` VALUES('site_title','MobileCms移动后台管理系统');
INSERT INTO `wr_setting` VALUES('site_keyword','MobileCms移动后台管理系统，phonegap100.com');
INSERT INTO `wr_setting` VALUES('site_description','MobileCms是一款移动互联网软件后台管理系统，由phonegap100.com 提供');
INSERT INTO `wr_setting` VALUES('site_status','1');
INSERT INTO `wr_setting` VALUES('site_icp','京ICP备88888888号');
INSERT INTO `wr_setting` VALUES('statistics_code','');
INSERT INTO `wr_setting` VALUES('closed_reason','升级');
INSERT INTO `wr_setting` VALUES('site_domain','http://localhost:8080/sys');
INSERT INTO `wr_setting` VALUES('logout_time','3000');
INSERT INTO `wr_setting` VALUES('mail_smtp','smtp.163.com');
INSERT INTO `wr_setting` VALUES('mail_username','ho1000003@163.comho1000004@163.comho1000005@163.comhml100000@163.com');
INSERT INTO `wr_setting` VALUES('mail_password','admin123');
INSERT INTO `wr_setting` VALUES('mail_port','root');
INSERT INTO `wr_setting` VALUES('mail_fromname','MobileCms');
INSERT INTO `wr_setting` VALUES('check_code','1');
INSERT INTO `wr_setting` VALUES('site_share','<meta property=\"qc:admins\" content=\"271503564761116217636\" />');
INSERT INTO `wr_setting` VALUES('ban_sipder','youdaobot|bingbot');
INSERT INTO `wr_setting` VALUES('ban_ip','192.168.1.50');
INSERT INTO `wr_setting` VALUES('site_logo','./data/setting/524a5cbde8499.jpg');
INSERT INTO `wr_setting` VALUES('mail_username','ho1000003@163.comho1000004@163.comho1000005@163.comhml100000@163.com');
INSERT INTO `wr_setting` VALUES('mail_receive_username','');
INSERT INTO `wr_setting` VALUES('mail_content','<body style=\"margin: 10px;\">
<div align=\"center\"><img src=\"http://www.phonegap100.com/static/image/common/logo.png\"></div><br>
<br>
 <h3>欢迎使用 树根cms 此系统由phonegap中文网 <a href=\"http://www.phonegap100.com\" target=\"_blank\">phonegap100.com</a>提供 </h3>
<br>

在使用中遇到任何问题，请到phonegap中文网提出，感谢大家对此程序的支持，我们的qq群：295402925

</body>');
INSERT INTO `wr_setting` VALUES('mail_title','欢迎使用树根cms，这是一封感谢信');
