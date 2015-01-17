<?php
require_once("upmp_service.php");
class UpmpHelper{

    //判断是否可用
    static function isAvailable(){
        return (upmp_config::mer_id()&&upmp_config::security_key());
    }
    
    /**获取客户端支付用的tn号
    *
    *@out_trade_no  订单号
    *@subject       商品名称
    *@body          商品描述
    *@totalFee      金额(分)
    *
    */
    static function fetchTradNumber($out_trade_no,$subject,$totalFee,&$err=NULL){
        $totalFee=intval($totalFee);
        $_out_trade_no=str_replace('=', 'dyu', base64_encode($out_trade_no));
        $req['version']             = upmp_config::$version; // 版本号
        $req['charset']             = upmp_config::$charset; // 字符编码
        $req['transType']           = "01"; // 交易类型
        $req['merId']               = upmp_config::mer_id(); // 商户代码
        $req['backEndUrl']          = upmp_config::mer_back_end_url(); // 通知URL
        // $req['frontEndUrl']         = upmp_config::$mer_front_end_url; // 前台通知URL(可选)
        $req['orderDescription']    = $subject;// 订单描述(可选)ans1..32,最大32字节,可送字母、数字、空格、符号(包括-_.空格中英文括号)和中文(字符集u4e00-u9fa5)
        $req['orderTime']           = date("YmdHis"); // 交易开始日期时间yyyyMMddHHmmss
        // $req['orderTimeout']         = ""; // 订单超时时间yyyyMMddHHmmss(可选)
        $req['orderNumber']         = $_out_trade_no; //订单号(商户根据自己需要生成订单号),最长40位数字、字母
        $req['orderAmount']         = $totalFee; // 订单金额
        $req['orderCurrency']       = '156'; // 交易币种(可选) 人民币:156
        $req['reqReserved']         = $out_trade_no; // 请求方保留域(可选，用于透传商户信息)最长 256 个字母、数字或者特殊字符
        // 保留域填充方法
        // $merReserved['test']         = "test";
        // $req['merReserved']          = UpmpService::buildReserved($merReserved); // 商户保留域(可选)
        $resp = array ();
        // pr($req);
        $validResp = UpmpService::trade($req, $resp);
        // 商户的业务逻辑
        if ($validResp&&$resp['tn']){
            // 服务器应答签名验证成功
            // echo 'success<br/>';
            // print_r($resp);die();
            return $resp['tn'];
        }else {
            // 服务器应答签名验证失败
            // echo 'fail<br/>';
            // print_r($resp);die();
            $err=$resp;
            return NULL;
        }
    }

    static function orderStateIsSucc($data)
    {
        /*
            00交易成功结束
            01处理中
            03交易处理失败
        */
        if ($data['transStatus']=='00') {
            return true;
        }else{
            return false;
        }
    }


    static function queryOrder()
    {
        //需要填入的部分
        $req['version']         = upmp_config::$version; // 版本号
        $req['charset']         = upmp_config::$charset; // 字符编码
        $req['transType']       = "01"; // 交易类型
        $req['merId']           = upmp_config::mer_id(); // 商户代码
        $req['orderTime']       = "20140726120541"; // 交易开始日期时间yyyyMMddHHmmss或yyyyMMdd
        $req['orderNumber']     = "Z28tMzItMS16b2Z3"; // 订单号

        // 保留域填充方法
        $merReserved['test']    = "test";
        $req['merReserved']     = UpmpService::buildReserved($merReserved); // 商户保留域(可选)

        $resp = array ();
        $validResp = UpmpService::query($req, $resp);

        // 商户的业务逻辑
        if ($validResp){
            // 服务器应答签名验证成功
            // print_r($resp);
        }else {
            // 服务器应答签名验证失败
            // print_r($resp);
        }
    }

    static function verifySignature($p)
    {
        return UpmpService::verifySignature($p);
    }
}

class upmp_config
{
    
    static $timezone                = "Asia/Shanghai"; //时区
    
    static $version                 = "1.0.0"; // 版本号
    static $charset                 = "UTF-8"; // 字符编码
    static $sign_method             = "MD5"; // 签名方法，目前仅支持MD5
    
    // static $mer_id                   = "880000000001443"; // 商户号
    // static $security_key            = "6txlEZSHBsut8GcyVuXNrqefOR4F88sC"; // 商户密钥
    // static $mer_back_end_url        = "http://www.yourdomain.com/your_path/yourBackEndUrl"; // 后台通知地址
    // static $mer_front_end_url       = "http://www.yourdomain.com/your_path/yourFrontEndUrl"; // 前台通知地址

    // static $upmp_trade_url          = "http://202.101.25.178:8080/gateway/merchant/trade";//下单地址
    // static $upmp_query_url          = "http://202.101.25.178:8080/gateway/merchant/query";//订单查询地址
    
    static $upmp_trade_url          = "https://mgate.unionpay.com/gateway/merchant/trade";//下单地址
    static $upmp_query_url          = "https://mgate.unionpay.com/gateway/merchant/query";//订单查询地址

    const VERIFY_HTTPS_CERT         = false;
    
    const RESPONSE_CODE_SUCCESS     = "00"; // 成功应答码
    const SIGNATURE                 = "signature"; // 签名
    const SIGN_METHOD               = "signMethod"; // 签名方法
    const RESPONSE_CODE             = "respCode"; // 应答码
    const RESPONSE_MSG              = "respMsg"; // 应答信息
    
    const QSTRING_SPLIT             = "&"; // &
    const QSTRING_EQUAL             = "="; // =

    static function security_key(){// 商户密钥
        return C('upmp_mer_security_key');
    }

    static function mer_id(){//商户号
        return C('upmp_mer_id');
    }

    static function mer_back_end_url(){// 后台通知地址
        $url=Utils::payNotifyUrl();
        return $url;
    }

    static function mer_front_end_url(){// 前台通知地址
        $url=self::mer_back_end_url();
        return $url;
    }

}