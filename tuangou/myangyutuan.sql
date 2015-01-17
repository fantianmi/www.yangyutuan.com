/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : yangyutuan

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2015-01-09 15:25:21
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `province` varchar(64) NOT NULL,
  `area` varchar(64) NOT NULL,
  `city` varchar(64) DEFAULT NULL,
  `street` varchar(255) NOT NULL,
  `zipcode` char(6) NOT NULL,
  `name` varchar(32) NOT NULL,
  `mobile` varchar(16) NOT NULL,
  `default` enum('Y','N') NOT NULL DEFAULT 'N',
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for `ask`
-- ----------------------------
DROP TABLE IF EXISTS `ask`;
CREATE TABLE `ask` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` enum('ask','transfer') NOT NULL DEFAULT 'ask',
  `content` text,
  `comment` text,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ask
-- ----------------------------

-- ----------------------------
-- Table structure for `card`
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `id` varchar(16) NOT NULL,
  `code` varchar(16) DEFAULT NULL,
  `partner_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `consume` enum('Y','N') NOT NULL DEFAULT 'N',
  `ip` varchar(16) DEFAULT NULL,
  `begin_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card
-- ----------------------------

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `detail` text,
  `money` double(10,2) NOT NULL DEFAULT '0.00',
  `action` varchar(16) NOT NULL DEFAULT 'buy',
  `state` varchar(16) NOT NULL DEFAULT 'unpay',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zone` varchar(16) DEFAULT NULL,
  `czone` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `ename` varchar(16) DEFAULT NULL,
  `letter` char(1) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `display` enum('Y','N') NOT NULL DEFAULT 'Y',
  `relate_data` text,
  `fid` int(10) NOT NULL DEFAULT '0',
  `is_hot` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_zne` (`zone`,`name`,`ename`)
) ENGINE=MyISAM AUTO_INCREMENT=2538 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO category VALUES ('2306', 'city', '', '昆明', 'KUNMING', 'K', '1', 'Y', null, '0', 'N');
INSERT INTO category VALUES ('13', 'group', null, '火锅', 'huoguo', 'H', '0', 'Y', null, '3', 'N');
INSERT INTO category VALUES ('3', 'group', null, '美食', 'meishi', 'M', '7', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('4', 'group', null, '娱乐', 'yule', 'Y', '6', 'Y', null, '0', 'N');
INSERT INTO category VALUES ('6', 'group', null, '酒店', 'hotel', 'J', '4', 'Y', null, '0', 'N');
INSERT INTO category VALUES ('9', 'group', null, '生活服务', 'life', 'S', '0', 'Y', null, '0', 'N');
INSERT INTO category VALUES ('14', 'group', null, '川菜', 'cc', 'C', '0', 'Y', null, '3', 'N');
INSERT INTO category VALUES ('15', 'group', null, '小吃快餐', 'xiaochi', 'X', '0', 'Y', null, '3', 'N');
INSERT INTO category VALUES ('16', 'group', null, '面包甜点', 'mianbaotiandain', 'M', '0', 'Y', null, '3', 'N');
INSERT INTO category VALUES ('17', 'group', null, '自助餐', 'zizhucan', 'Z', '0', 'Y', null, '3', 'N');
INSERT INTO category VALUES ('18', 'group', null, '西餐', 'xican', 'X', '0', 'Y', null, '3', 'N');
INSERT INTO category VALUES ('19', 'group', null, '日本料理', 'ribenliaoli', 'R', '0', 'Y', null, '3', 'N');
INSERT INTO category VALUES ('20', 'group', null, '粤菜', 'yuecai', 'Y', '0', 'Y', null, '3', 'N');
INSERT INTO category VALUES ('21', 'group', null, '烧烤', 'shaokao', 'S', '0', 'Y', null, '3', 'N');
INSERT INTO category VALUES ('22', 'group', null, '咖啡厅', 'caffe', 'K', '0', 'Y', null, '3', 'N');
INSERT INTO category VALUES ('23', 'group', null, '韩国料理', 'hanguoliaoli', 'H', '0', 'Y', null, '3', 'N');
INSERT INTO category VALUES ('24', 'group', null, '电影', 'movie', 'D', '5', 'Y', null, '0', 'N');
INSERT INTO category VALUES ('25', 'group', null, '景点郊游', 'jiaoyou', 'J', '0', 'Y', null, '4', 'N');
INSERT INTO category VALUES ('26', 'group', null, 'KTV', 'KTV', 'K', '0', 'Y', null, '4', 'N');
INSERT INTO category VALUES ('27', 'group', null, '足疗按摩', 'zuliao', 'Z', '0', 'Y', null, '4', 'N');
INSERT INTO category VALUES ('28', 'group', null, '洗浴', 'xiyu', 'X', '0', 'Y', null, '4', 'N');
INSERT INTO category VALUES ('29', 'group', null, '酒吧', 'bar', 'J', '0', 'Y', null, '4', 'N');
INSERT INTO category VALUES ('30', 'group', null, '温泉', 'wenquan', 'W', '0', 'Y', null, '4', 'N');
INSERT INTO category VALUES ('31', 'group', null, '运动健身', 'sports', 'Y', '0', 'Y', null, '0', 'N');
INSERT INTO category VALUES ('32', 'group', null, '经济型酒店', 'jinji', 'J', '0', 'Y', null, '6', 'N');
INSERT INTO category VALUES ('33', 'group', null, '五星级酒店', '5star', 'W', '0', 'Y', null, '6', 'N');
INSERT INTO category VALUES ('34', 'group', null, '四星级酒店', 'sixin', 'S', '0', 'Y', null, '6', 'N');
INSERT INTO category VALUES ('35', 'group', null, '三星级酒店', '3star', 'S', '0', 'Y', null, '6', 'N');
INSERT INTO category VALUES ('36', 'group', null, '度假村', 'dujia', 'D', '0', 'Y', null, '6', 'N');
INSERT INTO category VALUES ('37', 'group', null, '公寓式酒店', 'gongyu', 'G', '0', 'Y', null, '6', 'N');
INSERT INTO category VALUES ('38', 'group', null, '精品酒店', 'jingpin', 'J', '0', 'Y', null, '6', 'N');
INSERT INTO category VALUES ('39', 'group', null, '客栈旅社', 'kezhan', 'K', '0', 'Y', null, '6', 'N');
INSERT INTO category VALUES ('40', 'group', null, '青年女舍', 'young', 'Q', '0', 'Y', null, '6', 'N');
INSERT INTO category VALUES ('41', 'group', null, '美发', 'meifa', 'M', '0', 'Y', null, '7', 'N');
INSERT INTO category VALUES ('45', 'group', null, '个性写真', 'gexingxiezhen', 'G', '0', 'Y', null, '7', 'N');
INSERT INTO category VALUES ('43', 'group', null, '美容SPA', 'meirong', 'M', '0', 'Y', null, '7', 'N');
INSERT INTO category VALUES ('44', 'group', null, '美甲', 'meijia', 'M', '0', 'Y', null, '7', 'N');
INSERT INTO category VALUES ('46', 'group', null, '瑜伽', 'yujia', 'Y', '0', 'Y', null, '7', 'N');
INSERT INTO category VALUES ('47', 'group', null, '化妆品', 'huazhuang', 'H', '0', 'Y', null, '7', 'N');
INSERT INTO category VALUES ('48', 'group', null, '舞蹈', 'wudao', 'W', '0', 'Y', null, '7', 'N');
INSERT INTO category VALUES ('49', 'group', null, '齿科', 'chike', 'C', '0', 'Y', null, '7', 'N');
INSERT INTO category VALUES ('50', 'group', null, '瘦身纤体', 'shoushen', 'S', '0', 'Y', null, '7', 'N');
INSERT INTO category VALUES ('51', 'group', null, '整形', 'zhengxing', 'Z', '0', 'Y', null, '7', 'N');
INSERT INTO category VALUES ('52', 'group', null, '美睫', 'meijie', 'M', '0', 'Y', null, '7', 'N');
INSERT INTO category VALUES ('53', 'group', null, '纹身', 'wenshen', 'W', '0', 'Y', null, '7', 'N');
INSERT INTO category VALUES ('54', 'group', null, '家具家居', 'jiajujiaju', 'J', '0', 'Y', null, '8', 'N');
INSERT INTO category VALUES ('55', 'group', null, '建材', 'jiancaizilei', 'J', '0', 'Y', null, '8', 'N');
INSERT INTO category VALUES ('56', 'group', null, '家用电器', 'jiayongdianqi', 'J', '0', 'Y', null, '8', 'N');
INSERT INTO category VALUES ('57', 'group', null, '装修设计', 'zhuangxiusheji', 'Z', '0', 'Y', null, '8', 'N');
INSERT INTO category VALUES ('58', 'group', null, '家装卖场', 'jz', 'J', '0', 'Y', null, '8', 'N');
INSERT INTO category VALUES ('59', 'group', null, '银行', 'bank', 'Y', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('60', 'group', null, '医院', 'hospital', 'Y', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('61', 'group', null, '培训', 'peixun', 'P', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('62', 'group', null, '学校', 'xuexiao', 'X', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('63', 'group', null, '汽车服务', 'qichefuwu', 'Q', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('64', 'group', null, '宠物', 'chongwu', 'C', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('65', 'group', null, '交通', 'jiaotong', 'J', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('66', 'group', null, '齿科', 'cike', 'C', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('67', 'group', null, '旅行社', 'lvxingshe', 'L', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('68', 'group', null, '加油站', 'jiayouzhan', 'J', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('69', 'group', null, '停车场', 'tingchechang', 'T', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('70', 'group', null, '公司企业', 'gongsiqiye', 'G', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('71', 'group', null, '洗衣店', 'xiyidian', 'X', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('72', 'group', null, '电信营业厅', 'dxyyt', 'D', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('73', 'group', null, '售票点', 'spd', 'S', '0', 'Y', null, '9', 'N');
INSERT INTO category VALUES ('74', 'group', null, '健身中心', 'jszx', 'J', '0', 'Y', null, '31', 'N');
INSERT INTO category VALUES ('75', 'group', null, '游泳馆', 'yyg', 'Y', '0', 'Y', null, '31', 'N');
INSERT INTO category VALUES ('76', 'group', null, '舞蹈', 'wd', 'W', '0', 'Y', null, '31', 'N');
INSERT INTO category VALUES ('77', 'group', null, '台球馆', 'tq', 'T', '0', 'Y', null, '31', 'N');
INSERT INTO category VALUES ('78', 'group', null, '体育场馆', 'tycg', 'T', '0', 'Y', null, '31', 'N');
INSERT INTO category VALUES ('79', 'group', null, '羽毛球馆', 'ymqg', 'Y', '0', 'Y', null, '31', 'N');
INSERT INTO category VALUES ('80', 'group', null, '网球馆', 'wqg', 'W', '0', 'Y', null, '31', 'N');
INSERT INTO category VALUES ('81', 'group', null, '保龄球馆', 'blqg', 'B', '0', 'Y', null, '31', 'N');
INSERT INTO category VALUES ('82', 'group', null, '足球场', 'zqc', 'Z', '0', 'Y', null, '31', 'N');
INSERT INTO category VALUES ('83', 'group', null, '篮球场', 'lqc', 'L', '0', 'Y', null, '31', 'Y');
INSERT INTO category VALUES ('84', 'group', null, '乒乓球馆', 'ppqg', 'P', '0', 'Y', null, '31', 'N');
INSERT INTO category VALUES ('2484', 'city', '', '玉溪市', 'yuxi', 'Y', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2483', 'city', '', '曲靖市', 'qujing', 'Q', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2474', 'partner', '', '美食', 'meishi', 'M', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2475', 'express', '', '顺丰快递', 'SF', 'S', '0', 'Y', '12元/KG', '0', 'Y');
INSERT INTO category VALUES ('2476', 'express', '', '圆通快递', 'yt', 'Y', '0', 'Y', '6元/公斤', '0', 'Y');
INSERT INTO category VALUES ('2477', 'grade', '', '初级', 'primary', 'C', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2478', 'grade', '', '中级', 'Intermediate', 'Z', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2479', 'grade', '', '高级', 'Senior', 'G', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2480', 'grade', '', '大师', 'MASTER', 'D', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2481', 'public', '', '新手问题', 'question', 'X', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2482', 'public', '', '精彩推荐', 'reconment', 'J', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2485', 'city', '', '丽江', 'lijiang', 'L', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2486', 'city', '', '保山', 'baoshan', 'B', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2487', 'city', '', '昭通', 'zhaotong', 'Z', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2488', 'city', '', '临沧', 'lincang', 'L', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2489', 'city', '', '思茅市', 'simaoshi', 'S', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2490', 'city', '', '文山州', 'wenshanzhou', 'W', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2491', 'city', '', '红河', 'honghe', 'H', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2492', 'city', '', '西双版纳', 'xishuanbanna', 'X', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2493', 'city', '', '楚雄州', 'chuxiongzhou', 'C', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2494', 'city', '', '大理州', 'dali', 'D', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2495', 'city', '', '德宏州', 'dehongzhou', 'D', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2496', 'city', '', '怒江', 'nujiang', 'N', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2497', 'city', '', '迪庆州', 'diqing', 'D', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2498', 'area', null, '五华区', 'wuhuaqu', 'W', '0', 'Y', null, '2306', 'Y');
INSERT INTO category VALUES ('2499', 'area', null, '盘龙区', 'panlongqu', 'P', '0', 'Y', null, '2306', 'Y');
INSERT INTO category VALUES ('2500', 'area', null, '西山区', 'xishanqu', 'X', '0', 'Y', null, '2306', 'Y');
INSERT INTO category VALUES ('2501', 'area', null, '官渡区', 'guandu', 'G', '0', 'Y', null, '2306', 'Y');
INSERT INTO category VALUES ('2502', 'area', null, '东川区', 'dongchuan', 'D', '0', 'Y', null, '2306', 'Y');
INSERT INTO category VALUES ('2503', 'area', null, '昭阳区', 'zhaoyang', 'Z', '0', 'Y', null, '2487', 'Y');
INSERT INTO category VALUES ('2504', 'area', null, '鲁甸县', 'ludian', 'L', '0', 'Y', null, '2487', 'Y');
INSERT INTO category VALUES ('2505', 'area', null, '巧家县', 'qiaojiaxian', 'Q', '0', 'Y', null, '2487', 'Y');
INSERT INTO category VALUES ('2506', 'area', null, '延津县', 'yanjinxian', 'Y', '0', 'Y', null, '2487', 'Y');
INSERT INTO category VALUES ('2507', 'area', null, '大关县', 'DAGUAN', 'D', '0', 'Y', null, '2487', 'Y');
INSERT INTO category VALUES ('2508', 'area', null, '麒麟区', 'qilinqu', 'Q', '0', 'Y', null, '2483', 'Y');
INSERT INTO category VALUES ('2509', 'area', null, '宣威市', 'xuanwei', 'X', '0', 'Y', null, '2483', 'Y');
INSERT INTO category VALUES ('2510', 'area', null, '马龙县', 'malong', 'M', '0', 'Y', null, '2483', 'Y');
INSERT INTO category VALUES ('2511', 'area', null, '陆良县', 'luliang', 'L', '0', 'Y', null, '2483', 'Y');
INSERT INTO category VALUES ('2512', 'area', null, '罗平县', 'luopin', 'L', '0', 'Y', null, '2483', 'Y');
INSERT INTO category VALUES ('2513', 'area', null, '富源县', 'fuyuan', 'F', '0', 'Y', null, '2483', 'Y');
INSERT INTO category VALUES ('2514', 'area', null, '会泽县', 'huize', 'H', '0', 'Y', null, '2483', 'Y');
INSERT INTO category VALUES ('2515', 'area', null, '沾益县', 'zhanyixian', 'Z', '0', 'Y', null, '2483', 'Y');
INSERT INTO category VALUES ('2516', 'area', null, '红塔区', 'hongta', 'H', '0', 'Y', null, '2484', 'Y');
INSERT INTO category VALUES ('2517', 'area', null, '江川县', 'jiangchuan', 'J', '0', 'Y', null, '2484', 'Y');
INSERT INTO category VALUES ('2518', 'area', null, '澄江县', 'chengjiangxian', 'C', '0', 'Y', null, '2484', 'Y');
INSERT INTO category VALUES ('2519', 'area', null, '通海县', 'tonghai', 'T', '0', 'Y', null, '2484', 'Y');
INSERT INTO category VALUES ('2520', 'area', null, '易门县', 'yimen', 'Y', '0', 'Y', null, '2484', 'Y');
INSERT INTO category VALUES ('2521', 'area', null, '峨山县', 'eshan', 'E', '0', 'Y', null, '2484', 'Y');
INSERT INTO category VALUES ('2522', 'area', null, '新平县', 'xinping', 'X', '0', 'Y', null, '2484', 'Y');
INSERT INTO category VALUES ('2523', 'area', null, '古城区', 'guchengqu', 'G', '0', 'Y', null, '2485', 'Y');
INSERT INTO category VALUES ('2524', 'area', null, '永胜县', 'yongsheng', 'Y', '0', 'Y', null, '2485', 'Y');
INSERT INTO category VALUES ('2525', 'area', null, '华坪县', 'huapin', 'H', '0', 'Y', null, '2485', 'Y');
INSERT INTO category VALUES ('2526', 'area', null, '玉龙县', 'yulong', 'Y', '0', 'Y', null, '2485', 'Y');
INSERT INTO category VALUES ('2527', 'area', null, '隆阳县', 'longyang', 'L', '0', 'Y', null, '2486', 'Y');
INSERT INTO category VALUES ('2528', 'area', null, '施甸县', 'shidian', 'S', '0', 'Y', null, '2486', 'Y');
INSERT INTO category VALUES ('2529', 'area', null, '腾冲县', 'tengchong', 'T', '0', 'Y', null, '2486', 'Y');
INSERT INTO category VALUES ('2530', 'area', null, '龙陵县', 'longlin', 'L', '0', 'Y', null, '2486', 'Y');
INSERT INTO category VALUES ('2531', 'area', null, '昌宁县', 'changnin', 'C', '0', 'Y', null, '2486', 'Y');
INSERT INTO category VALUES ('2532', 'area', null, '临翔县', 'linxiang', 'L', '0', 'Y', null, '2488', 'Y');
INSERT INTO category VALUES ('2533', 'partner', '', '娱乐', 'yule', 'Y', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2534', 'partner', '', '电影', 'dianying', 'D', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2535', 'partner', '', '酒店', 'hotel', 'J', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2536', 'partner', '', '丽人', 'BEAUTY', 'L', '0', 'Y', null, '0', 'Y');
INSERT INTO category VALUES ('2537', 'partner', '', '建材', 'build', 'J', '0', 'Y', null, '0', 'Y');

-- ----------------------------
-- Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `team_price` double(10,2) DEFAULT NULL,
  `image` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for `coupon`
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `id` varchar(16) NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `partner_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` enum('consume','credit') NOT NULL DEFAULT 'consume',
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `secret` varchar(10) DEFAULT NULL,
  `consume` enum('Y','N') NOT NULL DEFAULT 'N',
  `ip` varchar(16) DEFAULT NULL,
  `sms` int(10) unsigned NOT NULL DEFAULT '0',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0',
  `consume_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sms_time` int(10) unsigned NOT NULL DEFAULT '0',
  `buy_id` int(11) NOT NULL DEFAULT '0',
  `is_bill` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO coupon VALUES ('272016165651', '4', '4', '8', '13', 'consume', '0', '531764', 'Y', '127.0.0.1', '0', '1425571200', '1417854495', '1417854474', '0', '2', '1');
INSERT INTO coupon VALUES ('502050023273', '4', '1', '4', '12', 'consume', '0', '798848', 'N', null, '0', '1425571200', '0', '1417838919', '0', '1', '0');
INSERT INTO coupon VALUES ('356455275157', '4', '4', '8', '14', 'consume', '0', '558843', 'Y', '127.0.0.1', '0', '1425571200', '1417854761', '1417854634', '0', '3', '1');
INSERT INTO coupon VALUES ('280796091877', '4', '4', '8', '14', 'consume', '0', '411974', 'Y', '127.0.0.1', '0', '1425571200', '1417854833', '1417854634', '0', '3', '1');
INSERT INTO coupon VALUES ('352793164432', '4', '4', '8', '14', 'consume', '0', '987059', 'Y', '127.0.0.1', '0', '1425571200', '1417859676', '1417854634', '0', '3', '1');
INSERT INTO coupon VALUES ('497446481574', '4', '4', '8', '14', 'consume', '0', '945966', 'Y', '127.0.0.1', '0', '1425571200', '1417859725', '1417854634', '0', '3', '1');
INSERT INTO coupon VALUES ('430126188832', '4', '4', '8', '11', 'consume', '0', '801205', 'Y', '127.0.0.1', '0', '1425571200', '1417839017', '1417838872', '0', '1', '1');
INSERT INTO coupon VALUES ('339756059051', '4', '4', '8', '14', 'consume', '0', '151483', 'Y', '127.0.0.1', '0', '1425571200', '1417927572', '1417854634', '0', '3', '1');
INSERT INTO coupon VALUES ('343947437063', '1', '4', '8', '15', 'consume', '0', '938154', 'N', null, '0', '1425571200', '0', '1418111948', '0', '4', '0');
INSERT INTO coupon VALUES ('450807782121', '1', '4', '8', '15', 'consume', '0', '307457', 'N', null, '0', '1425571200', '0', '1418111949', '0', '4', '0');
INSERT INTO coupon VALUES ('433277456812', '1', '1', '3', '17', 'consume', '0', '458815', 'N', null, '0', '1425398400', '0', '1420695582', '0', '1', '0');
INSERT INTO coupon VALUES ('244944937884', '1', '1', '4', '18', 'consume', '0', '929304', 'N', null, '0', '1425571200', '0', '1420701737', '0', '2', '0');
INSERT INTO coupon VALUES ('331462278140', '1', '4', '8', '19', 'consume', '0', '710686', 'N', null, '0', '1425571200', '0', '1420701759', '0', '5', '0');
INSERT INTO coupon VALUES ('293010125026', '1', '4', '8', '19', 'consume', '0', '216225', 'N', null, '0', '1425571200', '0', '1420701759', '0', '5', '0');
INSERT INTO coupon VALUES ('467839236342', '1', '4', '8', '19', 'consume', '0', '393370', 'N', null, '0', '1425571200', '0', '1420701759', '0', '5', '0');
INSERT INTO coupon VALUES ('480949589838', '1', '4', '8', '19', 'consume', '0', '709587', 'N', null, '0', '1425571200', '0', '1420701759', '0', '5', '0');
INSERT INTO coupon VALUES ('257341174264', '1', '4', '8', '19', 'consume', '0', '330566', 'N', null, '0', '1425571200', '0', '1420701759', '0', '5', '0');
INSERT INTO coupon VALUES ('322014035369', '1', '4', '8', '19', 'consume', '0', '865162', 'N', null, '0', '1425571200', '0', '1420701759', '0', '5', '0');
INSERT INTO coupon VALUES ('299968131904', '1', '4', '8', '19', 'consume', '0', '160264', 'N', null, '0', '1425571200', '0', '1420701760', '0', '5', '0');
INSERT INTO coupon VALUES ('416203489619', '1', '4', '8', '19', 'consume', '0', '694349', 'N', null, '0', '1425571200', '0', '1420701760', '0', '5', '0');
INSERT INTO coupon VALUES ('295720088263', '1', '4', '8', '19', 'consume', '0', '354375', 'N', null, '0', '1425571200', '0', '1420701760', '0', '5', '0');
INSERT INTO coupon VALUES ('463517944587', '1', '4', '8', '19', 'consume', '0', '808938', 'N', null, '0', '1425571200', '0', '1420701760', '0', '5', '0');
INSERT INTO coupon VALUES ('244597035340', '1', '4', '8', '19', 'consume', '0', '222997', 'N', null, '0', '1425571200', '0', '1420701760', '0', '5', '0');
INSERT INTO coupon VALUES ('463957398274', '1', '4', '8', '19', 'consume', '0', '784020', 'N', null, '0', '1425571200', '0', '1420701760', '0', '5', '0');
INSERT INTO coupon VALUES ('446598992137', '1', '4', '8', '19', 'consume', '0', '652022', 'N', null, '0', '1425571200', '0', '1420701760', '0', '5', '0');
INSERT INTO coupon VALUES ('417521842680', '1', '4', '8', '19', 'consume', '0', '324633', 'N', null, '0', '1425571200', '0', '1420701761', '0', '5', '0');
INSERT INTO coupon VALUES ('301725947652', '1', '4', '8', '19', 'consume', '0', '666559', 'N', null, '0', '1425571200', '0', '1420701761', '0', '5', '0');
INSERT INTO coupon VALUES ('324211295804', '1', '4', '8', '19', 'consume', '0', '447659', 'N', null, '0', '1425571200', '0', '1420701761', '0', '5', '0');
INSERT INTO coupon VALUES ('409977903886', '1', '4', '8', '19', 'consume', '0', '344509', 'N', null, '0', '1425571200', '0', '1420701761', '0', '5', '0');
INSERT INTO coupon VALUES ('484025758647', '1', '4', '8', '19', 'consume', '0', '144187', 'N', null, '0', '1425571200', '0', '1420701761', '0', '5', '0');
INSERT INTO coupon VALUES ('471354858839', '1', '4', '8', '19', 'consume', '0', '505060', 'N', null, '0', '1425571200', '0', '1420701761', '0', '5', '0');
INSERT INTO coupon VALUES ('296965202209', '1', '4', '8', '19', 'consume', '0', '304017', 'N', null, '0', '1425571200', '0', '1420701761', '0', '5', '0');
INSERT INTO coupon VALUES ('485856804510', '1', '4', '8', '19', 'consume', '0', '320924', 'N', null, '0', '1425571200', '0', '1420701762', '0', '5', '0');
INSERT INTO coupon VALUES ('363029654490', '1', '4', '8', '19', 'consume', '0', '248569', 'N', null, '0', '1425571200', '0', '1420701762', '0', '5', '0');
INSERT INTO coupon VALUES ('453483768900', '1', '4', '8', '19', 'consume', '0', '727400', 'N', null, '0', '1425571200', '0', '1420701762', '0', '5', '0');
INSERT INTO coupon VALUES ('382219116490', '1', '4', '8', '19', 'consume', '0', '645423', 'N', null, '0', '1425571200', '0', '1420701762', '0', '5', '0');
INSERT INTO coupon VALUES ('374235714009', '1', '4', '8', '19', 'consume', '0', '799388', 'N', null, '0', '1425571200', '0', '1420701762', '0', '5', '0');
INSERT INTO coupon VALUES ('354533568208', '1', '4', '8', '19', 'consume', '0', '726780', 'N', null, '0', '1425571200', '0', '1420701762', '0', '5', '0');
INSERT INTO coupon VALUES ('248112667837', '1', '4', '8', '19', 'consume', '0', '434688', 'N', null, '0', '1425571200', '0', '1420701763', '0', '5', '0');
INSERT INTO coupon VALUES ('279973019645', '1', '4', '8', '19', 'consume', '0', '480659', 'N', null, '0', '1425571200', '0', '1420701763', '0', '5', '0');
INSERT INTO coupon VALUES ('375114612383', '1', '4', '8', '19', 'consume', '0', '542480', 'N', null, '0', '1425571200', '0', '1420701763', '0', '5', '0');
INSERT INTO coupon VALUES ('458537471801', '1', '4', '8', '19', 'consume', '0', '607940', 'N', null, '0', '1425571200', '0', '1420701763', '0', '5', '0');
INSERT INTO coupon VALUES ('455241575648', '1', '4', '8', '19', 'consume', '0', '423795', 'N', null, '0', '1425571200', '0', '1420701763', '0', '5', '0');
INSERT INTO coupon VALUES ('290226912675', '1', '4', '8', '19', 'consume', '0', '598733', 'N', null, '0', '1425571200', '0', '1420701763', '0', '5', '0');
INSERT INTO coupon VALUES ('488493528632', '1', '4', '8', '19', 'consume', '0', '789522', 'N', null, '0', '1425571200', '0', '1420701764', '0', '5', '0');
INSERT INTO coupon VALUES ('375041373268', '1', '4', '8', '19', 'consume', '0', '962938', 'N', null, '0', '1425571200', '0', '1420701764', '0', '5', '0');
INSERT INTO coupon VALUES ('474870482335', '1', '4', '8', '19', 'consume', '0', '717751', 'N', null, '0', '1425571200', '0', '1420701764', '0', '5', '0');
INSERT INTO coupon VALUES ('412980833580', '1', '4', '8', '19', 'consume', '0', '900646', 'N', null, '0', '1425571200', '0', '1420701764', '0', '5', '0');
INSERT INTO coupon VALUES ('414372434756', '1', '4', '8', '19', 'consume', '0', '319492', 'N', null, '0', '1425571200', '0', '1420701764', '0', '5', '0');
INSERT INTO coupon VALUES ('404045283611', '1', '4', '8', '19', 'consume', '0', '511866', 'N', null, '0', '1425571200', '0', '1420701764', '0', '5', '0');
INSERT INTO coupon VALUES ('306999386896', '1', '4', '8', '19', 'consume', '0', '584645', 'N', null, '0', '1425571200', '0', '1420701765', '0', '5', '0');
INSERT INTO coupon VALUES ('348234733361', '1', '4', '8', '19', 'consume', '0', '796598', 'N', null, '0', '1425571200', '0', '1420701765', '0', '5', '0');
INSERT INTO coupon VALUES ('452751338755', '1', '4', '8', '19', 'consume', '0', '323201', 'N', null, '0', '1425571200', '0', '1420701765', '0', '5', '0');
INSERT INTO coupon VALUES ('245549182829', '1', '4', '8', '19', 'consume', '0', '654632', 'N', null, '0', '1425571200', '0', '1420701765', '0', '5', '0');
INSERT INTO coupon VALUES ('251628281333', '1', '4', '8', '19', 'consume', '0', '646379', 'N', null, '0', '1425571200', '0', '1420701765', '0', '5', '0');
INSERT INTO coupon VALUES ('395988642016', '1', '4', '8', '19', 'consume', '0', '985288', 'N', null, '0', '1425571200', '0', '1420701765', '0', '5', '0');
INSERT INTO coupon VALUES ('303630242629', '1', '4', '8', '19', 'consume', '0', '531958', 'N', null, '0', '1425571200', '0', '1420701765', '0', '5', '0');
INSERT INTO coupon VALUES ('499553099922', '1', '4', '8', '19', 'consume', '0', '970247', 'N', null, '0', '1425571200', '0', '1420701766', '0', '5', '0');
INSERT INTO coupon VALUES ('308757193644', '1', '4', '8', '19', 'consume', '0', '190941', 'N', null, '0', '1425571200', '0', '1420701766', '0', '5', '0');
INSERT INTO coupon VALUES ('256242548546', '1', '4', '8', '19', 'consume', '0', '649817', 'N', null, '0', '1425571200', '0', '1420701766', '0', '5', '0');
INSERT INTO coupon VALUES ('267009144378', '1', '4', '8', '19', 'consume', '0', '223535', 'N', null, '0', '1425571200', '0', '1420701766', '0', '5', '0');
INSERT INTO coupon VALUES ('266056996890', '1', '4', '8', '19', 'consume', '0', '791890', 'N', null, '0', '1425571200', '0', '1420701766', '0', '5', '0');
INSERT INTO coupon VALUES ('478386104831', '1', '4', '8', '19', 'consume', '0', '929441', 'N', null, '0', '1425571200', '0', '1420701766', '0', '5', '0');
INSERT INTO coupon VALUES ('528996454952', '1', '4', '8', '19', 'consume', '0', '506275', 'N', null, '0', '1425571200', '0', '1420701767', '0', '5', '0');
INSERT INTO coupon VALUES ('342888055002', '1', '4', '8', '19', 'consume', '0', '309960', 'N', null, '0', '1425571200', '0', '1420701767', '0', '5', '0');
INSERT INTO coupon VALUES ('445060902732', '1', '4', '8', '19', 'consume', '0', '995273', 'N', null, '0', '1425571200', '0', '1420701767', '0', '5', '0');
INSERT INTO coupon VALUES ('460515014892', '1', '4', '8', '19', 'consume', '0', '241881', 'N', null, '0', '1425571200', '0', '1420701767', '0', '5', '0');
INSERT INTO coupon VALUES ('314250359232', '1', '4', '8', '19', 'consume', '0', '847672', 'N', null, '0', '1425571200', '0', '1420701767', '0', '5', '0');
INSERT INTO coupon VALUES ('531266964501', '1', '4', '8', '19', 'consume', '0', '768224', 'N', null, '0', '1425571200', '0', '1420701767', '0', '5', '0');
INSERT INTO coupon VALUES ('436564816450', '1', '4', '8', '19', 'consume', '0', '472494', 'N', null, '0', '1425571200', '0', '1420701767', '0', '5', '0');
INSERT INTO coupon VALUES ('255143913829', '1', '4', '8', '19', 'consume', '0', '858069', 'N', null, '0', '1425571200', '0', '1420701768', '0', '5', '0');
INSERT INTO coupon VALUES ('512004273387', '1', '4', '8', '19', 'consume', '0', '671818', 'N', null, '0', '1425571200', '0', '1420701768', '0', '5', '0');
INSERT INTO coupon VALUES ('532145872875', '1', '4', '8', '19', 'consume', '0', '511427', 'N', null, '0', '1425571200', '0', '1420701768', '0', '5', '0');
INSERT INTO coupon VALUES ('540568729043', '1', '4', '8', '19', 'consume', '0', '454654', 'N', null, '0', '1425571200', '0', '1420701768', '0', '5', '0');
INSERT INTO coupon VALUES ('462272821640', '1', '4', '8', '19', 'consume', '0', '857286', 'N', null, '0', '1425571200', '0', '1420701768', '0', '5', '0');
INSERT INTO coupon VALUES ('522258175417', '1', '4', '8', '19', 'consume', '0', '790992', 'N', null, '0', '1425571200', '0', '1420701768', '0', '5', '0');
INSERT INTO coupon VALUES ('345524779124', '1', '4', '8', '19', 'consume', '0', '768458', 'N', null, '0', '1425571200', '0', '1420701768', '0', '5', '0');
INSERT INTO coupon VALUES ('457072621511', '1', '4', '8', '19', 'consume', '0', '619642', 'N', null, '0', '1425571200', '0', '1420701769', '0', '5', '0');
INSERT INTO coupon VALUES ('481901737327', '1', '4', '8', '19', 'consume', '0', '231132', 'N', null, '0', '1425571200', '0', '1420701769', '0', '5', '0');
INSERT INTO coupon VALUES ('345012076323', '1', '4', '8', '19', 'consume', '0', '202805', 'N', null, '0', '1425571200', '0', '1420701769', '0', '5', '0');
INSERT INTO coupon VALUES ('271403675248', '1', '4', '8', '19', 'consume', '0', '388328', 'N', null, '0', '1425571200', '0', '1420701769', '0', '5', '0');
INSERT INTO coupon VALUES ('486076531853', '1', '4', '8', '19', 'consume', '0', '368579', 'N', null, '0', '1425571200', '0', '1420701769', '0', '5', '0');
INSERT INTO coupon VALUES ('314030632888', '1', '4', '8', '19', 'consume', '0', '918026', 'N', null, '0', '1425571200', '0', '1420701769', '0', '5', '0');
INSERT INTO coupon VALUES ('280265986103', '1', '4', '8', '19', 'consume', '0', '997656', 'N', null, '0', '1425571200', '0', '1420701770', '0', '5', '0');
INSERT INTO coupon VALUES ('309782589247', '1', '4', '8', '19', 'consume', '0', '202137', 'N', null, '0', '1425571200', '0', '1420701770', '0', '5', '0');
INSERT INTO coupon VALUES ('327580431071', '1', '4', '8', '19', 'consume', '0', '300346', 'N', null, '0', '1425571200', '0', '1420701770', '0', '5', '0');
INSERT INTO coupon VALUES ('258659536325', '1', '4', '8', '19', 'consume', '0', '160850', 'N', null, '0', '1425571200', '0', '1420701770', '0', '5', '0');
INSERT INTO coupon VALUES ('328019884758', '1', '4', '8', '19', 'consume', '0', '277447', 'N', null, '0', '1425571200', '0', '1420701770', '0', '5', '0');
INSERT INTO coupon VALUES ('460661493121', '1', '4', '8', '19', 'consume', '0', '500885', 'N', null, '0', '1425571200', '0', '1420701770', '0', '5', '0');
INSERT INTO coupon VALUES ('281584348164', '1', '4', '8', '19', 'consume', '0', '727950', 'N', null, '0', '1425571200', '0', '1420701770', '0', '5', '0');
INSERT INTO coupon VALUES ('315788448636', '1', '4', '8', '19', 'consume', '0', '514422', 'N', null, '0', '1425571200', '0', '1420701771', '0', '5', '0');
INSERT INTO coupon VALUES ('488273802288', '1', '4', '8', '19', 'consume', '0', '840976', 'N', null, '0', '1425571200', '0', '1420701771', '0', '5', '0');
INSERT INTO coupon VALUES ('424040404870', '1', '4', '8', '19', 'consume', '0', '292471', 'N', null, '0', '1425571200', '0', '1420701771', '0', '5', '0');
INSERT INTO coupon VALUES ('348088245132', '1', '4', '8', '19', 'consume', '0', '547494', 'N', null, '0', '1425571200', '0', '1420701771', '0', '5', '0');
INSERT INTO coupon VALUES ('485417359823', '1', '4', '8', '19', 'consume', '0', '453922', 'N', null, '0', '1425571200', '0', '1420701771', '0', '5', '0');
INSERT INTO coupon VALUES ('461027707694', '1', '4', '8', '19', 'consume', '0', '707434', 'N', null, '0', '1425571200', '0', '1420701771', '0', '5', '0');
INSERT INTO coupon VALUES ('499919305494', '1', '4', '8', '19', 'consume', '0', '378896', 'N', null, '0', '1425571200', '0', '1420701771', '0', '5', '0');
INSERT INTO coupon VALUES ('527092169975', '1', '4', '8', '19', 'consume', '0', '631886', 'N', null, '0', '1425571200', '0', '1420701772', '0', '5', '0');
INSERT INTO coupon VALUES ('467546269884', '1', '4', '8', '19', 'consume', '0', '675272', 'N', null, '0', '1425571200', '0', '1420701772', '0', '5', '0');
INSERT INTO coupon VALUES ('246281602974', '1', '4', '8', '19', 'consume', '0', '148731', 'N', null, '0', '1425571200', '0', '1420701772', '0', '5', '0');
INSERT INTO coupon VALUES ('388298214993', '1', '4', '8', '19', 'consume', '0', '747150', 'N', null, '0', '1425571200', '0', '1420701772', '0', '5', '0');
INSERT INTO coupon VALUES ('518596064692', '1', '4', '8', '19', 'consume', '0', '229107', 'N', null, '0', '1425571200', '0', '1420701773', '0', '5', '0');
INSERT INTO coupon VALUES ('262175168821', '1', '4', '8', '19', 'consume', '0', '382550', 'N', null, '0', '1425571200', '0', '1420701773', '0', '5', '0');
INSERT INTO coupon VALUES ('444035516129', '1', '4', '8', '19', 'consume', '0', '873976', 'N', null, '0', '1425571200', '0', '1420701773', '0', '5', '0');
INSERT INTO coupon VALUES ('389177113367', '1', '4', '8', '19', 'consume', '0', '590353', 'N', null, '0', '1425571200', '0', '1420701773', '0', '5', '0');
INSERT INTO coupon VALUES ('322599967285', '1', '4', '8', '19', 'consume', '0', '100357', 'N', null, '0', '1425571200', '0', '1420701773', '0', '5', '0');
INSERT INTO coupon VALUES ('469304076632', '1', '4', '8', '19', 'consume', '0', '371667', 'N', null, '0', '1425571200', '0', '1420701773', '0', '5', '0');
INSERT INTO coupon VALUES ('454289428160', '1', '4', '8', '19', 'consume', '0', '991050', 'N', null, '0', '1425571200', '0', '1420701774', '0', '5', '0');
INSERT INTO coupon VALUES ('502556029616', '1', '4', '8', '19', 'consume', '0', '636384', 'N', null, '0', '1425571200', '0', '1420701774', '0', '5', '0');
INSERT INTO coupon VALUES ('539103888753', '1', '4', '8', '19', 'consume', '0', '365356', 'N', null, '0', '1425571200', '0', '1420701774', '0', '5', '0');
INSERT INTO coupon VALUES ('434926069388', '1', '1', '2', '20', 'consume', '0', '585493', 'N', null, '0', '1425398400', '0', '1420702112', '0', '1', '0');
INSERT INTO coupon VALUES ('521397729072', '1', '1', '7', '21', 'consume', '0', '346832', 'N', null, '0', '1425571200', '0', '1420703102', '0', '1', '0');
INSERT INTO coupon VALUES ('349999769109', '1', '4', '8', '24', 'consume', '0', '402893', 'N', null, '0', '1425571200', '0', '1420773934', '0', '4', '0');
INSERT INTO coupon VALUES ('445774254334', '1', '1', '4', '27', 'consume', '0', '849662', 'N', null, '0', '1425571200', '0', '1420785678', '0', '2', '0');

-- ----------------------------
-- Table structure for `credit`
-- ----------------------------
DROP TABLE IF EXISTS `credit`;
CREATE TABLE `credit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `detail_id` varchar(32) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `score` double(10,2) NOT NULL DEFAULT '0.00',
  `action` varchar(16) NOT NULL DEFAULT 'buy',
  `rname` varchar(32) DEFAULT NULL,
  `rmobile` varchar(32) DEFAULT NULL,
  `rcode` char(6) DEFAULT NULL,
  `raddress` varchar(128) DEFAULT NULL,
  `send_time` int(10) DEFAULT NULL,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `state` enum('unpay','pay') NOT NULL DEFAULT 'unpay',
  `remark` text,
  `op_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of credit
-- ----------------------------

-- ----------------------------
-- Table structure for `daysign`
-- ----------------------------
DROP TABLE IF EXISTS `daysign`;
CREATE TABLE `daysign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `credit` double(10,2) DEFAULT '0.00',
  `money` double(10,2) DEFAULT '0.00',
  `create_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of daysign
-- ----------------------------

-- ----------------------------
-- Table structure for `feedback`
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category` enum('suggest','seller') NOT NULL DEFAULT 'suggest',
  `title` varchar(128) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `flow`
