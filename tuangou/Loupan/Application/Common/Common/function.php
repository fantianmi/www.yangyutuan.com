<?php
// +----------------------------------------------------------------------
// | 还没准备好！
// +----------------------------------------------------------------------
// | provide by ：
// +----------------------------------------------------------------------
// | Author: 1018808441@qq.com
// +----------------------------------------------------------------------
/**
自定义函数     start
*/

/**
*@param $ret 错误的状态码
*
*@return json错误信息
*/
    function err($ret = 1){
        return json_encode(array('msg'=>'error','ret'=>$ret,'data'=>''));
    }

/**
*@return json成功信息(不带分页)
*/
    function suc($data = ''){
        return json_encode(array('msg'=>'success','ret'=>0,'data'=>$data));
    }

/**
*@return json成功信息(带分页)
*/
    function sucp($pagenum = 1, $pagesize = 10, $totalcount = 0, $data = ''){
        if($totalcount == 0) return json_encode(array('msg'=>'success','ret'=>0,'data'=>''));
        $totalpage = ceil($totalcount/$pagesize);   //计算总页数
        if($pagenum >= $totalpage){
            $hasNextPage = false;
        }else{
            $hasNextPage = true;
        }
        $datas = array(
            'pagedatas'=>$data,
            'totalcount'=>$totalcount,
            'totalpage'=>$totalpage,
            'pagenum'=>$pagenum,
            'pagesize'=>$pagesize,
            'hasNextPage'=>$hasNextPage
        );
        return json_encode(array('msg'=>'success','ret'=>0,'data'=>$datas));
    }




const ONETHINK_VERSION = '1.0.131218';
const ONETHINK_ADDON_PATH = './Addons/';
require_once(APP_PATH . '/Common/Common/thumb.php');
/**
 * 处理插件钩子
 * @param string $hook 钩子名称
 * @param mixed  $params 传入参数
 * @return void
 */
function hook($hook, $params = array()){
    \Think\Hook::listen($hook, $params);
}
/**
 * 获取插件类的类名
 * @param strng $name 插件名
 */
function get_addon_class($name){
    $class = "Addons\\{$name}\\{$name}Addon";
    return $class;
}
/**
 * 获取插件类的配置文件数组
 * @param string $name 插件名
 */
function get_addon_config($name){
    $class = get_addon_class($name);
    if (class_exists($class)) {
        $addon = new $class();
        return $addon->getConfig();
    } else {
        return array();
    }
}
/**
 * 插件显示内容里生成访问插件的url
 * @param string $url url
 * @param array  $param 参数
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function addons_url($url, $param = array()){
    $url = parse_url($url);
    $case = C('URL_CASE_INSENSITIVE');
    $addons = $case ? parse_name($url['scheme']) : $url['scheme'];
    $controller = $case ? parse_name($url['host']) : $url['host'];
    $action = trim($case ? strtolower($url['path']) : $url['path'], '/');

    /* 解析URL带的参数 */
    if (isset($url['query'])) {
        parse_str($url['query'], $query);
        $param = array_merge($query, $param);
    }

    /* 基础参数 */
    $params = array(
        '_addons' => $addons,
        '_controller' => $controller,
        '_action' => $action,
    );
    $params = array_merge($params, $param); //添加额外参数
    if(strtolower(MODULE_NAME)=='admin'){
        return U('Admin/Addons/execute', $params);
    }else{
        return U('Home/Addons/execute', $params);

    }

}
/**
 * 对查询结果集进行排序
 * @access public
 * @param array  $list 查询结果
 * @param string $field 排序的字段名
 * @param array  $sortby 排序类型
 * asc正向排序 desc逆向排序 nat自然排序
 * @return array
 */
function list_sort_by($list, $field, $sortby = 'asc')
{
    if (is_array($list)) {
        $refer = $resultSet = array();
        foreach ($list as $i => $data)
            $refer[$i] = & $data[$field];
        switch ($sortby) {
            case 'asc': // 正向排序
                asort($refer);
                break;
            case 'desc': // 逆向排序
                arsort($refer);
                break;
            case 'nat': // 自然排序
                natcasesort($refer);
                break;
        }
        foreach ($refer as $key => $val)
            $resultSet[] = & $list[$key];
        return $resultSet;
    }
    return false;
}

