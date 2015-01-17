<?php

class UploadAction extends CommonAction {
    public function XgPush($id=NULL,$plat=NULL,$tag=''){
    	$this->hinfo='
		/**
		*收集推送用户
		*	id 用户唯一id；为了ios不和android好识别，建议ios 用格式为 i_xxxx ,android 用 a_xxxxx
		*	plat 平台 ios or android
		*	tag	标签，可以不传，多个请以逗号分割 
		*
		*请求方式:GET
		*@return maxied 操作结果
		*/';
		$this->_help();
		if($id&&$plat){
			$XgPush=new XGPushEngine();
			$XgPush->record($id,$plat,$tag);
			$data['status'] = 1;
			$data['result']	= 'succ';
		}else{
			$data['status'] = 0;
			$data['error']	= C('ERR_500');
		}
		$this->out($data); 
    }
}
