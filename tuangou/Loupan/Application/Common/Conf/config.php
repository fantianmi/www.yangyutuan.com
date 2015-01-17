<?php
/**
* 系统配文件
* 所有系统级别的配置
*/
return array(
	/* 模块相关配置 */
	'DEFAULT_MODULE'     => 'Admin',//网站默认模块
	'AUTOLOAD_NAMESPACE' => array('Addons' => ONETHINK_ADDON_PATH), //扩展模块列表
	'TMPL_PARSE_STRING'  => array(
		'__JQUERY__'     => __ROOT__ . '/Public/js/jquery.js',
	),

	/* URL配置 */
	'URL_CASE_INSENSITIVE' => true, //默认false 表示URL区分大小写 true则表示不区分大小写

	/* 数据库配置 */
	'DB_TYPE'   => 'mysql', // 数据库类型
	'DB_HOST'   => '127.0.0.1', // 服务器地址
	'DB_NAME'   => 'loupan', // 数据库名
	'DB_USER'   => 'root', // 用户名
	'DB_PWD'    => '',  // 密码
	'DB_PORT'   => '3306', // 端口
	'DB_PREFIX' => 'wr_', // 数据库表前缀

	/*自动加载项目类库*/
	'TAGLIB_BUILD_IN'   => 'cx,html',//默认只载入系统的cx库，在自带的html库加了日期和编辑器的标签，就把自带的html库也加载进来了
	/*
	<editor id="info" name="info" type="WHERES" style="width:70%;height:350px;" >{$article.info}</editor>编辑器标签示例
	*/
	/*
	<calendar name="time_start">{$time_start}</calendar>
    -     日期标签示例
	<calendar name="time_end" more="true">{$time_end}</calendar>
	*/


	/*success和error方法，跳转的模板文件*/
	'TMPL_ACTION_ERROR'     => 'Public:error',
    'TMPL_ACTION_SUCCESS'   => 'Public:success',
);