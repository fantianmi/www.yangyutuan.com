<?php
/**
* 
*/
class TenpayFuns
{
	static function isTenpaySign($pars,$tenpaykey)
	{
		$tenpaySign=strtolower($pars['sign']);
		unset($pars['sign']);
		$vars=array();
		foreach ($pars as $key => $value) {
			if ($value!='')$vars[$key]=$value;
		}
		ksort($vars);
		$url='';
		foreach ($vars as $key => $value) {
			$url.=$key.'='.$value.'&';
		}
		$sign=$url.'key='.$tenpaykey;
		$sign=strtolower(md5($sign));
		return $sign == $tenpaySign;
	}

	static function intiTenpayUrl($sp_billno,$product,$total_fee,$sale_plat,$callback_data){
	
		$tenpay=Utils::getTenpay();
		$sk=$tenpay['mid'];
		$sec=$tenpay['sec'];

		if (!$sk||!$sec) {
			return false;
		}

		$host=Utils::host();
		
		$vars['ver']='2.0';
		$vars['sale_plat']=$sale_plat;//平台，ios：201 安卓：211
		$vars['bank_type']='0';

		if(mb_strlen($product, "UTF-8") >30){
			$product = mb_substr($product, 0, 28, "UTF-8");
			$product.='...';
		}
		$vars['desc']=$product;
		$vars['bargainor_id']=$sk;
		$vars['attach']='_client';

		$vars['sp_billno']=$sp_billno;
		$vars['total_fee']=$total_fee*100;

		$vars['notify_url']=Utils::payNotifyUrl();//新地址
		$dir = getAppDirName();
		$vars['callback_url']=$host."/$dir/api.php?s=PayReturn/payResultPage/id/".$callback_data;

		ksort($vars);
		$url='';
		foreach ($vars as $key => $value) {
			$url.=$key.'='.$value.'&';
		}
		$sign=$url.'key='.$sec;
		// echo $sign.'       ';
		$sign=md5($sign);
		$url='';
		$vars['notify_url']=urlencode($vars['notify_url']);
		// $vars['return_url']=urlencode($vars['return_url']);
		$vars['callback_url']=urlencode($vars['callback_url']);
		$vars['desc']=urlencode($vars['desc']);
		foreach ($vars as $key => $value) {
			$url.=$key.'='.$value.'&';
		}
		$url.='sign='.strtoupper($sign);
		$url='https://cl.tenpay.com/cgi-bin/wappayv2.0/wappay_init.cgi?'.$url;
		// echo $url.'   ';
		return $url;
	}
}


?>