/**
 * 检测验证码
 * @param  integer $id 验证码ID
 * @return boolean     检测结果
 * @author 还没准备好！ <1018808441@qq.com>
 */
function check_verify($code, $id = 1){
    $verify = new \Think\Verify();
    return $verify->check($code, $id);
}

//清除所有缓存新方法
function deleteCacheData($dir){
        $fileArr    =   file_list($dir);        
        foreach($fileArr as $file)
        {
            if(strstr($file,"Logs")==false)
            {               
                @unlink($file);             
            }
        } 
        
}
//删除商品图片和目录可以是数组或者文件
function file_list($path)
{
    global $fileList;
    if ($handle = opendir($path)) 
    {
        while (false !== ($file = readdir($handle))) 
        {
            if ($file != "." && $file != "..") 
            {
                if (is_dir($path."/".$file)) 
                {                   
                        
                    file_list($path."/".$file);
                } 
                else 
                {
                        //echo $path."/".$file."<br>";
                    $fileList[] =   $path."/".$file;
                }
            }
        }
    }
    return $fileList;
}


function url_parse($url){       
    $rs = preg_match("/^(http:\/\/|https:\/\/)/", $url, $match);
    if (intval($rs)==0) {
        $url = "http://".$url;
    }       
    return $url;
}

//转换时间
function gmt_time()
{   
    return date('YmdHis');
}
//如果不是二维数组返回true
function is_two_array($array){
      return count($array)==count($array, 1);
}


/*关键词替换*/

function replace_keywords($content)
{
    if (empty($content) )
    {
        return($content);
    }
    //获取屏蔽词语
    if(file_exists('./data/word.txt')){
        $str=file_get_contents('./data/word.txt');
        $arrKeywords=explode(',', $str);
        $array_keywords=array();
        foreach ($arrKeywords as $key=>$value){
            $array_keywords[]=explode('|', $value);
        }           
        foreach($array_keywords as $arr)//遍历关键字
        {
            if (strpos($content, $arr[0]) > -1 )
            {
                $content = preg_replace("/" . $arr[0] . "/i", $arr[1], $content);
                $arrTemp[] = $arr;              
            }
        }
        return $content;
    }
    else{
        return $content;
    }
    
}
//表单过滤函数 防止sql注入
function addslashes_set($_string) {
        if (!get_magic_quotes_gpc()) {
            if (is_array($_string)) {
                foreach ($_string as $_key=>$_value) {
                    $_string[$_key] = addslashes_set($_value);  //迭代调用
                }
            } else {
                return addslashes($_string); //mysql_real_escape_string($_string, $_link);不支持就用代替addslashes();
            }
        }
        return $_string;
}   
//对象表单选项转换
function set_obj_form_item($_data, $_key, $_value) {
    $_items = array();
    if (is_array($_data)) {
        foreach ($_data as $_v) {
            $_items[$_v->$_key] = $_v->$_value;
        }
    }
    return $_items;
}
//数组表单转换
function set_array_form_item($_data, $_key, $_value) {
        $_items = array();
        if (is_array($_data)) {
            foreach ($_data as $_v) {
                $_items[$_v[$_key]] = $_v[$_value];
            }
        }
    return $_items;
}

