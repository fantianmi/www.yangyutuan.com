<?php
return array(

/*

!!!!请将原先AlipayKeyChain文件夹删除

商户私钥为商家自行生成，支付宝公钥需要用商户私钥对应的公钥去支付宝商家后台换取

公钥注意事项，公钥必须以 -----BEGIN PUBLIC KEY----- 和 -----END PUBLIC KEY----- 包着，换行位置请勿自行修改
格式例如：
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCORBndEe18p0qgo4KKBfRAHtFzT8BVMddnzpT/
2aWldw2I1XUZKAbAjrmyBPsf/lUdC4sGhkoS2CvmQNjx2lu6/xsOQRW70sUIEvpZMo1RUUlh3Cxg
3f88cmN2Zwz2aCZWVXNSsGmQOQdeyKQviVtNxQ6S2hm4OAW4KIgxQzvhZQIDAQAB
-----END PUBLIC KEY-----

公钥注意事项，公钥必须以 -----BEGIN RSA PRIVATE KEY----- 和 -----END RSA PRIVATE KEY----- 包着，换行位置请勿自行修改
格式例如：
-----BEGIN RSA PRIVATE KEY-----
MIICWwIBAAKBgQC6d2p9DdbBAGjoWWBiQQiG3rJSzarAeaAHgjwkBhAkdxMhftWC
d7qaWbgcpDy/7b42C9Mu5JBIy5LEO5apxWI+859HCtT8LTkSNCCNNOj26xW4iIo6
Iz99gwVYiOVRpApHhcbUADPQsZF0SwUVf37EqVRAdCUTeHYVy6nc1JLZcQIDAQAB
AoGABNngelpm0OSa1hilKkk42JFooEDbhWBkqm1X9TP3LYuvgrqTAW7t+uAEqzIW
poOf5DYQi3LE0jABpHtMYyRQdvltGZS/YvMIfNy0pdbzdDaQjWZXoMJwimzCBkvQ
LgQJQYJpR5vakBmwmHP0Arkj0Oah2T1hYzuINn+ZcNc05xUCQQDjKV5q3HU8Nw9E
h6kb60B3ZMUZTGw9gpXywTjjjnF9pG7INrPVkkvZrUr3MIvG/SN0V/XuiTD9IOh0
Ojzzx2zDAkEA0iN6I83uVFbcK0dt/hIbpeAaMCz4+raeZbUGmIFkjAGd7te+Gcnq
TfPBV/b4Wy8xbjqfBSOs5Dfk2VJuFRWNuwJAE6ncE3H77/dwKeV4XQNTNEKT0SnN
YNGx+y6ApyoIZvDZ6hjaHk2opTIcACPCpbn53LNUhY54oCC+HnmAFzYXEwJAVPkd
mb7bIeWh0CppMvUVkwTE8jgtUgxojs4d5atlAixhNcStzXXVtkHcK/rlQNIblexE
g2qCriJf+vUXKJV3owJAOFutnF8JCNSAzfwE2GGn6cOa/loQqsAIonL0G1+KwoSi
SxA5pYWeKlHT5NHKLggZkQtJiNy3i69PtuglbL7qSQ==
-----END RSA PRIVATE KEY-----


证书生成辅助工具
http://t.cn/8k7tIiw
*/
//以下为例子，请团长们自己生成自己的密钥

//支付宝公钥 
//去 https://ms.alipay.com/index.htm	--我的商家服务--账号信息（右上角）--密钥管理

	'PATH_ALI_PUB_PEM'=>'
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDPWUXA6EDB6W8a7LINAZv2A/G9sH7Uw9vi3Ad4
ypJadg87pxHwZmDX7ZpyWCj8315DNv5ork1eyoONPXXWkOOSev4HtyssT18pwxoE8dubSctoGA7W
KPIDmQKaIP07zvqFhiXySmFiPSqQkk7uv0/rNV00k2bs7DQap6F1WaYLtwIDAQAB
-----END PUBLIC KEY-----
',

//商户私钥

    'PATH_ALI_RSA_PRI_PEM' => '
-----BEGIN RSA PRIVATE KEY-----
MIICXQIBAAKBgQDdJhwSAfjhqTiFlJ9klDCSE7LraPzpiVUssKwS/rL7Pc3+ULzF
7Cs0pHVxCwNKtf2Ac5TvkRqVNhgnyJcsZL2R5ExNENE8PZfuD+9ZVV9cqBoVgBh6
CI910LjR1x0sLBY2V1oQ8RqO1ZqulRQc1OfzkzrVLsA5pv1pxKANM7nsPQIDAQAB
AoGBALMuaZf9mRXd8jnpTaxElYYGB/XNPv5Jk4V+MC3DyGjgjsL7z7fdvrQMfEt3
TNd/1UH6ZDYnL46uIaw6TqJdjWniJZHyvXOYpCnm3KhTqDz0+hf+27gE02TdQICi
ZN0QjQtLsfrJwLIXVRWPU38vMQOOonSvD2UoK4cBnLjRYHjRAkEA8AiQfsvKY+tR
2yduwo8BjmDVmc+S2iKhYqi2jjFAmhMOIyyOlVAA5KJaZ/8D3xgHV1sVXldlj1BN
Eg+F4AyyKwJBAOvb94peRswoNfIkHmiKMkUFiKyWWr/8gm3/m/56B4GwBdrTv272
XopI5QTekYhLmXeRl8+eUoDtUFD3uhK9bzcCQDuyNZWDQ2uEO9BgRziV7lIlnRnq
uOANWsu5n+VPNHzdHlf7Hd7ejcpO4mMY1jKmvDSqj27uF3EEDJbgS3BEWA8CQQCb
Gb7SHicecD7xafEZO+/M1dPH8uPgppO69EFH+kVfcjqXaXHU7WzEMSVxq082ushE
Cdk0LeABao3LgOy7EBnHAkAr5mtUC9WVmJVK6D64UVH1q3k5mAathfKJFF9IbvuO
fsZhciDT4tWYYS2nO0PNcYTelbhRUWIQgfStE0tJwG2Z
-----END RSA PRIVATE KEY-----
',

// //商户公钥
//     'PATH_ALI_RSA_PUB_PEM' => '
// -----BEGIN PUBLIC KEY-----
// MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDdJhwSAfjhqTiFlJ9klDCSE7Lr
// aPzpiVUssKwS/rL7Pc3+ULzF7Cs0pHVxCwNKtf2Ac5TvkRqVNhgnyJcsZL2R5ExN
// ENE8PZfuD+9ZVV9cqBoVgBh6CI910LjR1x0sLBY2V1oQ8RqO1ZqulRQc1OfzkzrV
// LsA5pv1pxKANM7nsPQIDAQAB
// -----END PUBLIC KEY-----
// ',


    );

?>