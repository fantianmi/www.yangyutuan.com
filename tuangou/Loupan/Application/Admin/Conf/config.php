<?php
return array(
	/* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__STATIC__' => __ROOT__ . '/Public/static',
        '__ADDONS__' => __ROOT__ . '/Public/' . MODULE_NAME . '/Addons',
        '__IMG__'    => __ROOT__ . '/Public/' . MODULE_NAME . '/images',
        '__CSS__'    => __ROOT__ . '/Public/' . MODULE_NAME . '/css',
        '__JS__'     => __ROOT__ . '/Public/' . MODULE_NAME . '/js',
        '__JQUERY__'     => __ROOT__ . '/Public/js/jquery.js',
    ),

    /* SESSION 和 COOKIE 配置 */
    'SESSION_PREFIX' => 'wr_admin', //session前缀
    'COOKIE_PREFIX'  => 'wr_admin_', // Cookie前缀 避免冲突
    'VAR_SESSION_ID' => 'session_id',	//修复uploadify插件无法传递session_id的bug

    /*语言包*/
    'LANG_SWITCH_ON'   => true,
    'DEFAULT_LANG'     => 'zh-cn', // 默认语言
    'LANG_AUTO_DETECT' => true, // 自动侦测语言
    'VAR_LANGUAGE'     => 'l', // 默认语言切换变量

    /*权限验证用的配置*/ /*不用检测的都写在这里*/
/**
*@param  modele_name 不用检测的控制器名称
*@param  action_list 当前控制器不用检查的方法，为空表示当前控制器里的所有方法都不要检查
*/
    'IGNORE_PRIV_LIST'=>array(
        array(
            'module_name'=>'Admin',
            'action_list'=>array('ajaxCheckUsername')
        ),
        array(
            'module_name'=>'Public',
            'action_list'=>array()
        ),
        array(
            'module_name'=>'Index',
            'action_list'=>array()
        ),array(
            'module_name'=>'Cache',
            'action_list'=>array()
        ),
    ),
    
);