-- ----------------------------
DROP TABLE IF EXISTS `flow`;
CREATE TABLE `flow` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `detail_id` varchar(32) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `direction` enum('income','expense') NOT NULL DEFAULT 'income',
  `money` double(10,2) NOT NULL DEFAULT '0.00',
  `action` varchar(16) NOT NULL DEFAULT 'buy',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow
-- ----------------------------
INSERT INTO flow VALUES ('1', '3', '1', '0', null, 'income', '2000.00', 'store', '1417706529');
INSERT INTO flow VALUES ('2', '3', '0', '3', null, 'expense', '209.00', 'buy', '1417706618');
INSERT INTO flow VALUES ('3', '3', '0', '1', null, 'expense', '476.00', 'buy', '1417744549');
INSERT INTO flow VALUES ('4', '3', '0', '6', null, 'expense', '22.00', 'buy', '1417744795');
INSERT INTO flow VALUES ('5', '3', '0', '6', null, 'expense', '11.00', 'buy', '1417745312');
INSERT INTO flow VALUES ('6', '1', '1', '0', null, 'income', '999999.00', 'store', '1417746201');
INSERT INTO flow VALUES ('7', '1', '0', '7', null, 'expense', '121.00', 'buy', '1417746232');
INSERT INTO flow VALUES ('8', '4', '1', '0', null, 'income', '800000.00', 'store', '1417763073');
INSERT INTO flow VALUES ('9', '4', '0', '8', null, 'expense', '236.00', 'buy', '1417763105');
INSERT INTO flow VALUES ('10', '4', '0', '8', null, 'expense', '177.00', 'buy', '1417771398');
INSERT INTO flow VALUES ('11', '4', '0', '8', null, 'expense', '59.00', 'buy', '1417838872');
INSERT INTO flow VALUES ('12', '4', '0', '4', null, 'expense', '11.00', 'buy', '1417838919');
INSERT INTO flow VALUES ('13', '4', '0', '8', null, 'expense', '59.00', 'buy', '1417854474');
INSERT INTO flow VALUES ('14', '4', '0', '8', null, 'expense', '295.00', 'buy', '1417854634');
INSERT INTO flow VALUES ('15', '1', '0', '8', null, 'expense', '118.00', 'buy', '1418111948');
INSERT INTO flow VALUES ('16', '1', '0', '3', null, 'expense', '209.00', 'buy', '1420695582');
INSERT INTO flow VALUES ('17', '1', '0', '4', null, 'expense', '11.00', 'buy', '1420701737');
INSERT INTO flow VALUES ('18', '1', '0', '8', null, 'expense', '5782.00', 'buy', '1420701759');
INSERT INTO flow VALUES ('19', '1', '0', '2', null, 'expense', '70.00', 'buy', '1420702112');
INSERT INTO flow VALUES ('20', '1', '0', '7', null, 'expense', '11.00', 'buy', '1420703102');
INSERT INTO flow VALUES ('21', '1', '0', '8', null, 'expense', '59.00', 'buy', '1420773934');
INSERT INTO flow VALUES ('22', '1', '0', '4', null, 'expense', '1.00', 'buy', '1420785678');

-- ----------------------------
-- Table structure for `friendlink`
-- ----------------------------
DROP TABLE IF EXISTS `friendlink`;
CREATE TABLE `friendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `display` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_l` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friendlink
-- ----------------------------

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `image` varchar(128) DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL DEFAULT '0',
  `per_number` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `consume` int(11) NOT NULL DEFAULT '0',
  `display` enum('Y','N') NOT NULL DEFAULT 'Y',
  `enable` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for `invite`
