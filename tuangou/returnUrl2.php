<?php
/*$data  = '';
$data .= "out=".$_REQUEST['outOrderNo'];
file_put_contents("./returnRul288888888.txt", $_REQUEST);
if($_REQUEST['resultCode'] == "EXECUTE_SUCCESS"){
	preg_match('/go.+/',$_REQUEST['orderNo']);
}*/

$fileData = '';
$fileData .= "resultCode : ".$_REQUEST['resultCode']."\r\n";
$fileData .= "orderNo : ".$_REQUEST['orderNo']."\r\n";
$fileData .= "resultMessage : ".$_REQUEST['resultMessage']."\r\n";
/*
$data  = '666';
$data .= $_REQUEST['tradeNo']."\r\n";
$data .= $_REQUEST['tradeType']."\r\n";
$data .= $_REQUEST['accountDay']."\r\n";
file_put_contents("./noticeUrl288888888.txt", $data);*/
file_put_contents("./returnUrl288888888.txt", $fileData);
