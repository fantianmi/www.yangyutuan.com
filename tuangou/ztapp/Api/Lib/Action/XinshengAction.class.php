<?php

class XinshengAction extends CommonAction {
/*极易付回调后台*/
	public function noticeUrl(){
		$resultCode = I('resultCode');
		$orderNo = I('orderNo');
		if(empty($orderNo)) exit();
		if($resultCode == "EXECUTE_SUCCESS"){
			preg_match('/go.+/',$orderNo,$pay_id);
			$pay = $pay_id[0];
			$result = M('order')->where("pay_id='{$pay}'")->setField("state",'pay');
			file_put_contents("./demo00000.txt",dump(M('order')));
		}
	}
/*APP后台回调*/
	public function noticeUrlApp(){
		$tradeNo       = I('tradeNo');
		$executeStatus = I('executeStatus');
		if(empty($tradeNo)) exit();
		if($executeStatus == true){
			M('order')->where("tradeNo='{$tradeNo}'")->setField('state','pay');
		}
	}
	public function zhifu(){
		/*header("content-type:text/html;charset=utf-8");
		$user_id      = I('user_id');//用户id
		$quantity     = I('quantity');//商品数量
		$team_id      = I('team_id');//商品id
		$partner_id   = M('team')->where("id={$team_id}")->getField('partner_id');//商家id
		if(empty($team_id)) exit(err(100));
		if(empty($quantity)) exit(err(100));
		if(empty($partner_id)) exit(err(100));
		if(empty($user_id)) exit(100);
		$buy_id       = I('user_id');//购买会员的ID
		$service      = 'credit';//支付方式
		$admin_id     = '0';//判断是否管理员
		$state        = 'unpay';//支付状态
		$allowrefund  = 'Y';
		$rstate       = 'normal';
		$mobile       = I('mobile','');//电话号码
		$express      = 'N';//是否选择快递
		$express_id   = '0';//快点编号
		$price        = M('team')->where("id={$team_id}")->getField('team_price');//单价
		$money        = '0';//已支付金额
		$origin       = $price*$quantity;//总价
		$credit       = '0';//积分获取
		$card         = I('card',0);//使用优惠券金额
		$fare         = '0';
		$comment_display = 'Y';//评论显示
		$comment_grade   = 'good';//评论级别
		$luky_id      = '0';
		$sms_express  = 'N';//短息痛症
		$is_bill      = '0';
		$city_id      = M('team')->where("id={$team_id}")->getField('city_id');//城市id
		// $card_id      = I('card_id');//代金券ID
		$data         = array(
			'user_id'     => $user_id,
			'partner_id'  => $partner_id,
			'quantity'    => $quantity,
			'team_id'     => $team_id,
			'buy_id'      => $buy_id,
			'service'     => $service,
			'admin_id'    => $admin_id,
			'state'       => $state,
			'allowrefund' => $allowrefund,
			'rstate'      => $rstate,
			'mobile'      => $mobile,
			'express'     => $express,
			'express_id'  => $express_id,
			'price'       => $price,
			'money'       => $money,
			'origin'      => $origin,
			'credit'      => $credit,
			'card'        => $card,
			'fare'        => $fare,
			'create_time' => time(),
			'comment_display' => $comment_display,
			'comment_grade' => $comment_grade,
			'luky_id'     => $luky_id,
			'sms_express' => $sms_express,
			'is_bill'     => $is_bill,
			'city_id'     => $city_id
		);
		if($order_id = M('order')->add($data)){
			$result = M('order')->field('quantity')->where("id={$order_id}")->find();
			$count  = $result['quantity'];
			$pay_id       = 'go-'.$order_id.'-'.$count.'apps';//订单号带生成
			$saveDate = array(
				'id'     => $order_id,
				'pay_id' => $pay_id
			);
			M('order')->save($saveDate);
		}*/
		$order_id = I('order_id');
		if(empty($order_id)) exit(err(100));
		$order   = M('order')->where("id={$order_id}")->find();
		$orders   = preg_replace('/\./','',$order['origin']);
		$origins = abs($orders);
		$mall    = M('partner')->where("id={$order['partner_id']}")->getField('title');
		$res     = M('team')->where("id={$order['team_id']}")->getField('title');
		$partnerID = M('system')->where("id=2")->getField('value');
		$remark  = "扩展字段";
		$serialID = "bkltech".date("YmdHis");
		$times    = date("YmdHis");
		$stime    = date("YmdHis")+10000000000;
		$returnUrl = "anjingac.bkltech.com.cn/returnUrl.php";
		$noticeUrl = "anjingac.bkltech.com.cn/noticeUrl";
		$reDate  = array(
			'URL'          => "https://www.hnapay.com/website/pay.htm",
			'version'      => '2.6',
			'serialID'     => $serialID,
			'submitTime'   => $times,
			'failureTime'  => $stime,
			'customerIP'   => '',
			'orderDetails' => "{$order['pay_id']},{$origins},{$mall},{$res},{$order['quantity']}",
			'totalAmount'  => $origins,
			'type'         => '1000',
			'buyerMarked'  => '',
			'payType'      => 'ALL',
			'orgCode'      => '',
			'currencyCode' => '1',
			'directFlag'   => '0',
			'borrowingMarked' => '0',
			'couponFlag'   => '1',
			'platformID'   => '',
			'returnUrl'    => $returnUrl,//-----------
			'noticeUrl'    => $noticeUrl,//----
			'partnerID'    => $partnerID,
			'remark'       => $remark,
			'charset'      => '1',
			'signType'     => '2',
			'signMsg'      => "version=2.6&serialID={$serialID}&submitTime={$times}&failureTime={$stime}&customerIP=&orderDetails={$order['pay_id']},{$origins},{$mall},{$res},{$order['quantity']}&totalAmount={$origins}&type=1000&buyerMarked=&payType=ALL&orgCode=&currencyCode=1&directFlag=0&borrowingMarked=0&couponFlag=1&platformID=&returnUrl={$returnUrl}&noticeUrl={$noticeUrl}&partnerID={$partnerID}&remark={$remark}&charset=1&signType=2"
		);
		// dump($reDate);
		echo suc($reDate);
	}

/*获取APP订单号*/
	public function getTradeOrder(){
		$order_id = I('order_id');
		if(empty($order_id)) exit(err(100));
		$order = M('order')->field('pay_id,origin,team_id')->where("id={$order_id}")->find();
		$title = M('team')->where("id={$order['team_id']}")->getField('title');
		/*URL*/
		$this->url = "http://mpay.yijifu.net/gateway";
		/**/
		$this->service = "createTradeOrder";
		/*合作伙伴id*/
		$this->partnerId = "20140730020000048203";//***
		/*请求订单号*/
		$this->orderNo = $this->create_id().$order['pay_id'];//***
		/*签名方式*/
		$this->signType = "MD5";//**
		/**/
		$this->returnUrl = 'http://www.yangyutuan.cn/returnUrl2.php';//**
		/**/
		$this->notifyUrl = 'http://www.yangyutuan.cn/ztapp/api.php/Xinsheng/noticeUrlApp';//***
		/*获取商品名称*/
		$this->tradeName = $title;//**
		/*卖家id*/
		$this->sellerUserId = "20140730020000048203";//**
		/*合作商会员id*/
		$this->partnerUserId = "20140730020000048203";//**
		/*获取总价*/
		$this->tradeAmount = $order['origin'];
		/*协议*/
		$this->protocol = "httpPost";
		/*安全吗*/
		$md5 = "0b3ca56512f7dc39a63cadff06fa7892";
		$sign = "notifyUrl={$this->notifyUrl}&orderNo={$this->orderNo}&partnerId={$this->partnerId}&partnerUserId={$this->partnerUserId}&protocol={$this->protocol}&returnUrl={$this->returnUrl}&sellerUserId={$this->sellerUserId}&service={$this->service}&signType={$this->signType}&tradeAmount={$this->tradeAmount}&tradeName={$this->tradeName}0b3ca56512f7dc39a63cadff06fa7892";
		$this->sign = md5($sign);

		$uri = $this->url;
		// $uri = "localhost/order2.php";
		// 参数数组
		$data = array (
		        'service'        => $this->service, 
				'partnerId'      => $this->partnerId,
				'orderNo'        => $this->orderNo,
				'sellerUserId'   => $this->sellerUserId,
				'tradeAmount'    => $this->tradeAmount,
				'partnerUserId'  => $this->partnerUserId,
				'sign'           => $this->sign,
				'signType'       => $this->signType,
				'notifyUrl'      => $this->notifyUrl,
				'returnUrl'      => $this->returnUrl,
				'tradeName'      => $this->tradeName,
				'protocol'       => $this->protocol,
		);
		$data = trim($this->buildPairs($data),'&');
/*		dump($data);
		die;*/
		$ch = curl_init ();
		// print_r($ch);
		curl_setopt ( $ch, CURLOPT_URL, $uri );
		curl_setopt ( $ch, CURLOPT_POST, count($data) );
		curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, 13); 
		curl_setopt ( $ch, CURLOPT_HEADER, 0 );
		curl_setopt ( $ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt ( $ch, CURLOPT_HTTPHEADER, array('Content-Type: application/x-www-form-urlencoded; charset=UTF-8','Connection: Keep-Alive'));
		curl_setopt ( $ch, CURLOPT_POSTFIELDS, $data );
		$return = curl_exec ( $ch );
		curl_close ( $ch );
		$returns  = json_decode($return,true);
		$orderNo = $returns['orderNo'];
		preg_match('/go.+/',$orderNo,$pay_id);
		$pay = $pay_id[0];
		M('order')->where("pay_id='{$pay}'")->setField('tradeNo',$returns['tradeNo']);
		echo $return;
	}
/*生成唯一订单号*/
	protected function create_id() {
        $randId = '';
        for ($i = 0; $i < 20; $i++){
            $randId .= mt_rand(0,9);
        }
        return $randId;
    }
    public function buildPairs(array $param){
        $postStr = "";
        foreach ($param as $key => $value) {
            $postStr .= $key . '=' .$value. '&';
        }
        return $postStr;
    }
}