-- ----------------------------
DROP TABLE IF EXISTS `invite`;
CREATE TABLE `invite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_ip` varchar(16) DEFAULT NULL,
  `other_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `other_user_ip` varchar(16) DEFAULT NULL,
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pay` enum('Y','N','C') NOT NULL DEFAULT 'N',
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `buy_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_uo` (`user_id`,`other_user_id`),
  UNIQUE KEY `UNQ_o` (`other_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invite
-- ----------------------------

-- ----------------------------
-- Table structure for `logger_admin`
-- ----------------------------
DROP TABLE IF EXISTS `logger_admin`;
CREATE TABLE `logger_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `user_email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `operation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `relate_data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logger_admin
-- ----------------------------
INSERT INTO logger_admin VALUES ('1', '1', 'fantianmi@gmail.com', 'system', '编辑基本设置', 'a:1:{s:6:\"system\";a:23:{s:8:\"sitename\";s:9:\"洋芋团\";s:12:\"abbreviation\";s:9:\"洋芋团\";s:9:\"sitetitle\";s:24:\"洋芋团，团就对了\";s:11:\"description\";s:24:\"洋芋团，团就对了\";s:8:\"keywords\";s:9:\"洋芋团\";s:8:\"timezone\";s:9:\"Etc/GMT-8\";s:10:\"couponname\";s:9:\"优惠券\";s:8:\"currency\";s:2:\"¥\";s:12:\"currencyname\";s:3:\"CNY\";s:12:\"invitecredit\";s:1:\"0\";s:8:\"conduser\";s:1:\"0\";s:11:\"partnerdown\";s:1:\"0\";s:4:\"gzip\";s:1:\"0\";s:6:\"kefuqq\";s:0:\"\";s:7:\"kefumsn\";s:0:\"\";s:9:\"wwwprefix\";s:77:\"http://localhost/ZuituGo_CV2.0_build20120502/ZuituGo_CV2.0_20120502/zuituware\";s:9:\"imgprefix\";s:77:\"http://localhost/ZuituGo_CV2.0_build20120502/ZuituGo_CV2.0_20120502/zuituware\";s:9:\"cssprefix\";s:77:\"http://localhost/ZuituGo_CV2.0_build20120502/ZuituGo_CV2.0_20120502/zuituware\";s:9:\"mobileurl\";s:0:\"\";s:3:\"icp\";s:0:\"\";s:8:\"statcode\";s:0:\"\";s:9:\"sinajiwai\";s:0:\"\";s:12:\"tencentjiwai\";s:0:\"\";}}', '2014-12-02 14:59:06');
INSERT INTO logger_admin VALUES ('2', '1', 'fantianmi@gmail.com', 'system', '编辑基本设置', 'a:1:{s:6:\"system\";a:23:{s:8:\"sitename\";s:9:\"洋芋团\";s:12:\"abbreviation\";s:9:\"洋芋团\";s:9:\"sitetitle\";s:24:\"洋芋团，团就对了\";s:11:\"description\";s:24:\"洋芋团，团就对了\";s:8:\"keywords\";s:9:\"洋芋团\";s:8:\"timezone\";s:9:\"Etc/GMT-8\";s:10:\"couponname\";s:9:\"优惠券\";s:8:\"currency\";s:2:\"¥\";s:12:\"currencyname\";s:3:\"CNY\";s:12:\"invitecredit\";s:1:\"0\";s:8:\"conduser\";s:1:\"0\";s:11:\"partnerdown\";s:1:\"0\";s:4:\"gzip\";s:1:\"0\";s:6:\"kefuqq\";s:18:\"357531980,35763189\";s:7:\"kefumsn\";s:11:\"02399988888\";s:9:\"wwwprefix\";s:77:\"http://localhost/ZuituGo_CV2.0_build20120502/ZuituGo_CV2.0_20120502/zuituware\";s:9:\"imgprefix\";s:77:\"http://localhost/ZuituGo_CV2.0_build20120502/ZuituGo_CV2.0_20120502/zuituware\";s:9:\"cssprefix\";s:77:\"http://localhost/ZuituGo_CV2.0_build20120502/ZuituGo_CV2.0_20120502/zuituware\";s:9:\"mobileurl\";s:0:\"\";s:3:\"icp\";s:20:\"渝ICP备14004919号\";s:8:\"statcode\";s:0:\"\";s:9:\"sinajiwai\";s:33:\"http://www.weibo.com/u/1158074223\";s:12:\"tencentjiwai\";s:40:\"http://t.qq.com/oursdreams130126?preview\";}}', '2014-12-02 15:09:13');
INSERT INTO logger_admin VALUES ('3', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"N\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"Y\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"Y\";s:8:\"navforum\";s:1:\"N\";s:12:\"buycouponsms\";s:1:\"Y\";s:12:\"usecouponsms\";s:1:\"Y\";s:13:\"expressbuysms\";s:1:\"Y\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"Y\";s:8:\"trsimple\";s:1:\"N\";s:9:\"moneysave\";s:1:\"N\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"Y\";s:10:\"usercredit\";s:1:\"Y\";s:10:\"creditshop\";s:1:\"Y\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"N\";s:7:\"daysign\";s:1:\"N\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"N\";s:13:\"indexcateteam\";s:1:\"Y\";s:8:\"cateteam\";s:1:\"Y\";s:11:\"catepartner\";s:1:\"Y\";s:11:\"citypartner\";s:1:\"N\";s:11:\"cateseconds\";s:1:\"N\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"Y\";s:10:\"mobilecode\";s:1:\"Y\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-02 15:14:30');
INSERT INTO logger_admin VALUES ('4', '1', 'fantianmi@gmail.com', 'system', '编辑基本设置', 'a:1:{s:6:\"system\";a:23:{s:8:\"sitename\";s:9:\"洋芋团\";s:12:\"abbreviation\";s:9:\"洋芋团\";s:9:\"sitetitle\";s:24:\"洋芋团，团就对了\";s:11:\"description\";s:24:\"洋芋团，团就对了\";s:8:\"keywords\";s:9:\"洋芋团\";s:8:\"timezone\";s:9:\"Etc/GMT-8\";s:10:\"couponname\";s:9:\"优惠券\";s:8:\"currency\";s:2:\"¥\";s:12:\"currencyname\";s:3:\"CNY\";s:12:\"invitecredit\";s:1:\"0\";s:8:\"conduser\";s:1:\"0\";s:11:\"partnerdown\";s:1:\"0\";s:4:\"gzip\";s:1:\"0\";s:6:\"kefuqq\";s:18:\"357531980,35763189\";s:7:\"kefumsn\";s:11:\"02399988888\";s:9:\"wwwprefix\";s:16:\"http://localhost\";s:9:\"imgprefix\";s:16:\"http://localhost\";s:9:\"cssprefix\";s:16:\"http://localhost\";s:9:\"mobileurl\";s:0:\"\";s:3:\"icp\";s:20:\"渝ICP备14004919号\";s:8:\"statcode\";s:0:\"\";s:9:\"sinajiwai\";s:33:\"http://www.weibo.com/u/1158074223\";s:12:\"tencentjiwai\";s:40:\"http://t.qq.com/oursdreams130126?preview\";}}', '2014-12-02 15:26:54');
INSERT INTO logger_admin VALUES ('5', '1', 'fantianmi@gmail.com', 'system', '编辑基本设置', 'a:1:{s:6:\"system\";a:23:{s:8:\"sitename\";s:9:\"洋芋团\";s:12:\"abbreviation\";s:9:\"洋芋团\";s:9:\"sitetitle\";s:24:\"洋芋团，团就对了\";s:11:\"description\";s:24:\"洋芋团，团就对了\";s:8:\"keywords\";s:9:\"洋芋团\";s:8:\"timezone\";s:9:\"Etc/GMT-8\";s:10:\"couponname\";s:9:\"优惠券\";s:8:\"currency\";s:2:\"¥\";s:12:\"currencyname\";s:3:\"CNY\";s:12:\"invitecredit\";s:1:\"0\";s:8:\"conduser\";s:1:\"0\";s:11:\"partnerdown\";s:1:\"0\";s:4:\"gzip\";s:1:\"0\";s:6:\"kefuqq\";s:18:\"357531980,35763189\";s:7:\"kefumsn\";s:11:\"02399988888\";s:9:\"wwwprefix\";s:20:\"http://192.168.0.169\";s:9:\"imgprefix\";s:20:\"http://192.168.0.169\";s:9:\"cssprefix\";s:20:\"http://192.168.0.169\";s:9:\"mobileurl\";s:0:\"\";s:3:\"icp\";s:20:\"渝ICP备14004919号\";s:8:\"statcode\";s:0:\"\";s:9:\"sinajiwai\";s:33:\"http://www.weibo.com/u/1158074223\";s:12:\"tencentjiwai\";s:40:\"http://t.qq.com/oursdreams130126?preview\";}}', '2014-12-02 15:27:19');
INSERT INTO logger_admin VALUES ('6', '1', 'fantianmi@gmail.com', 'misc', '升级数据库结构', 'a:0:{}', '2014-12-02 17:33:08');
INSERT INTO logger_admin VALUES ('7', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"N\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"Y\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"Y\";s:8:\"navforum\";s:1:\"N\";s:12:\"buycouponsms\";s:1:\"Y\";s:12:\"usecouponsms\";s:1:\"Y\";s:13:\"expressbuysms\";s:1:\"Y\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"Y\";s:8:\"trsimple\";s:1:\"N\";s:9:\"moneysave\";s:1:\"N\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"Y\";s:10:\"usercredit\";s:1:\"Y\";s:10:\"creditshop\";s:1:\"N\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"N\";s:7:\"daysign\";s:1:\"N\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"N\";s:13:\"indexcateteam\";s:1:\"Y\";s:8:\"cateteam\";s:1:\"Y\";s:11:\"catepartner\";s:1:\"Y\";s:11:\"citypartner\";s:1:\"N\";s:11:\"cateseconds\";s:1:\"N\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"Y\";s:10:\"mobilecode\";s:1:\"Y\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-02 17:42:53');
INSERT INTO logger_admin VALUES ('8', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"N\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"Y\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"Y\";s:8:\"navforum\";s:1:\"N\";s:12:\"buycouponsms\";s:1:\"Y\";s:12:\"usecouponsms\";s:1:\"Y\";s:13:\"expressbuysms\";s:1:\"Y\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"Y\";s:8:\"trsimple\";s:1:\"N\";s:9:\"moneysave\";s:1:\"N\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"Y\";s:10:\"usercredit\";s:1:\"N\";s:10:\"creditshop\";s:1:\"N\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"N\";s:7:\"daysign\";s:1:\"N\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"N\";s:13:\"indexcateteam\";s:1:\"Y\";s:8:\"cateteam\";s:1:\"Y\";s:11:\"catepartner\";s:1:\"Y\";s:11:\"citypartner\";s:1:\"N\";s:11:\"cateseconds\";s:1:\"N\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"Y\";s:10:\"mobilecode\";s:1:\"Y\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-02 17:43:31');
INSERT INTO logger_admin VALUES ('9', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"N\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"Y\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"Y\";s:8:\"navforum\";s:1:\"N\";s:12:\"buycouponsms\";s:1:\"Y\";s:12:\"usecouponsms\";s:1:\"Y\";s:13:\"expressbuysms\";s:1:\"Y\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"Y\";s:8:\"trsimple\";s:1:\"N\";s:9:\"moneysave\";s:1:\"N\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"Y\";s:10:\"usercredit\";s:1:\"N\";s:10:\"creditshop\";s:1:\"N\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"Y\";s:7:\"daysign\";s:1:\"N\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"N\";s:13:\"indexcateteam\";s:1:\"Y\";s:8:\"cateteam\";s:1:\"Y\";s:11:\"catepartner\";s:1:\"Y\";s:11:\"citypartner\";s:1:\"N\";s:11:\"cateseconds\";s:1:\"N\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"Y\";s:10:\"mobilecode\";s:1:\"Y\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-02 17:43:53');
INSERT INTO logger_admin VALUES ('10', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"N\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"Y\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"Y\";s:8:\"navforum\";s:1:\"N\";s:12:\"buycouponsms\";s:1:\"Y\";s:12:\"usecouponsms\";s:1:\"Y\";s:13:\"expressbuysms\";s:1:\"Y\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"Y\";s:8:\"trsimple\";s:1:\"N\";s:9:\"moneysave\";s:1:\"N\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"Y\";s:10:\"usercredit\";s:1:\"N\";s:10:\"creditshop\";s:1:\"N\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"Y\";s:7:\"daysign\";s:1:\"N\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"N\";s:13:\"indexcateteam\";s:1:\"Y\";s:8:\"cateteam\";s:1:\"N\";s:11:\"catepartner\";s:1:\"Y\";s:11:\"citypartner\";s:1:\"N\";s:11:\"cateseconds\";s:1:\"N\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"Y\";s:10:\"mobilecode\";s:1:\"Y\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-02 17:44:13');
INSERT INTO logger_admin VALUES ('11', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"N\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"Y\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"Y\";s:8:\"navforum\";s:1:\"N\";s:12:\"buycouponsms\";s:1:\"Y\";s:12:\"usecouponsms\";s:1:\"Y\";s:13:\"expressbuysms\";s:1:\"Y\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"Y\";s:8:\"trsimple\";s:1:\"N\";s:9:\"moneysave\";s:1:\"N\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"Y\";s:10:\"usercredit\";s:1:\"N\";s:10:\"creditshop\";s:1:\"N\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"Y\";s:7:\"daysign\";s:1:\"N\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"N\";s:13:\"indexcateteam\";s:1:\"Y\";s:8:\"cateteam\";s:1:\"N\";s:11:\"catepartner\";s:1:\"N\";s:11:\"citypartner\";s:1:\"N\";s:11:\"cateseconds\";s:1:\"Y\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"Y\";s:10:\"mobilecode\";s:1:\"Y\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-02 17:44:46');
INSERT INTO logger_admin VALUES ('12', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存63个', 'a:0:{}', '2014-12-02 17:44:51');
INSERT INTO logger_admin VALUES ('13', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"N\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"Y\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"Y\";s:8:\"navforum\";s:1:\"N\";s:12:\"buycouponsms\";s:1:\"Y\";s:12:\"usecouponsms\";s:1:\"Y\";s:13:\"expressbuysms\";s:1:\"Y\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"Y\";s:8:\"trsimple\";s:1:\"N\";s:9:\"moneysave\";s:1:\"N\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"Y\";s:10:\"usercredit\";s:1:\"N\";s:10:\"creditshop\";s:1:\"N\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"Y\";s:7:\"daysign\";s:1:\"N\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"N\";s:13:\"indexcateteam\";s:1:\"N\";s:8:\"cateteam\";s:1:\"N\";s:11:\"catepartner\";s:1:\"N\";s:11:\"citypartner\";s:1:\"N\";s:11:\"cateseconds\";s:1:\"Y\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"Y\";s:10:\"mobilecode\";s:1:\"Y\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-02 17:45:33');
INSERT INTO logger_admin VALUES ('14', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"N\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"Y\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"Y\";s:8:\"navforum\";s:1:\"N\";s:12:\"buycouponsms\";s:1:\"Y\";s:12:\"usecouponsms\";s:1:\"Y\";s:13:\"expressbuysms\";s:1:\"Y\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"Y\";s:8:\"trsimple\";s:1:\"N\";s:9:\"moneysave\";s:1:\"N\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"Y\";s:10:\"usercredit\";s:1:\"N\";s:10:\"creditshop\";s:1:\"N\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"Y\";s:7:\"daysign\";s:1:\"N\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"N\";s:13:\"indexcateteam\";s:1:\"Y\";s:8:\"cateteam\";s:1:\"Y\";s:11:\"catepartner\";s:1:\"N\";s:11:\"citypartner\";s:1:\"N\";s:11:\"cateseconds\";s:1:\"Y\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"Y\";s:10:\"mobilecode\";s:1:\"Y\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-02 17:46:05');
INSERT INTO logger_admin VALUES ('15', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"N\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"N\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"N\";s:8:\"navforum\";s:1:\"N\";s:12:\"buycouponsms\";s:1:\"Y\";s:12:\"usecouponsms\";s:1:\"Y\";s:13:\"expressbuysms\";s:1:\"Y\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"Y\";s:8:\"trsimple\";s:1:\"N\";s:9:\"moneysave\";s:1:\"N\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"Y\";s:10:\"usercredit\";s:1:\"N\";s:10:\"creditshop\";s:1:\"N\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"Y\";s:7:\"daysign\";s:1:\"N\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"N\";s:13:\"indexcateteam\";s:1:\"Y\";s:8:\"cateteam\";s:1:\"Y\";s:11:\"catepartner\";s:1:\"N\";s:11:\"citypartner\";s:1:\"N\";s:11:\"cateseconds\";s:1:\"Y\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"Y\";s:10:\"mobilecode\";s:1:\"Y\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-02 17:46:18');
INSERT INTO logger_admin VALUES ('16', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"N\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"N\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"N\";s:8:\"navforum\";s:1:\"Y\";s:12:\"buycouponsms\";s:1:\"Y\";s:12:\"usecouponsms\";s:1:\"Y\";s:13:\"expressbuysms\";s:1:\"Y\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"Y\";s:8:\"trsimple\";s:1:\"N\";s:9:\"moneysave\";s:1:\"N\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"Y\";s:10:\"usercredit\";s:1:\"N\";s:10:\"creditshop\";s:1:\"N\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"Y\";s:7:\"daysign\";s:1:\"N\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"N\";s:13:\"indexcateteam\";s:1:\"Y\";s:8:\"cateteam\";s:1:\"Y\";s:11:\"catepartner\";s:1:\"N\";s:11:\"citypartner\";s:1:\"N\";s:11:\"cateseconds\";s:1:\"Y\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"Y\";s:10:\"mobilecode\";s:1:\"Y\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-02 17:46:28');
INSERT INTO logger_admin VALUES ('17', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"Y\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"N\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"N\";s:8:\"navforum\";s:1:\"Y\";s:12:\"buycouponsms\";s:1:\"Y\";s:12:\"usecouponsms\";s:1:\"Y\";s:13:\"expressbuysms\";s:1:\"Y\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"Y\";s:8:\"trsimple\";s:1:\"N\";s:9:\"moneysave\";s:1:\"N\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"Y\";s:10:\"usercredit\";s:1:\"N\";s:10:\"creditshop\";s:1:\"N\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"Y\";s:7:\"daysign\";s:1:\"N\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"N\";s:13:\"indexcateteam\";s:1:\"Y\";s:8:\"cateteam\";s:1:\"Y\";s:11:\"catepartner\";s:1:\"N\";s:11:\"citypartner\";s:1:\"N\";s:11:\"cateseconds\";s:1:\"Y\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"Y\";s:10:\"mobilecode\";s:1:\"Y\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-02 17:46:58');
INSERT INTO logger_admin VALUES ('18', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"N\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"N\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"N\";s:8:\"navforum\";s:1:\"Y\";s:12:\"buycouponsms\";s:1:\"Y\";s:12:\"usecouponsms\";s:1:\"Y\";s:13:\"expressbuysms\";s:1:\"Y\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"Y\";s:8:\"trsimple\";s:1:\"N\";s:9:\"moneysave\";s:1:\"N\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"Y\";s:10:\"usercredit\";s:1:\"N\";s:10:\"creditshop\";s:1:\"N\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"Y\";s:7:\"daysign\";s:1:\"N\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"N\";s:13:\"indexcateteam\";s:1:\"Y\";s:8:\"cateteam\";s:1:\"Y\";s:11:\"catepartner\";s:1:\"N\";s:11:\"citypartner\";s:1:\"N\";s:11:\"cateseconds\";s:1:\"Y\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"Y\";s:10:\"mobilecode\";s:1:\"Y\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-02 17:47:15');
INSERT INTO logger_admin VALUES ('19', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:6:{s:10:\"indexmulti\";s:1:\"Y\";s:9:\"indexpage\";s:1:\"Y\";s:17:\"indexmultimeituan\";s:1:\"Y\";s:14:\"verifyregister\";s:1:\"Y\";s:11:\"verifytopic\";s:1:\"Y\";s:14:\"verifyfeedback\";s:1:\"Y\";}s:6:\"system\";a:2:{s:9:\"indexteam\";s:2:\"12\";s:8:\"sideteam\";s:1:\"3\";}}', '2014-12-02 17:48:14');
INSERT INTO logger_admin VALUES ('20', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:1:{s:6:\"option\";a:3:{s:11:\"rewritecity\";s:1:\"Y\";s:11:\"rewriteteam\";s:1:\"Y\";s:14:\"rewritepartner\";s:1:\"Y\";}}', '2014-12-02 17:48:40');
INSERT INTO logger_admin VALUES ('21', '1', 'fantianmi@gmail.com', 'system', '编辑公告', 'a:2:{s:2:\"id\";s:1:\"1\";s:8:\"bulletin\";a:2:{i:0;s:24:\"洋芋团，团就对了\";i:2306;s:0:\"\";}}', '2014-12-02 17:49:17');
INSERT INTO logger_admin VALUES ('22', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:1:{s:6:\"option\";a:3:{s:11:\"rewritecity\";s:1:\"N\";s:11:\"rewriteteam\";s:1:\"N\";s:14:\"rewritepartner\";s:1:\"N\";}}', '2014-12-02 17:54:29');
INSERT INTO logger_admin VALUES ('23', '1', 'fantianmi@gmail.com', 'team', '新建team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:8:\"city_ids\";}', '2014-12-03 13:59:03');
INSERT INTO logger_admin VALUES ('24', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:8:\"city_ids\";}', '2014-12-03 13:59:45');
INSERT INTO logger_admin VALUES ('25', '1', 'fantianmi@gmail.com', 'team', '新建team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:8:\"city_ids\";}', '2014-12-03 14:01:57');
INSERT INTO logger_admin VALUES ('26', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:8:\"city_ids\";}', '2014-12-03 14:02:10');
INSERT INTO logger_admin VALUES ('27', '1', 'fantianmi@gmail.com', 'team', '新建team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:8:\"city_ids\";}', '2014-12-03 14:06:25');
INSERT INTO logger_admin VALUES ('28', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"N\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"N\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"N\";s:8:\"navforum\";s:1:\"Y\";s:12:\"buycouponsms\";s:1:\"Y\";s:12:\"usecouponsms\";s:1:\"Y\";s:13:\"expressbuysms\";s:1:\"Y\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"Y\";s:8:\"trsimple\";s:1:\"N\";s:9:\"moneysave\";s:1:\"N\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"Y\";s:10:\"usercredit\";s:1:\"N\";s:10:\"creditshop\";s:1:\"N\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"N\";s:7:\"daysign\";s:1:\"N\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"N\";s:13:\"indexcateteam\";s:1:\"Y\";s:8:\"cateteam\";s:1:\"Y\";s:11:\"catepartner\";s:1:\"N\";s:11:\"citypartner\";s:1:\"N\";s:11:\"cateseconds\";s:1:\"Y\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"Y\";s:10:\"mobilecode\";s:1:\"Y\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-03 16:40:50');
INSERT INTO logger_admin VALUES ('29', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:8:\"city_ids\";}', '2014-12-04 13:45:55');
INSERT INTO logger_admin VALUES ('30', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:8:\"city_ids\";}', '2014-12-04 14:01:51');
INSERT INTO logger_admin VALUES ('31', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:8:\"city_ids\";}', '2014-12-04 14:03:01');
INSERT INTO logger_admin VALUES ('32', '1', 'fantianmi@gmail.com', 'system', '编辑基本设置', 'a:1:{s:6:\"system\";a:23:{s:8:\"sitename\";s:9:\"洋芋团\";s:12:\"abbreviation\";s:24:\"洋芋团，团就对了\";s:9:\"sitetitle\";s:9:\"洋芋团\";s:11:\"description\";s:17:\"洋芋团||洋芋\";s:8:\"keywords\";s:17:\"洋芋团||洋芋\";s:8:\"timezone\";s:9:\"Etc/GMT-8\";s:10:\"couponname\";s:9:\"洋芋卷\";s:8:\"currency\";s:2:\"¥\";s:12:\"currencyname\";s:3:\"CNY\";s:12:\"invitecredit\";s:1:\"0\";s:8:\"conduser\";s:1:\"1\";s:11:\"partnerdown\";s:1:\"1\";s:4:\"gzip\";s:1:\"0\";s:6:\"kefuqq\";s:9:\"357531980\";s:7:\"kefumsn\";s:0:\"\";s:9:\"wwwprefix\";s:20:\"http://192.168.0.169\";s:9:\"imgprefix\";s:20:\"http://192.168.0.169\";s:9:\"cssprefix\";s:20:\"http://192.168.0.169\";s:9:\"mobileurl\";s:0:\"\";s:3:\"icp\";s:0:\"\";s:8:\"statcode\";s:0:\"\";s:9:\"sinajiwai\";s:0:\"\";s:12:\"tencentjiwai\";s:0:\"\";}}', '2014-12-04 16:21:51');
INSERT INTO logger_admin VALUES ('33', '1', 'fantianmi@gmail.com', 'system', '编辑公告', 'a:2:{s:2:\"id\";s:1:\"1\";s:8:\"bulletin\";a:17:{i:0;s:34:\"<p>洋芋团，团就对了！</p>\";i:2497;s:0:\"\";i:2496;s:0:\"\";i:2495;s:0:\"\";i:2494;s:0:\"\";i:2493;s:0:\"\";i:2492;s:0:\"\";i:2491;s:0:\"\";i:2490;s:0:\"\";i:2489;s:0:\"\";i:2488;s:0:\"\";i:2487;s:0:\"\";i:2486;s:0:\"\";i:2485;s:0:\"\";i:2484;s:0:\"\";i:2483;s:0:\"\";i:2306;s:0:\"\";}}', '2014-12-04 16:23:39');
INSERT INTO logger_admin VALUES ('34', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存159个', 'a:0:{}', '2014-12-04 16:35:13');
INSERT INTO logger_admin VALUES ('35', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存0个', 'a:0:{}', '2014-12-04 16:35:18');
INSERT INTO logger_admin VALUES ('36', '1', 'fantianmi@gmail.com', 'system', '编辑基本设置', 'a:1:{s:6:\"system\";a:26:{s:8:\"sitename\";s:9:\"团上团\";s:12:\"abbreviation\";s:9:\"团上团\";s:9:\"sitetitle\";s:31:\"团上团-精品团购每一天\";s:11:\"description\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:8:\"timezone\";s:9:\"Etc/GMT-8\";s:10:\"couponname\";s:9:\"优惠券\";s:8:\"currency\";s:2:\"¥\";s:12:\"currencyname\";s:3:\"CNY\";s:12:\"invitecredit\";s:1:\"0\";s:8:\"conduser\";s:1:\"0\";s:11:\"partnerdown\";s:1:\"0\";s:4:\"gzip\";s:1:\"0\";s:6:\"kefuqq\";s:0:\"\";s:7:\"kefumsn\";s:0:\"\";s:9:\"wwwprefix\";s:20:\"http://192.168.0.169\";s:9:\"imgprefix\";s:20:\"http://192.168.0.169\";s:9:\"cssprefix\";s:20:\"http://192.168.0.169\";s:9:\"mobileurl\";s:0:\"\";s:3:\"icp\";s:0:\"\";s:8:\"statcode\";s:0:\"\";s:9:\"sinajiwai\";s:0:\"\";s:12:\"tencentjiwai\";s:0:\"\";s:12:\"kefu_hotline\";s:10:\"020-123456\";s:11:\"server_time\";s:10:\"9:00-18:00\";s:11:\"tousu_email\";s:14:\"4545565@bn.com\";}}', '2014-12-04 17:31:31');
INSERT INTO logger_admin VALUES ('37', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存39个', 'a:0:{}', '2014-12-04 17:31:42');
INSERT INTO logger_admin VALUES ('38', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存26个', 'a:0:{}', '2014-12-04 20:56:33');
INSERT INTO logger_admin VALUES ('39', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存22个', 'a:0:{}', '2014-12-04 21:12:03');
INSERT INTO logger_admin VALUES ('40', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存0个', 'a:0:{}', '2014-12-04 21:12:07');
INSERT INTO logger_admin VALUES ('41', '1', 'fantianmi@gmail.com', 'system', '编辑基本设置', 'a:1:{s:6:\"system\";a:26:{s:8:\"sitename\";s:9:\"团上团\";s:12:\"abbreviation\";s:9:\"团上团\";s:9:\"sitetitle\";s:31:\"团上团-精品团购每一天\";s:11:\"description\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:8:\"timezone\";s:9:\"Etc/GMT-8\";s:10:\"couponname\";s:9:\"优惠券\";s:8:\"currency\";s:2:\"¥\";s:12:\"currencyname\";s:3:\"CNY\";s:12:\"invitecredit\";s:1:\"0\";s:8:\"conduser\";s:1:\"0\";s:11:\"partnerdown\";s:1:\"0\";s:4:\"gzip\";s:1:\"0\";s:6:\"kefuqq\";s:0:\"\";s:7:\"kefumsn\";s:0:\"\";s:9:\"wwwprefix\";s:16:\"http://localhost\";s:9:\"imgprefix\";s:16:\"http://localhost\";s:9:\"cssprefix\";s:16:\"http://localhost\";s:9:\"mobileurl\";s:0:\"\";s:3:\"icp\";s:0:\"\";s:8:\"statcode\";s:0:\"\";s:9:\"sinajiwai\";s:0:\"\";s:12:\"tencentjiwai\";s:0:\"\";s:12:\"kefu_hotline\";s:10:\"020-123456\";s:11:\"server_time\";s:10:\"9:00-18:00\";s:11:\"tousu_email\";s:14:\"4545565@bn.com\";}}', '2014-12-04 23:10:36');
INSERT INTO logger_admin VALUES ('42', '1', 'fantianmi@gmail.com', 'user', 'fantianmi@163.com线下充值2000元', 'a:0:{}', '2014-12-04 23:22:09');
INSERT INTO logger_admin VALUES ('43', '1', 'fantianmi@gmail.com', 'system', '编辑基本设置', 'a:1:{s:6:\"system\";a:23:{s:8:\"sitename\";s:9:\"洋芋团\";s:12:\"abbreviation\";s:9:\"洋芋团\";s:9:\"sitetitle\";s:24:\"洋芋团，团就对了\";s:11:\"description\";s:24:\"洋芋团，团就对了\";s:8:\"keywords\";s:9:\"洋芋团\";s:8:\"timezone\";s:9:\"Etc/GMT-8\";s:10:\"couponname\";s:9:\"优惠券\";s:8:\"currency\";s:2:\"¥\";s:12:\"currencyname\";s:3:\"CNY\";s:12:\"invitecredit\";s:1:\"0\";s:8:\"conduser\";s:1:\"0\";s:11:\"partnerdown\";s:1:\"0\";s:4:\"gzip\";s:1:\"0\";s:6:\"kefuqq\";s:18:\"357531980,35763189\";s:7:\"kefumsn\";s:11:\"02399988888\";s:9:\"wwwprefix\";s:16:\"http://localhost\";s:9:\"imgprefix\";s:16:\"http://localhost\";s:9:\"cssprefix\";s:16:\"http://localhost\";s:9:\"mobileurl\";s:0:\"\";s:3:\"icp\";s:20:\"渝ICP备14004919号\";s:8:\"statcode\";s:0:\"\";s:9:\"sinajiwai\";s:33:\"http://www.weibo.com/u/1158074223\";s:12:\"tencentjiwai\";s:40:\"http://t.qq.com/oursdreams130126?preview\";}}', '2014-12-04 23:40:11');
INSERT INTO logger_admin VALUES ('44', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存133个', 'a:0:{}', '2014-12-04 23:45:43');
INSERT INTO logger_admin VALUES ('45', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存4个', 'a:0:{}', '2014-12-04 23:46:24');
INSERT INTO logger_admin VALUES ('46', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存4个', 'a:0:{}', '2014-12-04 23:49:12');
INSERT INTO logger_admin VALUES ('47', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"N\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"N\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"N\";s:8:\"navforum\";s:1:\"N\";s:12:\"buycouponsms\";s:1:\"N\";s:12:\"usecouponsms\";s:1:\"N\";s:13:\"expressbuysms\";s:1:\"N\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"N\";s:8:\"trsimple\";s:1:\"Y\";s:9:\"moneysave\";s:1:\"Y\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"N\";s:10:\"usercredit\";s:1:\"Y\";s:10:\"creditshop\";s:1:\"Y\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"N\";s:7:\"daysign\";s:1:\"Y\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"Y\";s:13:\"indexcateteam\";s:1:\"Y\";s:8:\"cateteam\";s:1:\"Y\";s:11:\"catepartner\";s:1:\"Y\";s:11:\"citypartner\";s:1:\"Y\";s:11:\"cateseconds\";s:1:\"Y\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"N\";s:10:\"mobilecode\";s:1:\"N\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-04 23:59:26');
INSERT INTO logger_admin VALUES ('48', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存93个', 'a:0:{}', '2014-12-05 00:14:03');
INSERT INTO logger_admin VALUES ('49', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存16个', 'a:0:{}', '2014-12-05 00:41:10');
INSERT INTO logger_admin VALUES ('50', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存7个', 'a:0:{}', '2014-12-05 00:42:02');
INSERT INTO logger_admin VALUES ('51', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存7个', 'a:0:{}', '2014-12-05 00:47:13');
INSERT INTO logger_admin VALUES ('52', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存6个', 'a:0:{}', '2014-12-05 00:47:56');
INSERT INTO logger_admin VALUES ('53', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存1个', 'a:0:{}', '2014-12-05 00:48:45');
INSERT INTO logger_admin VALUES ('54', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存18个', 'a:0:{}', '2014-12-05 07:40:50');
INSERT INTO logger_admin VALUES ('55', '1', 'fantianmi@gmail.com', 'system', '编辑基本设置', 'a:1:{s:6:\"system\";a:26:{s:8:\"sitename\";s:9:\"洋芋团\";s:12:\"abbreviation\";s:9:\"洋芋团\";s:9:\"sitetitle\";s:24:\"洋芋团，团就对了\";s:11:\"description\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:8:\"timezone\";s:9:\"Etc/GMT-8\";s:10:\"couponname\";s:9:\"优惠券\";s:8:\"currency\";s:2:\"¥\";s:12:\"currencyname\";s:3:\"CNY\";s:12:\"invitecredit\";s:1:\"0\";s:8:\"conduser\";s:1:\"0\";s:11:\"partnerdown\";s:1:\"0\";s:4:\"gzip\";s:1:\"0\";s:6:\"kefuqq\";s:0:\"\";s:7:\"kefumsn\";s:0:\"\";s:9:\"wwwprefix\";s:16:\"http://localhost\";s:9:\"imgprefix\";s:16:\"http://localhost\";s:9:\"cssprefix\";s:16:\"http://localhost\";s:9:\"mobileurl\";s:0:\"\";s:3:\"icp\";s:0:\"\";s:8:\"statcode\";s:0:\"\";s:9:\"sinajiwai\";s:0:\"\";s:12:\"tencentjiwai\";s:0:\"\";s:12:\"kefu_hotline\";s:10:\"020-123456\";s:11:\"server_time\";s:10:\"9:00-18:00\";s:11:\"tousu_email\";s:14:\"4545565@bn.com\";}}', '2014-12-05 07:41:47');
INSERT INTO logger_admin VALUES ('56', '1', 'fantianmi@gmail.com', 'team', '新建team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";}', '2014-12-05 08:20:38');
INSERT INTO logger_admin VALUES ('57', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";}', '2014-12-05 08:28:27');
INSERT INTO logger_admin VALUES ('58', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";}', '2014-12-05 08:29:07');
INSERT INTO logger_admin VALUES ('59', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";}', '2014-12-05 08:29:34');
INSERT INTO logger_admin VALUES ('60', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";}', '2014-12-05 08:29:53');
INSERT INTO logger_admin VALUES ('61', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存28个', 'a:0:{}', '2014-12-05 08:30:26');
INSERT INTO logger_admin VALUES ('62', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";}', '2014-12-05 08:34:27');
INSERT INTO logger_admin VALUES ('63', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存28个', 'a:0:{}', '2014-12-05 08:40:22');
INSERT INTO logger_admin VALUES ('64', '1', 'fantianmi@gmail.com', 'team', '编辑team项目失败', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";}', '2014-12-05 08:51:12');
INSERT INTO logger_admin VALUES ('65', '1', 'fantianmi@gmail.com', 'team', '新建team项目', 'a:45:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";}', '2014-12-05 08:53:09');
INSERT INTO logger_admin VALUES ('66', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存31个', 'a:0:{}', '2014-12-05 08:53:27');
INSERT INTO logger_admin VALUES ('67', '1', 'fantianmi@gmail.com', 'team', '新建team项目', 'a:54:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";}', '2014-12-05 09:59:09');
INSERT INTO logger_admin VALUES ('68', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存51个', 'a:0:{}', '2014-12-05 10:07:54');
INSERT INTO logger_admin VALUES ('69', '1', 'fantianmi@gmail.com', 'team', '新建team项目', 'a:54:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";}', '2014-12-05 10:23:03');
INSERT INTO logger_admin VALUES ('70', '1', 'fantianmi@gmail.com', 'user', 'fantianmi@gmail.com线下充值999999元', 'a:0:{}', '2014-12-05 10:23:21');
INSERT INTO logger_admin VALUES ('71', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存44个', 'a:0:{}', '2014-12-05 10:56:42');
INSERT INTO logger_admin VALUES ('72', '1', 'fantianmi@gmail.com', 'order', '删除订单4', 'a:0:{}', '2014-12-05 13:50:45');
INSERT INTO logger_admin VALUES ('73', '1', 'fantianmi@gmail.com', 'order', '删除订单2', 'a:0:{}', '2014-12-05 13:50:48');
INSERT INTO logger_admin VALUES ('74', '1', 'fantianmi@gmail.com', 'order', '删除订单1', 'a:0:{}', '2014-12-05 13:50:52');
INSERT INTO logger_admin VALUES ('75', '1', 'fantianmi@gmail.com', 'team', '新建team项目', 'a:54:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";}', '2014-12-05 15:00:44');
INSERT INTO logger_admin VALUES ('76', '1', 'fantianmi@gmail.com', 'user', '357531980@qq.com线下充值800000元', 'a:0:{}', '2014-12-05 15:04:33');
INSERT INTO logger_admin VALUES ('77', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:56:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:10:\"close_time\";}', '2014-12-05 15:29:40');
INSERT INTO logger_admin VALUES ('78', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:56:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:10:\"close_time\";}', '2014-12-05 15:35:22');
INSERT INTO logger_admin VALUES ('79', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:56:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:10:\"close_time\";}', '2014-12-05 15:35:37');
INSERT INTO logger_admin VALUES ('80', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:55:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";}', '2014-12-05 15:35:57');
INSERT INTO logger_admin VALUES ('81', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:55:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";}', '2014-12-07 16:18:46');
INSERT INTO logger_admin VALUES ('82', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:55:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";}', '2014-12-07 16:18:54');
INSERT INTO logger_admin VALUES ('83', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:55:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";}', '2014-12-07 16:19:01');
INSERT INTO logger_admin VALUES ('84', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:55:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";}', '2014-12-07 16:19:44');
INSERT INTO logger_admin VALUES ('85', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:55:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";}', '2014-12-07 16:19:58');
INSERT INTO logger_admin VALUES ('86', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:55:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";}', '2014-12-07 16:20:11');
INSERT INTO logger_admin VALUES ('87', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存98个', 'a:0:{}', '2014-12-07 17:33:20');
INSERT INTO logger_admin VALUES ('88', '1', 'fantianmi@gmail.com', 'system', '编辑选项设置', 'a:1:{s:6:\"option\";a:3:{s:11:\"rewritecity\";s:1:\"N\";s:11:\"rewriteteam\";s:1:\"N\";s:14:\"rewritepartner\";s:1:\"N\";}}', '2014-12-07 17:34:22');
INSERT INTO logger_admin VALUES ('89', '1', 'fantianmi@gmail.com', 'system', '编辑公告', 'a:2:{s:2:\"id\";s:1:\"1\";s:8:\"bulletin\";a:17:{i:0;s:24:\"洋芋团，团就对了\";i:2497;s:0:\"\";i:2496;s:0:\"\";i:2495;s:0:\"\";i:2494;s:0:\"\";i:2493;s:0:\"\";i:2492;s:0:\"\";i:2491;s:0:\"\";i:2490;s:0:\"\";i:2489;s:0:\"\";i:2488;s:0:\"\";i:2487;s:0:\"\";i:2486;s:0:\"\";i:2485;s:0:\"\";i:2484;s:0:\"\";i:2483;s:0:\"\";i:2306;s:0:\"\";}}', '2014-12-07 20:51:23');
INSERT INTO logger_admin VALUES ('90', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存79个', 'a:0:{}', '2014-12-07 22:07:29');
INSERT INTO logger_admin VALUES ('91', '1', 'fantianmi@gmail.com', 'system', '清空模板缓存67个', 'a:0:{}', '2014-12-09 09:43:05');
INSERT INTO logger_admin VALUES ('92', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:57:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";}', '2014-12-09 10:00:01');
INSERT INTO logger_admin VALUES ('93', '1', 'fantianmi@gmail.com', 'team', '编辑team项目', 'a:57:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";}', '2014-12-09 12:41:38');
INSERT INTO logger_admin VALUES ('94', '1', 'maoyijieheiguang@163.com', 'system', '编辑选项设置', 'a:2:{s:6:\"option\";a:35:{s:10:\"navcomment\";s:1:\"N\";s:10:\"navpredict\";s:1:\"N\";s:10:\"navpartner\";s:1:\"N\";s:10:\"navseconds\";s:1:\"Y\";s:8:\"navgoods\";s:1:\"N\";s:8:\"navforum\";s:1:\"N\";s:12:\"buycouponsms\";s:1:\"N\";s:12:\"usecouponsms\";s:1:\"N\";s:13:\"expressbuysms\";s:1:\"N\";s:14:\"displayfailure\";s:1:\"N\";s:7:\"teamask\";s:1:\"N\";s:13:\"creditseconds\";s:1:\"Y\";s:12:\"smssubscribe\";s:1:\"N\";s:8:\"trsimple\";s:1:\"Y\";s:9:\"moneysave\";s:1:\"Y\";s:9:\"teamwhole\";s:1:\"N\";s:8:\"encodeid\";s:1:\"N\";s:11:\"userprivacy\";s:1:\"N\";s:10:\"usercredit\";s:1:\"Y\";s:10:\"creditshop\";s:1:\"Y\";s:9:\"citylocal\";s:1:\"Y\";s:8:\"mycoupon\";s:1:\"N\";s:10:\"bindmobile\";s:1:\"N\";s:7:\"daysign\";s:1:\"Y\";s:6:\"widget\";s:1:\"N\";s:10:\"onlycoupon\";s:1:\"Y\";s:13:\"indexcateteam\";s:1:\"Y\";s:8:\"cateteam\";s:1:\"Y\";s:11:\"catepartner\";s:1:\"Y\";s:11:\"citypartner\";s:1:\"Y\";s:11:\"cateseconds\";s:1:\"Y\";s:9:\"categoods\";s:1:\"N\";s:11:\"emailverify\";s:1:\"N\";s:10:\"needmobile\";s:1:\"Y\";s:10:\"mobilecode\";s:1:\"N\";}s:6:\"system\";a:1:{s:6:\"editor\";s:4:\"kind\";}}', '2014-12-09 16:10:10');
INSERT INTO logger_admin VALUES ('95', '1', 'maoyijieheiguang@163.com', 'system', '编辑基本设置', 'a:1:{s:6:\"system\";a:26:{s:8:\"sitename\";s:9:\"洋芋团\";s:12:\"abbreviation\";s:9:\"洋芋团\";s:9:\"sitetitle\";s:24:\"洋芋团，团就对了\";s:11:\"description\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:8:\"timezone\";s:9:\"Etc/GMT-8\";s:10:\"couponname\";s:9:\"优惠券\";s:8:\"currency\";s:2:\"¥\";s:12:\"currencyname\";s:3:\"CNY\";s:12:\"invitecredit\";s:1:\"0\";s:8:\"conduser\";s:1:\"0\";s:11:\"partnerdown\";s:1:\"0\";s:4:\"gzip\";s:1:\"0\";s:6:\"kefuqq\";s:0:\"\";s:7:\"kefumsn\";s:0:\"\";s:9:\"wwwprefix\";s:20:\"http://192.168.0.169\";s:9:\"imgprefix\";s:20:\"http://192.168.0.169\";s:9:\"cssprefix\";s:20:\"http://192.168.0.169\";s:9:\"mobileurl\";s:0:\"\";s:3:\"icp\";s:0:\"\";s:8:\"statcode\";s:0:\"\";s:9:\"sinajiwai\";s:0:\"\";s:12:\"tencentjiwai\";s:0:\"\";s:12:\"kefu_hotline\";s:10:\"020-123456\";s:11:\"server_time\";s:10:\"9:00-18:00\";s:11:\"tousu_email\";s:14:\"4545565@bn.com\";}}', '2014-12-09 16:50:34');
INSERT INTO logger_admin VALUES ('96', '1', 'maoyijieheiguang@163.com', 'system', '编辑基本设置', 'a:1:{s:6:\"system\";a:26:{s:8:\"sitename\";s:9:\"洋芋团\";s:12:\"abbreviation\";s:9:\"洋芋团\";s:9:\"sitetitle\";s:24:\"洋芋团，团就对了\";s:11:\"description\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:8:\"timezone\";s:9:\"Etc/GMT-8\";s:10:\"couponname\";s:9:\"优惠券\";s:8:\"currency\";s:2:\"¥\";s:12:\"currencyname\";s:3:\"CNY\";s:12:\"invitecredit\";s:1:\"0\";s:8:\"conduser\";s:1:\"0\";s:11:\"partnerdown\";s:1:\"0\";s:4:\"gzip\";s:1:\"0\";s:6:\"kefuqq\";s:0:\"\";s:7:\"kefumsn\";s:0:\"\";s:9:\"wwwprefix\";s:16:\"http://localhost\";s:9:\"imgprefix\";s:16:\"http://localhost\";s:9:\"cssprefix\";s:16:\"http://localhost\";s:9:\"mobileurl\";s:0:\"\";s:3:\"icp\";s:0:\"\";s:8:\"statcode\";s:0:\"\";s:9:\"sinajiwai\";s:0:\"\";s:12:\"tencentjiwai\";s:0:\"\";s:12:\"kefu_hotline\";s:10:\"020-123456\";s:11:\"server_time\";s:10:\"9:00-18:00\";s:11:\"tousu_email\";s:14:\"4545565@bn.com\";}}', '2014-12-09 21:35:49');
INSERT INTO logger_admin VALUES ('97', '1', 'maoyijieheiguang@163.com', 'team', '新建team项目', 'a:59:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:8:\"city_ids\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";s:8:\"city_ids\";s:4:\"2306\";}', '2014-12-09 21:36:22');
INSERT INTO logger_admin VALUES ('98', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:59:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:8:\"city_ids\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";s:8:\"city_ids\";s:4:\"2306\";}', '2014-12-09 21:40:27');
INSERT INTO logger_admin VALUES ('99', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:7:\"area_id\";i:47;s:9:\"index_rec\";i:48;s:10:\"free_yuyue\";i:49;s:7:\"weekend\";i:50;s:7:\"holiday\";i:51;s:4:\"wifi\";i:52;s:4:\"park\";i:53;s:5:\"score\";i:54;s:10:\"wap_detail\";i:55;s:10:\"fj_team_id\";i:56;s:8:\"js_price\";i:57;s:6:\"image3\";i:58;s:6:\"image4\";s:8:\"city_ids\";s:4:\"2306\";}', '2014-12-09 21:45:07');
INSERT INTO logger_admin VALUES ('100', '1', 'maoyijieheiguang@163.com', 'team', '新建team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:7:\"area_id\";i:47;s:9:\"index_rec\";i:48;s:10:\"free_yuyue\";i:49;s:7:\"weekend\";i:50;s:7:\"holiday\";i:51;s:4:\"wifi\";i:52;s:4:\"park\";i:53;s:5:\"score\";i:54;s:10:\"wap_detail\";i:55;s:10:\"fj_team_id\";i:56;s:8:\"js_price\";i:57;s:6:\"image3\";i:58;s:6:\"image4\";s:8:\"city_ids\";s:4:\"2306\";}', '2014-12-09 21:48:58');
INSERT INTO logger_admin VALUES ('101', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:7:\"area_id\";i:47;s:9:\"index_rec\";i:48;s:10:\"free_yuyue\";i:49;s:7:\"weekend\";i:50;s:7:\"holiday\";i:51;s:4:\"wifi\";i:52;s:4:\"park\";i:53;s:5:\"score\";i:54;s:10:\"wap_detail\";i:55;s:10:\"fj_team_id\";i:56;s:8:\"js_price\";i:57;s:6:\"image3\";i:58;s:6:\"image4\";s:8:\"city_ids\";s:4:\"2306\";}', '2014-12-09 21:51:17');
INSERT INTO logger_admin VALUES ('102', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:7:\"area_id\";i:47;s:9:\"index_rec\";i:48;s:10:\"free_yuyue\";i:49;s:7:\"weekend\";i:50;s:7:\"holiday\";i:51;s:4:\"wifi\";i:52;s:4:\"park\";i:53;s:5:\"score\";i:54;s:10:\"wap_detail\";i:55;s:10:\"fj_team_id\";i:56;s:8:\"js_price\";i:57;s:6:\"image3\";i:58;s:6:\"image4\";s:8:\"city_ids\";s:4:\"2306\";}', '2014-12-09 21:51:44');
INSERT INTO logger_admin VALUES ('103', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:7:\"area_id\";i:47;s:9:\"index_rec\";i:48;s:10:\"free_yuyue\";i:49;s:7:\"weekend\";i:50;s:7:\"holiday\";i:51;s:4:\"wifi\";i:52;s:4:\"park\";i:53;s:5:\"score\";i:54;s:10:\"wap_detail\";i:55;s:10:\"fj_team_id\";i:56;s:8:\"js_price\";i:57;s:6:\"image3\";i:58;s:6:\"image4\";s:8:\"city_ids\";s:4:\"2222\";}', '2014-12-09 21:55:53');
INSERT INTO logger_admin VALUES ('104', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:59:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";s:8:\"city_ids\";s:4:\"2222\";}', '2014-12-09 21:57:28');
INSERT INTO logger_admin VALUES ('105', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:7:\"area_id\";i:47;s:9:\"index_rec\";i:48;s:10:\"free_yuyue\";i:49;s:7:\"weekend\";i:50;s:7:\"holiday\";i:51;s:4:\"wifi\";i:52;s:4:\"park\";i:53;s:5:\"score\";i:54;s:10:\"wap_detail\";i:55;s:10:\"fj_team_id\";i:56;s:8:\"js_price\";i:57;s:6:\"image3\";i:58;s:6:\"image4\";s:8:\"city_ids\";s:4:\"2306\";}', '2014-12-09 22:04:52');
INSERT INTO logger_admin VALUES ('106', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:7:\"area_id\";i:47;s:9:\"index_rec\";i:48;s:10:\"free_yuyue\";i:49;s:7:\"weekend\";i:50;s:7:\"holiday\";i:51;s:4:\"wifi\";i:52;s:4:\"park\";i:53;s:5:\"score\";i:54;s:10:\"wap_detail\";i:55;s:10:\"fj_team_id\";i:56;s:8:\"js_price\";i:57;s:6:\"image3\";i:58;s:6:\"image4\";s:8:\"city_ids\";s:4:\"2306\";}', '2014-12-09 22:06:31');
INSERT INTO logger_admin VALUES ('107', '1', 'maoyijieheiguang@163.com', 'system', '清空模板缓存116个', 'a:0:{}', '2014-12-09 22:06:55');
INSERT INTO logger_admin VALUES ('108', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:7:\"area_id\";i:47;s:9:\"index_rec\";i:48;s:10:\"free_yuyue\";i:49;s:7:\"weekend\";i:50;s:7:\"holiday\";i:51;s:4:\"wifi\";i:52;s:4:\"park\";i:53;s:5:\"score\";i:54;s:10:\"wap_detail\";i:55;s:10:\"fj_team_id\";i:56;s:8:\"js_price\";i:57;s:6:\"image3\";i:58;s:6:\"image4\";s:8:\"city_ids\";s:4:\"2306\";}', '2014-12-09 22:07:09');
INSERT INTO logger_admin VALUES ('109', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:7:\"area_id\";i:47;s:9:\"index_rec\";i:48;s:10:\"free_yuyue\";i:49;s:7:\"weekend\";i:50;s:7:\"holiday\";i:51;s:4:\"wifi\";i:52;s:4:\"park\";i:53;s:5:\"score\";i:54;s:10:\"wap_detail\";i:55;s:10:\"fj_team_id\";i:56;s:8:\"js_price\";i:57;s:6:\"image3\";i:58;s:6:\"image4\";s:8:\"city_ids\";s:4:\"2306\";}', '2014-12-09 22:09:36');
INSERT INTO logger_admin VALUES ('110', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:7:\"area_id\";i:47;s:9:\"index_rec\";i:48;s:10:\"free_yuyue\";i:49;s:7:\"weekend\";i:50;s:7:\"holiday\";i:51;s:4:\"wifi\";i:52;s:4:\"park\";i:53;s:5:\"score\";i:54;s:10:\"wap_detail\";i:55;s:10:\"fj_team_id\";i:56;s:8:\"js_price\";i:57;s:6:\"image3\";i:58;s:6:\"image4\";s:8:\"city_ids\";s:4:\"2306\";}', '2014-12-09 22:10:03');
INSERT INTO logger_admin VALUES ('111', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:9:\"team_type\";i:43;s:5:\"state\";i:44;s:7:\"condbuy\";i:45;s:14:\"express_relate\";i:46;s:7:\"area_id\";i:47;s:9:\"index_rec\";i:48;s:10:\"free_yuyue\";i:49;s:7:\"weekend\";i:50;s:7:\"holiday\";i:51;s:4:\"wifi\";i:52;s:4:\"park\";i:53;s:5:\"score\";i:54;s:10:\"wap_detail\";i:55;s:10:\"fj_team_id\";i:56;s:8:\"js_price\";i:57;s:6:\"image3\";i:58;s:6:\"image4\";s:8:\"city_ids\";s:4:\"2306\";}', '2014-12-09 22:11:10');
INSERT INTO logger_admin VALUES ('112', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";}', '2014-12-09 22:12:07');
INSERT INTO logger_admin VALUES ('113', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:59:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";s:8:\"city_ids\";s:3:\"444\";}', '2014-12-09 22:12:49');
INSERT INTO logger_admin VALUES ('114', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:59:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";s:8:\"city_ids\";i:444;}', '2014-12-09 22:13:22');
INSERT INTO logger_admin VALUES ('115', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:59:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";s:8:\"city_ids\";i:444;}', '2014-12-09 22:13:43');
INSERT INTO logger_admin VALUES ('116', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";}', '2014-12-09 22:14:16');
INSERT INTO logger_admin VALUES ('117', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";}', '2014-12-09 22:14:56');
INSERT INTO logger_admin VALUES ('118', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";}', '2014-12-09 22:15:15');
INSERT INTO logger_admin VALUES ('119', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";}', '2014-12-09 23:12:10');
INSERT INTO logger_admin VALUES ('120', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";}', '2014-12-09 23:30:45');
INSERT INTO logger_admin VALUES ('121', '1', 'maoyijieheiguang@163.com', 'team', '新建team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";}', '2014-12-16 17:41:19');
INSERT INTO logger_admin VALUES ('122', '1', 'maoyijieheiguang@163.com', 'team', '新建team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";}', '2014-12-16 17:41:38');
INSERT INTO logger_admin VALUES ('123', '1', 'maoyijieheiguang@163.com', 'team', '新建team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";}', '2014-12-16 17:42:09');
INSERT INTO logger_admin VALUES ('124', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";}', '2014-12-16 17:42:29');
INSERT INTO logger_admin VALUES ('125', '1', 'maoyijieheiguang@163.com', 'team', '编辑team项目', 'a:58:{i:0;s:5:\"title\";i:1;s:12:\"market_price\";i:2;s:10:\"team_price\";i:3;s:8:\"end_time\";i:4;s:10:\"begin_time\";i:5;s:11:\"expire_time\";i:6;s:10:\"min_number\";i:7;s:10:\"max_number\";i:8;s:7:\"summary\";i:9;s:6:\"notice\";i:10;s:10:\"per_number\";i:11;s:13:\"permin_number\";i:12;s:11:\"allowrefund\";i:13;s:7:\"product\";i:14;s:5:\"image\";i:15;s:6:\"image1\";i:16;s:6:\"image2\";i:17;s:3:\"flv\";i:18;s:10:\"now_number\";i:19;s:6:\"detail\";i:20;s:10:\"userreview\";i:21;s:4:\"card\";i:22;s:12:\"systemreview\";i:23;s:8:\"conduser\";i:24;s:7:\"buyonce\";i:25;s:5:\"bonus\";i:26;s:10:\"sort_order\";i:27;s:8:\"delivery\";i:28;s:6:\"mobile\";i:29;s:7:\"address\";i:30;s:4:\"fare\";i:31;s:7:\"express\";i:32;s:6:\"credit\";i:33;s:8:\"farefree\";i:34;s:10:\"pre_number\";i:35;s:7:\"user_id\";i:36;s:7:\"city_id\";i:37;s:8:\"group_id\";i:38;s:6:\"sub_id\";i:39;s:10:\"partner_id\";i:40;s:8:\"city_ids\";i:41;s:9:\"team_type\";i:44;s:5:\"state\";i:45;s:7:\"condbuy\";i:46;s:14:\"express_relate\";i:47;s:7:\"area_id\";i:48;s:9:\"index_rec\";i:49;s:10:\"free_yuyue\";i:50;s:7:\"weekend\";i:51;s:7:\"holiday\";i:52;s:4:\"wifi\";i:53;s:4:\"park\";i:54;s:5:\"score\";i:55;s:10:\"wap_detail\";i:56;s:10:\"fj_team_id\";i:57;s:8:\"js_price\";i:58;s:6:\"image3\";i:59;s:6:\"image4\";}', '2014-12-16 17:42:56');
INSERT INTO logger_admin VALUES ('126', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-08 13:53:02');
INSERT INTO logger_admin VALUES ('127', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-08 13:53:19');
INSERT INTO logger_admin VALUES ('128', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 12:38:41');
INSERT INTO logger_admin VALUES ('129', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 12:38:50');
INSERT INTO logger_admin VALUES ('130', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 12:39:12');
INSERT INTO logger_admin VALUES ('131', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 12:40:16');
INSERT INTO logger_admin VALUES ('132', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 12:40:36');
INSERT INTO logger_admin VALUES ('133', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 12:43:43');
INSERT INTO logger_admin VALUES ('134', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 12:43:50');
INSERT INTO logger_admin VALUES ('135', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 12:43:59');
INSERT INTO logger_admin VALUES ('136', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 12:56:50');
INSERT INTO logger_admin VALUES ('137', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 13:02:40');
INSERT INTO logger_admin VALUES ('138', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 13:38:12');
INSERT INTO logger_admin VALUES ('139', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 13:38:27');
INSERT INTO logger_admin VALUES ('140', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 13:38:53');
INSERT INTO logger_admin VALUES ('141', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 13:41:10');
INSERT INTO logger_admin VALUES ('142', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 13:42:29');
INSERT INTO logger_admin VALUES ('143', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 13:43:30');
INSERT INTO logger_admin VALUES ('144', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 13:43:42');
INSERT INTO logger_admin VALUES ('145', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 13:44:01');
INSERT INTO logger_admin VALUES ('146', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 13:44:12');
INSERT INTO logger_admin VALUES ('147', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 13:54:57');
INSERT INTO logger_admin VALUES ('148', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 14:08:15');
INSERT INTO logger_admin VALUES ('149', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 14:13:37');
INSERT INTO logger_admin VALUES ('150', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 14:18:04');
INSERT INTO logger_admin VALUES ('151', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 14:20:10');
INSERT INTO logger_admin VALUES ('152', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 14:20:56');
INSERT INTO logger_admin VALUES ('153', '1', 'maoyijieheiguang@163.com', 'system', '编辑支付方式', 'a:0:{}', '2015-01-09 14:28:05');

-- ----------------------------
-- Table structure for `mailer`
-- ----------------------------
DROP TABLE IF EXISTS `mailer`;
CREATE TABLE `mailer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(128) DEFAULT NULL,
  `city_id` int(10) unsigned NOT NULL DEFAULT '0',
  `secret` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_e` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mailer
-- ----------------------------

-- ----------------------------
-- Table structure for `movie`
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(128) DEFAULT NULL,
  `release` int(11) DEFAULT NULL,
  `mtype` text,
  `edition` int(11) DEFAULT NULL,
  `region` int(11) DEFAULT NULL,
  `duration` char(255) DEFAULT NULL,
  `director` char(255) DEFAULT NULL,
  `mainstar` char(255) DEFAULT NULL,
  `plot` text,
  `like` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `score` float(10,2) DEFAULT NULL,
  `shortdes` text,
  `score_integer` int(11) DEFAULT NULL,
  `score_fractional` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO movie VALUES ('6', 'team/2014/1216/14187014271918.jpg', '1417449600', '5', '2', '1', '129分钟', '吴宇森', '金城武，章子怡，宋慧乔，黄晓明，佟大为，长泽雅美，秦海璐，王千源，俞飞鸿，黑木瞳，林保怡，吴飞霞，寇世勋，方青卓，杨...', '<span style=\"color:#666666;font-family:Tahoma, Helvetica, arial, sans-serif;font-size:12px;line-height:20px;\">　　国共一场大战，国民党军全面溃败。众人都想登上太平轮，离开上海去台湾。这艘船成了最后的希望。没想到，意外的沉船改变了所有人的命运，船上近千人绝大多数都在海难中遇难，几位主角能逃过劫难吗？</span>', '0', '2', '太平轮（上）', '6.20', '国共一场大战，国民党军全面溃败。众人都想登上太平轮', '6', '2');
INSERT INTO movie VALUES ('7', 'team/2014/1216/14186989687557.jpg', '1418659200', '4', '1', '1', '119分钟', '张一白', '彭于晏，倪妮，郑恺，魏晨，张子萱', '<span style=\"color:#666666;font-family:Tahoma, Helvetica, arial, sans-serif;font-size:12px;line-height:20px;\">张一白《将爱》之后再拍青春爱情片，根据九夜茴同名小说改编。电影讲述了阳光少年陈寻（彭于晏饰）、痴心女孩方茴（倪妮饰）、纯情备胎赵烨（郑恺饰）、温情暖男乔燃（魏晨饰）、豪放女神林嘉茉（张子萱饰）这群死党跨越十五年的青春、记忆与友情。</span>', '0', '2', '匆匆那年', '8.30', '张一白《将爱》之后再拍青春爱情片', '8', '3');
INSERT INTO movie VALUES ('8', 'team/2014/1216/14187015346738.jpg', '1418832000', '1', '2', '1', '140分钟', '姜文', '葛优，舒淇，周韵，文章，王志文，那英，洪晃，陶虹', '<span style=\"color:#666666;font-family:Tahoma, Helvetica, arial, sans-serif;font-size:12px;line-height:20px;\">北洋年间，东方魔都，花国大选如火如荼，各国佳丽争相斗艳，万众瞩目，全城狂欢，两届总统完颜英（舒淇 饰） 惊险连任，大选操办人马走日（姜文 饰） 因此名满天下。然而一场谋杀颠覆了一切，完颜英命丧黄泉，马走日亡命天涯，并和操办大选的另一搭档、发小项飞田（葛优 饰） 由莫逆之交变为生死宿敌，而将府名媛武六（周韵 饰） 的出现，改变了所有人的命运，魔都双雄展开生死对决，惊天冒险一触即发，生死爱恋一步之遥……</span>', '0', '2', '一步之遥', '10.00', '北洋年间，东方魔都，花国大选如火如荼，各国佳丽争相斗艳', '10', '0');
INSERT INTO movie VALUES ('9', 'team/2014/1217/14187844042507.jpg', '1419609600', '6', '2', '1', 'dsadsadasdas', 'dasdasdasd', 'adasdasdasd', 'asdasdasdas', '0', '1', 'adsadsadas', '5.60', 'dasdasdas', '5', '6');
INSERT INTO movie VALUES ('10', 'team/2014/1217/14187844642706.jpg', '1418832000', '6', '1', '1', 'asdasdsad', 'asdasdasdasd', 'asdasdas', 'dasdasdasdasadasdasd', '0', '1', 'adasdasd', '5.60', 'dasdas', '5', '6');

-- ----------------------------
-- Table structure for `mtype`
-- ----------------------------
DROP TABLE IF EXISTS `mtype`;
CREATE TABLE `mtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mtype
-- ----------------------------
INSERT INTO mtype VALUES ('1', '喜剧');
INSERT INTO mtype VALUES ('2', '科幻');
INSERT INTO mtype VALUES ('3', '战争');
INSERT INTO mtype VALUES ('4', '爱情');
INSERT INTO mtype VALUES ('5', '悬疑');
INSERT INTO mtype VALUES ('6', '动作');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `detail` text,
  `begin_time` int(10) unsigned NOT NULL DEFAULT '0',
  `is_index` enum('Y','N') NOT NULL DEFAULT 'Y',
  `display` enum('Y','N') NOT NULL DEFAULT 'Y',
  `sort_order` int(11) DEFAULT NULL,
  `image` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO news VALUES ('1', '大神双12剑指小米是否陷入小米陷阱', '<blockquote style=\"margin:20px 0px;padding:15px 20px;border:1px dashed #eaeaea;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;color:#333333;background:#fbfbfb;\"><span style=\"margin:0px;padding:0px;border:0px;font-family:inherit;font-size:inherit;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;vertical-align:baseline;color:#999999;\">摘要 :&nbsp;</span>继黑色星期五带动了新一轮的电商购物风潮之后，双十二成为双十一之后电商巨头们新的布局点，一场在12月12日举行的电商购物节，又已经开启其特有的造势模式，关于双12的讯息已经扑面而来。</blockquote>\r\n<div class=\"article-detail\" style=\"margin:0px;padding:0px;border:0px;font-family:Simsun;font-size:medium;font-stretch:inherit;line-height:24px;vertical-align:baseline;letter-spacing:0.5px;\"><p class=\"image\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:inherit;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;vertical-align:baseline;text-align:center;\"><img src=\"http://b.hiphotos.baidu.com/news/crop%3D10%2C29%2C401%2C241%3Bw%3D638/sign=3036204ab23533fae1f9c96e95e2cd33/cc11728b4710b912e1125fbac0fdfc03934522a6.jpg\" data-score=\"0.0000022033507095514987\" style=\"margin:0px;padding:0px;border:0px;font-family:inherit;font-size:inherit;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;vertical-align:baseline;\" /></p>\r\n<div class=\"l-main-inner-ad\" style=\"margin:0px;padding:0px 0px 20px 20px;border:0px;font-family:inherit;font-size:inherit;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;vertical-align:baseline;float:right;\"></div>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\">继黑色星期五带动了新一轮的电商购物风潮之后，双十二成为双十一之后电商巨头们新的布局点，一场在12月12日举行的电商购物节，又已经开启其特有的造势模式，关于双12的讯息已经扑面而来。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\">据驱动之家12月1日报道，大神双12促销主题页面曝光。该页面显示，大神双12将与淘宝进行深度战略合作，以最强的促销手段迎战双12年度促销活动。大神要放核武器！击败小米，成为双12销量榜第一。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\"><strong>从大神双12的销售任务来说，刚刚正式发布logo不久的大神要完成任务可谓是压力山大。</strong><strong>而小米作为此前在双十一中取得销量榜第一的品牌，其在前几年的发展中，在中低端智能手机消费领域建立了一定的品牌认知和销售优</strong>势。虽然在中华酷联们清醒之后，深谙中低端智能手机生产与销售经验的中华酷联各成员，已经迅速组成反击方阵对小米形成合围之势，大神自8月多独立之后就在中低端市场和华为荣耀一同为围剿小米建立了汗马功劳。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\">但由于小米在中华酷联的围剿之下之后，其依旧还能够在中低端手机领域占据一定的市场地位，不得不引起中华酷联们的继续重视。此次大神刚刚发布双12任务，剑指小米之后，就有评论人士认为大神或者中华酷联的产品和小米拼销量，就正好陷入了小米所设的圈套。在我们起先并不考虑大神在双12中是否有能力在销量上超过小米的情况下，销量这个传统手机厂商信奉了多年的发展要素，究竟是不是小米所设下的圈套呢？</p>\r\n<h2 style=\"margin:25px 0px 20px;padding:0px;border:0px;font-family:微软雅黑;font-size:16px;font-style:inherit;font-variant:inherit;font-stretch:inherit;line-height:inherit;vertical-align:baseline;color:#993300;text-indent:28px;\">销量恐慌：小米的空城计</h2>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\">12月1日，著名评论作者丁鹏发布了一篇名为《大神独立&nbsp;拼销量会陷入小米陷阱》的文章备受热议。该文认为：在小米出现之后，小米从2000元手机市场开始突破，一度冲入千元机市场，肆无忌惮地攻击着国产手机的地盘，小米的真正攻击性来自于它独特的思维模式。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\">正是因为小米在与中华酷联竞争中给中华酷联最大的竞争压力，源自于小米自身独特的思维模式和不一样的新兴盈利模式，让销量似乎并不是中华酷联赶走小米的方式。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\">但如果中华酷联不继续在销量上追赶小米，甚至超越小米，他们又怎么在新的竞争领域与小米竞争呢？在笔者看来，如果说销量是小米对中华酷联设下的一个陷阱的话，那么销量便是小米设下的一个空城计，狐假虎威，小米借此可在时间上拉远小米与中华酷联之间的距离，让中华酷联更没有机会追赶小米。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\"><strong>在IDC刚刚公布的今年Q3手机销售量排行榜中，小米以1730万的销量排行第三，而排在第一和第二的为三星及苹果。小米在销量上处于国内智能手机品牌前列，似乎早已板上钉钉。</strong></p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\">但就在小米无比火热，智能手机创新乏力，整个智能手机市场增速放缓的情况下，中华酷联紧紧追赶让小米也是备感压力。在刚刚过去的双11，大神宣布全网总销售额为5.6亿元，其中大神F2京东单品销量排名第一。而华为则以10.6亿元的售价，紧随小米之后。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\">当华为、中兴、努比亚、华为荣耀、大神、一加等传统厂商或独立新品牌对小米紧紧相逼，小米事实上在市场布局上也会受到这些传统厂商的各种压力，难以保持之前的高速发展速度进一步突破。在这样的情况下，小米的盈利模式的确和传统厂商以前靠卖硬件赚钱，而非增值付费盈利，显得更加前沿，更有发展的空间。那么传统厂商还未能成功围剿灭杀掉小米的原因，是不是就是因为传统厂商们的盈利模式没有变革呢？不尽然。销量是变革的基础，如果大神和中华酷联的其他成员不能够在销量上围剿小米，纵然现在将自身的手机业务盈利模式，运营思维转变，也是难以真正对小米的发展产生很大的阻碍作用。因此当人们已经产生一种销量恐慌，认为中华酷联要围剿小米不能靠销量，再靠销量发展就是死路一条的情况下，实际上这可能是属于小米的空城计，让小米拥有更多的时间发展壮大。</p>\r\n<h2 style=\"margin:25px 0px 20px;padding:0px;border:0px;font-family:微软雅黑;font-size:16px;font-style:inherit;font-variant:inherit;font-stretch:inherit;line-height:inherit;vertical-align:baseline;color:#993300;text-indent:28px;\">大神双12剑指小米&nbsp;销量是中华酷联必须占据的优势</h2>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\">在双12的活动中，大神发布了消息称：此次将与电商平台大亨淘宝进行深度战略合作，此前也有传言称大神与京东会在双12时推年度机型。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\">如果说12月8日大神将要发布的核武器就是大神的年度机型，那么这一年度机型在京东的助力下，实际上也能让大神在双十二中拥有京东和淘宝两大电商平台的支持，夺取销量第一的宝座也更有把握。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\"><strong>虽然有言论认为小米对中华酷联冲击最大的地方，并非在销量上，但互联网是一个讲究规模效应的世界。</strong>销量的规模，能够直接影响到手机厂商的用户数量，用户数量也能够直接决定手机厂商发力增值业务的价值有多大。增值业务在业务上的突破并不是最难的地方。对于中华酷联而言，他们面向小米所迎接的挑战的确是源自于思维模式上。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\">中华酷联开启独立子公司做手机之后，实际上就已经在思维上有所转变。大神发布新logo也可以看出中华酷联转变思维的决心，华为荣耀也涉足智能硬件，实际上也表示中华酷联正在筹备一场二次创业，这都是我们可以感受得到的了。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\"><strong>变革与改变，是一个循环渐进的过程，并不是一朝一夕的事情。而销量，一个手机厂商无论日后会否会在二次创业中成为一家智能硬件厂商，其自身的变革和改变，如果没有庞大的产品销量做支撑，手机厂商自身的变革和改变都难以引得他人注视。</strong>中华酷联代表了我国国产手机品牌，要继续保持外界对他们的关注，销量是他们依旧需要保持的优势。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\">此次在双12的活动中，大神直指小米，希望要借助其双12活动期间的新品和既有的产品，在销量上超过小米。虽然大神真正独立的时间不足半年，但双11中大神的销量的确还不错，借助新品的力量和京东、淘宝的渠道优势，大神要在销量上超过小米也具备了一定的可能性。如若大神能在双12的销量上超过小米，那么销量是中华酷联在围剿小米的过程中必须占据的优势，也更有信服力了。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:inherit;font-size:14px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;vertical-align:baseline;text-indent:28px;\">作者：小谦，微博@小莫谦，微信联系net1996。</p>\r\n</div>', '1417622400', 'Y', 'Y', '1', 'news/2014/1207/14179610061308.jpg');
INSERT INTO news VALUES ('2', '告别罗永浩，锤子手机未来可期', '<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">罗永浩已经完成了自己的使命，适时隐退、从台前走到幕后，对他本人和锤子手机来说都是一件万分幸运的事情。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">昨日那场演讲被他称为“为了告别的聚会”。告别了高度理想主义，告别了英雄般的个人情怀，老罗想让自己从此以后转变成一位合格的企业家、一个优秀的CEO。这意味着锤子手机依靠老罗双肩负重、杀进手机行业的时代已经结束了。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">根据老罗公布的数据，在过去半年多的时间里，锤子手机创造了约12万的销量。跟每年动辄几千万销量的“中华米酷联”等厂商相比，这个数字微不足道，甚至不足魅族手机年销量的十分之一。但对一个从无到有的新品牌来说，这样的成绩已经难能可贵了。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">在过去半年，老罗个人的声誉为锤子手机带来了空前的关注度。当然，在初期产品质量存在瑕疵的背景下，外界的高期望也为锤子挖了一个大坑。老罗掉了下去，又爬了上来。经过供应链和舆论的种种风波、磨难之后，如今锤子手机的发展渐渐步入正轨。锤子真正要和友商比拼的焦点也将回归到产品上。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">从0分走到60分，锤子离不开一呼百应的“英雄”老罗；但从60分到90分，锤子更需要的是一个日臻成熟的产品体系，一支具有战斗力的团队，一套规范的制度和流程，以及包容创新的企业文化。老罗时代的结束将为这些变化腾出空间，所谓的“天生骄傲”之路，或许会由此正式启程，锤子和老罗个人的辉煌也将随着老罗的“隐身”而不再遥远。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">当然，在智能手机市场逐渐饱和、生存竞争日趋激烈的背景下，锤子的天花板究竟有多高，能否由小众产品进击到大众市场，还有太多的不确定性。但大局不再需要老罗独自掌舵。或许，对他来说，退隐幕后、拿起木锤雕琢产品才是最合适的角色。</p>\r\n<h2 style=\"margin:25px 0px 20px;padding:0px;border:0px;font-family:微软雅黑;font-size:16px;font-stretch:inherit;line-height:24px;vertical-align:baseline;color:#993300;text-indent:28px;letter-spacing:0.5px;\">“老愤青”隐退</h2>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">时间回到5月20日，锤子手机发布会。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">老罗讲得异常投入，观众听得十分激动。在发布会结束后，媒体报道铺天盖地而来，与2013年3月那次失败的ROM发布会相比，显然这次老罗赢得了赞许。从来没有一个企业家，可以凭一张嘴就达到其他厂商投入几百万也未必能够做到的宣传效果。发布会结束后，老罗扬眉吐气，接受了一圈媒体的采访。形势仿佛大好，大家都觉得老罗做手机——成了！</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">但在锤子会议室见到因为劳累过度而双眼发红的老罗时，笔者心中的疑虑并未得到解释。这位面相和蔼但出言不逊的公众人物，并不喜欢过多谈论产品和行业，以及锤子手机可能面临的问题。他唯一的乐趣似乎集中在喋喋不休的吐糟上。就像那张流传甚广的海报上所画的胖子一样，老罗眼前的世界杂乱无章，随时在等待他挥起大锤砸个七零八落。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">“我送你个东西，你来崇拜我，这TMD能叫粉丝吗？你牛逼人家才崇拜你！”在谈到某个友商时，老罗的表情十分不屑，他表示羞于使用“粉丝”二字称呼自己的支持者。在空旷的会议室里，老罗甚至旁若无人地大声模仿某厂商发布会现场粉丝们的欢呼声和尖叫声，音调里充满了愤懑和讽刺。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">老罗自称老愤青，他表示自己和投资人的关系无比糟糕，“聪明的傻子我都搞不定”，庆幸的是有朋友帮忙。当时他和线下渠道也没有业务合作：“你现在找他，人家不理你。如果机器好卖，他们自然会来找你。”运营商也不在老罗眼里，“他们的Logo土的要死”，“锤子手机不接受运营商的开机Logo，运营商要做就做，不做就算了。苹果手机启动的时候就没有运营商的Logo，因为人家产品足够好，我们即使做不到，也要有点骨气”。当然，老罗也吐槽了部分媒体的行为，就像昨天的演讲中提到的一样。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">当时，老罗还说过一个数字——50万台，这是锤子手机第一台产品的销售目标。现在看来，想象和现实的落差十分巨大。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">在此之后，所有的故事大家都能看到，因为质量、产能、价格等问题，锤子和老罗遭受到的质疑不断。直到昨天，他又一次站上了讲台。</p>\r\n<h2 style=\"margin:25px 0px 20px;padding:0px;border:0px;font-family:微软雅黑;font-size:16px;font-stretch:inherit;line-height:24px;vertical-align:baseline;color:#993300;text-indent:28px;letter-spacing:0.5px;\">锤子未来可期</h2>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">老罗昨天的演讲其实并无多少亮点可言。跟半年前相比，他不再像个老愤青一样喋喋不休的指责同行。虽然在讲到“过去半年锤子做错了什么”的时候，老罗从供应链和媒体两个角度做了一番揶揄，但听起来更像是对锤子所遇到问题的另一种开脱。而且，总体基调偏于自嘲，老罗并不害怕把自己的短处摆在聚光灯下任人欣赏。事实上，他乐在其中，而观众也因为这种坦率而钦佩他。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">老罗花费大量口舌、利用多媒体不停地渲染锤子手机所受到的欢迎程度。他简单介绍了第二代产品避免重蹈覆辙的计划，并且宣布白色版T1已正式上线。但与这些七零八落的信息相比，最让人印象深刻的是老罗对“天生骄傲”品牌理念的阐释。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">“这些人不是我的粉丝，他们是某种信念、某种价值观、某种理想、某种人生态度的粉丝，他们来到现场，是知道从我身上能看到这种东西。”老罗没有详细说明自己究竟代表了什么样的信念和价值观，但他用父亲、足球运动员、司机等普通人的小故事来阐述一种“人的精神应该独立”的观点。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">可以说，过去依靠自己的个人魅力，老罗吸引了一大批有文化、渴望自由、不愿意向现实屈服的支持者。这些支持者中的很多人在老罗的感召下，已经成为了锤子手机的用户。而未来，老罗希望将他个人所传递的品牌理念延续到锤子手机之上。众所周知，时下众多消费品品牌仍然停留在传播物质崇拜、生活品质追求等理念的阶段，而锤子则要传播精神上的自由和独立，可以说非常巧妙地契合了这个时代的年轻思潮。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">在听完老罗对“天生骄傲”的煽情讲解之后，笔者的不少朋友都对锤子手机有了新的认知。过去，很多人是因为钦佩老罗才买锤子。但老罗的粉丝必定有限，如果把老罗所代表的理念具化到锤子手机上，则可以得到很好的延续和张力。如果说锤子未来能大获成功，“天生骄傲”功不可没。当然，这是老罗的遗产。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">成为企业家之后，老罗一定不会再把时间和精力花费在铁锤上。对他和锤子手机来说，已经过了需要标新立异、四处出击来扩大品牌影响力的造势阶段。锤子需要一个未来，这个未来更多与行业有关、与产品有关，而与老罗的关联将会越来越少。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">从去年开始，智能手机行业已经趋于饱和，竞争日益激烈，很多厂商在被动竞争中走上了比拼性价比的苦逼之路。但值得一提的是，虽然经过了一次降价清仓，但锤子还是希望把产品定位在2500元左右，一来因为这是一个竞争者稀少的档位，锤子不用四面楚歌；二来，这一定价可以很好地保证产品的利润，有利于良性发展。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">从产品层面讲，锤子手机的优势在于硬件做工上的精致追求和软件上极简、重视体验的理念。这一特点也使其成功与其他安卓手机划清了界限。一位用户把锤子评价为安卓和iPhone的完美结合，比较中肯。随着锤子手机不断更新迭代，这些优势会得到进一步的巩固。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">智能手机的人口红利已过，很多人第一次尝试智能手机时会选择性价比的产品，但在更换第二部手机时则会追求品牌与品质。今后，手机厂商要想扩展销量，更多要靠从同行那里抢用户，如果继续完善，锤子手机的前景值得想象。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">当然，现在看来，锤子手机仍然还是一款小众产品。但罗永浩的野心不会这么小，未来不排除会推出千元以下、1500左右档位的机型。不过，要想在一个极度成熟的市场里搅动浑水，锤子创新之路还有很长。</p>\r\n<p class=\"text\" style=\"margin-top:25px;margin-bottom:25px;padding:0px;border:0px;font-family:Simsun;font-stretch:inherit;line-height:24px;vertical-align:baseline;text-indent:28px;letter-spacing:0.5px;\">不管怎样，罗永浩已经让位，以后该让锤子手机自己说话了。</p>', '1417881600', 'Y', 'Y', '1', 'news/2014/1207/14179662995855.jpg');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pay_id` varchar(32) DEFAULT NULL,
  `buy_id` int(11) NOT NULL DEFAULT '0',
  `service` varchar(16) NOT NULL DEFAULT 'alipay',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0',
  `card_id` varchar(16) DEFAULT NULL,
  `state` enum('unpay','pay') NOT NULL DEFAULT 'unpay',
  `trade_no` varchar(32) DEFAULT NULL,
  `allowrefund` enum('Y','N') NOT NULL DEFAULT 'N',
  `rstate` enum('normal','askrefund','berefund','norefund') NOT NULL DEFAULT 'normal',
  `rereason` text,
  `retime` int(11) DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `realname` varchar(32) DEFAULT NULL,
  `mobile` varchar(128) DEFAULT NULL,
  `zipcode` char(6) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `express` enum('Y','N') NOT NULL DEFAULT 'Y',
  `express_xx` varchar(128) DEFAULT NULL,
  `express_id` int(10) unsigned NOT NULL DEFAULT '0',
  `express_no` varchar(32) DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT '0.00',
  `money` double(10,2) NOT NULL DEFAULT '0.00',
  `origin` double(10,2) NOT NULL DEFAULT '0.00',
  `credit` double(10,2) NOT NULL DEFAULT '0.00',
  `card` double(10,2) NOT NULL DEFAULT '0.00',
  `fare` double(10,2) NOT NULL DEFAULT '0.00',
  `condbuy` varchar(128) DEFAULT NULL,
  `remark` text,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_content` text,
  `comment_display` enum('Y','N') NOT NULL DEFAULT 'Y',
  `comment_grade` enum('good','none','bad') NOT NULL DEFAULT 'good',
  `comment_wantmore` enum('Y','N') DEFAULT NULL,
  `comment_time` int(11) DEFAULT NULL,
  `partner_id` int(11) NOT NULL DEFAULT '0',
  `sms_express` enum('Y','N') NOT NULL DEFAULT 'N',
  `luky_id` int(11) NOT NULL DEFAULT '0',
  `adminremark` text,
  `is_bill` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_p` (`pay_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO order VALUES ('11', 'go-11-1-qtnq', '1', 'credit', '4', '0', '8', '2306', null, 'pay', null, 'Y', 'normal', null, null, '1', null, '17799332222', null, null, 'N', null, '0', null, '59.00', '0.00', '59.00', '59.00', '0.00', '0.00', null, '', '1417838866', '1417838872', null, 'Y', 'good', null, null, '4', 'N', '159281', null, '1');
INSERT INTO order VALUES ('12', 'go-12-1-uuly', '1', 'credit', '4', '0', '4', '2306', null, 'pay', null, 'Y', 'normal', null, null, '1', null, '17799332222', null, null, 'N', null, '0', null, '11.00', '0.00', '11.00', '11.00', '0.00', '0.00', null, '', '1417838914', '1417838919', null, 'Y', 'good', null, null, '1', 'N', '167112', null, '0');
INSERT INTO order VALUES ('13', 'go-13-1-yiut', '2', 'credit', '4', '0', '8', '2306', null, 'pay', null, 'Y', 'normal', null, null, '1', null, '17799332222', null, null, 'N', null, '0', null, '59.00', '0.00', '59.00', '59.00', '0.00', '0.00', null, '', '1417854469', '1417854474', null, 'Y', 'good', null, null, '4', 'N', '177714', null, '1');
INSERT INTO order VALUES ('14', 'go-14-5-fzaa', '3', 'credit', '4', '0', '8', '2306', null, 'pay', null, 'Y', 'normal', null, null, '5', null, '17799332222', null, null, 'N', null, '0', null, '59.00', '0.00', '295.00', '295.00', '0.00', '0.00', null, '', '1417854630', '1417854634', null, 'Y', 'good', null, null, '4', 'N', '114860', null, '1');
INSERT INTO order VALUES ('25', 'go-25-1-tcka', '0', 'credit', '1', '0', '8', '2306', null, 'unpay', null, 'Y', 'normal', null, null, '1', null, '18688164055', null, null, 'N', null, '0', null, '59.00', '0.00', '59.00', '0.00', '0.00', '0.00', null, '', '1420773960', '0', null, 'Y', 'good', null, null, '4', 'N', '0', null, '0');
INSERT INTO order VALUES ('26', 'go-26-1-mfzs', '0', 'credit', '1', '0', '7', '2306', null, 'unpay', null, 'N', 'normal', null, null, '1', null, '18688164055', null, null, 'N', null, '0', null, '1.00', '0.00', '1.00', '0.00', '0.00', '0.00', null, '', '1420774083', '0', null, 'Y', 'good', null, null, '1', 'N', '0', null, '0');
INSERT INTO order VALUES ('27', 'go-27-1-bult', '2', 'credit', '1', '0', '4', '2306', null, 'pay', null, 'Y', 'normal', null, null, '1', null, '18688164055', null, null, 'N', null, '0', null, '1.00', '0.00', '1.00', '1.00', '0.00', '0.00', null, '', '1420774175', '1420785678', null, 'Y', 'good', null, null, '1', 'N', '149137', null, '0');
INSERT INTO order VALUES ('28', 'go-28-1-svne', '0', 'credit', '1', '0', '2', '2306', null, 'unpay', null, 'Y', 'normal', null, null, '1', null, '18688164055', null, null, 'N', null, '0', null, '70.00', '0.00', '70.00', '0.00', '0.00', '0.00', null, '', '1420774242', '0', null, 'Y', 'good', null, null, '1', 'N', '0', null, '0');

-- ----------------------------
-- Table structure for `page`
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` varchar(16) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page
-- ----------------------------

-- ----------------------------
-- Table structure for `partner`
-- ----------------------------
DROP TABLE IF EXISTS `partner`;
CREATE TABLE `partner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `homepage` varchar(128) DEFAULT NULL,
  `city_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bank_name` varchar(128) DEFAULT NULL,
  `bank_no` varchar(128) DEFAULT NULL,
  `bank_user` varchar(128) DEFAULT NULL,
  `location` text NOT NULL,
  `contact` varchar(32) DEFAULT NULL,
  `image` varchar(128) DEFAULT NULL,
  `image1` varchar(128) DEFAULT NULL,
  `image2` varchar(128) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `other` text,
  `mobile` varchar(12) DEFAULT NULL,
  `open` enum('Y','N') NOT NULL DEFAULT 'N',
  `enable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `head` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `longlat` varchar(255) DEFAULT NULL,
  `display` enum('Y','N') NOT NULL DEFAULT 'Y',
  `comment_good` int(11) DEFAULT '0',
  `comment_none` int(11) NOT NULL DEFAULT '0',
  `comment_bad` int(11) NOT NULL DEFAULT '0',
  `yy_time` varchar(50) DEFAULT NULL,
  `server` text,
  `area_id` int(11) DEFAULT NULL,
  `city_ids` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_ct` (`city_id`,`title`),
  UNIQUE KEY `UNQ_u` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partner
-- ----------------------------
INSERT INTO partner VALUES ('1', 'bkltech', 'e7fe8b88db51d86ef2f5e169144b9c1b', '兰博基尼4s', '2535', 'http://www.bkltech.com.cn', '2306', '重庆南坪支行', '2909219902121', '重庆南坪商铺', '重庆市南岸区上海城嘉德中心A座13楼', 'JACK', 'team/2014/1202/14175113127139.jpg', 'team/2014/1202/14175113135309.jpg', 'team/2014/1202/14175113131443.jpg', '18688164055', '重庆市南岸区南坪西路家的中心A座', '重庆市南岸区上海城嘉德中心A座13楼', '18688164055', 'Y', 'Y', '0', '1', '1417511312', '39.918099,116.403425', 'Y', '0', '0', '0', '', '', '2498', '@2306@');
INSERT INTO partner VALUES ('2', 'smgjyc', 'e7fe8b88db51d86ef2f5e169144b9c1b', '世茂国际影城', '2534', '', '2306', 'test', '2212', 'test', '<span style=\"color:#666666;font-family:Tahoma, Helvetica, arial, sans-serif;font-size:12px;line-height:18px;\">五华区正义路西侧昆明老街正义坊北馆4层5层</span>', '世茂国际影城', 'team/2014/1204/14176982446631.jpg', 'team/2014/1204/14176982449830.jpg', 'team/2014/1204/14176982444059.jpg', '0871-68072651-801', '五华区正义路西侧昆明老街正义坊北馆4层5层', '<span style=\"color:#666666;font-family:Tahoma, Helvetica, arial, sans-serif;font-size:12px;line-height:18px;\">世茂国际影城紧随世茂股份的商业发展规划，到2014年影院开至60家，拥有500块银幕，票房达15亿。作为世茂股份的全资子公司，世茂影院投资发展有限公司依托世茂股份优质的商业地产平台，依靠优秀的管理经营团队，计划在未来五年中，配套世茂广场及百货的发展，构建世茂全新概念创意影院，并迅速使之规模化经营，建立完善的数字化影院连锁经营体系，实现统一品牌、统一运营、统一发行、统一管理、统一营销的现代化连锁影院运营模式。</span>', '0871-680726', 'Y', 'Y', '0', '1', '1417698244', '39.691722,116.310576', 'Y', '0', '0', '0', '', '', '2500', '@2306@');
INSERT INTO partner VALUES ('4', 'kmshanghu', 'e7fe8b88db51d86ef2f5e169144b9c1b', '千奈美女人心', '2536', 'http://www.bkltech.com.cn', '2306', '昆明农业银行五华区支行', '2991991900992', '千奈美', '千奈美是一个源于梦想的女性调整型内衣品牌，她继承了欧洲内衣享誉国际的两大特色，在拥有修身美体和细心呵护的同时，将特有的自由无束的生活艺术气质渗入内衣主张。', '倩女', 'team/2014/1205/14177601524401.jpg', 'team/2014/1205/14177601527153.jpg', 'team/2014/1205/14177601526082.jpg', '18688164055', '昆明五华区环城南路', '千奈美是一个源于梦想的女性调整型内衣品牌，她继承了欧洲内衣享誉国际的两大特色，在拥有修身美体和细心呵护的同时，将特有的自由无束的生活艺术气质渗入内衣主张。', '18688164055', 'Y', 'Y', '0', '1', '1417760152', '29.317044,106.613763', 'Y', '0', '0', '0', '9：00~24：00', '千奈美是一个源于梦想的女性调整型内衣品牌，她继承了欧洲内衣享誉国际的两大特色，在拥有修身美体和细心呵护的同时，将特有的自由无束的生活艺术气质渗入内衣主张。', '2501', '@2306@');

-- ----------------------------
-- Table structure for `partner_bill`
-- ----------------------------
DROP TABLE IF EXISTS `partner_bill`;
CREATE TABLE `partner_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_sn` varchar(255) NOT NULL,
  `add_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `bill_status` int(11) DEFAULT NULL,
  `bank_sn` varchar(128) DEFAULT NULL,
  `bank_name` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `mnote` text,
  `partner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partner_bill
-- ----------------------------
INSERT INTO partner_bill VALUES ('2', '1412071245', '1417927508', '1417939057', '354.00', '1', '2991991900992', '昆明农业银行五华区支行', '千奈美', 'bbbbbb', '4');
INSERT INTO partner_bill VALUES ('3', '1412071246', '1417927579', '1418112525', '59.00', '1', '2991991900992', '昆明农业银行五华区支行', '千奈美', 'aaaaaa', '4');

-- ----------------------------
-- Table structure for `pay`
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `vid` varchar(32) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bank` varchar(32) DEFAULT NULL,
  `money` double(10,2) DEFAULT NULL,
  `currency` enum('CNY','USD') NOT NULL DEFAULT 'CNY',
  `service` varchar(16) NOT NULL DEFAULT 'alipay',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_o` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay
-- ----------------------------

-- ----------------------------
-- Table structure for `paycard`
-- ----------------------------
DROP TABLE IF EXISTS `paycard`;
CREATE TABLE `paycard` (
  `id` varchar(16) NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `consume` enum('Y','N') NOT NULL DEFAULT 'N',
  `recharge_time` int(10) unsigned NOT NULL DEFAULT '0',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paycard
-- ----------------------------

-- ----------------------------
-- Table structure for `referer`
-- ----------------------------
DROP TABLE IF EXISTS `referer`;
CREATE TABLE `referer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '??id',
  `referer` varchar(400) COLLATE utf8_unicode_ci NOT NULL COMMENT '??',
  `create_time` int(10) unsigned NOT NULL COMMENT '????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_o` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='??';

-- ----------------------------
-- Records of referer
-- ----------------------------
INSERT INTO referer VALUES ('1', '1', '2', '客户端-android', '1417684133');
INSERT INTO referer VALUES ('2', '2', '2', '客户端-iOS', '1417686850');
INSERT INTO referer VALUES ('3', '3', '3', 'http://localhost/', '1417706166');
INSERT INTO referer VALUES ('4', '4', '1', 'http://localhost/', '1417706555');
INSERT INTO referer VALUES ('5', '5', '3', 'http://localhost/', '1417706611');
INSERT INTO referer VALUES ('6', '6', '3', 'http://localhost/', '1417744789');
INSERT INTO referer VALUES ('7', '7', '3', 'http://localhost/', '1417745306');
INSERT INTO referer VALUES ('8', '8', '1', 'http://localhost/', '1417746227');
INSERT INTO referer VALUES ('9', '9', '4', 'http://localhost/', '1417763099');
INSERT INTO referer VALUES ('10', '10', '4', 'http://localhost/', '1417771393');
INSERT INTO referer VALUES ('11', '11', '4', 'http://localhost/', '1417838866');
INSERT INTO referer VALUES ('12', '12', '4', 'http://localhost/', '1417838914');
INSERT INTO referer VALUES ('13', '13', '4', 'http://localhost/', '1417854469');
INSERT INTO referer VALUES ('14', '14', '4', 'http://localhost/', '1417854630');
INSERT INTO referer VALUES ('15', '15', '1', 'http://localhost/partner/', '1417950368');
INSERT INTO referer VALUES ('16', '16', '6', 'http://192.168.0.169/wap/', '1418116965');
INSERT INTO referer VALUES ('17', '17', '1', 'http://localhost/', '1420695551');
INSERT INTO referer VALUES ('18', '18', '1', 'http://localhost/', '1420695638');
INSERT INTO referer VALUES ('19', '19', '1', 'http://localhost/', '1420699737');
INSERT INTO referer VALUES ('20', '20', '1', 'http://localhost/', '1420701823');
INSERT INTO referer VALUES ('21', '21', '1', 'http://localhost/', '1420702141');
INSERT INTO referer VALUES ('22', '22', '1', 'http://localhost/', '1420703282');
INSERT INTO referer VALUES ('23', '23', '1', 'http://localhost/', '1420705806');
INSERT INTO referer VALUES ('24', '24', '1', 'http://localhost/order/xinsheng.php?id=23', '1420773916');
INSERT INTO referer VALUES ('25', '25', '1', 'http://localhost/order/xinsheng.php?id=23', '1420773960');
INSERT INTO referer VALUES ('26', '26', '1', 'http://localhost/order/xinsheng.php?id=23', '1420774083');
INSERT INTO referer VALUES ('27', '27', '1', 'http://localhost/order/xinsheng.php?id=23', '1420774175');
INSERT INTO referer VALUES ('28', '28', '1', 'http://localhost/order/xinsheng.php?id=23', '1420774242');

-- ----------------------------
-- Table structure for `smssubscribe`
-- ----------------------------
DROP TABLE IF EXISTS `smssubscribe`;
CREATE TABLE `smssubscribe` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(18) DEFAULT NULL,
  `city_id` int(10) unsigned NOT NULL DEFAULT '0',
  `secret` char(6) DEFAULT NULL,
  `enable` enum('Y','N') NOT NULL DEFAULT 'N',
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_e` (`mobile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of smssubscribe
-- ----------------------------

-- ----------------------------
-- Table structure for `subscribe`
-- ----------------------------
DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE `subscribe` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(128) DEFAULT NULL,
  `city_id` int(10) unsigned NOT NULL DEFAULT '0',
  `secret` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_e` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subscribe
-- ----------------------------
INSERT INTO subscribe VALUES ('1', 'fantianmi@gmail.com', '0', '77c9cf25af1d554a56b7e64a6d0283f4');

-- ----------------------------
-- Table structure for `system`
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `id` enum('2','1') NOT NULL DEFAULT '1',
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system
-- ----------------------------
INSERT INTO system VALUES ('1', 'eyJkYiI6eyJob3N0IjoibG9jYWxob3N0IiwidXNlciI6InJvb3QiLCJwYXNzIjoiIiwibmFtZSI6Inlhbmd5dXR1YW4ifSwibWVtY2FjaGUiOm51bGwsIndlYnJvb3QiOiIiLCJzeXN0ZW0iOnsid3d3cHJlZml4IjoiaHR0cDpcL1wvbG9jYWxob3N0IiwiaW1ncHJlZml4IjoiaHR0cDpcL1wvbG9jYWxob3N0IiwiY3NzcHJlZml4IjoiaHR0cDpcL1wvbG9jYWxob3N0Iiwic2l0ZW5hbWUiOiJcdTZkMGJcdTgyOGJcdTU2ZTIiLCJzaXRldGl0bGUiOiJcdTZkMGJcdTgyOGJcdTU2ZTJcdWZmMGNcdTU2ZTJcdTVjMzFcdTViZjlcdTRlODYiLCJhYmJyZXZpYXRpb24iOiJcdTZkMGJcdTgyOGJcdTU2ZTIiLCJjb3Vwb25uYW1lIjoiXHU0ZjE4XHU2MGUwXHU1MjM4IiwiY3VycmVuY3kiOiJcdTAwYTUiLCJjdXJyZW5jeW5hbWUiOiJDTlkiLCJ0aW1lem9uZSI6IkV0Y1wvR01ULTgiLCJlZGl0b3IiOiJraW5kIiwiaW5kZXh0ZWFtIjoiMCIsInNpZGV0ZWFtIjoiMCIsImRlc2NyaXB0aW9uIjoiIiwia2V5d29yZHMiOiIiLCJpbnZpdGVjcmVkaXQiOiIwIiwiY29uZHVzZXIiOjAsInBhcnRuZXJkb3duIjowLCJnemlwIjowLCJrZWZ1cXEiOiIiLCJrZWZ1bXNuIjoiIiwibW9iaWxldXJsIjoiIiwiaWNwIjoiIiwic3RhdGNvZGUiOiIiLCJzaW5haml3YWkiOiIiLCJ0ZW5jZW50aml3YWkiOiIiLCJrZWZ1X2hvdGxpbmUiOiIwMjAtMTIzNDU2Iiwic2VydmVyX3RpbWUiOiI5OjAwLTE4OjAwIiwidG91c3VfZW1haWwiOiI0NTQ1NTY1QGJuLmNvbSIsImdpdmVjcmVkaXQiOiIxMCJ9LCJidWxsZXRpbiI6eyIwIjoiXHU2ZDBiXHU4MjhiXHU1NmUyXHVmZjBjXHU1NmUyXHU1YzMxXHU1YmY5XHU0ZTg2IiwiMjQ5NyI6IiIsIjI0OTYiOiIiLCIyNDk1IjoiIiwiMjQ5NCI6IiIsIjI0OTMiOiIiLCIyNDkyIjoiIiwiMjQ5MSI6IiIsIjI0OTAiOiIiLCIyNDg5IjoiIiwiMjQ4OCI6IiIsIjI0ODciOiIiLCIyNDg2IjoiIiwiMjQ4NSI6IiIsIjI0ODQiOiIiLCIyNDgzIjoiIiwiMjMwNiI6IiJ9LCJhbGlwYXkiOnsiZ3VhcmFudGVlIjoiWSIsIm1pZCI6IjIwODgwMTI1NTExNzg3NzQiLCJzZWMiOiJ3YmdoM3lqNXp1Mmw2cHlta3ZocDBseHVyYWNvazc2MiIsImFjYyI6Indhbmd5b3Vhb0BxcS5jb20iLCJpdGJwYXkiOiIiLCJndWFyYW50ZWVzdWNjZXNzIjoiTiIsImFsaWZhc3QiOiJOIiwiYWxpYWRkcmVzcyI6Ik4ifSwidGVucGF5Ijp7Im1pZCI6IiIsInNlYyI6IiIsImd1YXJhbnRlZSI6IlkiLCJkaXJlY3QiOiJZIn0sInNkb3BheSI6eyJtaWQiOiIiLCJzZWMiOiIiLCJkaXJlY3QiOiJZIn0sImJpbGwiOnsibWlkIjoiIiwic2VjIjoiIn0sImNoaW5hYmFuayI6eyJtaWQiOiIiLCJzZWMiOiIifSwicGF5cGFsIjp7Im1pZCI6IiIsImxvYyI6IiJ9LCJ5ZWVwYXkiOnsibWlkIjoiIiwic2VjIjoiIiwiZGlyZWN0IjoiWSJ9LCJjbXBheSI6eyJtaWQiOiI1NDU1NDUxMjEyMTIiLCJzZWMiOiJhc2Rhc2Zhc2Rhc2FzZmFzZndlZjY2YXNkZmFzZGFzZCJ9LCJnb3BheSI6eyJtaWQiOiIiLCJhY2MiOiIiLCJjb2RlIjoiIiwiZGlyZWN0IjoiWSJ9LCJvdGhlciI6eyJwYXkiOiIifSwib3B0aW9uIjp7Im5hdmNvbW1lbnQiOiJOIiwibmF2cHJlZGljdCI6Ik4iLCJuYXZwYXJ0bmVyIjoiTiIsIm5hdnNlY29uZHMiOiJZIiwibmF2Z29vZHMiOiJOIiwibmF2Zm9ydW0iOiJOIiwiYnV5Y291cG9uc21zIjoiTiIsInVzZWNvdXBvbnNtcyI6Ik4iLCJleHByZXNzYnV5c21zIjoiTiIsImRpc3BsYXlmYWlsdXJlIjoiTiIsInRlYW1hc2siOiJOIiwiY3JlZGl0c2Vjb25kcyI6IlkiLCJzbXNzdWJzY3JpYmUiOiJOIiwidHJzaW1wbGUiOiJZIiwibW9uZXlzYXZlIjoiWSIsInRlYW13aG9sZSI6Ik4iLCJlbmNvZGVpZCI6Ik4iLCJ1c2VycHJpdmFjeSI6Ik4iLCJ1c2VyY3JlZGl0IjoiWSIsImNyZWRpdHNob3AiOiJZIiwiY2l0eWxvY2FsIjoiWSIsIm15Y291cG9uIjoiTiIsImJpbmRtb2JpbGUiOiJOIiwiZGF5c2lnbiI6IlkiLCJ3aWRnZXQiOiJOIiwib25seWNvdXBvbiI6IlkiLCJpbmRleGNhdGV0ZWFtIjoiWSIsImNhdGV0ZWFtIjoiWSIsImNhdGVwYXJ0bmVyIjoiWSIsImNpdHlwYXJ0bmVyIjoiWSIsImNhdGVzZWNvbmRzIjoiWSIsImNhdGVnb29kcyI6Ik4iLCJlbWFpbHZlcmlmeSI6Ik4iLCJuZWVkbW9iaWxlIjoiWSIsIm1vYmlsZWNvZGUiOiJOIiwiaW5kZXhtdWx0aSI6IlkiLCJpbmRleHBhZ2UiOiJZIiwiaW5kZXhtdWx0aW1laXR1YW4iOiJZIiwidmVyaWZ5cmVnaXN0ZXIiOiJOIiwidmVyaWZ5dG9waWMiOiJOIiwidmVyaWZ5ZmVlZGJhY2siOiJOIiwic2luYWxvZ2luIjoiTiIsImZpcnN0c2luYWxvZ2luIjoiTiIsInFxbG9naW4iOiJOIiwiZmlyc3RxcWxvZ2luIjoiTiIsInF6b25lbG9naW4iOiJZIiwiZmlyc3Rxem9uZWxvZ2luIjoiTiIsInJld3JpdGVjaXR5IjoiTiIsInJld3JpdGV0ZWFtIjoiTiIsInJld3JpdGVwYXJ0bmVyIjoiTiIsImdpdmVjcmVkaXQiOiJZIiwiZ2l2ZW1vbmV5IjoiTiJ9LCJtYWlsIjp7ImVuY29kaW5nIjoiVVRGLTgifSwic21zIjp7InNtc2FwaSI6IjIxMC41LjE1OC4zMTo5MDExIiwidXNlciI6IjgwMjAzIiwicGFzcyI6Inp0eHhsZWk4NzEwMjEiLCJpbnRlcnZhbCI6IjAiLCJudW1iZXJzIjoiMCIsInRva2VuIjoiIn0sImNyZWRpdCI6bnVsbCwic2tpbiI6eyJ0ZW1wbGF0ZSI6ImRlZmF1bHQiLCJ0aGVtZSI6ImRlZmF1bHQifSwiYXV0aG9yaXphdGlvbiI6eyIyIjpbInRlYW0iLCJoZWxwIiwib3JkZXIiLCJtYXJrZXQiXX0sInNpbmEiOnsia2V5IjoiIiwic2VjIjoiIn0sInFxIjp7ImtleSI6IiIsInNlYyI6IiJ9LCJxem9uZSI6eyJrZXkiOiIxMDExNDg3MTkiLCJzZWMiOiJlN2I0MDY4NDczYjkzMWRhMzE1ODY2YzU2MTYwODE1MiJ9LCJ2YWx1ZSI6IjEwMDU0NjYzNjg2In0=');
INSERT INTO system VALUES ('2', '10054663686');

-- ----------------------------
-- Table structure for `team`
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `summary` text,
  `city_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area_id` int(11) DEFAULT NULL,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `partner_id` int(10) unsigned NOT NULL DEFAULT '0',
  `system` enum('Y','N') NOT NULL DEFAULT 'Y',
  `team_price` double(10,2) NOT NULL DEFAULT '0.00',
  `market_price` double(10,2) NOT NULL DEFAULT '0.00',
  `product` varchar(128) DEFAULT NULL,
  `condbuy` varchar(255) DEFAULT NULL,
  `per_number` int(10) unsigned NOT NULL DEFAULT '1',
  `permin_number` int(10) DEFAULT '1',
  `min_number` int(10) unsigned NOT NULL DEFAULT '1',
  `max_number` int(10) unsigned NOT NULL DEFAULT '0',
  `now_number` int(10) unsigned NOT NULL DEFAULT '0',
  `pre_number` int(10) unsigned NOT NULL DEFAULT '0',
  `allowrefund` enum('Y','N') NOT NULL DEFAULT 'N',
  `image` varchar(128) DEFAULT NULL,
  `image1` varchar(128) DEFAULT NULL,
  `image2` varchar(128) DEFAULT NULL,
  `flv` varchar(128) DEFAULT NULL,
  `mobile` varchar(16) DEFAULT NULL,
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `card` int(10) unsigned NOT NULL DEFAULT '0',
  `fare` int(10) unsigned NOT NULL DEFAULT '0',
  `farefree` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0',
  `address` varchar(128) DEFAULT NULL,
  `detail` text,
  `systemreview` text,
  `userreview` text,
  `notice` text,
  `express` text,
  `delivery` varchar(16) NOT NULL DEFAULT 'coupon',
  `state` enum('none','success','soldout','failure','refund') NOT NULL DEFAULT 'none',
  `conduser` enum('Y','N') NOT NULL DEFAULT 'Y',
  `buyonce` enum('Y','N') NOT NULL DEFAULT 'Y',
  `team_type` varchar(20) DEFAULT 'normal',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0',
  `begin_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `reach_time` int(10) unsigned NOT NULL DEFAULT '0',
  `close_time` int(10) unsigned NOT NULL DEFAULT '0',
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` text,
  `express_relate` text,
  `sub_id` int(10) NOT NULL DEFAULT '0',
  `send_time` int(10) DEFAULT '0',
  `index_rec` enum('Y','N') DEFAULT 'Y',
  `free_yuyue` enum('Y','N') DEFAULT 'Y',
  `weekend` enum('Y','N') DEFAULT 'Y',
  `holiday` enum('Y','N') DEFAULT 'Y',
  `wifi` enum('Y','N') DEFAULT 'Y',
  `park` enum('Y','N') DEFAULT 'Y',
  `score` int(11) DEFAULT NULL,
  `wap_detail` text,
  `fj_team_id` text,
  `js_price` double(10,2) DEFAULT NULL,
  `image3` varchar(128) DEFAULT NULL,
  `image4` varchar(128) DEFAULT NULL,
  `city_ids` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO team VALUES ('2', '1', '【同德昆明广场】万记麻辣TOWN', '仅售70元！价值100元的代金券1张，全场通用，可叠加使用2张，可免费使用包间，提供免费WiFi。', '2306', '2501', '3', '1', 'Y', '70.00', '100.00', '【同德昆明广场】万记麻辣TOWN', '', '1', '1', '1', '0', '8', '7', 'Y', 'team/2014/1203/14175865175600.jpg', 'team/2014/1203/14175865175614.jpg', 'team/2014/1203/14175865179873.jpg', '', '', '0', '0', '0', '0', '0', '', '<h2 class=\"content-title\" id=\"anchor-detail\" style=\"margin:0px;padding:20px 0px 10px;font-size:18px;border-bottom-width:2px;border-style:none none solid;border-bottom-color:#888888;color:#333333;font-family:Tahoma, Helvetica, arial, sans-serif;\">本单详情</h2>\r\n<table id=\"table3\" style=\"border-spacing:0px;color:#666666;font-size:14px;line-height:21px;font-family:Arial, Verdana, sans-serif;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody id=\"yui_3_16_0_1_1417672848011_373\"><tr id=\"yui_3_16_0_1_1417672848011_372\"><td style=\"margin:0px;padding:0px;font-family:Arial, Verdana, sans-serif;font-size:12px;\" align=\"center\" bgcolor=\"#f0f0f0\" height=\"44\" width=\"198\"><span style=\"font-size:11pt;font-weight:700;\">套餐内容</span></td>\r\n<td id=\"yui_3_16_0_1_1417672848011_371\" style=\"margin:0px;padding:0px;font-family:Arial, Verdana, sans-serif;font-size:12px;\" align=\"center\" bgcolor=\"#f0f0f0\" height=\"44\" width=\"414\"><span id=\"yui_3_16_0_1_1417672848011_370\" style=\"font-weight:bold;\"><span id=\"yui_3_16_0_1_1417672848011_369\" style=\"font-size:11pt;\">数量/规格</span></span></td>\r\n<td style=\"margin:0px;padding:0px;font-family:Arial, Verdana, sans-serif;font-size:12px;\" align=\"center\" bgcolor=\"#f0f0f0\" height=\"44\"><span style=\"font-weight:bold;\"><span style=\"font-size:11pt;\">小计</span></span></td>\r\n</tr>\r\n<tr><td style=\"margin:0px;padding:0px;font-family:Arial, Verdana, sans-serif;font-size:12px;\" align=\"center\" height=\"30\" width=\"198\"><span style=\"font-size:11pt;\">意式肉酱面</span></td>\r\n<td style=\"margin:0px;padding:0px;font-family:Arial, Verdana, sans-serif;font-size:12px;\" align=\"center\" height=\"30\" width=\"414\"><span style=\"font-size:11pt;\">1份</span></td>\r\n<td style=\"margin:0px;padding:0px;font-family:Arial, Verdana, sans-serif;font-size:12px;\" align=\"center\" height=\"30\"><span style=\"font-size:11pt;\">￥28</span></td>\r\n</tr>\r\n<tr><td style=\"margin:0px;padding:0px;font-family:Arial, Verdana, sans-serif;font-size:12px;\" align=\"center\" height=\"30\" width=\"198\"><span style=\"font-size:11pt;\">果汁</span></td>\r\n<td style=\"margin:0px;padding:0px;font-family:Arial, Verdana, sans-serif;font-size:12px;\" align=\"center\" height=\"30\" width=\"414\"><span style=\"font-size:11pt;\">1杯</span></td>\r\n<td style=\"margin:0px;padding:0px;font-family:Arial, Verdana, sans-serif;font-size:12px;\" align=\"center\" height=\"30\"><span style=\"font-size:11pt;\">￥6</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h2 style=\"margin:0px 0px 10px;padding:0px 0px 10px;font-size:16px;border:none;line-height:normal;font-family:Arial, Verdana, sans-serif;white-space:pre-line;\">&nbsp;</h2>\r\n<h2 style=\"margin:0px 0px 10px;padding:0px 15px;font-size:16px;border:none;line-height:normal;font-family:Arial, Verdana, sans-serif;white-space:pre-line;\" align=\"right\">原价:￥34团购价：<span style=\"font-size:14px;color:#ff0000;\">￥18</span></h2>', '我们都觉得好！', '好好好', '<br style=\"color:#666666;font-family:Tahoma, Helvetica, arial, sans-serif;\" />\r\n<span style=\"color:#666666;font-family:Tahoma, Helvetica, arial, sans-serif;\">仅售18元！价值34元的单人套餐A，提供免费WiFi。美味从此开始~</span>', '', 'coupon', 'none', 'N', 'N', 'normal', '0', '1425398400', '1417363200', '1449244800', '1420702112', '0', null, null, null, 'N;', '13', '0', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '5', '', '', '11.00', null, null, '@2306@');
INSERT INTO team VALUES ('3', '1', '【万象城】隔锅香', '仅售209元！价值319元的香锅套餐，建议4人使用，提供免费WiFi。', '2306', '2501', '3', '1', 'Y', '209.00', '319.00', '【万象城】隔锅香', '', '1', '1', '1', '0', '1', '0', 'Y', 'team/2014/1203/14175867858320.jpg', 'team/2014/1203/14175867851853.jpg', 'team/2014/1203/14175867853388.jpg', '', '', '0', '0', '0', '0', '0', '', '<h2 class=\"content-title\" id=\"anchor-detail\" style=\"margin:0px;padding:20px 0px 10px;font-size:18px;border-bottom-width:2px;border-style:none none solid;border-bottom-color:#888888;color:#333333;font-family:Tahoma, Helvetica, arial, sans-serif;\">本单详情</h2>\r\n<table id=\"table3\" style=\"border-spacing:0px;color:#666666;font-family:Tahoma, Helvetica, arial, sans-serif;font-size:14px;line-height:21px;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td style=\"margin:0px;padding:0px;\" align=\"center\" bgcolor=\"#f0f0f0\" height=\"44\" width=\"163\"><strong>套餐内容</strong></td>\r\n<td style=\"margin:0px;padding:0px;\" align=\"center\" bgcolor=\"#f0f0f0\" height=\"44\" width=\"573\"><strong>数量/规格</strong></td>\r\n<td style=\"margin:0px;padding:0px;\" align=\"center\" bgcolor=\"#f0f0f0\" height=\"44\"><strong>小计</strong></td>\r\n</tr>\r\n<tr><td style=\"margin:0px;padding:0px;\" align=\"center\" height=\"30\" width=\"163\">辣子鸡面/红烧排骨面</td>\r\n<td style=\"margin:0px;padding:0px;\" align=\"center\" height=\"30\" width=\"573\">1份（二选一）</td>\r\n<td style=\"margin:0px;padding:0px;\" align=\"center\" height=\"30\">￥13</td>\r\n</tr>\r\n<tr><td style=\"margin:0px;padding:0px;\" align=\"center\" height=\"30\" width=\"163\">酱鸡爪/煎蛋</td>\r\n<td style=\"margin:0px;padding:0px;\" align=\"center\" height=\"30\" width=\"573\">1份（二选一）</td>\r\n<td style=\"margin:0px;padding:0px;\" align=\"center\" height=\"30\">￥2</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div jquery1414543438671=\"341\" jquery1413524899578=\"216\" style=\"margin:0px;padding:0px;color:#666666;font-family:Tahoma, Helvetica, arial, sans-serif;\"><div jquery1414543438671=\"341\" jquery1413524899578=\"216\" style=\"margin:0px;padding:0px;\"><br />\r\n&nbsp;</div>\r\n<h2 style=\"margin:0px 0px 10px;padding:0px 15px;font-size:16px;border:none;\" align=\"right\">原价:￥15 团购价：<span style=\"font-size:14px;color:#ff0000;\">￥9.9</span></h2>\r\n</div>', '很好，非常好', '好好好！', '<span style=\"color:#666666;font-family:Tahoma, Helvetica, arial, sans-serif;\">唐佳手擀面原价15元的辣子鸡面和红烧排骨面套餐（二选一）仅需9.9元~</span>', '', 'coupon', 'none', 'N', 'N', 'normal', '0', '1425398400', '1417536000', '1449244800', '1420695582', '0', null, null, null, 'N;', '13', '0', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '5', '', '', '11.00', null, null, '@2306@');
INSERT INTO team VALUES ('4', '1', 'dsadsadsadasdsadsadsadasdsa', '<table class=\"meal_list\" width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\r\n        <tbody>\r\n        <tr>\r\n        <td width=\"15%\" height=\"36\">有效期： </td>\r\n        <td width=\"80%\" height=\"36\">2014年04月11日至2015年02月27日，周末通用，节假日通用；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用时间： </td>\r\n        <td height=\"32\">11:30-02:30；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">预约提醒： </td>\r\n        <td height=\"32\">本单需提前2小时预约，预约电话：2021-888888；</td>\r\n        </tr>\r\n        <tr>\r\n        <td rowspan=\"3\">使用限制：</td>\r\n        <td height=\"32\">购买限制：每人不限购买团购券份数； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用限制：每人不限使用份数，每张团购券建议2人使用；仅供堂食，不提供外卖及打包服务； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">通用规则：团购券不兑现、不找零、不与店内其它优惠同享；</td>\r\n        </tr>\r\n        </tbody>\r\n        </table>', '2306', '2498', '4', '1', 'Y', '1.00', '222.00', 'dsadsadsadasdsadsa', '', '1', '1', '1', '0', '4', '1', 'Y', 'team/2014/1205/14177388376352.jpg', 'team/2014/1205/14177388383831.jpg', 'team/2014/1205/14177388383955.jpg', '', '', '0', '0', '0', '0', '0', '', 'dsadasdasdasdsadsa', null, null, null, '', 'coupon', 'none', 'N', 'N', 'normal', '0', '1425571200', '1417363200', '1449417600', '1417838919', '0', null, null, null, 'N;', '29', '0', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', null, null, null, '11.00', null, null, '@2306@');
INSERT INTO team VALUES ('5', '1', 'dsadsadsadsadsadsacxzcxzcxz', '<table class=\"meal_list\" width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\r\n        <tbody>\r\n        <tr>\r\n        <td width=\"15%\" height=\"36\">有效期： </td>\r\n        <td width=\"80%\" height=\"36\">2014年04月11日至2015年02月27日，周末通用，节假日通用；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用时间： </td>\r\n        <td height=\"32\">11:30-02:30；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">预约提醒： </td>\r\n        <td height=\"32\">本单需提前2小时预约，预约电话：2021-888888；</td>\r\n        </tr>\r\n        <tr>\r\n        <td rowspan=\"3\">使用限制：</td>\r\n        <td height=\"32\">购买限制：每人不限购买团购券份数； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用限制：每人不限使用份数，每张团购券建议2人使用；仅供堂食，不提供外卖及打包服务； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">通用规则：团购券不兑现、不找零、不与店内其它优惠同享；</td>\r\n        </tr>\r\n        </tbody>\r\n        </table>', '2306', '2498', '4', '2', 'Y', '111.00', '222222.00', 'sadsadasdasdsadsadsaddsadsadsadas', '', '222', '1', '1', '22222', '0', '0', 'Y', 'team/2014/1205/14177407895350.jpg', 'team/2014/1205/14177407892618.jpg', 'team/2014/1205/14177407896749.jpg', '', '', '0', '0', '0', '0', '0', '', 'dsadasdsadsadasdsad', null, null, null, '', 'coupon', 'none', 'N', 'N', 'seconds', '0', '1425571200', '1417827117', '1417913517', '0', '0', null, null, null, 'N;', '29', '0', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', null, null, null, '11.00', null, null, '@2306@');
INSERT INTO team VALUES ('6', '1', 'sadsadcxz cxz', '<table class=\"meal_list\" width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\r\n        <tbody>\r\n        <tr>\r\n        <td width=\"15%\" height=\"36\">有效期： </td>\r\n        <td width=\"80%\" height=\"36\">2014年04月11日至2015年02月27日，周末通用，节假日通用；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用时间： </td>\r\n        <td height=\"32\">11:30-02:30；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">预约提醒： </td>\r\n        <td height=\"32\">本单需提前2小时预约，预约电话：2021-888888；</td>\r\n        </tr>\r\n        <tr>\r\n        <td rowspan=\"3\">使用限制：</td>\r\n        <td height=\"32\">购买限制：每人不限购买团购券份数； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用限制：每人不限使用份数，每张团购券建议2人使用；仅供堂食，不提供外卖及打包服务； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">通用规则：团购券不兑现、不找零、不与店内其它优惠同享；</td>\r\n        </tr>\r\n        </tbody>\r\n        </table>', '2306', '2498', '7', '1', 'Y', '1.00', '2222.00', 'sacsadsadsadsad', '', '23213', '1', '1', '223232', '3', '0', 'N', 'team/2014/1205/14177447499613.jpg', 'team/2014/1205/14177447497238.jpg', 'team/2014/1205/14177447496976.jpg', '', '', '0', '0', '0', '0', '0', '', 'dsadsadsadsadsa', null, null, null, '', 'coupon', 'none', 'N', 'N', 'normal', '0', '1425571200', '1417363200', '1417881600', '0', '0', null, null, null, 'N;', '84', '0', 'N', 'N', 'N', 'N', 'N', 'N', '5', 'dsadsadsadassadsa', '11,8,7', '11.00', null, null, '@2306@');
INSERT INTO team VALUES ('7', '1', '测啊大王打算', '<table class=\"meal_list\" width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\r\n        <tbody>\r\n        <tr>\r\n        <td width=\"15%\" height=\"36\">有效期： </td>\r\n        <td width=\"80%\" height=\"36\">2014年04月11日至2015年02月27日，周末通用，节假日通用；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用时间： </td>\r\n        <td height=\"32\">11:30-02:30；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">预约提醒： </td>\r\n        <td height=\"32\">本单需提前2小时预约，预约电话：2021-888888；</td>\r\n        </tr>\r\n        <tr>\r\n        <td rowspan=\"3\">使用限制：</td>\r\n        <td height=\"32\">购买限制：每人不限购买团购券份数； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用限制：每人不限使用份数，每张团购券建议2人使用；仅供堂食，不提供外卖及打包服务； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">通用规则：团购券不兑现、不找零、不与店内其它优惠同享；</td>\r\n        </tr>\r\n        </tbody>\r\n        </table>', '2306', '2500', '7', '1', 'Y', '1.00', '222.00', '撒大苏打撒旦撒旦撒', '', '22', '1', '1', '222', '12', '0', 'N', 'team/2014/1205/14177461832773.jpg', 'team/2014/1205/14177461832822.jpg', 'team/2014/1205/14177461836855.jpg', '', '', '0', '0', '0', '0', '0', '', '似的撒旦撒大苏打撒', null, null, null, '', 'coupon', 'none', 'N', 'Y', 'normal', '0', '1425571200', '1417363200', '1449417600', '1417746232', '0', null, null, null, 'N;', '65', '0', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', '5', '大苏打撒旦撒旦撒旦', '', '11.00', null, null, '@2306@');
INSERT INTO team VALUES ('8', '1', '【包邮】千奈美女人心厚薄可选性感聚拢调整型文胸', '<table class=\"meal_list\" width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\r\n        <tbody>\r\n        <tr>\r\n        <td width=\"15%\" height=\"36\">有效期： </td>\r\n        <td width=\"80%\" height=\"36\">2014年04月11日至2015年02月27日，周末通用，节假日通用；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用时间： </td>\r\n        <td height=\"32\">11:30-02:30；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">预约提醒： </td>\r\n        <td height=\"32\">本单需提前2小时预约，预约电话：2021-888888；</td>\r\n        </tr>\r\n        <tr>\r\n        <td rowspan=\"3\">使用限制：</td>\r\n        <td height=\"32\">购买限制：每人不限购买团购券份数； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用限制：每人不限使用份数，每张团购券建议2人使用；仅供堂食，不提供外卖及打包服务； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">通用规则：团购券不兑现、不找零、不与店内其它优惠同享；</td>\r\n        </tr>\r\n        </tbody>\r\n        </table>', '2306', '2498', '7', '4', 'Y', '59.00', '598.00', '【包邮】千奈美女人心厚薄可选性感聚拢调整型文胸', '', '100', '1', '1', '0', '108', '0', 'Y', 'team/2014/1205/14177628437885.jpg', 'team/2014/1205/14177628436182.jpg', 'team/2014/1205/14177628434957.jpg', '', '', '0', '0', '0', '0', '0', '', '<span style=\"color:#666666;font-family:\'Tahoma, Helvetica, arial, sans-serif\';\"><span style=\"font-size:16px;line-height:24px;\">仅售59元全国包邮！价值598元的千奈美女人心厚薄可选性感聚拢调整型文胸1件，本款3色多尺码厚薄可选，时尚性感与舒适聚拢完美结合，塑造迷人曲线！</span></span>', null, null, null, '', 'coupon', 'none', 'N', 'N', 'normal', '0', '1425571200', '1416153600', '1449417600', '1417763105', '0', null, null, null, 'N;', '41', '0', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', '5', '<span style=\"color:#666666;font-family:\'Tahoma, Helvetica, arial, sans-serif\';\"><span style=\"font-size:16px;line-height:24px;\">仅售59元全国包邮！价值598元的千奈美女人心厚薄可选性感聚拢调整型文胸1件，本款3色多尺码厚薄可选，时尚性感与舒适聚拢完美结合，塑造迷人曲线！</span></span>', '1,2,3', '59.00', 'team/2014/1209/14180904012715.jpg', 'team/2014/1209/14180904019302.jpg', '@2306@');
INSERT INTO team VALUES ('9', '1', 'dsadsadsadasdsad', '<table class=\"meal_list\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n        <tbody>\r\n        <tr>\r\n        <td height=\"36\" width=\"15%\">有效期： </td>\r\n        <td height=\"36\" width=\"80%\">2014年04月11日至2015年02月27日，周末通用，节假日通用；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用时间： </td>\r\n        <td height=\"32\">11:30-02:30；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">预约提醒： </td>\r\n        <td height=\"32\">本单需提前2小时预约，预约电话：2021-888888；</td>\r\n        </tr>\r\n        <tr>\r\n        <td rowspan=\"3\">使用限制：</td>\r\n        <td height=\"32\">购买限制：每人不限购买团购券份数； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用限制：每人不限使用份数，每张团购券建议2人使用；仅供堂食，不提供外卖及打包服务； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">通用规则：团购券不兑现、不找零、不与店内其它优惠同享；</td>\r\n        </tr>\r\n        </tbody>\r\n        </table>', '2306', '0', '7', '0', 'Y', '1.00', '1.00', 'sasadsa', '', '1', '1', '10', '0', '0', '0', 'N', 'team/2014/1209/14181321822918.jpg', null, null, '', '', '0', '0', '0', '0', '0', '', 'dsadsada\'s\'da\'s\'da', null, null, null, '', 'coupon', 'none', 'N', 'Y', 'normal', '0', '1425916800', '1417363200', '1418227200', '0', '0', null, null, null, 'N;', '45', '0', 'N', 'N', 'N', 'N', 'N', 'N', '5', 'sadadsaddsadas', '', '1.00', null, null, '@2306@');
INSERT INTO team VALUES ('10', '1', 'dadasdasdas', '<table class=\"meal_list\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n        <tbody>\r\n        <tr>\r\n        <td height=\"36\" width=\"15%\">有效期： </td>\r\n        <td height=\"36\" width=\"80%\">2014年04月11日至2015年02月27日，周末通用，节假日通用；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用时间： </td>\r\n        <td height=\"32\">11:30-02:30；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">预约提醒： </td>\r\n        <td height=\"32\">本单需提前2小时预约，预约电话：2021-888888；</td>\r\n        </tr>\r\n        <tr>\r\n        <td rowspan=\"3\">使用限制：</td>\r\n        <td height=\"32\">购买限制：每人不限购买团购券份数； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用限制：每人不限使用份数，每张团购券建议2人使用；仅供堂食，不提供外卖及打包服务； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">通用规则：团购券不兑现、不找零、不与店内其它优惠同享；</td>\r\n        </tr>\r\n        </tbody>\r\n        </table>', '2306', '2500', '7', '2', 'Y', '1.00', '1.00', 'dasdasdasd', '', '1', '1', '10', '0', '0', '0', 'N', 'team/2014/1209/14181329384933.jpg', null, null, '', '', '0', '0', '0', '0', '0', '', 'sadadasdasdasdasdsaadsadass<br />', null, null, null, '', 'coupon', 'none', 'N', 'Y', 'normal', '0', '1425916800', '1417363200', '1418227200', '0', '0', null, null, null, 'N;', '45', '0', 'N', 'N', 'N', 'N', 'N', 'N', '5', 'asdasdasdadasdasdsadsdasdsad<br />', '', '1.00', null, null, '@2306@');
INSERT INTO team VALUES ('11', '1', 'dsadsadsads', '<table class=\"meal_list\" width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\r\n        <tbody>\r\n        <tr>\r\n        <td width=\"15%\" height=\"36\">有效期： </td>\r\n        <td width=\"80%\" height=\"36\">2014年04月11日至2015年02月27日，周末通用，节假日通用；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用时间： </td>\r\n        <td height=\"32\">11:30-02:30；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">预约提醒： </td>\r\n        <td height=\"32\">本单需提前2小时预约，预约电话：2021-888888；</td>\r\n        </tr>\r\n        <tr>\r\n        <td rowspan=\"3\">使用限制：</td>\r\n        <td height=\"32\">购买限制：每人不限购买团购券份数； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用限制：每人不限使用份数，每张团购券建议2人使用；仅供堂食，不提供外卖及打包服务； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">通用规则：团购券不兑现、不找零、不与店内其它优惠同享；</td>\r\n        </tr>\r\n        </tbody>\r\n        </table>', '2306', '2502', '24', '2', 'Y', '1.00', '1.00', 'dsadas', '', '1', '1', '10', '0', '0', '0', 'N', 'team/2014/1216/14187228781146.jpg', null, null, '', '', '0', '0', '0', '0', '0', '', 'dsadsaddsadsad', null, null, null, '', 'coupon', 'none', 'N', 'N', 'normal', '0', '1426521600', '1418572800', '1419955200', '0', '0', null, null, null, 'N;', '0', '0', 'N', 'N', 'N', 'N', 'N', 'N', '5', 'dsadsadsadsadsad', '', '1.00', null, null, '@2306@');
INSERT INTO team VALUES ('12', '1', 'sadsdsad', '<table class=\"meal_list\" width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\r\n        <tbody>\r\n        <tr>\r\n        <td width=\"15%\" height=\"36\">有效期： </td>\r\n        <td width=\"80%\" height=\"36\">2014年04月11日至2015年02月27日，周末通用，节假日通用；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用时间： </td>\r\n        <td height=\"32\">11:30-02:30；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">预约提醒： </td>\r\n        <td height=\"32\">本单需提前2小时预约，预约电话：2021-888888；</td>\r\n        </tr>\r\n        <tr>\r\n        <td rowspan=\"3\">使用限制：</td>\r\n        <td height=\"32\">购买限制：每人不限购买团购券份数； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用限制：每人不限使用份数，每张团购券建议2人使用；仅供堂食，不提供外卖及打包服务； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">通用规则：团购券不兑现、不找零、不与店内其它优惠同享；</td>\r\n        </tr>\r\n        </tbody>\r\n        </table>', '2306', '2502', '24', '2', 'Y', '1.00', '1.00', 'dsadsaddsadsadsa', 'sadsadsa', '1', '1', '10', '0', '0', '0', 'N', 'team/2014/1216/14187228979094.jpg', null, null, '', '', '0', '0', '0', '0', '0', '', 'dsadsa', null, null, null, '', 'coupon', 'none', 'N', 'Y', 'normal', '0', '1426521600', '1418572800', '1419955200', '0', '0', null, null, null, 'N;', '0', '0', 'N', 'N', 'N', 'N', 'N', 'N', '5', 'dsadsa', '', '1.00', null, null, '@2306@');
INSERT INTO team VALUES ('13', '1', 'dsadsadsa', '<table class=\"meal_list\" width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\r\n        <tbody>\r\n        <tr>\r\n        <td width=\"15%\" height=\"36\">有效期： </td>\r\n        <td width=\"80%\" height=\"36\">2014年04月11日至2015年02月27日，周末通用，节假日通用；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用时间： </td>\r\n        <td height=\"32\">11:30-02:30；</td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">预约提醒： </td>\r\n        <td height=\"32\">本单需提前2小时预约，预约电话：2021-888888；</td>\r\n        </tr>\r\n        <tr>\r\n        <td rowspan=\"3\">使用限制：</td>\r\n        <td height=\"32\">购买限制：每人不限购买团购券份数； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">使用限制：每人不限使用份数，每张团购券建议2人使用；仅供堂食，不提供外卖及打包服务； </td>\r\n        </tr>\r\n        <tr>\r\n        <td height=\"32\">通用规则：团购券不兑现、不找零、不与店内其它优惠同享；</td>\r\n        </tr>\r\n        </tbody>\r\n        </table>', '2306', '2502', '24', '0', 'Y', '1.00', '1.00', 'dsadsadsa', '', '1', '1', '10', '0', '0', '0', 'N', 'team/2014/1216/14187229299233.jpg', null, null, '', '', '0', '0', '0', '0', '0', '', 'dsadsadas', null, null, null, '', 'coupon', 'none', 'N', 'Y', 'normal', '0', '1419955200', '1418572800', '1419955200', '0', '0', null, null, null, 'N;', '0', '0', 'N', 'N', 'N', 'N', 'N', 'N', '5', 'dsad', '', '1.00', null, null, '@2306@');

-- ----------------------------
-- Table structure for `toolsbind`
-- ----------------------------
DROP TABLE IF EXISTS `toolsbind`;
CREATE TABLE `toolsbind` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `tools` varchar(16) NOT NULL,
  `secret` varchar(16) DEFAULT NULL,
  `enable` enum('Y','N') NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of toolsbind
-- ----------------------------

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0',
  `public_id` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text,
  `head` int(10) unsigned NOT NULL DEFAULT '0',
  `reply_number` int(10) unsigned NOT NULL DEFAULT '0',
  `view_number` int(10) unsigned NOT NULL DEFAULT '0',
  `last_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `last_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(128) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `realname` varchar(32) DEFAULT NULL,
  `alipay_id` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `avatar` varchar(128) DEFAULT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `newbie` enum('Y','N') NOT NULL DEFAULT 'Y',
  `mobile` varchar(16) DEFAULT NULL,
  `qq` varchar(16) DEFAULT NULL,
  `money` double(10,2) NOT NULL DEFAULT '0.00',
  `score` int(11) NOT NULL DEFAULT '0',
  `zipcode` char(6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city_id` int(10) unsigned NOT NULL DEFAULT '0',
  `emailable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `enable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `manager` enum('Y','N') NOT NULL DEFAULT 'N',
  `secret` varchar(32) DEFAULT NULL,
  `recode` varchar(32) DEFAULT NULL,
  `sns` varchar(64) DEFAULT NULL,
  `ip` varchar(16) DEFAULT NULL,
  `login_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `mobilecode` char(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_name` (`username`),
  UNIQUE KEY `UNQ_e` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('1', 'maoyijieheiguang@163.com', 'admin', '管理员A', null, 'e7fe8b88db51d86ef2f5e169144b9c1b', null, 'M', 'N', '18688164055', '', '993617.00', '0', '', '', '0', 'Y', 'Y', 'Y', '', null, null, '127.0.0.1', '1417503086', '1417503086', null);
INSERT INTO user VALUES ('2', 'cb371030349@sina.com', 'nickname', null, null, 'ed725fad2563569e8d54102a085e8672', null, 'M', 'Y', null, null, '0.00', '0', null, null, '0', 'Y', 'Y', 'N', null, null, null, null, '0', '1417596304', null);
INSERT INTO user VALUES ('3', 'fantianmi@163.com', 'fantianmi', '', null, 'ee098d18af322766ee13aaa7f4dd3632', null, 'M', 'N', '18688164055', '', '1282.00', '0', '', '', '2306', 'Y', 'Y', 'N', 'f8bc381a819bb877e3c95c8017f537c1', null, null, '127.0.0.1', '1417706013', '1417706013', null);
INSERT INTO user VALUES ('4', '357531980@qq.com', 'km', null, null, 'e7fe8b88db51d86ef2f5e169144b9c1b', null, 'M', 'N', '17799332222', null, '799163.00', '0', null, null, '2306', 'Y', 'Y', 'N', 'de6877743e9e4af7b12300eb318f091c', null, null, '127.0.0.1', '1417762937', '1417762937', null);
INSERT INTO user VALUES ('5', '357531983@qq.com', 'km2', null, null, 'e7fe8b88db51d86ef2f5e169144b9c1b', null, 'M', 'Y', '13102981244', null, '0.00', '0', null, null, '2306', 'Y', 'Y', 'N', 'f9aa6615fc0405d74e744fcf29c12e46', null, null, '127.0.0.1', '1417945700', '1417945700', null);
INSERT INTO user VALUES ('6', '3322222@qq.com', '123456', null, null, 'e7fe8b88db51d86ef2f5e169144b9c1b', null, 'M', 'Y', '', null, '0.00', '0', null, null, '2306', 'Y', 'Y', 'N', '56d3607d7b408d08b0e1994bb0112e84', null, null, '127.0.0.1', '1418116032', '1418116032', null);

-- ----------------------------
-- Table structure for `vote_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `vote_feedback`;
CREATE TABLE `vote_feedback` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `addtime` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `vote_feedback_input`
-- ----------------------------
DROP TABLE IF EXISTS `vote_feedback_input`;
CREATE TABLE `vote_feedback_input` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feedback_id` bigint(20) unsigned NOT NULL,
  `options_id` mediumint(8) unsigned NOT NULL,
  `value` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_feedback_input
-- ----------------------------

-- ----------------------------
-- Table structure for `vote_feedback_question`
-- ----------------------------
DROP TABLE IF EXISTS `vote_feedback_question`;
CREATE TABLE `vote_feedback_question` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feedback_id` bigint(20) unsigned NOT NULL,
  `question_id` mediumint(8) unsigned NOT NULL,
  `options_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_feedback_question
-- ----------------------------

-- ----------------------------
-- Table structure for `vote_options`
-- ----------------------------
DROP TABLE IF EXISTS `vote_options`;
CREATE TABLE `vote_options` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` mediumint(8) unsigned NOT NULL,
  `name` varchar(60) NOT NULL,
  `is_br` char(1) NOT NULL DEFAULT '0',
  `is_input` char(1) NOT NULL DEFAULT '0',
  `is_show` char(1) NOT NULL DEFAULT '1',
  `order` mediumint(8) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_options
-- ----------------------------

-- ----------------------------
-- Table structure for `vote_question`
-- ----------------------------
DROP TABLE IF EXISTS `vote_question`;
CREATE TABLE `vote_question` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'radio',
  `is_show` char(1) NOT NULL DEFAULT '1',
  `addtime` char(10) NOT NULL,
  `order` mediumint(8) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_question
-- ----------------------------

-- ----------------------------
-- Table structure for `voucher`
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sms` int(10) unsigned NOT NULL DEFAULT '0',
  `sms_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_ct` (`code`,`team_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of voucher
-- ----------------------------
