<?php
// +----------------------------------------------------------------------
// | 爱书很多年
// +----------------------------------------------------------------------
// | provide by ：tecphp.com
// +----------------------------------------------------------------------
// | Author: 84386590@qq.com
// +----------------------------------------------------------------------
namespace Admin\Controller;
class ExtendController extends BaseController {
    /*后台日志列表*/
    public function adminLog (){
        $log_mod =M('admin_log');

        $where = array();
        $time_start = I('time_start', '', 'trim');
        $time_end   = I('time_end', '', 'trim'); 
        if ( !empty($time_start) && !empty($time_end) ){ 
            $where['add_time'] = array(array('egt', strtotime($time_start)),array('elt', strtotime($time_end)+24*3600));
        }elseif ( !empty($time_start) && empty($time_end) ) {
            $where['add_time'] = array('egt', strtotime($time_start));
        }elseif ( empty($time_start) && !empty($time_end) ) {
            $where['add_time'] = array('elt', strtotime($time_end));   
        }

        $count = $log_mod->where($where)->count();
        $page  = new \Think\Page($count,20);
        $lists = $log_mod->where($where)->order('id DESC')->limit($page->firstRow.','.$page->listRows)->select();
       
        $this->assign('lists', $lists);
        $this->assign('page',  $page->show());
        $this->assign('time_start',   $time_start);
        $this->assign('time_end',     $time_end);
        $this->display();
    }
    /*删除日志*/
    public function log_delete (){
        $log_ids = I('id', '', 'trim');
        if (empty($log_ids)){
            $this->error('请至少选择一条信息');
        }
        $ids = implode(',', $log_ids);
        if (M('admin_log')->delete($ids)){
            insertAdminLog('删除日志--ids：'.$ids);
            $this->success('操作成功');
        }else{
            $this->error('操作失败');
        }
    }

    /*数据库导出*/
    public function databaseExport (){
        $m = M();
        if ( IS_POST ){
            function_exists('set_time_limit') && set_time_limit(0); //防止备份数据过程超时
            $tables = empty($_POST['table']) ? array() : $_POST['table'];
            if ( empty($tables) ){
                $this->error('选择要备份的数据表');
            }
            $time = time();
            $bakupfile = dirname($_SERVER['SCRIPT_FILENAME']).'/Data/Sql/'.date('YmdHis').'.sql';

 
            $outPut = '';
            $outPut .= "# -----------------------------------------------------------\n" .
                "# Database backup files\n" .
                "# Web: http://tecphp.com\n" .
                "# Time: ".date('Y-m-d H:i') . "\n" .
                "# ------------------------------------------------------------\n";
            foreach ( $tables as $table ){ 
                $outPut .= "\n\n#表的结构 {$table}\n";
                $createTable = $m->query("SHOW CREATE TABLE `{$table}`"); 
                $outPut .= $createTable[0]['Create Table'].';';

                $outPut .= "\n#数据表 {$table} 的数据信息\n";
                $tableInfo = $m->query("SELECT * FROM `{$table}`");  

                $tt = ''; 
                foreach ( $tableInfo as $k=>$v ){
                    $tt .= "INSERT INTO `{$table}` VALUES(";  
                    foreach ($v as $value) {  
                        //这里要把value 替换下
                        $tt .=  "'{$value}'".',';
                    } 
                    $tt = substr($tt, 0, -1);
                    $tt .= ");\n";
                } 
                $outPut .= $tt;
            }    

            if (file_put_contents($bakupfile, $outPut)){
                insertAdminLog('备份数据库');
                $this->success('备份文件成功');
            }else{
                $this->error('备份文件失败');
            }

        }else{ 
            //列出系统中所有的数据表信息 
            $tables = $m->query('SHOW TABLE STATUS');
            $total = 0;
            foreach ($tables as $k=>$v){
                $tables[$k]['size'] = byteFormat($v['Data_length']+$v['Index_length']);
                $total += $v['Data_length']+$v['Index_length'];
            } 
            $this->assign('tables',     $tables);
            $this->assign('total',      byteFormat($total));

            //所有已备份的数据库sql文件    
            $sqlfiles = glob(dirname($_SERVER['SCRIPT_FILENAME']).'/Data/Sql/*.sql');
            //print_r($sqlfiles);
            if (is_array($sqlfiles)){ 
                rsort( $sqlfiles);
                $sqlinfo = array();
                foreach($sqlfiles as $id=>$sqlfile) {
                    //老的数据库备份文件转换为新格式 
                    if(preg_match("/([0-9]{14}\.sql)/i",basename($sqlfile),$num)) {
                        $sqlinfo[$id]['filename'] = basename($sqlfile);
                        $sqlinfo[$id]['filesize'] = byteFormat(filesize($sqlfile));
                        $sqlinfo[$id]['maketime'] = date('Y-m-d H:i:s', filemtime($sqlfile));
                    }
                }
            }
            $this->assign('sqlinfo',    $sqlinfo); 
            
            $this->display();
        }
    }
    /*修复数据表*/
    public function repairData (){
        $table = I('table', '', 'trim');
        if ( empty($table) ){
            $this->error('请选择要修复的数据表');
        }
        $m = M();
        if ($m->query("REPAIR TABLE {$table}")){
            insertAdminLog('修复数据表 '.$table);
            $this->success('修复成功');
        }else{
            $this->error('修复失败');
        }
    }
    /*优化数据表*/
    public function optimizeData (){
        $table = I('table', '', 'trim');
         if ( empty($table) ){
            $this->error('请选择要优化的数据表');
        }
        $m = M();
        if ($m->query("OPTIMIZE TABLE {$table}")){
            insertAdminLog('优化数据表 '.$table);
            $this->success('优化成功');
        }else{
            $this->error('优化失败');
        }
    }
    /*删除备份数据文件*/
    public function delData (){
        $sql = I('sql', '', 'trim');
        $link = dirname($_SERVER['SCRIPT_FILENAME'])."/Data/Sql/".$sql;
        if ( @unlink($link) ){
            insertAdminLog('删除备份数据文件');
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
}

?>