//屏蔽ip
function banip($value1,$value2){
    $ban_range_low=ip2long($value1);
    $ban_range_up=ip2long($value2);
    $ip=ip2long($_SERVER["REMOTE_ADDR"]);           
    if ($ip>=$ban_range_low && $ip<=$ban_range_up)
    {
        echo "对不起,您的IP在被禁止的IP段之中，禁止访问！";
        exit();
    }
}
function get_banip(){
    if(file_exists('./data/banip_config_inc.php')){
        $banip=@file_get_contents('./data/banip_config_inc.php');
        $banip=unserialize($banip);
        return $banip;
    }
    else{
        return false;
    }
}
//把对象数组转换为关联数组的方法
function get_object_vars_final($obj){
    if(is_object($obj)){
        $obj=get_object_vars($obj);
    }
    if(is_array($obj)){
        foreach ($obj as $key=>$value){
            $obj[$key]=get_object_vars_final($value);
        }
    }
    return $obj;
}
function curl($url, $postFields = null)
{
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_FAILONERROR, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        if (is_array($postFields) && 0 < count($postFields))
        {
            $postBodyString = "";
            foreach ($postFields as $k => $v)
            {
                $postBodyString .= "$k=" . urlencode($v) . "&"; 
            }
            unset($k, $v);
            curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, 0);  
            curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0); 
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, substr($postBodyString,0,-1));
        }
        $reponse = curl_exec($ch);
        curl_close($ch);
        return $reponse;
}
//根据url获取id的方法
function get_id($url) {
    $id = 0;
    $parse = parse_url($url);
    if (isset($parse['query'])) {
        parse_str($parse['query'], $params);
        if (isset($params['id'])) {
            $id = $params['id'];
        } elseif (isset($params['item_id'])) {
            $id = $params['item_id'];
        } elseif (isset($params['default_item_id'])) {
            $id = $params['default_item_id'];
        }elseif(isset($params['mallstItemId'])){
            $id = $params['mallstItemId'];
        }else if(isset($params['num_iid '])){
            $id = $params['num_iid'];
        }
    }
    return $id;
}

function addslashes_deep($value) {
    $value = is_array($value) ? array_map('addslashes_deep', $value) : addslashes($value);
    return $value;
}
 
//构造分类树形图
function cateTree ($category, $pid=0, $level=0, $html='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'){
    $tree = array();
    foreach ( $category AS $v ){
        if ( $pid==$v['pid'] ){
            $v['level'] = $level+1;
            $v['html'] = str_repeat($html, $level);
            $v['image'] = ($pid==0) ? 'tv-expandable.gif' : 'tv-collapsable.gif';
             
            $tree[] = $v;

            $tree = array_merge($tree, cateTree($category,$v['id'],$level+1,$html='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'));  
        }
    }
    return $tree;
} 

//  记录操作日志
//  $info  记录的内容
function insertAdminLog ($info){
    $data = array(
        'username' => $_SESSION['admin_info']['user_name'],
        'info'     => $info,
        'add_time' => time(),
        'ip'       => get_client_ip()
        );
    M('admin_log')->add($data);
}

/**
  +----------------------------------------------------------
 * 功能：计算文件大小
  +----------------------------------------------------------
 * @param int $bytes
  +----------------------------------------------------------
 * @return string 转换后的字符串
  +----------------------------------------------------------
 */
function byteFormat($bytes) {
    $sizetext = array(" B", " KB", " MB", " GB", " TB", " PB", " EB", " ZB", " YB");
    return round($bytes / pow(1024, ($i = floor(log($bytes, 1024)))), 2) . $sizetext[$i];
}
/**
  +----------------------------------------------------------
 * 生成随机字符串
  +----------------------------------------------------------
 * @param int       $length  要生成的随机字符串长度
 * @param string    $type    随机码类型：0，数字+大写字母；1，数字；2，小写字母；3，大写字母；4，特殊字符；-1，数字+大小写字母+特殊字符
  +----------------------------------------------------------
 * @return string
  +----------------------------------------------------------
 */
function randCode($length = 5, $type = 0) {
    $arr = array(1 => "0123456789", 2 => "abcdefghijklmnopqrstuvwxyz", 3 => "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 4 => "~@#$%^&*(){}[]|");
    if ($type == 0) {
        array_pop($arr);
        $string = implode("", $arr);
    } else if ($type == "-1") {
        $string = implode("", $arr);
    } else {
        $string = $arr[$type];
    }
    $count = strlen($string) - 1;
    for ($i = 0; $i < $length; $i++) {
        $str[$i] = $string[rand(0, $count)];
        $code .= $str[$i];
    }
    return $code;
}
/**
  +----------------------------------------------------------
 * 功能：检测一个字符串是否是邮件地址格式
  +----------------------------------------------------------
 * @param string $value    待检测字符串
  +----------------------------------------------------------
 * @return boolean
  +----------------------------------------------------------
 */
function is_email($value) {
    return preg_match("/^[0-9a-zA-Z]+(?:[\_\.\-][a-z0-9\-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\.[a-zA-Z]+$/i", $value);
}
