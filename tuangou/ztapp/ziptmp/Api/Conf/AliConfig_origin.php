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
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCsL/b8S2FW4DUqsBIXMGEyI6J3j5yL88q8hUHc
XAYhcqvIkKZPXUOvn18w4utEC3oimmJFT6gLpzUz10Ix3KOAeUcsCwi2WqomuVo1T23A8ThUCklj
KuiHjibZvglDsF4sGrUS5FAGEWR4htVY9PgaCQAUyc6o1RBCLDqR9Yao0QIDAQAB
-----END PUBLIC KEY-----
',

//商户私钥

    'PATH_ALI_RSA_PRI_PEM' => '
-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQC2nudYotKzJFK6F08YXTsfaCe6N6LE7rcmjoqwTun7owLNePx4
W2zisfHvz7bvuA5oL+pA6kUVuyhA+w9gFxCflhkiE+zNp1cvb+nrFKcmpu/oMsMt
0cONJCeDqC2wcndfzsKwGscUQU/ICvxh28zbnR+zFI35PJgGZMNqbzJU0QIDAQAB
AoGBAIiantVHnrKQRi2bh/firXoV0DnUqjYDlw8JaybtMMuhqVQH31sskGuWzjIj
v2Tb2jMHPIRoeVsDD95jrqGjPzPNdiXaO2ViOb5ftWfmCQDcyuheG/z7N9yosl9Z
uPYI4PPrBFqZWDdlWsFB4GTtartwoK4c/C+KaET88uteR5JNAkEA2lED1SBq+/o3
4YahyjUsSYqn+nkYF4tWZ4IhgRw4kInT3rd5rRwghlLijU1vUaLT/i0y/ww9wr0u
2BT1I9YBqwJBANYkj/ADHp97e0JFxfxNm2XclC4CtFB+uPC2/euZGKoqxAHBarEv
OkhLoulxJUcsI+V3DXz1geULHMmTfsFzv3MCQFJS5HgUvmMAStwvUYkXnfipYYhw
62XNdCqaBppSEv5mCs/cLfTaO2WLkcSo44ZMOVaKosVMT2nEvwpadMoro/sCQEp0
F995FjKY+jgGjlm0me0GjjaZFhxOkvqOhSZe6mZvzApYN0I3i2oLci77+dwPCsQD
apshuPHrtSyYrZ+RIOUCQGYbcGb5K+qddRu/BzAUh5TEqUpTTcPWZghjMMucu0Iv
hQOSEQZH1Ke3Yz274dnAN3Kiow1U6sfhM2Hnqg8gsU4=
-----END RSA PRIVATE KEY-----
',


    );

?>