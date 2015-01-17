/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : thinkox

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2015-01-02 12:43:23
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `thinkox_action`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_action`;
CREATE TABLE `thinkox_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of thinkox_action
-- ----------------------------
INSERT INTO thinkox_action VALUES ('1', 'user_login', '用户登录', '积分+10，每天1次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '-1', '1419488850');
INSERT INTO thinkox_action VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '-1', '1419488857');
INSERT INTO thinkox_action VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '-1', '1419489925');
INSERT INTO thinkox_action VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一个微博。\r\n表[model]，记录编号[record]。', '1', '-1', '1419488865');
INSERT INTO thinkox_action VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '-1', '1419488868');
INSERT INTO thinkox_action VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '-1', '1419488872');
INSERT INTO thinkox_action VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '-1', '1419488880');
INSERT INTO thinkox_action VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO thinkox_action VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO thinkox_action VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO thinkox_action VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');
INSERT INTO thinkox_action VALUES ('13', 'add_weibo', '发微博', '积分+2，金币+1，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+2|cycle:24|max:5|tox_money_rule:tox_money+1|tox_money_field:tox_money', '', '1', '-1', '1419488777');
INSERT INTO thinkox_action VALUES ('14', 'add_weibo_comment', '微博评论', '积分+1，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+1|cycle:24|max:5', '', '1', '-1', '1419488783');
INSERT INTO thinkox_action VALUES ('15', 'add_post', '发帖子', '积分+3，每天上限3次', 'table:member|field:score|condition:uid={$self}|rule:score+3|cycle:24|max:3', '', '1', '1', '1419488965');
INSERT INTO thinkox_action VALUES ('20', 'add_check', '签到', '积分+5，每天上限1次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:1', '', '1', '1', '1419497124');
INSERT INTO thinkox_action VALUES ('16', 'add_post_reply', '帖子回复', '积分+1，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+1|cycle:24|max:10', '', '1', '1', '1419497097');
INSERT INTO thinkox_action VALUES ('17', 'add_yun_2', '做运动+2', '积分+2，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+2|cycle:24|max:10', '', '1', '1', '1419497107');
INSERT INTO thinkox_action VALUES ('18', 'add_yun_3', '做运动+3', '积分+3，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+1|cycle:3|max:10', '', '1', '1', '1419488691');
INSERT INTO thinkox_action VALUES ('19', 'add_yun_5', '做运动+5', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+1|cycle:5|max:10', '', '1', '1', '1419497115');
INSERT INTO thinkox_action VALUES ('21', 'add_shibu', '食补', '积分+2，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+2|cycle:24|max:10', '', '1', '1', '1419498293');

-- ----------------------------
-- Table structure for `thinkox_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_action_log`;
CREATE TABLE `thinkox_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7726 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of thinkox_action_log
-- ----------------------------
INSERT INTO thinkox_action_log VALUES ('7179', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-06 11:07登录了后台', '1', '1417835241');
INSERT INTO thinkox_action_log VALUES ('7180', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 11:15登录了后台', '1', '1417835725');
INSERT INTO thinkox_action_log VALUES ('7181', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 11:20登录了后台', '1', '1417836021');
INSERT INTO thinkox_action_log VALUES ('7182', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-06 11:21登录了后台', '1', '1417836083');
INSERT INTO thinkox_action_log VALUES ('7183', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 11:22登录了后台', '1', '1417836159');
INSERT INTO thinkox_action_log VALUES ('7184', '1', '1', '0', 'member', '1', 'admin在2014-12-06 11:46登录了后台', '1', '1417837568');
INSERT INTO thinkox_action_log VALUES ('7185', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 11:54登录了后台', '1', '1417838052');
INSERT INTO thinkox_action_log VALUES ('7186', '15', '58', '-1062731647', 'ForumPost', '22', '操作url：/thinkox4/index.php?s=/forum/index/doedit.html', '1', '1417838132');
INSERT INTO thinkox_action_log VALUES ('7187', '13', '58', '-1062731647', 'Weibo', '403', '操作url：/thinkox4/index.php?s=/forum/index/doedit.html', '1', '1417838132');
INSERT INTO thinkox_action_log VALUES ('7188', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 12:48登录了后台', '1', '1417841330');
INSERT INTO thinkox_action_log VALUES ('7189', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 12:49登录了后台', '1', '1417841372');
INSERT INTO thinkox_action_log VALUES ('7190', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 12:59登录了后台', '1', '1417841952');
INSERT INTO thinkox_action_log VALUES ('7191', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 13:03登录了后台', '1', '1417842227');
INSERT INTO thinkox_action_log VALUES ('7192', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 13:04登录了后台', '1', '1417842266');
INSERT INTO thinkox_action_log VALUES ('7193', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 13:05登录了后台', '1', '1417842359');
INSERT INTO thinkox_action_log VALUES ('7194', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:07登录了后台', '1', '1417842461');
INSERT INTO thinkox_action_log VALUES ('7195', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 13:08登录了后台', '1', '1417842534');
INSERT INTO thinkox_action_log VALUES ('7196', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:11登录了后台', '1', '1417842694');
INSERT INTO thinkox_action_log VALUES ('7197', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:12登录了后台', '1', '1417842732');
INSERT INTO thinkox_action_log VALUES ('7198', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:12登录了后台', '1', '1417842758');
INSERT INTO thinkox_action_log VALUES ('7199', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:13登录了后台', '1', '1417842798');
INSERT INTO thinkox_action_log VALUES ('7200', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:13登录了后台', '1', '1417842813');
INSERT INTO thinkox_action_log VALUES ('7201', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:13登录了后台', '1', '1417842824');
INSERT INTO thinkox_action_log VALUES ('7202', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:14登录了后台', '1', '1417842842');
INSERT INTO thinkox_action_log VALUES ('7203', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:14登录了后台', '1', '1417842854');
INSERT INTO thinkox_action_log VALUES ('7204', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:14登录了后台', '1', '1417842874');
INSERT INTO thinkox_action_log VALUES ('7205', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:14登录了后台', '1', '1417842881');
INSERT INTO thinkox_action_log VALUES ('7206', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:14登录了后台', '1', '1417842898');
INSERT INTO thinkox_action_log VALUES ('7207', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:15登录了后台', '1', '1417842927');
INSERT INTO thinkox_action_log VALUES ('7208', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:15登录了后台', '1', '1417842943');
INSERT INTO thinkox_action_log VALUES ('7209', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:15登录了后台', '1', '1417842950');
INSERT INTO thinkox_action_log VALUES ('7210', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:16登录了后台', '1', '1417843009');
INSERT INTO thinkox_action_log VALUES ('7211', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:17登录了后台', '1', '1417843053');
INSERT INTO thinkox_action_log VALUES ('7212', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:17登录了后台', '1', '1417843055');
INSERT INTO thinkox_action_log VALUES ('7213', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:17登录了后台', '1', '1417843079');
INSERT INTO thinkox_action_log VALUES ('7214', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:18登录了后台', '1', '1417843099');
INSERT INTO thinkox_action_log VALUES ('7215', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-06 13:19登录了后台', '1', '1417843167');
INSERT INTO thinkox_action_log VALUES ('7216', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 13:32登录了后台', '1', '1417843941');
INSERT INTO thinkox_action_log VALUES ('7217', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 13:36登录了后台', '1', '1417844171');
INSERT INTO thinkox_action_log VALUES ('7218', '16', '58', '-1062731647', 'ForumPostReply', '5', '操作url：/thinkox4/index.php?s=/forum/index/doreply/post_id/22.html', '1', '1417845505');
INSERT INTO thinkox_action_log VALUES ('7219', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 14:07登录了后台', '1', '1417846023');
INSERT INTO thinkox_action_log VALUES ('7220', '1', '60', '-1062731603', 'member', '60', '13101351388在2014-12-06 14:22登录了后台', '1', '1417846956');
INSERT INTO thinkox_action_log VALUES ('7221', '1', '60', '-1062731603', 'member', '60', '13101351388在2014-12-06 14:22登录了后台', '1', '1417846972');
INSERT INTO thinkox_action_log VALUES ('7222', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 14:41登录了后台', '1', '1417848085');
INSERT INTO thinkox_action_log VALUES ('7223', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 14:46登录了后台', '1', '1417848373');
INSERT INTO thinkox_action_log VALUES ('7224', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 14:48登录了后台', '1', '1417848480');
INSERT INTO thinkox_action_log VALUES ('7225', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 14:59登录了后台', '1', '1417849195');
INSERT INTO thinkox_action_log VALUES ('7226', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 15:12登录了后台', '1', '1417849969');
INSERT INTO thinkox_action_log VALUES ('7227', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 15:17登录了后台', '1', '1417850269');
INSERT INTO thinkox_action_log VALUES ('7228', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 15:21登录了后台', '1', '1417850499');
INSERT INTO thinkox_action_log VALUES ('7229', '16', '58', '-1062731647', 'ForumPostReply', '6', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1417851754');
INSERT INTO thinkox_action_log VALUES ('7230', '16', '58', '-1062731647', 'ForumPostReply', '7', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1417851905');
INSERT INTO thinkox_action_log VALUES ('7231', '1', '59', '-1062731603', 'member', '59', '13101351386在2014-12-06 16:45登录了后台', '1', '1417855523');
INSERT INTO thinkox_action_log VALUES ('7232', '1', '58', '-1062731647', 'member', '58', 'ipipipip在2014-12-08 09:51登录了后台', '1', '1418003519');
INSERT INTO thinkox_action_log VALUES ('7233', '15', '58', '-1062731647', 'ForumPost', '23', '操作url：/thinkox4/index.php?s=/forum/index/doedit.html', '1', '1418003882');
INSERT INTO thinkox_action_log VALUES ('7234', '13', '58', '-1062731647', 'Weibo', '404', '操作url：/thinkox4/index.php?s=/forum/index/doedit.html', '1', '1418003882');
INSERT INTO thinkox_action_log VALUES ('7235', '15', '58', '-1062731647', 'ForumPost', '24', '操作url：/thinkox4/index.php?s=/forum/index/doedit.html', '1', '1418003949');
INSERT INTO thinkox_action_log VALUES ('7236', '13', '58', '-1062731647', 'Weibo', '405', '操作url：/thinkox4/index.php?s=/forum/index/doedit.html', '1', '1418003949');
INSERT INTO thinkox_action_log VALUES ('7237', '16', '58', '-1062731647', 'ForumPostReply', '8', '操作url：/thinkox4/index.php?s=/forum/index/doreply/post_id/24.html', '1', '1418003991');
INSERT INTO thinkox_action_log VALUES ('7238', '16', '58', '-1062731647', 'ForumPostReply', '9', '操作url：/thinkox4/index.php?s=/forum/index/doreply/post_id/24.html', '1', '1418004003');
INSERT INTO thinkox_action_log VALUES ('7239', '16', '58', '-1062731647', 'ForumPostReply', '10', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1418004319');
INSERT INTO thinkox_action_log VALUES ('7240', '15', '1', '0', 'ForumPost', '25', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418005995');
INSERT INTO thinkox_action_log VALUES ('7241', '16', '58', '-1062731647', 'ForumPostReply', '11', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1418006161');
INSERT INTO thinkox_action_log VALUES ('7242', '15', '1', '0', 'ForumPost', '26', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418006404');
INSERT INTO thinkox_action_log VALUES ('7243', '15', '1', '0', 'ForumPost', '27', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418007009');
INSERT INTO thinkox_action_log VALUES ('7244', '16', '58', '-1062731647', 'ForumPostReply', '12', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1418008514');
INSERT INTO thinkox_action_log VALUES ('7245', '16', '1', '-1062731647', 'ForumLzlReply', '84', '操作url：/thinkox4/index.php?s=/forum/lzl/doSendLZLReply', '1', '1418014143');
INSERT INTO thinkox_action_log VALUES ('7246', '1', '59', '-1062731644', 'member', '59', '13101351386在2014-12-08 13:41登录了后台', '1', '1418017293');
INSERT INTO thinkox_action_log VALUES ('7247', '1', '59', '-1062731644', 'member', '59', '13101351386在2014-12-08 13:46登录了后台', '1', '1418017609');
INSERT INTO thinkox_action_log VALUES ('7248', '1', '59', '-1062731644', 'member', '59', '13101351386在2014-12-08 13:49登录了后台', '1', '1418017766');
INSERT INTO thinkox_action_log VALUES ('7249', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-08 15:04登录了后台', '1', '1418022295');
INSERT INTO thinkox_action_log VALUES ('7250', '11', '1', '-1062731647', 'category', '40', '操作url：/thinkox4/index.php?s=/admin/category/remove/id/40.html', '1', '1418024906');
INSERT INTO thinkox_action_log VALUES ('7251', '11', '1', '-1062731647', 'category', '41', '操作url：/thinkox4/index.php?s=/admin/category/remove/id/41.html', '1', '1418024908');
INSERT INTO thinkox_action_log VALUES ('7252', '11', '1', '-1062731647', 'category', '2', '操作url：/thinkox4/index.php?s=/admin/category/remove/id/2.html', '1', '1418024925');
INSERT INTO thinkox_action_log VALUES ('7253', '11', '1', '-1062731647', 'category', '1', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1418025925');
INSERT INTO thinkox_action_log VALUES ('7254', '11', '1', '-1062731647', 'category', '1', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1418025934');
INSERT INTO thinkox_action_log VALUES ('7255', '11', '1', '-1062731647', 'category', '45', '操作url：/thinkox4/index.php?s=/admin/category/add.html', '1', '1418026024');
INSERT INTO thinkox_action_log VALUES ('7256', '11', '1', '-1062731647', 'category', '42', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1418026116');
INSERT INTO thinkox_action_log VALUES ('7257', '11', '1', '-1062731647', 'category', '46', '操作url：/thinkox4/index.php?s=/admin/category/add.html', '1', '1418026214');
INSERT INTO thinkox_action_log VALUES ('7258', '11', '1', '-1062731647', 'category', '46', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1418026306');
INSERT INTO thinkox_action_log VALUES ('7259', '11', '1', '-1062731647', 'category', '46', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1418026352');
INSERT INTO thinkox_action_log VALUES ('7260', '11', '1', '-1062731647', 'category', '1', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1418028214');
INSERT INTO thinkox_action_log VALUES ('7261', '11', '1', '-1062731647', 'category', '1', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1418028261');
INSERT INTO thinkox_action_log VALUES ('7262', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-09 09:32登录了后台', '1', '1418088744');
INSERT INTO thinkox_action_log VALUES ('7263', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-09 12:37登录了后台', '1', '1418099841');
INSERT INTO thinkox_action_log VALUES ('7264', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-10 09:32登录了后台', '1', '1418175122');
INSERT INTO thinkox_action_log VALUES ('7265', '15', '1', '0', 'ForumPost', '28', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418177486');
INSERT INTO thinkox_action_log VALUES ('7266', '15', '1', '0', 'ForumPost', '29', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418177521');
INSERT INTO thinkox_action_log VALUES ('7267', '15', '1', '0', 'ForumPost', '30', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418179177');
INSERT INTO thinkox_action_log VALUES ('7268', '15', '1', '0', 'ForumPost', '31', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418179263');
INSERT INTO thinkox_action_log VALUES ('7269', '15', '1', '0', 'ForumPost', '32', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418179269');
INSERT INTO thinkox_action_log VALUES ('7270', '15', '1', '0', 'ForumPost', '33', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418179333');
INSERT INTO thinkox_action_log VALUES ('7271', '15', '1', '0', 'ForumPost', '34', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418179453');
INSERT INTO thinkox_action_log VALUES ('7272', '15', '1', '0', 'ForumPost', '35', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418179467');
INSERT INTO thinkox_action_log VALUES ('7273', '15', '1', '0', 'ForumPost', '36', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418179748');
INSERT INTO thinkox_action_log VALUES ('7274', '15', '1', '0', 'ForumPost', '37', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418179829');
INSERT INTO thinkox_action_log VALUES ('7275', '15', '1', '0', 'ForumPost', '38', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418179839');
INSERT INTO thinkox_action_log VALUES ('7276', '15', '1', '0', 'ForumPost', '39', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418179856');
INSERT INTO thinkox_action_log VALUES ('7277', '15', '1', '0', 'ForumPost', '40', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418179915');
INSERT INTO thinkox_action_log VALUES ('7278', '15', '1', '0', 'ForumPost', '41', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418179935');
INSERT INTO thinkox_action_log VALUES ('7279', '15', '1', '0', 'ForumPost', '42', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418179988');
INSERT INTO thinkox_action_log VALUES ('7280', '15', '1', '0', 'ForumPost', '43', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180022');
INSERT INTO thinkox_action_log VALUES ('7281', '15', '1', '0', 'ForumPost', '44', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180070');
INSERT INTO thinkox_action_log VALUES ('7282', '15', '1', '0', 'ForumPost', '45', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180211');
INSERT INTO thinkox_action_log VALUES ('7283', '15', '1', '0', 'ForumPost', '46', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180232');
INSERT INTO thinkox_action_log VALUES ('7284', '15', '1', '0', 'ForumPost', '47', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180317');
INSERT INTO thinkox_action_log VALUES ('7285', '15', '1', '0', 'ForumPost', '48', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180329');
INSERT INTO thinkox_action_log VALUES ('7286', '15', '1', '0', 'ForumPost', '49', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180352');
INSERT INTO thinkox_action_log VALUES ('7287', '15', '1', '0', 'ForumPost', '50', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180371');
INSERT INTO thinkox_action_log VALUES ('7288', '15', '1', '0', 'ForumPost', '51', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180392');
INSERT INTO thinkox_action_log VALUES ('7289', '15', '1', '0', 'ForumPost', '52', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180399');
INSERT INTO thinkox_action_log VALUES ('7290', '15', '1', '0', 'ForumPost', '53', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180411');
INSERT INTO thinkox_action_log VALUES ('7291', '15', '1', '0', 'ForumPost', '54', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180451');
INSERT INTO thinkox_action_log VALUES ('7292', '15', '1', '0', 'ForumPost', '55', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180540');
INSERT INTO thinkox_action_log VALUES ('7293', '15', '1', '0', 'ForumPost', '56', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180608');
INSERT INTO thinkox_action_log VALUES ('7294', '15', '1', '0', 'ForumPost', '57', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180661');
INSERT INTO thinkox_action_log VALUES ('7295', '15', '1', '0', 'ForumPost', '58', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180675');
INSERT INTO thinkox_action_log VALUES ('7296', '15', '1', '0', 'ForumPost', '59', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180828');
INSERT INTO thinkox_action_log VALUES ('7297', '15', '1', '0', 'ForumPost', '60', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180919');
INSERT INTO thinkox_action_log VALUES ('7298', '15', '1', '0', 'ForumPost', '61', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418180934');
INSERT INTO thinkox_action_log VALUES ('7299', '15', '1', '0', 'ForumPost', '62', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418181010');
INSERT INTO thinkox_action_log VALUES ('7300', '15', '1', '0', 'ForumPost', '63', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418181090');
INSERT INTO thinkox_action_log VALUES ('7301', '15', '1', '0', 'ForumPost', '64', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418181129');
INSERT INTO thinkox_action_log VALUES ('7302', '15', '1', '0', 'ForumPost', '65', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418181144');
INSERT INTO thinkox_action_log VALUES ('7303', '15', '1', '0', 'ForumPost', '66', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418181310');
INSERT INTO thinkox_action_log VALUES ('7304', '15', '1', '0', 'ForumPost', '67', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418181343');
INSERT INTO thinkox_action_log VALUES ('7305', '15', '1', '0', 'ForumPost', '68', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418181394');
INSERT INTO thinkox_action_log VALUES ('7306', '15', '1', '0', 'ForumPost', '69', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418181454');
INSERT INTO thinkox_action_log VALUES ('7307', '15', '1', '0', 'ForumPost', '70', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418181541');
INSERT INTO thinkox_action_log VALUES ('7308', '15', '1', '0', 'ForumPost', '71', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418181745');
INSERT INTO thinkox_action_log VALUES ('7309', '15', '1', '0', 'ForumPost', '72', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418181799');
INSERT INTO thinkox_action_log VALUES ('7310', '15', '1', '0', 'ForumPost', '73', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418182034');
INSERT INTO thinkox_action_log VALUES ('7311', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-10 13:57登录了后台', '1', '1418191041');
INSERT INTO thinkox_action_log VALUES ('7312', '15', '1', '-1062731647', 'ForumPost', '74', '操作url：/thinkox4/index.php?s=/forum/index/doedit.html', '1', '1418191140');
INSERT INTO thinkox_action_log VALUES ('7313', '15', '1', '-1062731647', 'ForumPost', '75', '操作url：/thinkox4/index.php?s=/forum/index/doedit.html', '1', '1418193090');
INSERT INTO thinkox_action_log VALUES ('7314', '15', '1', '-1062731647', 'ForumPost', '76', '操作url：/thinkox4/index.php?s=/forum/index/doedit.html', '1', '1418193156');
INSERT INTO thinkox_action_log VALUES ('7315', '15', '1', '-1062731647', 'ForumPost', '77', '操作url：/thinkox4/index.php?s=/forum/index/doedit.html', '1', '1418193554');
INSERT INTO thinkox_action_log VALUES ('7316', '15', '1', '-1062731647', 'ForumPost', '78', '操作url：/thinkox4/index.php?s=/forum/index/doedit.html', '1', '1418193609');
INSERT INTO thinkox_action_log VALUES ('7406', '1', '61', '-1062731647', 'member', '61', 'ceshi2在2014-12-11 14:37登录了后台', '1', '1418279827');
INSERT INTO thinkox_action_log VALUES ('7318', '1', '62', '-1062731647', 'member', '62', 'ceshi3在2014-12-10 15:36登录了后台', '1', '1418196991');
INSERT INTO thinkox_action_log VALUES ('7319', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-10 15:37登录了后台', '1', '1418197030');
INSERT INTO thinkox_action_log VALUES ('7320', '1', '62', '-1062731647', 'member', '62', 'ceshi3在2014-12-10 15:37登录了后台', '1', '1418197051');
INSERT INTO thinkox_action_log VALUES ('7321', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-10 16:02登录了后台', '1', '1418198565');
INSERT INTO thinkox_action_log VALUES ('7322', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-10 16:03登录了后台', '1', '1418198619');
INSERT INTO thinkox_action_log VALUES ('7323', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-10 16:04登录了后台', '1', '1418198655');
INSERT INTO thinkox_action_log VALUES ('7324', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 09:58登录了后台', '1', '1418263139');
INSERT INTO thinkox_action_log VALUES ('7325', '15', '1', '0', 'ForumPost', '79', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418273221');
INSERT INTO thinkox_action_log VALUES ('7326', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 12:58登录了后台', '1', '1418273924');
INSERT INTO thinkox_action_log VALUES ('7327', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 12:59登录了后台', '1', '1418273946');
INSERT INTO thinkox_action_log VALUES ('7328', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 12:59登录了后台', '1', '1418273956');
INSERT INTO thinkox_action_log VALUES ('7329', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:46登录了后台', '1', '1418276804');
INSERT INTO thinkox_action_log VALUES ('7330', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:46登录了后台', '1', '1418276817');
INSERT INTO thinkox_action_log VALUES ('7331', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:48登录了后台', '1', '1418276937');
INSERT INTO thinkox_action_log VALUES ('7332', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:48登录了后台', '1', '1418276937');
INSERT INTO thinkox_action_log VALUES ('7333', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:49登录了后台', '1', '1418276958');
INSERT INTO thinkox_action_log VALUES ('7334', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:49登录了后台', '1', '1418276958');
INSERT INTO thinkox_action_log VALUES ('7335', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:49登录了后台', '1', '1418276972');
INSERT INTO thinkox_action_log VALUES ('7336', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:49登录了后台', '1', '1418276972');
INSERT INTO thinkox_action_log VALUES ('7337', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:50登录了后台', '1', '1418277003');
INSERT INTO thinkox_action_log VALUES ('7338', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:50登录了后台', '1', '1418277003');
INSERT INTO thinkox_action_log VALUES ('7339', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:50登录了后台', '1', '1418277017');
INSERT INTO thinkox_action_log VALUES ('7340', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:50登录了后台', '1', '1418277017');
INSERT INTO thinkox_action_log VALUES ('7341', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:56登录了后台', '1', '1418277379');
INSERT INTO thinkox_action_log VALUES ('7342', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:56登录了后台', '1', '1418277379');
INSERT INTO thinkox_action_log VALUES ('7343', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:58登录了后台', '1', '1418277504');
INSERT INTO thinkox_action_log VALUES ('7344', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:58登录了后台', '1', '1418277504');
INSERT INTO thinkox_action_log VALUES ('7345', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:59登录了后台', '1', '1418277549');
INSERT INTO thinkox_action_log VALUES ('7346', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:59登录了后台', '1', '1418277549');
INSERT INTO thinkox_action_log VALUES ('7347', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:59登录了后台', '1', '1418277571');
INSERT INTO thinkox_action_log VALUES ('7348', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 13:59登录了后台', '1', '1418277571');
INSERT INTO thinkox_action_log VALUES ('7349', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:01登录了后台', '1', '1418277661');
INSERT INTO thinkox_action_log VALUES ('7350', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:01登录了后台', '1', '1418277661');
INSERT INTO thinkox_action_log VALUES ('7351', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:01登录了后台', '1', '1418277686');
INSERT INTO thinkox_action_log VALUES ('7352', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:01登录了后台', '1', '1418277686');
INSERT INTO thinkox_action_log VALUES ('7353', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:03登录了后台', '1', '1418277828');
INSERT INTO thinkox_action_log VALUES ('7354', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:03登录了后台', '1', '1418277828');
INSERT INTO thinkox_action_log VALUES ('7355', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:04登录了后台', '1', '1418277847');
INSERT INTO thinkox_action_log VALUES ('7356', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:04登录了后台', '1', '1418277847');
INSERT INTO thinkox_action_log VALUES ('7357', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:04登录了后台', '1', '1418277854');
INSERT INTO thinkox_action_log VALUES ('7358', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:04登录了后台', '1', '1418277854');
INSERT INTO thinkox_action_log VALUES ('7359', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:04登录了后台', '1', '1418277856');
INSERT INTO thinkox_action_log VALUES ('7360', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:04登录了后台', '1', '1418277856');
INSERT INTO thinkox_action_log VALUES ('7361', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:04登录了后台', '1', '1418277887');
INSERT INTO thinkox_action_log VALUES ('7362', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:04登录了后台', '1', '1418277887');
INSERT INTO thinkox_action_log VALUES ('7363', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:05登录了后台', '1', '1418277908');
INSERT INTO thinkox_action_log VALUES ('7364', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:05登录了后台', '1', '1418277908');
INSERT INTO thinkox_action_log VALUES ('7365', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:08登录了后台', '1', '1418278137');
INSERT INTO thinkox_action_log VALUES ('7366', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:08登录了后台', '1', '1418278137');
INSERT INTO thinkox_action_log VALUES ('7367', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:09登录了后台', '1', '1418278140');
INSERT INTO thinkox_action_log VALUES ('7368', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:09登录了后台', '1', '1418278140');
INSERT INTO thinkox_action_log VALUES ('7369', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:09登录了后台', '1', '1418278156');
INSERT INTO thinkox_action_log VALUES ('7370', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:09登录了后台', '1', '1418278156');
INSERT INTO thinkox_action_log VALUES ('7371', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:10登录了后台', '1', '1418278214');
INSERT INTO thinkox_action_log VALUES ('7372', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:10登录了后台', '1', '1418278214');
INSERT INTO thinkox_action_log VALUES ('7373', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:11登录了后台', '1', '1418278261');
INSERT INTO thinkox_action_log VALUES ('7374', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:11登录了后台', '1', '1418278261');
INSERT INTO thinkox_action_log VALUES ('7375', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:11登录了后台', '1', '1418278277');
INSERT INTO thinkox_action_log VALUES ('7376', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:11登录了后台', '1', '1418278277');
INSERT INTO thinkox_action_log VALUES ('7377', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:13登录了后台', '1', '1418278421');
INSERT INTO thinkox_action_log VALUES ('7378', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:13登录了后台', '1', '1418278421');
INSERT INTO thinkox_action_log VALUES ('7379', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:14登录了后台', '1', '1418278467');
INSERT INTO thinkox_action_log VALUES ('7380', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:14登录了后台', '1', '1418278467');
INSERT INTO thinkox_action_log VALUES ('7381', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:14登录了后台', '1', '1418278469');
INSERT INTO thinkox_action_log VALUES ('7382', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:14登录了后台', '1', '1418278469');
INSERT INTO thinkox_action_log VALUES ('7383', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:14登录了后台', '1', '1418278487');
INSERT INTO thinkox_action_log VALUES ('7384', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:14登录了后台', '1', '1418278487');
INSERT INTO thinkox_action_log VALUES ('7385', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:14登录了后台', '1', '1418278489');
INSERT INTO thinkox_action_log VALUES ('7386', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:14登录了后台', '1', '1418278489');
INSERT INTO thinkox_action_log VALUES ('7387', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:15登录了后台', '1', '1418278521');
INSERT INTO thinkox_action_log VALUES ('7388', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:15登录了后台', '1', '1418278521');
INSERT INTO thinkox_action_log VALUES ('7389', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:15登录了后台', '1', '1418278525');
INSERT INTO thinkox_action_log VALUES ('7390', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:15登录了后台', '1', '1418278525');
INSERT INTO thinkox_action_log VALUES ('7391', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:16登录了后台', '1', '1418278599');
INSERT INTO thinkox_action_log VALUES ('7392', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:16登录了后台', '1', '1418278599');
INSERT INTO thinkox_action_log VALUES ('7393', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:16登录了后台', '1', '1418278605');
INSERT INTO thinkox_action_log VALUES ('7394', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:16登录了后台', '1', '1418278605');
INSERT INTO thinkox_action_log VALUES ('7395', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:17登录了后台', '1', '1418278636');
INSERT INTO thinkox_action_log VALUES ('7396', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:17登录了后台', '1', '1418278662');
INSERT INTO thinkox_action_log VALUES ('7397', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:17登录了后台', '1', '1418278667');
INSERT INTO thinkox_action_log VALUES ('7398', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:17登录了后台', '1', '1418278673');
INSERT INTO thinkox_action_log VALUES ('7399', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:17登录了后台', '1', '1418278674');
INSERT INTO thinkox_action_log VALUES ('7400', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 14:27登录了后台', '1', '1418279226');
INSERT INTO thinkox_action_log VALUES ('7401', '16', '63', '-1062731647', 'ForumPostReply', '13', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1418279516');
INSERT INTO thinkox_action_log VALUES ('7402', '1', '62', '-1062731647', 'member', '62', 'ceshi3在2014-12-11 14:33登录了后台', '1', '1418279594');
INSERT INTO thinkox_action_log VALUES ('7407', '1', '61', '-1062731647', 'member', '61', 'ceshi2在2014-12-11 14:38登录了后台', '1', '1418279882');
INSERT INTO thinkox_action_log VALUES ('7408', '1', '61', '-1062731647', 'member', '61', 'ceshi2在2014-12-11 14:38登录了后台', '1', '1418279924');
INSERT INTO thinkox_action_log VALUES ('7409', '1', '61', '-1062731647', 'member', '61', 'ceshi2在2014-12-11 14:38登录了后台', '1', '1418279927');
INSERT INTO thinkox_action_log VALUES ('7410', '1', '61', '-1062731647', 'member', '61', 'ceshi2在2014-12-11 14:40登录了后台', '1', '1418280021');
INSERT INTO thinkox_action_log VALUES ('7411', '1', '61', '-1062731647', 'member', '61', 'ceshi2在2014-12-11 14:40登录了后台', '1', '1418280032');
INSERT INTO thinkox_action_log VALUES ('7412', '1', '61', '-1062731647', 'member', '61', 'ceshi2在2014-12-11 14:40登录了后台', '1', '1418280051');
INSERT INTO thinkox_action_log VALUES ('7413', '1', '61', '-1062731647', 'member', '61', 'ceshi2在2014-12-11 14:40登录了后台', '1', '1418280052');
INSERT INTO thinkox_action_log VALUES ('7414', '1', '61', '-1062731647', 'member', '61', 'ceshi2在2014-12-11 14:40登录了后台', '1', '1418280053');
INSERT INTO thinkox_action_log VALUES ('7415', '1', '61', '-1062731647', 'member', '61', 'ceshi2在2014-12-11 14:40登录了后台', '1', '1418280054');
INSERT INTO thinkox_action_log VALUES ('7416', '1', '61', '-1062731647', 'member', '61', 'ceshi2在2014-12-11 14:40登录了后台', '1', '1418280055');
INSERT INTO thinkox_action_log VALUES ('7417', '1', '61', '-1062731647', 'member', '61', 'ceshi2在2014-12-11 14:40登录了后台', '1', '1418280056');
INSERT INTO thinkox_action_log VALUES ('7418', '1', '61', '-1062731647', 'member', '61', 'ceshi2在2014-12-11 14:42登录了后台', '1', '1418280130');
INSERT INTO thinkox_action_log VALUES ('7419', '1', '61', '-1062731647', 'member', '61', 'ceshi2在2014-12-11 14:43登录了后台', '1', '1418280234');
INSERT INTO thinkox_action_log VALUES ('7420', '15', '1', '0', 'ForumPost', '80', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418280329');
INSERT INTO thinkox_action_log VALUES ('7421', '15', '1', '0', 'ForumPost', '81', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418280389');
INSERT INTO thinkox_action_log VALUES ('7422', '15', '1', '0', 'ForumPost', '82', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418280423');
INSERT INTO thinkox_action_log VALUES ('7423', '15', '1', '0', 'ForumPost', '83', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418280660');
INSERT INTO thinkox_action_log VALUES ('7424', '15', '1', '0', 'ForumPost', '84', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418280712');
INSERT INTO thinkox_action_log VALUES ('7425', '15', '1', '0', 'ForumPost', '85', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418280716');
INSERT INTO thinkox_action_log VALUES ('7426', '15', '1', '0', 'ForumPost', '86', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418280732');
INSERT INTO thinkox_action_log VALUES ('7427', '15', '1', '0', 'ForumPost', '87', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418280760');
INSERT INTO thinkox_action_log VALUES ('7428', '15', '1', '0', 'ForumPost', '88', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418281042');
INSERT INTO thinkox_action_log VALUES ('7429', '15', '63', '0', 'ForumPost', '89', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418281068');
INSERT INTO thinkox_action_log VALUES ('7430', '15', '63', '0', 'ForumPost', '90', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418281088');
INSERT INTO thinkox_action_log VALUES ('7431', '15', '63', '0', 'ForumPost', '91', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418281104');
INSERT INTO thinkox_action_log VALUES ('7432', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:00登录了后台', '1', '1418281206');
INSERT INTO thinkox_action_log VALUES ('7433', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:01登录了后台', '1', '1418281281');
INSERT INTO thinkox_action_log VALUES ('7434', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283141');
INSERT INTO thinkox_action_log VALUES ('7435', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283143');
INSERT INTO thinkox_action_log VALUES ('7436', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283144');
INSERT INTO thinkox_action_log VALUES ('7437', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283144');
INSERT INTO thinkox_action_log VALUES ('7438', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283145');
INSERT INTO thinkox_action_log VALUES ('7439', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283145');
INSERT INTO thinkox_action_log VALUES ('7440', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283145');
INSERT INTO thinkox_action_log VALUES ('7441', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283146');
INSERT INTO thinkox_action_log VALUES ('7442', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283146');
INSERT INTO thinkox_action_log VALUES ('7443', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283146');
INSERT INTO thinkox_action_log VALUES ('7444', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283147');
INSERT INTO thinkox_action_log VALUES ('7445', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283147');
INSERT INTO thinkox_action_log VALUES ('7446', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283147');
INSERT INTO thinkox_action_log VALUES ('7447', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283147');
INSERT INTO thinkox_action_log VALUES ('7448', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283147');
INSERT INTO thinkox_action_log VALUES ('7449', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283147');
INSERT INTO thinkox_action_log VALUES ('7450', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283148');
INSERT INTO thinkox_action_log VALUES ('7451', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 15:32登录了后台', '1', '1418283148');
INSERT INTO thinkox_action_log VALUES ('7452', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283151');
INSERT INTO thinkox_action_log VALUES ('7453', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283153');
INSERT INTO thinkox_action_log VALUES ('7454', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283154');
INSERT INTO thinkox_action_log VALUES ('7455', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283154');
INSERT INTO thinkox_action_log VALUES ('7456', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283155');
INSERT INTO thinkox_action_log VALUES ('7457', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283159');
INSERT INTO thinkox_action_log VALUES ('7458', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283159');
INSERT INTO thinkox_action_log VALUES ('7459', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283160');
INSERT INTO thinkox_action_log VALUES ('7460', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283160');
INSERT INTO thinkox_action_log VALUES ('7461', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283160');
INSERT INTO thinkox_action_log VALUES ('7462', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283160');
INSERT INTO thinkox_action_log VALUES ('7463', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283160');
INSERT INTO thinkox_action_log VALUES ('7464', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283161');
INSERT INTO thinkox_action_log VALUES ('7465', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283161');
INSERT INTO thinkox_action_log VALUES ('7466', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283161');
INSERT INTO thinkox_action_log VALUES ('7467', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283162');
INSERT INTO thinkox_action_log VALUES ('7468', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283162');
INSERT INTO thinkox_action_log VALUES ('7469', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283162');
INSERT INTO thinkox_action_log VALUES ('7470', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283163');
INSERT INTO thinkox_action_log VALUES ('7471', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:32登录了后台', '1', '1418283163');
INSERT INTO thinkox_action_log VALUES ('7472', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:35登录了后台', '1', '1418283308');
INSERT INTO thinkox_action_log VALUES ('7473', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:36登录了后台', '1', '1418283390');
INSERT INTO thinkox_action_log VALUES ('7474', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:36登录了后台', '1', '1418283392');
INSERT INTO thinkox_action_log VALUES ('7475', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:36登录了后台', '1', '1418283393');
INSERT INTO thinkox_action_log VALUES ('7476', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:36登录了后台', '1', '1418283394');
INSERT INTO thinkox_action_log VALUES ('7477', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:36登录了后台', '1', '1418283394');
INSERT INTO thinkox_action_log VALUES ('7478', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:36登录了后台', '1', '1418283394');
INSERT INTO thinkox_action_log VALUES ('7479', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:36登录了后台', '1', '1418283395');
INSERT INTO thinkox_action_log VALUES ('7480', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:36登录了后台', '1', '1418283395');
INSERT INTO thinkox_action_log VALUES ('7481', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:36登录了后台', '1', '1418283395');
INSERT INTO thinkox_action_log VALUES ('7482', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:36登录了后台', '1', '1418283395');
INSERT INTO thinkox_action_log VALUES ('7483', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:36登录了后台', '1', '1418283396');
INSERT INTO thinkox_action_log VALUES ('7484', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:37登录了后台', '1', '1418283433');
INSERT INTO thinkox_action_log VALUES ('7485', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:37登录了后台', '1', '1418283435');
INSERT INTO thinkox_action_log VALUES ('7486', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:37登录了后台', '1', '1418283435');
INSERT INTO thinkox_action_log VALUES ('7487', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:41登录了后台', '1', '1418283701');
INSERT INTO thinkox_action_log VALUES ('7488', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:41登录了后台', '1', '1418283703');
INSERT INTO thinkox_action_log VALUES ('7489', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:41登录了后台', '1', '1418283703');
INSERT INTO thinkox_action_log VALUES ('7490', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:41登录了后台', '1', '1418283704');
INSERT INTO thinkox_action_log VALUES ('7491', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:41登录了后台', '1', '1418283705');
INSERT INTO thinkox_action_log VALUES ('7492', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:41登录了后台', '1', '1418283705');
INSERT INTO thinkox_action_log VALUES ('7493', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:41登录了后台', '1', '1418283705');
INSERT INTO thinkox_action_log VALUES ('7494', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:41登录了后台', '1', '1418283706');
INSERT INTO thinkox_action_log VALUES ('7495', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:41登录了后台', '1', '1418283706');
INSERT INTO thinkox_action_log VALUES ('7496', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:41登录了后台', '1', '1418283707');
INSERT INTO thinkox_action_log VALUES ('7497', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:41登录了后台', '1', '1418283707');
INSERT INTO thinkox_action_log VALUES ('7498', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:41登录了后台', '1', '1418283708');
INSERT INTO thinkox_action_log VALUES ('7499', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:41登录了后台', '1', '1418283708');
INSERT INTO thinkox_action_log VALUES ('7500', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:41登录了后台', '1', '1418283708');
INSERT INTO thinkox_action_log VALUES ('7501', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:42登录了后台', '1', '1418283750');
INSERT INTO thinkox_action_log VALUES ('7502', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:45登录了后台', '1', '1418283942');
INSERT INTO thinkox_action_log VALUES ('7503', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:45登录了后台', '1', '1418283943');
INSERT INTO thinkox_action_log VALUES ('7504', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:45登录了后台', '1', '1418283943');
INSERT INTO thinkox_action_log VALUES ('7505', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:45登录了后台', '1', '1418283943');
INSERT INTO thinkox_action_log VALUES ('7506', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:45登录了后台', '1', '1418283944');
INSERT INTO thinkox_action_log VALUES ('7507', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:45登录了后台', '1', '1418283944');
INSERT INTO thinkox_action_log VALUES ('7508', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:45登录了后台', '1', '1418283944');
INSERT INTO thinkox_action_log VALUES ('7509', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:45登录了后台', '1', '1418283944');
INSERT INTO thinkox_action_log VALUES ('7510', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:45登录了后台', '1', '1418283945');
INSERT INTO thinkox_action_log VALUES ('7511', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:45登录了后台', '1', '1418283945');
INSERT INTO thinkox_action_log VALUES ('7512', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:45登录了后台', '1', '1418283945');
INSERT INTO thinkox_action_log VALUES ('7513', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:47登录了后台', '1', '1418284076');
INSERT INTO thinkox_action_log VALUES ('7514', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:47登录了后台', '1', '1418284078');
INSERT INTO thinkox_action_log VALUES ('7515', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:55登录了后台', '1', '1418284503');
INSERT INTO thinkox_action_log VALUES ('7516', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:55登录了后台', '1', '1418284534');
INSERT INTO thinkox_action_log VALUES ('7517', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:56登录了后台', '1', '1418284600');
INSERT INTO thinkox_action_log VALUES ('7518', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 15:56登录了后台', '1', '1418284607');
INSERT INTO thinkox_action_log VALUES ('7519', '1', '59', '-1062731644', 'member', '59', 'xxxx在2014-12-11 15:58登录了后台', '1', '1418284724');
INSERT INTO thinkox_action_log VALUES ('7520', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 16:00登录了后台', '1', '1418284831');
INSERT INTO thinkox_action_log VALUES ('7521', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 16:00登录了后台', '1', '1418284849');
INSERT INTO thinkox_action_log VALUES ('7522', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 16:01登录了后台', '1', '1418284865');
INSERT INTO thinkox_action_log VALUES ('7523', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 16:01登录了后台', '1', '1418284871');
INSERT INTO thinkox_action_log VALUES ('7524', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 16:07登录了后台', '1', '1418285229');
INSERT INTO thinkox_action_log VALUES ('7525', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 16:07登录了后台', '1', '1418285238');
INSERT INTO thinkox_action_log VALUES ('7526', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 16:07登录了后台', '1', '1418285274');
INSERT INTO thinkox_action_log VALUES ('7527', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 16:09登录了后台', '1', '1418285340');
INSERT INTO thinkox_action_log VALUES ('7528', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 16:09登录了后台', '1', '1418285386');
INSERT INTO thinkox_action_log VALUES ('7529', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 16:10登录了后台', '1', '1418285434');
INSERT INTO thinkox_action_log VALUES ('7530', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 16:11登录了后台', '1', '1418285468');
INSERT INTO thinkox_action_log VALUES ('7531', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 16:11登录了后台', '1', '1418285486');
INSERT INTO thinkox_action_log VALUES ('7532', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 16:12登录了后台', '1', '1418285527');
INSERT INTO thinkox_action_log VALUES ('7533', '1', '64', '-1062731647', 'member', '64', 'heiguang在2014-12-11 16:15登录了后台', '1', '1418285713');
INSERT INTO thinkox_action_log VALUES ('7534', '15', '64', '-1062731647', 'ForumPost', '92', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418286198');
INSERT INTO thinkox_action_log VALUES ('7535', '15', '64', '-1062731647', 'ForumPost', '93', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418286302');
INSERT INTO thinkox_action_log VALUES ('7536', '15', '1', '-1062731647', 'ForumPost', '94', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418286471');
INSERT INTO thinkox_action_log VALUES ('7537', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 16:36登录了后台', '1', '1418286994');
INSERT INTO thinkox_action_log VALUES ('7538', '10', '1', '-1062731647', 'Menu', '93', '操作url：/thinkox4/index.php?s=/admin/menu/edit.html', '1', '1418287460');
INSERT INTO thinkox_action_log VALUES ('7539', '10', '1', '-1062731647', 'Menu', '93', '操作url：/thinkox4/index.php?s=/admin/menu/edit.html', '1', '1418287480');
INSERT INTO thinkox_action_log VALUES ('7540', '10', '1', '-1062731647', 'Menu', '2235', '操作url：/thinkox4/index.php?s=/admin/menu/add.html', '1', '1418287822');
INSERT INTO thinkox_action_log VALUES ('7541', '10', '1', '-1062731647', 'Menu', '2235', '操作url：/thinkox4/index.php?s=/admin/menu/edit.html', '1', '1418287835');
INSERT INTO thinkox_action_log VALUES ('7542', '10', '1', '-1062731647', 'Menu', '2236', '操作url：/thinkox4/index.php?s=/admin/menu/add.html', '1', '1418288142');
INSERT INTO thinkox_action_log VALUES ('7543', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-11 17:29登录了后台', '1', '1418290167');
INSERT INTO thinkox_action_log VALUES ('7544', '1', '63', '-1062731647', 'member', '63', 'ceshi4在2014-12-11 17:30登录了后台', '1', '1418290203');
INSERT INTO thinkox_action_log VALUES ('7545', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-12 09:34登录了后台', '1', '1418348071');
INSERT INTO thinkox_action_log VALUES ('7546', '1', '59', '-1062731603', 'member', '59', 'xxxx在2014-12-12 10:23登录了后台', '1', '1418351015');
INSERT INTO thinkox_action_log VALUES ('7547', '1', '59', '-1062731603', 'member', '59', 'xxxx在2014-12-12 10:47登录了后台', '1', '1418352460');
INSERT INTO thinkox_action_log VALUES ('7548', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-12 10:52登录了后台', '1', '1418352771');
INSERT INTO thinkox_action_log VALUES ('7549', '1', '59', '-1062731603', 'member', '59', 'xxxx在2014-12-12 13:19登录了后台', '1', '1418361547');
INSERT INTO thinkox_action_log VALUES ('7550', '1', '59', '-1062731603', 'member', '59', 'xxxx在2014-12-12 13:33登录了后台', '1', '1418362400');
INSERT INTO thinkox_action_log VALUES ('7551', '1', '59', '-1062731603', 'member', '59', 'xxxx在2014-12-12 13:34登录了后台', '1', '1418362470');
INSERT INTO thinkox_action_log VALUES ('7552', '1', '59', '-1062731644', 'member', '59', 'xxxx在2014-12-12 13:45登录了后台', '1', '1418363105');
INSERT INTO thinkox_action_log VALUES ('7553', '16', '0', '-1062731644', 'ForumPostReply', '14', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1418364002');
INSERT INTO thinkox_action_log VALUES ('7554', '15', '59', '-1062731603', 'ForumPost', '80', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418366551');
INSERT INTO thinkox_action_log VALUES ('7555', '16', '0', '-1062731644', 'ForumPostReply', '15', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1418370550');
INSERT INTO thinkox_action_log VALUES ('7556', '15', '59', '-1062731644', 'ForumPost', '81', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1418372751');
INSERT INTO thinkox_action_log VALUES ('7557', '16', '0', '-1062731644', 'ForumPostReply', '16', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1418373499');
INSERT INTO thinkox_action_log VALUES ('7558', '10', '1', '-1062731647', 'Menu', '2235', '操作url：/thinkox4/index.php?s=/admin/menu/edit.html', '1', '1418378371');
INSERT INTO thinkox_action_log VALUES ('7559', '10', '1', '-1062731647', 'Menu', '2237', '操作url：/thinkox4/index.php?s=/admin/menu/add.html', '1', '1418380749');
INSERT INTO thinkox_action_log VALUES ('7560', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-15 10:04登录了后台', '1', '1418609075');
INSERT INTO thinkox_action_log VALUES ('7561', '1', '65', '-1062731647', 'member', '65', 'display在2014-12-16 11:47登录了后台', '1', '1418701657');
INSERT INTO thinkox_action_log VALUES ('7562', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-16 11:55登录了后台', '1', '1418702126');
INSERT INTO thinkox_action_log VALUES ('7563', '11', '1', '-1062731647', 'category', '47', '操作url：/thinkox4/index.php?s=/admin/category/add.html', '1', '1418702261');
INSERT INTO thinkox_action_log VALUES ('7564', '1', '1', '-1062731647', 'member', '1', 'admin在2014-12-16 12:50登录了后台', '1', '1418705432');
INSERT INTO thinkox_action_log VALUES ('7565', '1', '1', '-1062731647', 'member', '1', '超级管理员在2014-12-16 13:39登录了后台', '1', '1418708371');
INSERT INTO thinkox_action_log VALUES ('7566', '1', '65', '-1062731647', 'member', '65', 'display-none在2014-12-16 13:39登录了后台', '1', '1418708381');
INSERT INTO thinkox_action_log VALUES ('7567', '1', '65', '-1062731647', 'member', '65', 'display-none在2014-12-16 13:46登录了后台', '1', '1418708803');
INSERT INTO thinkox_action_log VALUES ('7568', '1', '65', '-1062731647', 'member', '65', 'display-none在2014-12-16 13:48登录了后台', '1', '1418708892');
INSERT INTO thinkox_action_log VALUES ('7569', '1', '1', '-1062731647', 'member', '1', '超级管理员在2014-12-17 09:31登录了后台', '1', '1418779865');
INSERT INTO thinkox_action_log VALUES ('7570', '1', '1', '0', 'member', '1', '超级管理员在2014-12-18 10:47登录了后台', '1', '1418870861');
INSERT INTO thinkox_action_log VALUES ('7571', '10', '1', '0', 'Menu', '2241', '操作url：/thinkox4/index.php?s=/admin/menu/add.html', '1', '1418885557');
INSERT INTO thinkox_action_log VALUES ('7572', '10', '1', '0', 'Menu', '2242', '操作url：/thinkox4/index.php?s=/admin/menu/add.html', '1', '1418894927');
INSERT INTO thinkox_action_log VALUES ('7573', '1', '1', '0', 'member', '1', '超级管理员在2014-12-19 11:40登录了后台', '1', '1418960401');
INSERT INTO thinkox_action_log VALUES ('7574', '1', '66', '-1062731647', 'member', '66', 'admin1在2014-12-19 14:01登录了后台', '1', '1418968904');
INSERT INTO thinkox_action_log VALUES ('7575', '1', '67', '-1062731647', 'member', '67', 'admin@在2014-12-19 14:25登录了后台', '1', '1418970353');
INSERT INTO thinkox_action_log VALUES ('7576', '1', '68', '-1062731647', 'member', '68', 'admin-@qq.com在2014-12-19 14:35登录了后台', '1', '1418970911');
INSERT INTO thinkox_action_log VALUES ('7577', '1', '69', '-1062731647', 'member', '69', 'wocao123在2014-12-19 15:16登录了后台', '1', '1418973384');
INSERT INTO thinkox_action_log VALUES ('7578', '1', '70', '-1062731647', 'member', '70', 'king123在2014-12-19 15:58登录了后台', '1', '1418975905');
INSERT INTO thinkox_action_log VALUES ('7579', '1', '70', '-1062731647', 'member', '70', 'king123在2014-12-19 15:58登录了后台', '1', '1418975924');
INSERT INTO thinkox_action_log VALUES ('7580', '1', '70', '-1062731647', 'member', '70', 'king123在2014-12-19 16:11登录了后台', '1', '1418976703');
INSERT INTO thinkox_action_log VALUES ('7581', '1', '1', '0', 'member', '1', '超级管理员在2014-12-20 10:19登录了后台', '1', '1419041952');
INSERT INTO thinkox_action_log VALUES ('7582', '1', '1', '0', 'member', '1', '超级管理员在2014-12-20 11:32登录了后台', '1', '1419046373');
INSERT INTO thinkox_action_log VALUES ('7583', '10', '1', '0', 'Menu', '2243', '操作url：/thinkox4/index.php?s=/admin/menu/add.html', '1', '1419046449');
INSERT INTO thinkox_action_log VALUES ('7584', '1', '1', '0', 'member', '1', '超级管理员在2014-12-20 14:42登录了后台', '1', '1419057736');
INSERT INTO thinkox_action_log VALUES ('7585', '11', '1', '0', 'category', '42', '操作url：/thinkox4/index.php?s=/admin/category/remove/id/42.html', '1', '1419064564');
INSERT INTO thinkox_action_log VALUES ('7586', '11', '1', '0', 'category', '47', '操作url：/thinkox4/index.php?s=/admin/category/remove/id/47.html', '1', '1419064569');
INSERT INTO thinkox_action_log VALUES ('7587', '11', '1', '0', 'category', '47', '操作url：/thinkox4/index.php?s=/admin/category/remove/id/47.html', '1', '1419064572');
INSERT INTO thinkox_action_log VALUES ('7588', '11', '1', '0', 'category', '45', '操作url：/thinkox4/index.php?s=/admin/category/remove/id/45.html', '1', '1419064577');
INSERT INTO thinkox_action_log VALUES ('7589', '11', '1', '0', 'category', '1', '操作url：/thinkox4/index.php?s=/admin/category/remove/id/1.html', '1', '1419064579');
INSERT INTO thinkox_action_log VALUES ('7590', '11', '1', '0', 'category', '46', '操作url：/thinkox4/index.php?s=/admin/category/remove/id/46.html', '1', '1419064582');
INSERT INTO thinkox_action_log VALUES ('7591', '7', '1', '0', 'model', '3', '操作url：/thinkox4/index.php?s=/admin/model/update.html', '1', '1419064630');
INSERT INTO thinkox_action_log VALUES ('7592', '11', '1', '0', 'category', '48', '操作url：/thinkox4/index.php?s=/admin/category/add.html', '1', '1419064824');
INSERT INTO thinkox_action_log VALUES ('7593', '11', '1', '0', 'category', '48', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1419065334');
INSERT INTO thinkox_action_log VALUES ('7594', '11', '1', '0', 'category', '48', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1419065395');
INSERT INTO thinkox_action_log VALUES ('7595', '11', '1', '0', 'category', '48', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1419065423');
INSERT INTO thinkox_action_log VALUES ('7596', '11', '1', '0', 'category', '49', '操作url：/thinkox4/index.php?s=/admin/category/add.html', '1', '1419065534');
INSERT INTO thinkox_action_log VALUES ('7597', '11', '1', '0', 'category', '50', '操作url：/thinkox4/index.php?s=/admin/category/add.html', '1', '1419065558');
INSERT INTO thinkox_action_log VALUES ('7598', '11', '1', '0', 'category', '51', '操作url：/thinkox4/index.php?s=/admin/category/add.html', '1', '1419065578');
INSERT INTO thinkox_action_log VALUES ('7599', '11', '1', '0', 'category', '52', '操作url：/thinkox4/index.php?s=/admin/category/add.html', '1', '1419065599');
INSERT INTO thinkox_action_log VALUES ('7600', '11', '1', '0', 'category', '50', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1419065858');
INSERT INTO thinkox_action_log VALUES ('7601', '8', '1', '0', 'attribute', '34', '操作url：/thinkox4/index.php?s=/admin/attribute/update.html', '1', '1419066077');
INSERT INTO thinkox_action_log VALUES ('7602', '11', '1', '0', 'category', '52', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1419067108');
INSERT INTO thinkox_action_log VALUES ('7603', '11', '1', '0', 'category', '51', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1419067115');
INSERT INTO thinkox_action_log VALUES ('7604', '11', '1', '0', 'category', '48', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1419067122');
INSERT INTO thinkox_action_log VALUES ('7605', '11', '1', '0', 'category', '49', '操作url：/thinkox4/index.php?s=/admin/category/edit.html', '1', '1419067128');
INSERT INTO thinkox_action_log VALUES ('7606', '1', '1', '0', 'member', '1', '超级管理员在2014-12-22 09:55登录了后台', '1', '1419213317');
INSERT INTO thinkox_action_log VALUES ('7607', '1', '1', '0', 'member', '1', '超级管理员在2014-12-22 13:45登录了后台', '1', '1419227149');
INSERT INTO thinkox_action_log VALUES ('7608', '17', '1', '-1062731647', 'yundong_user', '4', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doYundong/uid/1/id/21', '1', '1419228307');
INSERT INTO thinkox_action_log VALUES ('7609', '17', '1', '-1062731647', 'yundong_user', '5', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doYundong/uid/1/id/23', '1', '1419228423');
INSERT INTO thinkox_action_log VALUES ('7610', '17', '70', '-1062731647', 'yundong_user', '6', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doYundong/uid/70/id/23', '1', '1419228493');
INSERT INTO thinkox_action_log VALUES ('7611', '1', '1', '0', 'member', '1', '超级管理员在2014-12-23 10:03登录了后台', '1', '1419300207');
INSERT INTO thinkox_action_log VALUES ('7612', '1', '1', '0', 'member', '1', '超级管理员在2014-12-25 09:46登录了后台', '1', '1419471963');
INSERT INTO thinkox_action_log VALUES ('7613', '15', '70', '-1062731647', 'ForumPost', '82', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1419489532');
INSERT INTO thinkox_action_log VALUES ('7614', '15', '70', '-1062731647', 'ForumPost', '83', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1419489695');
INSERT INTO thinkox_action_log VALUES ('7615', '15', '70', '-1062731647', 'ForumPost', '84', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1419489711');
INSERT INTO thinkox_action_log VALUES ('7616', '15', '70', '-1062731647', 'ForumPost', '85', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1419489782');
INSERT INTO thinkox_action_log VALUES ('7617', '15', '70', '-1062731647', 'ForumPost', '86', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1419489794');
INSERT INTO thinkox_action_log VALUES ('7618', '16', '0', '-1062731647', 'ForumPostReply', '17', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490182');
INSERT INTO thinkox_action_log VALUES ('7619', '16', '70', '-1062731647', 'ForumPostReply', '18', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490311');
INSERT INTO thinkox_action_log VALUES ('7620', '16', '70', '-1062731647', 'ForumPostReply', '19', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490331');
INSERT INTO thinkox_action_log VALUES ('7621', '16', '70', '-1062731647', 'ForumPostReply', '20', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490343');
INSERT INTO thinkox_action_log VALUES ('7622', '16', '70', '-1062731647', 'ForumPostReply', '21', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490418');
INSERT INTO thinkox_action_log VALUES ('7623', '16', '70', '-1062731647', 'ForumPostReply', '22', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490439');
INSERT INTO thinkox_action_log VALUES ('7624', '16', '70', '-1062731647', 'ForumPostReply', '23', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490452');
INSERT INTO thinkox_action_log VALUES ('7625', '16', '70', '-1062731647', 'ForumPostReply', '24', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490464');
INSERT INTO thinkox_action_log VALUES ('7626', '16', '70', '-1062731647', 'ForumPostReply', '25', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490476');
INSERT INTO thinkox_action_log VALUES ('7627', '16', '70', '-1062731647', 'ForumPostReply', '26', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490488');
INSERT INTO thinkox_action_log VALUES ('7628', '16', '70', '-1062731647', 'ForumPostReply', '27', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490502');
INSERT INTO thinkox_action_log VALUES ('7629', '16', '70', '-1062731647', 'ForumPostReply', '28', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490517');
INSERT INTO thinkox_action_log VALUES ('7630', '16', '70', '-1062731647', 'ForumPostReply', '29', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490528');
INSERT INTO thinkox_action_log VALUES ('7631', '16', '70', '-1062731647', 'ForumPostReply', '30', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490587');
INSERT INTO thinkox_action_log VALUES ('7632', '16', '70', '-1062731647', 'ForumPostReply', '31', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490589');
INSERT INTO thinkox_action_log VALUES ('7633', '16', '70', '-1062731647', 'ForumPostReply', '32', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490591');
INSERT INTO thinkox_action_log VALUES ('7634', '16', '70', '-1062731647', 'ForumPostReply', '33', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490593');
INSERT INTO thinkox_action_log VALUES ('7635', '16', '70', '-1062731647', 'ForumPostReply', '34', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490634');
INSERT INTO thinkox_action_log VALUES ('7636', '16', '70', '-1062731647', 'ForumPostReply', '35', '操作url：/thinkox4/index.php?s=/forum/index/doreply', '1', '1419490636');
INSERT INTO thinkox_action_log VALUES ('7637', '20', '70', '-1062731647', 'check_info', '70', '操作url：/thinkox4/index.php?s=/home/addons/execute/_addons/checkin/_controller/checkin/_action/check_in', '1', '1419491821');
INSERT INTO thinkox_action_log VALUES ('7638', '20', '69', '-1062731647', 'check_info', '69', '操作url：/thinkox4/index.php?s=/home/addons/execute/_addons/checkin/_controller/checkin/_action/check_in', '1', '1419491846');
INSERT INTO thinkox_action_log VALUES ('7639', '21', '70', '-1062731647', 'shibu_user', '1', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498571');
INSERT INTO thinkox_action_log VALUES ('7640', '21', '70', '-1062731647', 'shibu_user', '2', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498579');
INSERT INTO thinkox_action_log VALUES ('7641', '21', '70', '-1062731647', 'shibu_user', '3', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498581');
INSERT INTO thinkox_action_log VALUES ('7642', '21', '70', '-1062731647', 'shibu_user', '4', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498582');
INSERT INTO thinkox_action_log VALUES ('7643', '21', '70', '-1062731647', 'shibu_user', '5', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498582');
INSERT INTO thinkox_action_log VALUES ('7644', '21', '70', '-1062731647', 'shibu_user', '6', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498583');
INSERT INTO thinkox_action_log VALUES ('7645', '21', '70', '-1062731647', 'shibu_user', '7', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498584');
INSERT INTO thinkox_action_log VALUES ('7646', '21', '70', '-1062731647', 'shibu_user', '8', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498584');
INSERT INTO thinkox_action_log VALUES ('7647', '21', '70', '-1062731647', 'shibu_user', '9', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498585');
INSERT INTO thinkox_action_log VALUES ('7648', '21', '70', '-1062731647', 'shibu_user', '10', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498586');
INSERT INTO thinkox_action_log VALUES ('7649', '21', '70', '-1062731647', 'shibu_user', '11', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498591');
INSERT INTO thinkox_action_log VALUES ('7650', '21', '70', '-1062731647', 'shibu_user', '12', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498593');
INSERT INTO thinkox_action_log VALUES ('7651', '21', '70', '-1062731647', 'shibu_user', '13', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498593');
INSERT INTO thinkox_action_log VALUES ('7652', '21', '70', '-1062731647', 'shibu_user', '14', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498593');
INSERT INTO thinkox_action_log VALUES ('7653', '21', '70', '-1062731647', 'shibu_user', '15', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498860');
INSERT INTO thinkox_action_log VALUES ('7654', '21', '70', '-1062731647', 'shibu_user', '16', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498863');
INSERT INTO thinkox_action_log VALUES ('7655', '21', '70', '-1062731647', 'shibu_user', '17', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498883');
INSERT INTO thinkox_action_log VALUES ('7656', '21', '70', '-1062731647', 'shibu_user', '18', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498885');
INSERT INTO thinkox_action_log VALUES ('7657', '21', '70', '-1062731647', 'shibu_user', '19', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498886');
INSERT INTO thinkox_action_log VALUES ('7658', '21', '70', '-1062731647', 'shibu_user', '20', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419498912');
INSERT INTO thinkox_action_log VALUES ('7659', '21', '70', '-1062731647', 'shibu_user', '21', '操作url：/thinkox4/index.php?s=/face/Zhengzhuang/doShibu', '1', '1419499240');
INSERT INTO thinkox_action_log VALUES ('7660', '20', '71', '-1062731604', 'check_info', '71', '操作url：/thinkox4/index.php?s=/home/addons/execute/_addons/checkin/_controller/checkin/_action/check_in', '1', '1419916526');
INSERT INTO thinkox_action_log VALUES ('7661', '20', '71', '-1062731604', 'check_info', '71', '操作url：/thinkox4/index.php?s=/home/addons/execute/_addons/checkin/_controller/checkin/_action/check_in', '1', '1419916746');
INSERT INTO thinkox_action_log VALUES ('7662', '20', '71', '-1062731604', 'check_info', '71', '操作url：/thinkox4/index.php?s=/home/addons/execute/_addons/checkin/_controller/checkin/_action/check_in', '1', '1419917648');
INSERT INTO thinkox_action_log VALUES ('7663', '20', '71', '-1062731624', 'check_info', '71', '操作url：/thinkox4/index.php?s=/home/addons/execute/_addons/checkin/_controller/checkin/_action/check_in', '1', '1419918017');
INSERT INTO thinkox_action_log VALUES ('7664', '20', '71', '-1062731624', 'check_info', '71', '操作url：/thinkox4/index.php?s=/home/addons/execute/_addons/checkin/_controller/checkin/_action/check_in', '1', '1419918216');
INSERT INTO thinkox_action_log VALUES ('7665', '20', '71', '-1062731624', 'check_info', '71', '操作url：/thinkox4/index.php?s=/home/addons/execute/_addons/checkin/_controller/checkin/_action/check_in', '1', '1419991759');
INSERT INTO thinkox_action_log VALUES ('7666', '15', '1', '-1062731647', 'ForumPost', '87', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420000872');
INSERT INTO thinkox_action_log VALUES ('7667', '15', '1', '-1062731647', 'ForumPost', '88', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420001030');
INSERT INTO thinkox_action_log VALUES ('7668', '15', '1', '-1062731647', 'ForumPost', '89', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420001064');
INSERT INTO thinkox_action_log VALUES ('7669', '15', '1', '-1062731647', 'ForumPost', '90', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420001183');
INSERT INTO thinkox_action_log VALUES ('7670', '15', '1', '-1062731647', 'ForumPost', '91', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420001408');
INSERT INTO thinkox_action_log VALUES ('7671', '15', '1', '-1062731647', 'ForumPost', '92', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420001459');
INSERT INTO thinkox_action_log VALUES ('7672', '15', '1', '-1062731647', 'ForumPost', '93', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420001523');
INSERT INTO thinkox_action_log VALUES ('7673', '15', '1', '-1062731647', 'ForumPost', '94', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420001596');
INSERT INTO thinkox_action_log VALUES ('7674', '15', '1', '-1062731647', 'ForumPost', '95', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420001622');
INSERT INTO thinkox_action_log VALUES ('7675', '15', '1', '-1062731647', 'ForumPost', '96', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420001674');
INSERT INTO thinkox_action_log VALUES ('7676', '15', '1', '-1062731647', 'ForumPost', '97', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420001689');
INSERT INTO thinkox_action_log VALUES ('7677', '15', '1', '-1062731647', 'ForumPost', '98', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420001731');
INSERT INTO thinkox_action_log VALUES ('7678', '15', '1', '-1062731647', 'ForumPost', '99', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420002021');
INSERT INTO thinkox_action_log VALUES ('7679', '15', '1', '-1062731647', 'ForumPost', '100', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420002556');
INSERT INTO thinkox_action_log VALUES ('7680', '15', '1', '-1062731647', 'ForumPost', '101', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420002952');
INSERT INTO thinkox_action_log VALUES ('7681', '15', '1', '-1062731647', 'ForumPost', '102', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420002968');
INSERT INTO thinkox_action_log VALUES ('7682', '15', '1', '-1062731647', 'ForumPost', '103', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420002980');
INSERT INTO thinkox_action_log VALUES ('7683', '15', '1', '-1062731647', 'ForumPost', '104', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420003155');
INSERT INTO thinkox_action_log VALUES ('7684', '15', '71', '-1062731624', 'ForumPost', '105', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420003564');
INSERT INTO thinkox_action_log VALUES ('7685', '15', '1', '-1062731647', 'ForumPost', '106', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420004978');
INSERT INTO thinkox_action_log VALUES ('7686', '15', '1', '-1062731647', 'ForumPost', '107', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420005091');
INSERT INTO thinkox_action_log VALUES ('7687', '15', '1', '-1062731647', 'ForumPost', '108', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420005249');
INSERT INTO thinkox_action_log VALUES ('7688', '15', '1', '-1062731647', 'ForumPost', '109', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420005342');
INSERT INTO thinkox_action_log VALUES ('7689', '15', '71', '-1062731604', 'ForumPost', '110', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420007788');
INSERT INTO thinkox_action_log VALUES ('7690', '15', '71', '-1062731604', 'ForumPost', '111', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420009598');
INSERT INTO thinkox_action_log VALUES ('7691', '15', '1', '-1062731647', 'ForumPost', '112', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420009965');
INSERT INTO thinkox_action_log VALUES ('7692', '15', '1', '-1062731647', 'ForumPost', '113', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010135');
INSERT INTO thinkox_action_log VALUES ('7693', '15', '1', '-1062731647', 'ForumPost', '114', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010173');
INSERT INTO thinkox_action_log VALUES ('7694', '15', '1', '-1062731647', 'ForumPost', '115', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010207');
INSERT INTO thinkox_action_log VALUES ('7695', '15', '1', '-1062731647', 'ForumPost', '116', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010218');
INSERT INTO thinkox_action_log VALUES ('7696', '15', '1', '-1062731647', 'ForumPost', '117', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010226');
INSERT INTO thinkox_action_log VALUES ('7697', '15', '1', '-1062731647', 'ForumPost', '118', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010246');
INSERT INTO thinkox_action_log VALUES ('7698', '15', '1', '-1062731647', 'ForumPost', '119', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010268');
INSERT INTO thinkox_action_log VALUES ('7699', '15', '1', '-1062731647', 'ForumPost', '120', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010304');
INSERT INTO thinkox_action_log VALUES ('7700', '15', '1', '-1062731647', 'ForumPost', '121', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010322');
INSERT INTO thinkox_action_log VALUES ('7701', '15', '71', '-1062731604', 'ForumPost', '122', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010348');
INSERT INTO thinkox_action_log VALUES ('7702', '15', '1', '-1062731647', 'ForumPost', '123', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010469');
INSERT INTO thinkox_action_log VALUES ('7703', '15', '71', '-1062731604', 'ForumPost', '124', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010553');
INSERT INTO thinkox_action_log VALUES ('7704', '15', '1', '-1062731647', 'ForumPost', '125', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010612');
INSERT INTO thinkox_action_log VALUES ('7705', '15', '1', '-1062731647', 'ForumPost', '126', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010900');
INSERT INTO thinkox_action_log VALUES ('7706', '15', '1', '-1062731647', 'ForumPost', '127', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010910');
INSERT INTO thinkox_action_log VALUES ('7707', '15', '1', '-1062731647', 'ForumPost', '128', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420010983');
INSERT INTO thinkox_action_log VALUES ('7708', '15', '1', '-1062731647', 'ForumPost', '129', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011016');
INSERT INTO thinkox_action_log VALUES ('7709', '15', '1', '-1062731647', 'ForumPost', '130', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011058');
INSERT INTO thinkox_action_log VALUES ('7710', '15', '1', '-1062731647', 'ForumPost', '131', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011088');
INSERT INTO thinkox_action_log VALUES ('7711', '15', '1', '-1062731647', 'ForumPost', '132', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011145');
INSERT INTO thinkox_action_log VALUES ('7712', '15', '1', '-1062731647', 'ForumPost', '133', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011210');
INSERT INTO thinkox_action_log VALUES ('7713', '15', '1', '-1062731647', 'ForumPost', '134', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011276');
INSERT INTO thinkox_action_log VALUES ('7714', '15', '1', '-1062731647', 'ForumPost', '135', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011284');
INSERT INTO thinkox_action_log VALUES ('7715', '15', '1', '-1062731647', 'ForumPost', '136', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011306');
INSERT INTO thinkox_action_log VALUES ('7716', '15', '1', '-1062731647', 'ForumPost', '137', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011340');
INSERT INTO thinkox_action_log VALUES ('7717', '15', '1', '-1062731647', 'ForumPost', '138', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011347');
INSERT INTO thinkox_action_log VALUES ('7718', '15', '1', '-1062731647', 'ForumPost', '139', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011698');
INSERT INTO thinkox_action_log VALUES ('7719', '15', '1', '-1062731647', 'ForumPost', '140', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011810');
INSERT INTO thinkox_action_log VALUES ('7720', '15', '1', '-1062731647', 'ForumPost', '141', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011866');
INSERT INTO thinkox_action_log VALUES ('7721', '15', '1', '-1062731647', 'ForumPost', '142', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011887');
INSERT INTO thinkox_action_log VALUES ('7722', '15', '1', '-1062731647', 'ForumPost', '143', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011955');
INSERT INTO thinkox_action_log VALUES ('7723', '15', '1', '-1062731647', 'ForumPost', '144', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420011984');
INSERT INTO thinkox_action_log VALUES ('7724', '15', '71', '-1062731604', 'ForumPost', '145', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420012277');
INSERT INTO thinkox_action_log VALUES ('7725', '15', '1', '-1062731647', 'ForumPost', '146', '操作url：/thinkox4/index.php?s=/forum/index/doEdit', '1', '1420012338');

-- ----------------------------
-- Table structure for `thinkox_addons`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_addons`;
CREATE TABLE `thinkox_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of thinkox_addons
-- ----------------------------
INSERT INTO thinkox_addons VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO thinkox_addons VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO thinkox_addons VALUES ('89', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"ThinkOX\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1409038881', '0');
INSERT INTO thinkox_addons VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO thinkox_addons VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO thinkox_addons VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO thinkox_addons VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');
INSERT INTO thinkox_addons VALUES ('16', 'Avatar', '头像插件', '用于头像的上传', '1', '{\"random\":\"1\"}', 'caipeichao', '0.1', '1394449710', '1');
INSERT INTO thinkox_addons VALUES ('49', 'Checkin', '签到', '签到积分', '1', '{\"random\":\"1\"}', '想天软件工作室', '0.1', '1403764341', '1');
INSERT INTO thinkox_addons VALUES ('58', 'SyncLogin', '同步登陆', '同步登陆', '1', '{\"type\":null,\"meta\":\"\",\"bind\":\"0\",\"QqKEY\":\"\",\"QqSecret\":\"\",\"SinaKEY\":\"\",\"SinaSecret\":\"\"}', 'xjw129xjt', '0.1', '1406598876', '0');
INSERT INTO thinkox_addons VALUES ('41', 'LocalComment', '本地评论', '本地评论插件，不依赖社会化评论平台', '1', '{\"can_guest_comment\":\"1\"}', 'caipeichao', '0.1', '1399440324', '0');
INSERT INTO thinkox_addons VALUES ('44', 'InsertImage', '插入图片', '微博上传图片', '1', 'null', '想天软件工作室', '0.1', '1402390777', '0');
INSERT INTO thinkox_addons VALUES ('48', 'Repost', '转发', '转发', '1', 'null', '想天软件工作室', '0.1', '1403763025', '0');
INSERT INTO thinkox_addons VALUES ('63', 'Advertising', '广告位置', '广告位插件', '1', 'null', 'onep2p', '0.1', '1406689090', '1');
INSERT INTO thinkox_addons VALUES ('64', 'Advs', '广告管理', '广告插件', '1', 'null', 'onep2p', '0.1', '1406689131', '1');
INSERT INTO thinkox_addons VALUES ('68', 'ImageSlider', '图片轮播', '图片轮播，需要先通过 http://www.onethink.cn/topic/2153.html 的方法，让配置支持多图片上传', '1', '{\"second\":\"3000\",\"direction\":\"horizontal\",\"imgWidth\":\"900\",\"imgHeight\":\"650\",\"url\":\"http:\\/\\/www.baidu.com\\r\\nhttp:\\/\\/www.hao123.com\",\"images\":\"111,118,119,120,121,122\"}', 'birdy', '0.1', '1407144129', '0');
INSERT INTO thinkox_addons VALUES ('70', 'SuperLinks', '合作单位', '合作单位', '1', '{\"random\":\"1\"}', '苏南 newsn.net', '0.1', '1407156572', '1');
INSERT INTO thinkox_addons VALUES ('91', 'Rank_checkin', '签到排名', '设置每天某一时刻开始 按时间先后 签到排名，取前十', '1', '{\"random\":\"1\",\"ranktime\":null}', '嘉兴想天信息科技有限公司', '0.1', '1409109841', '1');
INSERT INTO thinkox_addons VALUES ('84', 'Support', '赞', '赞的功能', '1', 'null', '嘉兴想天信息科技有限公司', '0.1', '1408499141', '0');
INSERT INTO thinkox_addons VALUES ('94', 'demo', '示列', '我写来测试的', '1', '{\"random\":\"1\",\"image\":\"1\"}', 'where', '0.1', '1418101830', '0');
INSERT INTO thinkox_addons VALUES ('95', 'ChinaCity', '中国省市区三级联动', '每个系统都需要的一个中国省市区三级联动插件。想天-駿濤修改，将镇级地区移除', '1', 'null', 'i友街', '2.0', '1418264820', '0');

-- ----------------------------
-- Table structure for `thinkox_advertising`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_advertising`;
CREATE TABLE `thinkox_advertising` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '广告位置展示方式  0为默认展示一张',
  `width` char(20) NOT NULL DEFAULT '' COMMENT '广告位置宽度',
  `height` char(20) NOT NULL DEFAULT '' COMMENT '广告位置高度',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `pos` varchar(50) NOT NULL,
  `style` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告位置表';

-- ----------------------------
-- Records of thinkox_advertising
-- ----------------------------
INSERT INTO thinkox_advertising VALUES ('1', '微博发布框下方', '2', '620', '87', '1', 'weibo_below_sendbox', '0');
INSERT INTO thinkox_advertising VALUES ('2', '微博首页签到排行下方', '4', '', '', '1', 'weibo_below_checkrank', '0');
INSERT INTO thinkox_advertising VALUES ('3', '首页1号广告位', '1', '756', '100', '1', 'home_ad1', '0');

-- ----------------------------
-- Table structure for `thinkox_advs`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_advs`;
CREATE TABLE `thinkox_advs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告名称',
  `position` int(11) NOT NULL COMMENT '广告位置',
  `advspic` int(11) NOT NULL COMMENT '图片地址',
  `advstext` text NOT NULL COMMENT '文字广告内容',
  `advshtml` text NOT NULL COMMENT '代码广告内容',
  `link` char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
  `level` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告表';

-- ----------------------------
-- Records of thinkox_advs
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_attachment`;
CREATE TABLE `thinkox_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of thinkox_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_attribute`;
CREATE TABLE `thinkox_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of thinkox_attribute
-- ----------------------------
INSERT INTO thinkox_attribute VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO thinkox_attribute VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO thinkox_attribute VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO thinkox_attribute VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO thinkox_attribute VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO thinkox_attribute VALUES ('33', 'zx', '附件', 'int(10) UNSIGNED NOT NULL', 'file', '', '', '1', '', '2', '0', '1', '1395988634', '1395988634', '', '3', '', 'regex', '', '3', 'function');

-- ----------------------------
-- Table structure for `thinkox_auth_extend`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_auth_extend`;
CREATE TABLE `thinkox_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of thinkox_auth_extend
-- ----------------------------
INSERT INTO thinkox_auth_extend VALUES ('1', '1', '1');
INSERT INTO thinkox_auth_extend VALUES ('1', '1', '2');
INSERT INTO thinkox_auth_extend VALUES ('1', '2', '1');
INSERT INTO thinkox_auth_extend VALUES ('1', '2', '2');
INSERT INTO thinkox_auth_extend VALUES ('1', '3', '1');
INSERT INTO thinkox_auth_extend VALUES ('1', '3', '2');
INSERT INTO thinkox_auth_extend VALUES ('1', '4', '1');
INSERT INTO thinkox_auth_extend VALUES ('1', '37', '1');
INSERT INTO thinkox_auth_extend VALUES ('5', '1', '1');
INSERT INTO thinkox_auth_extend VALUES ('5', '42', '1');
INSERT INTO thinkox_auth_extend VALUES ('5', '45', '1');
INSERT INTO thinkox_auth_extend VALUES ('5', '46', '1');

-- ----------------------------
-- Table structure for `thinkox_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_auth_group`;
CREATE TABLE `thinkox_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_auth_group
-- ----------------------------
INSERT INTO thinkox_auth_group VALUES ('1', 'admin', '1', '默认组', '', '1', '');
INSERT INTO thinkox_auth_group VALUES ('5', 'admin', '1', '编辑组', '此组的用户来管理后台', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,79,211,217,218,219,220,223,227,240,244,247,248,249');
INSERT INTO thinkox_auth_group VALUES ('6', 'admin', '1', '测试组', '用来测试的组', '1', '1');

-- ----------------------------
-- Table structure for `thinkox_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_auth_group_access`;
CREATE TABLE `thinkox_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_auth_group_access
-- ----------------------------
INSERT INTO thinkox_auth_group_access VALUES ('1', '1');
INSERT INTO thinkox_auth_group_access VALUES ('1', '3');
INSERT INTO thinkox_auth_group_access VALUES ('63', '5');
INSERT INTO thinkox_auth_group_access VALUES ('64', '5');
INSERT INTO thinkox_auth_group_access VALUES ('65', '5');

-- ----------------------------
-- Table structure for `thinkox_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_auth_rule`;
CREATE TABLE `thinkox_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_auth_rule
-- ----------------------------
INSERT INTO thinkox_auth_rule VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '资讯', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('217', 'admin', '1', 'Admin/Forum/forum', '板块管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('218', 'admin', '1', 'Admin/Forum/post', '帖子管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('219', 'admin', '1', 'Admin/Forum/editForum', '编辑／发表帖子', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('220', 'admin', '1', 'Admin/Forum/editPost', 'edit pots', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('221', 'admin', '2', 'Admin//Admin/Forum/index', '讨论区', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('222', 'admin', '2', 'Admin//Admin/Weibo/index', '微博', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('223', 'admin', '1', 'Admin/Forum/sortForum', '排序', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('224', 'admin', '1', 'Admin/SEO/editRule', '新增、编辑', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('225', 'admin', '1', 'Admin/SEO/sortRule', '排序', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('226', 'admin', '1', 'Admin/SEO/index', '规则管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('227', 'admin', '1', 'Admin/Forum/editReply', '新增 编辑', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('228', 'admin', '1', 'Admin/Weibo/editComment', '编辑回复', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('229', 'admin', '1', 'Admin/Weibo/editWeibo', '编辑微博', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('230', 'admin', '1', 'Admin/SEO/ruleTrash', '规则回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('231', 'admin', '1', 'Admin/Rank/userList', '查看用户', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('232', 'admin', '1', 'Admin/Rank/userRankList', '用户头衔列表', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('233', 'admin', '1', 'Admin/Rank/userAddRank', '关联新头衔', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('234', 'admin', '1', 'Admin/Rank/userChangeRank', '编辑头衔关联', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('235', 'admin', '1', 'Admin/Issue/add', '编辑专辑', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('236', 'admin', '1', 'Admin/Issue/issue', '专辑管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('237', 'admin', '1', 'Admin/Issue/operate', '专辑操作', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('238', 'admin', '1', 'Admin/Weibo/weibo', '微博管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('239', 'admin', '1', 'Admin/Rank/index', '头衔列表', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('240', 'admin', '1', 'Admin/Forum/forumTrash', '板块回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('241', 'admin', '1', 'Admin/Weibo/weiboTrash', '微博回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('242', 'admin', '1', 'Admin/Rank/editRank', '添加头衔', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('243', 'admin', '1', 'Admin/Weibo/comment', '回复管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('244', 'admin', '1', 'Admin/Forum/postTrash', '帖子回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('245', 'admin', '1', 'Admin/Weibo/commentTrash', '回复回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('246', 'admin', '1', 'Admin/Issue/issueTrash', '专辑回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('247', 'admin', '1', 'Admin//Admin/Forum/reply', '回复管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('248', 'admin', '1', 'Admin/Forum/replyTrash', '回复回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('249', 'admin', '2', 'Admin/Forum/index', '论坛', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('250', 'admin', '2', 'Admin/Weibo/weibo', '微博', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('251', 'admin', '2', 'Admin/SEO/index', 'SEO', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('252', 'admin', '2', 'Admin/Rank/index', '头衔', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('253', 'admin', '2', 'Admin/Issue/issue', '专辑', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('254', 'admin', '1', 'Admin/Issue/contents', '内容管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('255', 'admin', '1', 'Admin/User/profile', '扩展资料', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('256', 'admin', '1', 'Admin/User/editProfile', '添加、编辑分组', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('257', 'admin', '1', 'Admin/User/sortProfile', '分组排序', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('258', 'admin', '1', 'Admin/User/field', '字段列表', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('259', 'admin', '1', 'Admin/User/editFieldSetting', '添加、编辑字段', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('260', 'admin', '1', 'Admin/User/sortField', '字段排序', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('261', 'admin', '1', 'Admin/Update/quick', '全部补丁', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('262', 'admin', '1', 'Admin/Update/addpack', '新增补丁', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('263', 'admin', '1', 'Admin/User/expandinfo_select', '用户扩展资料列表', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('264', 'admin', '1', 'Admin/User/expandinfo_details', '扩展资料详情', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('265', 'admin', '1', 'Admin/Shop/shopLog', '商城信息记录', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('266', 'admin', '1', 'Admin/Shop/setStatus', '商品分类状态设置', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('267', 'admin', '1', 'Admin/Shop/setGoodsStatus', '商品状态设置', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('268', 'admin', '1', 'Admin/Shop/operate', '商品分类操作', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('269', 'admin', '1', 'Admin/Shop/add', '商品分类添加', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('270', 'admin', '1', 'Admin/Shop/goodsEdit', '添加、编辑商品', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('271', 'admin', '1', 'Admin/Shop/hotSellConfig', '热销商品阀值配置', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('272', 'admin', '1', 'Admin/Shop/setNew', '设置新品', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('273', 'admin', '1', 'Admin/EventType/index', '活动分类管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('274', 'admin', '1', 'Admin/Event/event', '内容管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('275', 'admin', '1', 'Admin/EventType/eventTypeTrash', '活动分类回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('276', 'admin', '1', 'Admin/Event/verify', '内容审核', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('277', 'admin', '1', 'Admin/Event/contentTrash', '内容回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('278', 'admin', '1', 'Admin/Rank/rankVerify', '待审核用户头衔', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('279', 'admin', '1', 'Admin/Rank/rankVerifyFailure', '被驳回的头衔申请', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('280', 'admin', '1', 'Admin/Weibo/config', '微博设置', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('281', 'admin', '1', 'Admin/Issue/verify', '内容审核', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('282', 'admin', '1', 'Admin/Shop/goodsList', '商品列表', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('283', 'admin', '1', 'Admin/Shop/shopCategory', '商品分类配置', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('284', 'admin', '1', 'Admin/Shop/categoryTrash', '商品分类回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('285', 'admin', '1', 'Admin/Shop/verify', '待发货交易', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('286', 'admin', '1', 'Admin/Issue/contentTrash', '内容回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('287', 'admin', '1', 'Admin/Shop/goodsBuySuccess', '交易成功记录', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('288', 'admin', '1', 'Admin/Shop/goodsTrash', '商品回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('289', 'admin', '1', 'Admin/Shop/toxMoneyConfig', '货币配置', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('290', 'admin', '2', 'Admin/Shop/shopCategory', '商城', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('291', 'admin', '2', 'Admin/EventType/index', '活动', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('292', 'admin', '1', 'Admin/Issue/config', '专辑设置', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('293', 'admin', '1', 'Admin/Event/config', '活动设置', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('294', 'admin', '1', 'Admin/User/level', '等级管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('295', 'admin', '1', 'admin/group/group', '群组管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('296', 'admin', '1', 'Admin/group/groupType', '分类管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('297', 'admin', '1', 'Admin/group/postType', '文章分类', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('298', 'admin', '1', 'Admin/group/editPostCate', '修改分类', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('299', 'admin', '1', 'Admin/group/sortPostCate', '类型排序', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('300', 'admin', '1', 'Admin/group/editGroupType', '修改群组分类', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('301', 'admin', '1', 'Admin/group/sortGroupType', '群组类型排序', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('302', 'admin', '1', 'Admin/group/editLzlReply', '编辑楼中楼回复', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('303', 'admin', '1', 'Admin/group/lzlreply', '楼中楼回复', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('304', 'admin', '1', 'Admin/group/lzlreplyTrash', '楼中楼回复回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('305', 'admin', '1', 'Admin/group/editReply', '编辑回复', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('306', 'admin', '1', 'Admin/group/groupTrash', '群组回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('307', 'admin', '1', 'Admin/group/post', '文章管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('308', 'admin', '1', 'Admin/group/postTrash', '文章回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('309', 'admin', '1', 'Admin/group/reply', '回复管理', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('310', 'admin', '1', 'Admin/group/replyTrash', '回复回收站', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('311', 'admin', '1', 'Admin/group/config', '群组设置', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('312', 'admin', '1', 'Admin/group/unverify', '未审核群组', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('313', 'admin', '1', 'Admin/Forum/config', '论坛设置', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('314', 'admin', '2', 'admin/group/index', '群组', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('315', 'admin', '1', 'Admin/Xinxi/ceshi', '测试二级菜单', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('316', 'admin', '2', 'Admin/Xinxi/index', '测试信息', '-1', '');
INSERT INTO thinkox_auth_rule VALUES ('317', 'admin', '1', 'Admin/Zhengzhuang/changjian', '系统症状', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('318', 'admin', '1', 'Admin/Zhengzhuang/yijian', '意见列表', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('319', 'admin', '1', 'Admin/Zhengzhuang/doYijian', '以处理意见', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('320', 'admin', '1', 'Admin/Zhengzhuang/user', '用户症状', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('321', 'admin', '1', 'Admin/Zhengzhuang/mostZheng', '用户常见症状', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('322', 'admin', '1', 'Admin/Zhengzhuang/yundong', '运动健身', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('323', 'admin', '2', 'Admin/Zhengzhuang/changjian', '症状', '1', '');
INSERT INTO thinkox_auth_rule VALUES ('324', 'admin', '1', 'Admin/Zhengzhuang/listHui', '回收站', '1', '');

-- ----------------------------
-- Table structure for `thinkox_avatar`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_avatar`;
CREATE TABLE `thinkox_avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `path` varchar(200) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_temp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_avatar
-- ----------------------------
INSERT INTO thinkox_avatar VALUES ('10', '1', '/Avatar/2014-12-06/5482bea45e3e5.jpg', '1417854628', '1', '1');
INSERT INTO thinkox_avatar VALUES ('13', '60', '/Avatar/2014-12-06/5482bef224b14.jpg', '1417854706', '1', '1');
INSERT INTO thinkox_avatar VALUES ('17', '59', '/Avatar/2014-12-06/5482c59b447c8.jpg', '1417856411', '1', '1');
INSERT INTO thinkox_avatar VALUES ('18', '58', '/Avatar/2014-12-08/54853dec6eed0.jpg', '1418018284', '1', '1');
INSERT INTO thinkox_avatar VALUES ('20', '3', '/Avatar/2014-12-08/54853fb3b0c89.jpg', '1418018739', '1', '1');
INSERT INTO thinkox_avatar VALUES ('21', '3', '/Avatar/2014-12-08/5485489662e8e.jpg', '1418021014', '1', '1');
INSERT INTO thinkox_avatar VALUES ('22', '59', '/Avatar/2014-12-08/548548f2865d1.jpg', '1418021106', '1', '1');
INSERT INTO thinkox_avatar VALUES ('23', '59', '/Avatar/2014-12-08/54854a3147766.jpg', '1418021425', '1', '1');
INSERT INTO thinkox_avatar VALUES ('24', '59', '/Avatar/2014-12-08/54854a58350e9.jpg', '1418021464', '1', '1');
INSERT INTO thinkox_avatar VALUES ('25', '59', '/Avatar/2014-12-12/548a7be42f596.jpg', '1418361828', '1', '1');
INSERT INTO thinkox_avatar VALUES ('26', '64', '/Avatar/2014-12-16/548f9d009665b.jpg', '1418697984', '1', '1');
INSERT INTO thinkox_avatar VALUES ('27', '65', '/Avatar/2014-12-16/548fac3f363c3.jpg', '1418701887', '1', '1');
INSERT INTO thinkox_avatar VALUES ('28', '69', '/Avatar/2014-12-19/5493e1c3d5b7c.jpg', '1418977731', '1', '1');

-- ----------------------------
-- Table structure for `thinkox_category`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_category`;
CREATE TABLE `thinkox_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of thinkox_category
-- ----------------------------
INSERT INTO thinkox_category VALUES ('51', 'youxi', '关于戒撸的游戏', '0', '1', '10', '', '', '', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1419065578', '1419067115', '1', '0');
INSERT INTO thinkox_category VALUES ('52', 'shipin', '关于戒撸的视频', '0', '2', '10', '', '', '', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1419065599', '1419067108', '1', '0');
INSERT INTO thinkox_category VALUES ('49', 'shibu', '食补疗养', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1419065534', '1419067128', '1', '0');
INSERT INTO thinkox_category VALUES ('50', 'wenzhang', '关于戒撸的文章', '0', '3', '10', '', '', '', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1419065558', '1419065858', '1', '0');
INSERT INTO thinkox_category VALUES ('48', 'yundong', '运动健身督促', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1419064824', '1419067122', '1', '127');

-- ----------------------------
-- Table structure for `thinkox_channel`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_channel`;
CREATE TABLE `thinkox_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  `color` varchar(30) NOT NULL,
  `band_color` varchar(30) NOT NULL,
  `band_text` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_channel
-- ----------------------------
INSERT INTO thinkox_channel VALUES ('1', '0', '首页', 'Weibo/Index/index', '1', '1379475111', '1401628204', '1', '0', '', '', '');
INSERT INTO thinkox_channel VALUES ('2', '0', '论坛', 'Forum/Index/index', '2', '1379475131', '1409662841', '1', '0', '', '', '');
INSERT INTO thinkox_channel VALUES ('4', '0', '专辑', 'Issue/Index/index', '123', '1399022492', '1406255246', '1', '0', '', '', '');
INSERT INTO thinkox_channel VALUES ('5', '0', '会员', 'People/Index/index', '5', '1399784340', '1406256451', '1', '0', '', '', '');
INSERT INTO thinkox_channel VALUES ('11', '0', '商城', 'Shop/Index/index', '5', '1403056971', '1403085891', '1', '0', '', '', '');
INSERT INTO thinkox_channel VALUES ('14', '0', '资讯', 'blog/index/index', '4', '1406084715', '1406084910', '1', '0', '', '', '');
INSERT INTO thinkox_channel VALUES ('13', '0', '活动', '/Event/index', '3', '1403797042', '1403797164', '1', '0', '', '', '');
INSERT INTO thinkox_channel VALUES ('15', '0', '群组', 'group/index/index', '5', '1410771228', '1410771228', '1', '0', '', '', '');

-- ----------------------------
-- Table structure for `thinkox_check_info`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_check_info`;
CREATE TABLE `thinkox_check_info` (
  `uid` int(11) DEFAULT NULL,
  `con_num` int(11) DEFAULT '1',
  `total_num` int(11) DEFAULT '1',
  `ctime` int(11) DEFAULT '0',
  `content` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_check_info
-- ----------------------------
INSERT INTO thinkox_check_info VALUES ('1', '1', '1', '1418099853', null);
INSERT INTO thinkox_check_info VALUES ('1', '2', '2', '1418176383', null);
INSERT INTO thinkox_check_info VALUES ('1', '3', '3', '1418263775', null);
INSERT INTO thinkox_check_info VALUES ('1', '4', '4', '1418365723', null);
INSERT INTO thinkox_check_info VALUES ('2', '1', '1', '1418366103', null);
INSERT INTO thinkox_check_info VALUES ('3', '1', '1', '1418366624', '测试签到用户3');
INSERT INTO thinkox_check_info VALUES ('65', '1', '1', '1418702070', '测试签到次数来的');
INSERT INTO thinkox_check_info VALUES ('70', '1', '1', '1419491821', '签到拿积分一次');
INSERT INTO thinkox_check_info VALUES ('69', '1', '1', '1419491846', '签到拿积分一次');
INSERT INTO thinkox_check_info VALUES ('71', '1', '1', '1419818017', '我发誓今天没有撸');
INSERT INTO thinkox_check_info VALUES ('71', '2', '2', '1419918216', '我发誓今天没有撸');
INSERT INTO thinkox_check_info VALUES ('71', '3', '3', '1419991759', '我发誓今天没有撸');

-- ----------------------------
-- Table structure for `thinkox_config`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_config`;
CREATE TABLE `thinkox_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_config
-- ----------------------------
INSERT INTO thinkox_config VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO thinkox_config VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '8');
INSERT INTO thinkox_config VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '浙ICP备XX号', '12');
INSERT INTO thinkox_config VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '11');
INSERT INTO thinkox_config VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '14');
INSERT INTO thinkox_config VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰\r\namaze:Amazu', '后台颜色风格', '1379122533', '1409279514', '1', 'amaze', '2');
INSERT INTO thinkox_config VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:邮件', '15');
INSERT INTO thinkox_config VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '17');
INSERT INTO thinkox_config VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '20');
INSERT INTO thinkox_config VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '10');
INSERT INTO thinkox_config VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '9');
INSERT INTO thinkox_config VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '24');
INSERT INTO thinkox_config VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '12');
INSERT INTO thinkox_config VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '13');
INSERT INTO thinkox_config VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '16');
INSERT INTO thinkox_config VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '18');
INSERT INTO thinkox_config VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '22');
INSERT INTO thinkox_config VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '25');
INSERT INTO thinkox_config VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '26');
INSERT INTO thinkox_config VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '2');
INSERT INTO thinkox_config VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '3');
INSERT INTO thinkox_config VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '4');
INSERT INTO thinkox_config VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '27');
INSERT INTO thinkox_config VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '7');
INSERT INTO thinkox_config VALUES ('38', 'WEB_SITE', '1', '网站名称', '1', '', '用于邮件,短信,站内信显示', '1388332311', '1388501500', '1', '黑光科技', '3');
INSERT INTO thinkox_config VALUES ('39', 'MAIL_TYPE', '4', '邮件类型', '5', '1:SMTP 模块发送\r\n2:mail() 函数发送', '如果您选择了采用服务器内置的 Mail 服务，您不需要填写下面的内容', '1388332882', '1388931416', '1', '1', '0');
INSERT INTO thinkox_config VALUES ('40', 'MAIL_SMTP_HOST', '1', 'SMTP 服务器', '5', '', 'SMTP服务器', '1388332932', '1388332932', '1', '', '0');
INSERT INTO thinkox_config VALUES ('41', 'MAIL_SMTP_PORT', '0', 'SMTP服务器端口', '5', '', '默认25', '1388332975', '1388332975', '1', '25', '0');
INSERT INTO thinkox_config VALUES ('42', 'MAIL_SMTP_USER', '1', 'SMTP服务器用户名', '5', '', '填写完整用户名', '1388333010', '1388333010', '1', '', '0');
INSERT INTO thinkox_config VALUES ('43', 'MAIL_SMTP_PASS', '6', 'SMTP服务器密码', '5', '', '填写您的密码', '1388333057', '1389187088', '1', '', '0');
INSERT INTO thinkox_config VALUES ('50', 'MAIL_USER_PASS', '5', '密码找回模板', '0', '', '支持HTML代码', '1388583989', '1388672614', '1', '密码找回111223333555111', '0');
INSERT INTO thinkox_config VALUES ('51', 'PIC_FILE_PATH', '1', '图片文件保存根目录', '4', '', '图片文件保存根目录./目录/', '1388673255', '1388673255', '1', './Uploads/', '0');
INSERT INTO thinkox_config VALUES ('46', 'MAIL_SMTP_CE', '1', '邮件发送测试', '5', '', '填写测试邮件地址', '1388334529', '1388584028', '1', '', '11');
INSERT INTO thinkox_config VALUES ('47', 'MAIL_USER_REG', '5', '注册邮件模板', '3', '', '支持HTML代码', '1388337307', '1389532335', '1', '<a href=\"http://3spp.cn\" target=\"_blank\">点击进入</a><span style=\"color:#E53333;\">当您收到这封邮件，表明您已注册成功，以上为您的用户名和密码。。。。祝您生活愉快····</span>', '55');
INSERT INTO thinkox_config VALUES ('52', 'USER_NAME_BAOLIU', '1', '保留用户名', '3', '', '禁止注册用户名,用\" , \"号隔开', '1388845937', '1388845937', '1', '管理员,测试,admin,垃圾', '0');
INSERT INTO thinkox_config VALUES ('53', 'USER_REG_TIME', '0', '注册时间限制', '3', '', '同一IP注册时间限制，防恶意注册，格式分钟', '1388847715', '1388847715', '1', '2', '0');
INSERT INTO thinkox_config VALUES ('48', 'VERIFY_OPEN', '4', '验证码配置', '4', '0:全部关闭\r\n1:全部显示\r\n2:注册显示\r\n3:登陆显示', '验证码配置', '1388500332', '1405561711', '1', '2', '0');
INSERT INTO thinkox_config VALUES ('49', 'VERIFY_TYPE', '4', '验证码类型', '4', '1:中文\r\n2:英文\r\n3:数字\r\n4:算数', '验证码类型', '1388500873', '1405561731', '1', '2', '0');
INSERT INTO thinkox_config VALUES ('54', 'NO_BODY_TLE', '2', '空白说明', '2', '', '空白说明', '1392216444', '1392981305', '1', '呵呵，暂时没有内容哦！！', '0');
INSERT INTO thinkox_config VALUES ('55', 'USER_RESPASS', '5', '密码找回模板', '3', '', '密码找回文本', '1396191234', '1396191234', '1', '<span style=\"color:#009900;\">请点击以下链接找回密码，如无反应，请将链接地址复制到浏览器中打开(下次登录前有效)</span>', '0');
INSERT INTO thinkox_config VALUES ('56', 'COUNT_CODE', '2', '统计代码', '1', '', '用于统计网站访问量的第三方代码，推荐CNZZ统计', '1403058890', '1403058890', '1', '', '4');
INSERT INTO thinkox_config VALUES ('57', 'SHARE_WEIBO_ID', '0', '分享来源微博ID', '1', '', '来源的微博ID，不配置则隐藏顶部微博分享按钮。', '1403091490', '1403091490', '1', '', '5');
INSERT INTO thinkox_config VALUES ('60', 'AFTER_LOGIN_JUMP_URL', '2', '登陆后跳转的Url', '1', '', '支持形如weibo/index/index的ThinkPhp路由写法，支持普通的url写法', '1407145718', '1407154887', '1', 'admin/public/login', '7');
INSERT INTO thinkox_config VALUES ('58', 'USER_REG_WEIBO_CONTENT', '1', '用户注册微博提示内容', '3', '', '留空则表示不发新微博，支持face', '1404965285', '1404965445', '1', '', '0');
INSERT INTO thinkox_config VALUES ('59', 'WEIBO_WORDS_COUNT', '0', '微博字数限制', '1', '', '最大允许的微博字数长度', '1405330568', '1405330622', '1', '200', '6');
INSERT INTO thinkox_config VALUES ('61', 'FOOTER_RIGHT', '2', '底部右侧链接部分', '1', '', '链接部分', '1408008354', '1408008354', '1', '  <p><h4><strong>联系</strong></h4></p>\r\n                    <p><a href=\"http://www.ourstu.com/index.php?s=/home/index/about.html\" target=\"_blank\">关于我们</a>\r\n                    <p>\r\n                    <p><a href=\"http://tox.ourstu.com/tox/index.php?s=/Forum/Index/forum/id/3.html\" target=\"_blank\">问题反馈</a></p>\r\n                    <p><a href=\"http://www.ourstu.com/index.php?s=/home/index/contact.html\" target=\"_blank\">联系我们</a></p>', '10');
INSERT INTO thinkox_config VALUES ('62', 'FOOTER_SUMMARY', '2', '底部简介部分代码', '1', '', '', '1408008496', '1408008496', '1', '嘉兴想天信息科技有限公司是一家专注于为客户提供专业的社交方案。公司秉持简洁、高效、创新，不断为客户创造奇迹。', '9');
INSERT INTO thinkox_config VALUES ('63', 'FOOTER_TITLE', '2', '底部介绍标题', '1', '', '公司标题', '1408008573', '1408008573', '1', '<a target=\"_blank\" href=\"http://www.ourstu.com/\">嘉兴想天信息科技有限公司</a>', '8');
INSERT INTO thinkox_config VALUES ('64', 'FOOTER_QCODE', '2', '底部二维码部分代码', '1', '', '', '1408008644', '1408008738', '1', ' <img src=\"/Public/Core/images/erweima.png\"/>', '11');
INSERT INTO thinkox_config VALUES ('78', '_WEIBO_SHOW_TITLE', '0', '', '0', '', '', '1409670239', '1409670239', '1', '1', '0');
INSERT INTO thinkox_config VALUES ('75', '_WEIBO_SHOWTITLE', '0', '', '0', '', '', '1409670094', '1409670094', '1', '0', '0');
INSERT INTO thinkox_config VALUES ('87', '_FORUM_LIMIT_IMAGE', '0', '', '0', '', '', '1418702462', '1418702462', '1', '10', '0');
INSERT INTO thinkox_config VALUES ('82', '_ISSUE_NEED_VERIFY', '0', '', '0', '', '', '1409712596', '1409712596', '1', '0', '0');
INSERT INTO thinkox_config VALUES ('97', '_USER_LEVEL', '0', '', '0', '', '', '1419484325', '1419484325', '1', '0:Lv1 戒客\r\n100:Lv2 戒侠\r\n400:Lv3 戒师\r\n1000:Lv4 戒尊\r\n1800:Lv 5 戒宗\r\n2800:Lv6 戒王\r\n4000:Lv7 戒帝\r\n6500:Lv8 戒圣\r\n10000:Lv9 戒仙\r\n15000:Lv10 戒神\r\n20000:Lv11 涅槃', '0');

-- ----------------------------
-- Table structure for `thinkox_district`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_district`;
CREATE TABLE `thinkox_district` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=910007 DEFAULT CHARSET=utf8 COMMENT='中国省市区乡镇数据表';

-- ----------------------------
-- Records of thinkox_district
-- ----------------------------
INSERT INTO thinkox_district VALUES ('110000', '北京市', '1', '0');
INSERT INTO thinkox_district VALUES ('120000', '天津市', '1', '0');
INSERT INTO thinkox_district VALUES ('130000', '河北省', '1', '0');
INSERT INTO thinkox_district VALUES ('140000', '山西省', '1', '0');
INSERT INTO thinkox_district VALUES ('150000', '内蒙古', '1', '0');
INSERT INTO thinkox_district VALUES ('210000', '辽宁省', '1', '0');
INSERT INTO thinkox_district VALUES ('220000', '吉林省', '1', '0');
INSERT INTO thinkox_district VALUES ('230000', '黑龙江', '1', '0');
INSERT INTO thinkox_district VALUES ('310000', '上海市', '1', '0');
INSERT INTO thinkox_district VALUES ('320000', '江苏省', '1', '0');
INSERT INTO thinkox_district VALUES ('330000', '浙江省', '1', '0');
INSERT INTO thinkox_district VALUES ('340000', '安徽省', '1', '0');
INSERT INTO thinkox_district VALUES ('350000', '福建省', '1', '0');
INSERT INTO thinkox_district VALUES ('360000', '江西省', '1', '0');
INSERT INTO thinkox_district VALUES ('370000', '山东省', '1', '0');
INSERT INTO thinkox_district VALUES ('410000', '河南省', '1', '0');
INSERT INTO thinkox_district VALUES ('420000', '湖北省', '1', '0');
INSERT INTO thinkox_district VALUES ('430000', '湖南省', '1', '0');
INSERT INTO thinkox_district VALUES ('440000', '广东省', '1', '0');
INSERT INTO thinkox_district VALUES ('450000', '广西省', '1', '0');
INSERT INTO thinkox_district VALUES ('460000', '海南省', '1', '0');
INSERT INTO thinkox_district VALUES ('500000', '重庆市', '1', '0');
INSERT INTO thinkox_district VALUES ('510000', '四川省', '1', '0');
INSERT INTO thinkox_district VALUES ('520000', '贵州省', '1', '0');
INSERT INTO thinkox_district VALUES ('530000', '云南省', '1', '0');
INSERT INTO thinkox_district VALUES ('540000', '西　藏', '1', '0');
INSERT INTO thinkox_district VALUES ('610000', '陕西省', '1', '0');
INSERT INTO thinkox_district VALUES ('620000', '甘肃省', '1', '0');
INSERT INTO thinkox_district VALUES ('630000', '青海省', '1', '0');
INSERT INTO thinkox_district VALUES ('640000', '宁　夏', '1', '0');
INSERT INTO thinkox_district VALUES ('650000', '新　疆', '1', '0');
INSERT INTO thinkox_district VALUES ('710000', '台湾省', '1', '0');
INSERT INTO thinkox_district VALUES ('810000', '香　港', '1', '0');
INSERT INTO thinkox_district VALUES ('820000', '澳　门', '1', '0');
INSERT INTO thinkox_district VALUES ('110100', '北京市', '2', '110000');
INSERT INTO thinkox_district VALUES ('110200', '县', '2', '110000');
INSERT INTO thinkox_district VALUES ('120100', '市辖区', '2', '120000');
INSERT INTO thinkox_district VALUES ('120200', '县', '2', '120000');
INSERT INTO thinkox_district VALUES ('130100', '石家庄市', '2', '130000');
INSERT INTO thinkox_district VALUES ('130200', '唐山市', '2', '130000');
INSERT INTO thinkox_district VALUES ('130300', '秦皇岛市', '2', '130000');
INSERT INTO thinkox_district VALUES ('130400', '邯郸市', '2', '130000');
INSERT INTO thinkox_district VALUES ('130500', '邢台市', '2', '130000');
INSERT INTO thinkox_district VALUES ('130600', '保定市', '2', '130000');
INSERT INTO thinkox_district VALUES ('130700', '张家口市', '2', '130000');
INSERT INTO thinkox_district VALUES ('130800', '承德市', '2', '130000');
INSERT INTO thinkox_district VALUES ('130900', '沧州市', '2', '130000');
INSERT INTO thinkox_district VALUES ('131000', '廊坊市', '2', '130000');
INSERT INTO thinkox_district VALUES ('131100', '衡水市', '2', '130000');
INSERT INTO thinkox_district VALUES ('140100', '太原市', '2', '140000');
INSERT INTO thinkox_district VALUES ('140200', '大同市', '2', '140000');
INSERT INTO thinkox_district VALUES ('140300', '阳泉市', '2', '140000');
INSERT INTO thinkox_district VALUES ('140400', '长治市', '2', '140000');
INSERT INTO thinkox_district VALUES ('140500', '晋城市', '2', '140000');
INSERT INTO thinkox_district VALUES ('140600', '朔州市', '2', '140000');
INSERT INTO thinkox_district VALUES ('140700', '晋中市', '2', '140000');
INSERT INTO thinkox_district VALUES ('140800', '运城市', '2', '140000');
INSERT INTO thinkox_district VALUES ('140900', '忻州市', '2', '140000');
INSERT INTO thinkox_district VALUES ('141000', '临汾市', '2', '140000');
INSERT INTO thinkox_district VALUES ('141100', '吕梁市', '2', '140000');
INSERT INTO thinkox_district VALUES ('150100', '呼和浩特市', '2', '150000');
INSERT INTO thinkox_district VALUES ('150200', '包头市', '2', '150000');
INSERT INTO thinkox_district VALUES ('150300', '乌海市', '2', '150000');
INSERT INTO thinkox_district VALUES ('150400', '赤峰市', '2', '150000');
INSERT INTO thinkox_district VALUES ('150500', '通辽市', '2', '150000');
INSERT INTO thinkox_district VALUES ('150600', '鄂尔多斯市', '2', '150000');
INSERT INTO thinkox_district VALUES ('150700', '呼伦贝尔市', '2', '150000');
INSERT INTO thinkox_district VALUES ('150800', '巴彦淖尔市', '2', '150000');
INSERT INTO thinkox_district VALUES ('150900', '乌兰察布市', '2', '150000');
INSERT INTO thinkox_district VALUES ('152200', '兴安盟', '2', '150000');
INSERT INTO thinkox_district VALUES ('152500', '锡林郭勒盟', '2', '150000');
INSERT INTO thinkox_district VALUES ('152900', '阿拉善盟', '2', '150000');
INSERT INTO thinkox_district VALUES ('210100', '沈阳市', '2', '210000');
INSERT INTO thinkox_district VALUES ('210200', '大连市', '2', '210000');
INSERT INTO thinkox_district VALUES ('210300', '鞍山市', '2', '210000');
INSERT INTO thinkox_district VALUES ('210400', '抚顺市', '2', '210000');
INSERT INTO thinkox_district VALUES ('210500', '本溪市', '2', '210000');
INSERT INTO thinkox_district VALUES ('210600', '丹东市', '2', '210000');
INSERT INTO thinkox_district VALUES ('210700', '锦州市', '2', '210000');
INSERT INTO thinkox_district VALUES ('210800', '营口市', '2', '210000');
INSERT INTO thinkox_district VALUES ('210900', '阜新市', '2', '210000');
INSERT INTO thinkox_district VALUES ('211000', '辽阳市', '2', '210000');
INSERT INTO thinkox_district VALUES ('211100', '盘锦市', '2', '210000');
INSERT INTO thinkox_district VALUES ('211200', '铁岭市', '2', '210000');
INSERT INTO thinkox_district VALUES ('211300', '朝阳市', '2', '210000');
INSERT INTO thinkox_district VALUES ('211400', '葫芦岛市', '2', '210000');
INSERT INTO thinkox_district VALUES ('220100', '长春市', '2', '220000');
INSERT INTO thinkox_district VALUES ('220200', '吉林市', '2', '220000');
INSERT INTO thinkox_district VALUES ('220300', '四平市', '2', '220000');
INSERT INTO thinkox_district VALUES ('220400', '辽源市', '2', '220000');
INSERT INTO thinkox_district VALUES ('220500', '通化市', '2', '220000');
INSERT INTO thinkox_district VALUES ('220600', '白山市', '2', '220000');
INSERT INTO thinkox_district VALUES ('220700', '松原市', '2', '220000');
INSERT INTO thinkox_district VALUES ('220800', '白城市', '2', '220000');
INSERT INTO thinkox_district VALUES ('222400', '延边朝鲜族自治州', '2', '220000');
INSERT INTO thinkox_district VALUES ('230100', '哈尔滨市', '2', '230000');
INSERT INTO thinkox_district VALUES ('230200', '齐齐哈尔市', '2', '230000');
INSERT INTO thinkox_district VALUES ('230300', '鸡西市', '2', '230000');
INSERT INTO thinkox_district VALUES ('230400', '鹤岗市', '2', '230000');
INSERT INTO thinkox_district VALUES ('230500', '双鸭山市', '2', '230000');
INSERT INTO thinkox_district VALUES ('230600', '大庆市', '2', '230000');
INSERT INTO thinkox_district VALUES ('230700', '伊春市', '2', '230000');
INSERT INTO thinkox_district VALUES ('230800', '佳木斯市', '2', '230000');
INSERT INTO thinkox_district VALUES ('230900', '七台河市', '2', '230000');
INSERT INTO thinkox_district VALUES ('231000', '牡丹江市', '2', '230000');
INSERT INTO thinkox_district VALUES ('231100', '黑河市', '2', '230000');
INSERT INTO thinkox_district VALUES ('231200', '绥化市', '2', '230000');
INSERT INTO thinkox_district VALUES ('232700', '大兴安岭地区', '2', '230000');
INSERT INTO thinkox_district VALUES ('310100', '市辖区', '2', '310000');
INSERT INTO thinkox_district VALUES ('310200', '县', '2', '310000');
INSERT INTO thinkox_district VALUES ('320100', '南京市', '2', '320000');
INSERT INTO thinkox_district VALUES ('320200', '无锡市', '2', '320000');
INSERT INTO thinkox_district VALUES ('320300', '徐州市', '2', '320000');
INSERT INTO thinkox_district VALUES ('320400', '常州市', '2', '320000');
INSERT INTO thinkox_district VALUES ('320500', '苏州市', '2', '320000');
INSERT INTO thinkox_district VALUES ('320600', '南通市', '2', '320000');
INSERT INTO thinkox_district VALUES ('320700', '连云港市', '2', '320000');
INSERT INTO thinkox_district VALUES ('320800', '淮安市', '2', '320000');
INSERT INTO thinkox_district VALUES ('320900', '盐城市', '2', '320000');
INSERT INTO thinkox_district VALUES ('321000', '扬州市', '2', '320000');
INSERT INTO thinkox_district VALUES ('321100', '镇江市', '2', '320000');
INSERT INTO thinkox_district VALUES ('321200', '泰州市', '2', '320000');
INSERT INTO thinkox_district VALUES ('321300', '宿迁市', '2', '320000');
INSERT INTO thinkox_district VALUES ('330100', '杭州市', '2', '330000');
INSERT INTO thinkox_district VALUES ('330200', '宁波市', '2', '330000');
INSERT INTO thinkox_district VALUES ('330300', '温州市', '2', '330000');
INSERT INTO thinkox_district VALUES ('330400', '嘉兴市', '2', '330000');
INSERT INTO thinkox_district VALUES ('330500', '湖州市', '2', '330000');
INSERT INTO thinkox_district VALUES ('330600', '绍兴市', '2', '330000');
INSERT INTO thinkox_district VALUES ('330700', '金华市', '2', '330000');
INSERT INTO thinkox_district VALUES ('330800', '衢州市', '2', '330000');
INSERT INTO thinkox_district VALUES ('330900', '舟山市', '2', '330000');
INSERT INTO thinkox_district VALUES ('331000', '台州市', '2', '330000');
INSERT INTO thinkox_district VALUES ('331100', '丽水市', '2', '330000');
INSERT INTO thinkox_district VALUES ('340100', '合肥市', '2', '340000');
INSERT INTO thinkox_district VALUES ('340200', '芜湖市', '2', '340000');
INSERT INTO thinkox_district VALUES ('340300', '蚌埠市', '2', '340000');
INSERT INTO thinkox_district VALUES ('340400', '淮南市', '2', '340000');
INSERT INTO thinkox_district VALUES ('340500', '马鞍山市', '2', '340000');
INSERT INTO thinkox_district VALUES ('340600', '淮北市', '2', '340000');
INSERT INTO thinkox_district VALUES ('340700', '铜陵市', '2', '340000');
INSERT INTO thinkox_district VALUES ('340800', '安庆市', '2', '340000');
INSERT INTO thinkox_district VALUES ('341000', '黄山市', '2', '340000');
INSERT INTO thinkox_district VALUES ('341100', '滁州市', '2', '340000');
INSERT INTO thinkox_district VALUES ('341200', '阜阳市', '2', '340000');
INSERT INTO thinkox_district VALUES ('341300', '宿州市', '2', '340000');
INSERT INTO thinkox_district VALUES ('341500', '六安市', '2', '340000');
INSERT INTO thinkox_district VALUES ('341600', '亳州市', '2', '340000');
INSERT INTO thinkox_district VALUES ('341700', '池州市', '2', '340000');
INSERT INTO thinkox_district VALUES ('341800', '宣城市', '2', '340000');
INSERT INTO thinkox_district VALUES ('350100', '福州市', '2', '350000');
INSERT INTO thinkox_district VALUES ('350200', '厦门市', '2', '350000');
INSERT INTO thinkox_district VALUES ('350300', '莆田市', '2', '350000');
INSERT INTO thinkox_district VALUES ('350400', '三明市', '2', '350000');
INSERT INTO thinkox_district VALUES ('350500', '泉州市', '2', '350000');
INSERT INTO thinkox_district VALUES ('350600', '漳州市', '2', '350000');
INSERT INTO thinkox_district VALUES ('350700', '南平市', '2', '350000');
INSERT INTO thinkox_district VALUES ('350800', '龙岩市', '2', '350000');
INSERT INTO thinkox_district VALUES ('350900', '宁德市', '2', '350000');
INSERT INTO thinkox_district VALUES ('360100', '南昌市', '2', '360000');
INSERT INTO thinkox_district VALUES ('360200', '景德镇市', '2', '360000');
INSERT INTO thinkox_district VALUES ('360300', '萍乡市', '2', '360000');
INSERT INTO thinkox_district VALUES ('360400', '九江市', '2', '360000');
INSERT INTO thinkox_district VALUES ('360500', '新余市', '2', '360000');
INSERT INTO thinkox_district VALUES ('360600', '鹰潭市', '2', '360000');
INSERT INTO thinkox_district VALUES ('360700', '赣州市', '2', '360000');
INSERT INTO thinkox_district VALUES ('360800', '吉安市', '2', '360000');
INSERT INTO thinkox_district VALUES ('360900', '宜春市', '2', '360000');
INSERT INTO thinkox_district VALUES ('361000', '抚州市', '2', '360000');
INSERT INTO thinkox_district VALUES ('361100', '上饶市', '2', '360000');
INSERT INTO thinkox_district VALUES ('370100', '济南市', '2', '370000');
INSERT INTO thinkox_district VALUES ('370200', '青岛市', '2', '370000');
INSERT INTO thinkox_district VALUES ('370300', '淄博市', '2', '370000');
INSERT INTO thinkox_district VALUES ('370400', '枣庄市', '2', '370000');
INSERT INTO thinkox_district VALUES ('370500', '东营市', '2', '370000');
INSERT INTO thinkox_district VALUES ('370600', '烟台市', '2', '370000');
INSERT INTO thinkox_district VALUES ('370700', '潍坊市', '2', '370000');
INSERT INTO thinkox_district VALUES ('370800', '济宁市', '2', '370000');
INSERT INTO thinkox_district VALUES ('370900', '泰安市', '2', '370000');
INSERT INTO thinkox_district VALUES ('371000', '威海市', '2', '370000');
INSERT INTO thinkox_district VALUES ('371100', '日照市', '2', '370000');
INSERT INTO thinkox_district VALUES ('371200', '莱芜市', '2', '370000');
INSERT INTO thinkox_district VALUES ('371300', '临沂市', '2', '370000');
INSERT INTO thinkox_district VALUES ('371400', '德州市', '2', '370000');
INSERT INTO thinkox_district VALUES ('371500', '聊城市', '2', '370000');
INSERT INTO thinkox_district VALUES ('371600', '滨州市', '2', '370000');
INSERT INTO thinkox_district VALUES ('371700', '菏泽市', '2', '370000');
INSERT INTO thinkox_district VALUES ('410100', '郑州市', '2', '410000');
INSERT INTO thinkox_district VALUES ('410200', '开封市', '2', '410000');
INSERT INTO thinkox_district VALUES ('410300', '洛阳市', '2', '410000');
INSERT INTO thinkox_district VALUES ('410400', '平顶山市', '2', '410000');
INSERT INTO thinkox_district VALUES ('410500', '安阳市', '2', '410000');
INSERT INTO thinkox_district VALUES ('410600', '鹤壁市', '2', '410000');
INSERT INTO thinkox_district VALUES ('410700', '新乡市', '2', '410000');
INSERT INTO thinkox_district VALUES ('410800', '焦作市', '2', '410000');
INSERT INTO thinkox_district VALUES ('410900', '濮阳市', '2', '410000');
INSERT INTO thinkox_district VALUES ('411000', '许昌市', '2', '410000');
INSERT INTO thinkox_district VALUES ('411100', '漯河市', '2', '410000');
INSERT INTO thinkox_district VALUES ('411200', '三门峡市', '2', '410000');
INSERT INTO thinkox_district VALUES ('411300', '南阳市', '2', '410000');
INSERT INTO thinkox_district VALUES ('411400', '商丘市', '2', '410000');
INSERT INTO thinkox_district VALUES ('411500', '信阳市', '2', '410000');
INSERT INTO thinkox_district VALUES ('411600', '周口市', '2', '410000');
INSERT INTO thinkox_district VALUES ('411700', '驻马店市', '2', '410000');
INSERT INTO thinkox_district VALUES ('420100', '武汉市', '2', '420000');
INSERT INTO thinkox_district VALUES ('420200', '黄石市', '2', '420000');
INSERT INTO thinkox_district VALUES ('420300', '十堰市', '2', '420000');
INSERT INTO thinkox_district VALUES ('420500', '宜昌市', '2', '420000');
INSERT INTO thinkox_district VALUES ('420600', '襄樊市', '2', '420000');
INSERT INTO thinkox_district VALUES ('420700', '鄂州市', '2', '420000');
INSERT INTO thinkox_district VALUES ('420800', '荆门市', '2', '420000');
INSERT INTO thinkox_district VALUES ('420900', '孝感市', '2', '420000');
INSERT INTO thinkox_district VALUES ('421000', '荆州市', '2', '420000');
INSERT INTO thinkox_district VALUES ('421100', '黄冈市', '2', '420000');
INSERT INTO thinkox_district VALUES ('421200', '咸宁市', '2', '420000');
INSERT INTO thinkox_district VALUES ('421300', '随州市', '2', '420000');
INSERT INTO thinkox_district VALUES ('422800', '恩施土家族苗族自治州', '2', '420000');
INSERT INTO thinkox_district VALUES ('429000', '省直辖行政单位', '2', '420000');
INSERT INTO thinkox_district VALUES ('430100', '长沙市', '2', '430000');
INSERT INTO thinkox_district VALUES ('430200', '株洲市', '2', '430000');
INSERT INTO thinkox_district VALUES ('430300', '湘潭市', '2', '430000');
INSERT INTO thinkox_district VALUES ('430400', '衡阳市', '2', '430000');
INSERT INTO thinkox_district VALUES ('430500', '邵阳市', '2', '430000');
INSERT INTO thinkox_district VALUES ('430600', '岳阳市', '2', '430000');
INSERT INTO thinkox_district VALUES ('430700', '常德市', '2', '430000');
INSERT INTO thinkox_district VALUES ('430800', '张家界市', '2', '430000');
INSERT INTO thinkox_district VALUES ('430900', '益阳市', '2', '430000');
INSERT INTO thinkox_district VALUES ('431000', '郴州市', '2', '430000');
INSERT INTO thinkox_district VALUES ('431100', '永州市', '2', '430000');
INSERT INTO thinkox_district VALUES ('431200', '怀化市', '2', '430000');
INSERT INTO thinkox_district VALUES ('431300', '娄底市', '2', '430000');
INSERT INTO thinkox_district VALUES ('433100', '湘西土家族苗族自治州', '2', '430000');
INSERT INTO thinkox_district VALUES ('440100', '广州市', '2', '440000');
INSERT INTO thinkox_district VALUES ('440200', '韶关市', '2', '440000');
INSERT INTO thinkox_district VALUES ('440300', '深圳市', '2', '440000');
INSERT INTO thinkox_district VALUES ('440400', '珠海市', '2', '440000');
INSERT INTO thinkox_district VALUES ('440500', '汕头市', '2', '440000');
INSERT INTO thinkox_district VALUES ('440600', '佛山市', '2', '440000');
INSERT INTO thinkox_district VALUES ('440700', '江门市', '2', '440000');
INSERT INTO thinkox_district VALUES ('440800', '湛江市', '2', '440000');
INSERT INTO thinkox_district VALUES ('440900', '茂名市', '2', '440000');
INSERT INTO thinkox_district VALUES ('441200', '肇庆市', '2', '440000');
INSERT INTO thinkox_district VALUES ('441300', '惠州市', '2', '440000');
INSERT INTO thinkox_district VALUES ('441400', '梅州市', '2', '440000');
INSERT INTO thinkox_district VALUES ('441500', '汕尾市', '2', '440000');
INSERT INTO thinkox_district VALUES ('441600', '河源市', '2', '440000');
INSERT INTO thinkox_district VALUES ('441700', '阳江市', '2', '440000');
INSERT INTO thinkox_district VALUES ('441800', '清远市', '2', '440000');
INSERT INTO thinkox_district VALUES ('441900', '东莞市', '2', '440000');
INSERT INTO thinkox_district VALUES ('442000', '中山市', '2', '440000');
INSERT INTO thinkox_district VALUES ('445100', '潮州市', '2', '440000');
INSERT INTO thinkox_district VALUES ('445200', '揭阳市', '2', '440000');
INSERT INTO thinkox_district VALUES ('445300', '云浮市', '2', '440000');
INSERT INTO thinkox_district VALUES ('450100', '南宁市', '2', '450000');
INSERT INTO thinkox_district VALUES ('450200', '柳州市', '2', '450000');
INSERT INTO thinkox_district VALUES ('450300', '桂林市', '2', '450000');
INSERT INTO thinkox_district VALUES ('450400', '梧州市', '2', '450000');
INSERT INTO thinkox_district VALUES ('450500', '北海市', '2', '450000');
INSERT INTO thinkox_district VALUES ('450600', '防城港市', '2', '450000');
INSERT INTO thinkox_district VALUES ('450700', '钦州市', '2', '450000');
INSERT INTO thinkox_district VALUES ('450800', '贵港市', '2', '450000');
INSERT INTO thinkox_district VALUES ('450900', '玉林市', '2', '450000');
INSERT INTO thinkox_district VALUES ('451000', '百色市', '2', '450000');
INSERT INTO thinkox_district VALUES ('451100', '贺州市', '2', '450000');
INSERT INTO thinkox_district VALUES ('451200', '河池市', '2', '450000');
INSERT INTO thinkox_district VALUES ('451300', '来宾市', '2', '450000');
INSERT INTO thinkox_district VALUES ('451400', '崇左市', '2', '450000');
INSERT INTO thinkox_district VALUES ('460100', '海口市', '2', '460000');
INSERT INTO thinkox_district VALUES ('460200', '三亚市', '2', '460000');
INSERT INTO thinkox_district VALUES ('469000', '省直辖县级行政单位', '2', '460000');
INSERT INTO thinkox_district VALUES ('500100', '市辖区', '2', '500000');
INSERT INTO thinkox_district VALUES ('500200', '县', '2', '500000');
INSERT INTO thinkox_district VALUES ('500300', '市', '2', '500000');
INSERT INTO thinkox_district VALUES ('510100', '成都市', '2', '510000');
INSERT INTO thinkox_district VALUES ('510300', '自贡市', '2', '510000');
INSERT INTO thinkox_district VALUES ('510400', '攀枝花市', '2', '510000');
INSERT INTO thinkox_district VALUES ('510500', '泸州市', '2', '510000');
INSERT INTO thinkox_district VALUES ('510600', '德阳市', '2', '510000');
INSERT INTO thinkox_district VALUES ('510700', '绵阳市', '2', '510000');
INSERT INTO thinkox_district VALUES ('510800', '广元市', '2', '510000');
INSERT INTO thinkox_district VALUES ('510900', '遂宁市', '2', '510000');
INSERT INTO thinkox_district VALUES ('511000', '内江市', '2', '510000');
INSERT INTO thinkox_district VALUES ('511100', '乐山市', '2', '510000');
INSERT INTO thinkox_district VALUES ('511300', '南充市', '2', '510000');
INSERT INTO thinkox_district VALUES ('511400', '眉山市', '2', '510000');
INSERT INTO thinkox_district VALUES ('511500', '宜宾市', '2', '510000');
INSERT INTO thinkox_district VALUES ('511600', '广安市', '2', '510000');
INSERT INTO thinkox_district VALUES ('511700', '达州市', '2', '510000');
INSERT INTO thinkox_district VALUES ('511800', '雅安市', '2', '510000');
INSERT INTO thinkox_district VALUES ('511900', '巴中市', '2', '510000');
INSERT INTO thinkox_district VALUES ('512000', '资阳市', '2', '510000');
INSERT INTO thinkox_district VALUES ('513200', '阿坝藏族羌族自治州', '2', '510000');
INSERT INTO thinkox_district VALUES ('513300', '甘孜藏族自治州', '2', '510000');
INSERT INTO thinkox_district VALUES ('513400', '凉山彝族自治州', '2', '510000');
INSERT INTO thinkox_district VALUES ('520100', '贵阳市', '2', '520000');
INSERT INTO thinkox_district VALUES ('520200', '六盘水市', '2', '520000');
INSERT INTO thinkox_district VALUES ('520300', '遵义市', '2', '520000');
INSERT INTO thinkox_district VALUES ('520400', '安顺市', '2', '520000');
INSERT INTO thinkox_district VALUES ('522200', '铜仁地区', '2', '520000');
INSERT INTO thinkox_district VALUES ('522300', '黔西南布依族苗族自治州', '2', '520000');
INSERT INTO thinkox_district VALUES ('522400', '毕节地区', '2', '520000');
INSERT INTO thinkox_district VALUES ('522600', '黔东南苗族侗族自治州', '2', '520000');
INSERT INTO thinkox_district VALUES ('522700', '黔南布依族苗族自治州', '2', '520000');
INSERT INTO thinkox_district VALUES ('530100', '昆明市', '2', '530000');
INSERT INTO thinkox_district VALUES ('530300', '曲靖市', '2', '530000');
INSERT INTO thinkox_district VALUES ('530400', '玉溪市', '2', '530000');
INSERT INTO thinkox_district VALUES ('530500', '保山市', '2', '530000');
INSERT INTO thinkox_district VALUES ('530600', '昭通市', '2', '530000');
INSERT INTO thinkox_district VALUES ('530700', '丽江市', '2', '530000');
INSERT INTO thinkox_district VALUES ('530800', '思茅市', '2', '530000');
INSERT INTO thinkox_district VALUES ('530900', '临沧市', '2', '530000');
INSERT INTO thinkox_district VALUES ('532300', '楚雄彝族自治州', '2', '530000');
INSERT INTO thinkox_district VALUES ('532500', '红河哈尼族彝族自治州', '2', '530000');
INSERT INTO thinkox_district VALUES ('532600', '文山壮族苗族自治州', '2', '530000');
INSERT INTO thinkox_district VALUES ('532800', '西双版纳傣族自治州', '2', '530000');
INSERT INTO thinkox_district VALUES ('532900', '大理白族自治州', '2', '530000');
INSERT INTO thinkox_district VALUES ('533100', '德宏傣族景颇族自治州', '2', '530000');
INSERT INTO thinkox_district VALUES ('533300', '怒江傈僳族自治州', '2', '530000');
INSERT INTO thinkox_district VALUES ('533400', '迪庆藏族自治州', '2', '530000');
INSERT INTO thinkox_district VALUES ('540100', '拉萨市', '2', '540000');
INSERT INTO thinkox_district VALUES ('542100', '昌都地区', '2', '540000');
INSERT INTO thinkox_district VALUES ('542200', '山南地区', '2', '540000');
INSERT INTO thinkox_district VALUES ('542300', '日喀则地区', '2', '540000');
INSERT INTO thinkox_district VALUES ('542400', '那曲地区', '2', '540000');
INSERT INTO thinkox_district VALUES ('542500', '阿里地区', '2', '540000');
INSERT INTO thinkox_district VALUES ('542600', '林芝地区', '2', '540000');
INSERT INTO thinkox_district VALUES ('610100', '西安市', '2', '610000');
INSERT INTO thinkox_district VALUES ('610200', '铜川市', '2', '610000');
INSERT INTO thinkox_district VALUES ('610300', '宝鸡市', '2', '610000');
INSERT INTO thinkox_district VALUES ('610400', '咸阳市', '2', '610000');
INSERT INTO thinkox_district VALUES ('610500', '渭南市', '2', '610000');
INSERT INTO thinkox_district VALUES ('610600', '延安市', '2', '610000');
INSERT INTO thinkox_district VALUES ('610700', '汉中市', '2', '610000');
INSERT INTO thinkox_district VALUES ('610800', '榆林市', '2', '610000');
INSERT INTO thinkox_district VALUES ('610900', '安康市', '2', '610000');
INSERT INTO thinkox_district VALUES ('611000', '商洛市', '2', '610000');
INSERT INTO thinkox_district VALUES ('620100', '兰州市', '2', '620000');
INSERT INTO thinkox_district VALUES ('620200', '嘉峪关市', '2', '620000');
INSERT INTO thinkox_district VALUES ('620300', '金昌市', '2', '620000');
INSERT INTO thinkox_district VALUES ('620400', '白银市', '2', '620000');
INSERT INTO thinkox_district VALUES ('620500', '天水市', '2', '620000');
INSERT INTO thinkox_district VALUES ('620600', '武威市', '2', '620000');
INSERT INTO thinkox_district VALUES ('620700', '张掖市', '2', '620000');
INSERT INTO thinkox_district VALUES ('620800', '平凉市', '2', '620000');
INSERT INTO thinkox_district VALUES ('620900', '酒泉市', '2', '620000');
INSERT INTO thinkox_district VALUES ('621000', '庆阳市', '2', '620000');
INSERT INTO thinkox_district VALUES ('621100', '定西市', '2', '620000');
INSERT INTO thinkox_district VALUES ('621200', '陇南市', '2', '620000');
INSERT INTO thinkox_district VALUES ('622900', '临夏回族自治州', '2', '620000');
INSERT INTO thinkox_district VALUES ('623000', '甘南藏族自治州', '2', '620000');
INSERT INTO thinkox_district VALUES ('630100', '西宁市', '2', '630000');
INSERT INTO thinkox_district VALUES ('632100', '海东地区', '2', '630000');
INSERT INTO thinkox_district VALUES ('632200', '海北藏族自治州', '2', '630000');
INSERT INTO thinkox_district VALUES ('632300', '黄南藏族自治州', '2', '630000');
INSERT INTO thinkox_district VALUES ('632500', '海南藏族自治州', '2', '630000');
INSERT INTO thinkox_district VALUES ('632600', '果洛藏族自治州', '2', '630000');
INSERT INTO thinkox_district VALUES ('632700', '玉树藏族自治州', '2', '630000');
INSERT INTO thinkox_district VALUES ('632800', '海西蒙古族藏族自治州', '2', '630000');
INSERT INTO thinkox_district VALUES ('640100', '银川市', '2', '640000');
INSERT INTO thinkox_district VALUES ('640200', '石嘴山市', '2', '640000');
INSERT INTO thinkox_district VALUES ('640300', '吴忠市', '2', '640000');
INSERT INTO thinkox_district VALUES ('640400', '固原市', '2', '640000');
INSERT INTO thinkox_district VALUES ('640500', '中卫市', '2', '640000');
INSERT INTO thinkox_district VALUES ('650100', '乌鲁木齐市', '2', '650000');
INSERT INTO thinkox_district VALUES ('650200', '克拉玛依市', '2', '650000');
INSERT INTO thinkox_district VALUES ('652100', '吐鲁番地区', '2', '650000');
INSERT INTO thinkox_district VALUES ('652200', '哈密地区', '2', '650000');
INSERT INTO thinkox_district VALUES ('652300', '昌吉回族自治州', '2', '650000');
INSERT INTO thinkox_district VALUES ('652700', '博尔塔拉蒙古自治州', '2', '650000');
INSERT INTO thinkox_district VALUES ('652800', '巴音郭楞蒙古自治州', '2', '650000');
INSERT INTO thinkox_district VALUES ('652900', '阿克苏地区', '2', '650000');
INSERT INTO thinkox_district VALUES ('653000', '克孜勒苏柯尔克孜自治州', '2', '650000');
INSERT INTO thinkox_district VALUES ('653100', '喀什地区', '2', '650000');
INSERT INTO thinkox_district VALUES ('653200', '和田地区', '2', '650000');
INSERT INTO thinkox_district VALUES ('654000', '伊犁哈萨克自治州', '2', '650000');
INSERT INTO thinkox_district VALUES ('654200', '塔城地区', '2', '650000');
INSERT INTO thinkox_district VALUES ('654300', '阿勒泰地区', '2', '650000');
INSERT INTO thinkox_district VALUES ('659000', '省直辖行政单位', '2', '650000');
INSERT INTO thinkox_district VALUES ('110101', '东城区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110102', '西城区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110103', '崇文区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110104', '宣武区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110105', '朝阳区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110106', '丰台区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110107', '石景山区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110108', '海淀区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110109', '门头沟区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110111', '房山区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110112', '通州区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110113', '顺义区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110114', '昌平区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110115', '大兴区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110116', '怀柔区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110117', '平谷区', '3', '110100');
INSERT INTO thinkox_district VALUES ('110228', '密云县', '3', '110200');
INSERT INTO thinkox_district VALUES ('110229', '延庆县', '3', '110200');
INSERT INTO thinkox_district VALUES ('120101', '和平区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120102', '河东区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120103', '河西区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120104', '南开区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120105', '河北区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120106', '红桥区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120107', '塘沽区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120108', '汉沽区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120109', '大港区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120110', '东丽区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120111', '西青区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120112', '津南区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120113', '北辰区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120114', '武清区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120115', '宝坻区', '3', '120100');
INSERT INTO thinkox_district VALUES ('120221', '宁河县', '3', '120200');
INSERT INTO thinkox_district VALUES ('120223', '静海县', '3', '120200');
INSERT INTO thinkox_district VALUES ('120225', '蓟　县', '3', '120200');
INSERT INTO thinkox_district VALUES ('130101', '市辖区', '3', '130100');
INSERT INTO thinkox_district VALUES ('130102', '长安区', '3', '130100');
INSERT INTO thinkox_district VALUES ('130103', '桥东区', '3', '130100');
INSERT INTO thinkox_district VALUES ('130104', '桥西区', '3', '130100');
INSERT INTO thinkox_district VALUES ('130105', '新华区', '3', '130100');
INSERT INTO thinkox_district VALUES ('130107', '井陉矿区', '3', '130100');
INSERT INTO thinkox_district VALUES ('130108', '裕华区', '3', '130100');
INSERT INTO thinkox_district VALUES ('130121', '井陉县', '3', '130100');
INSERT INTO thinkox_district VALUES ('130123', '正定县', '3', '130100');
INSERT INTO thinkox_district VALUES ('130124', '栾城县', '3', '130100');
INSERT INTO thinkox_district VALUES ('130125', '行唐县', '3', '130100');
INSERT INTO thinkox_district VALUES ('130126', '灵寿县', '3', '130100');
INSERT INTO thinkox_district VALUES ('130127', '高邑县', '3', '130100');
INSERT INTO thinkox_district VALUES ('130128', '深泽县', '3', '130100');
INSERT INTO thinkox_district VALUES ('130129', '赞皇县', '3', '130100');
INSERT INTO thinkox_district VALUES ('130130', '无极县', '3', '130100');
INSERT INTO thinkox_district VALUES ('130131', '平山县', '3', '130100');
INSERT INTO thinkox_district VALUES ('130132', '元氏县', '3', '130100');
INSERT INTO thinkox_district VALUES ('130133', '赵　县', '3', '130100');
INSERT INTO thinkox_district VALUES ('130181', '辛集市', '3', '130100');
INSERT INTO thinkox_district VALUES ('130182', '藁城市', '3', '130100');
INSERT INTO thinkox_district VALUES ('130183', '晋州市', '3', '130100');
INSERT INTO thinkox_district VALUES ('130184', '新乐市', '3', '130100');
INSERT INTO thinkox_district VALUES ('130185', '鹿泉市', '3', '130100');
INSERT INTO thinkox_district VALUES ('130201', '市辖区', '3', '130200');
INSERT INTO thinkox_district VALUES ('130202', '路南区', '3', '130200');
INSERT INTO thinkox_district VALUES ('130203', '路北区', '3', '130200');
INSERT INTO thinkox_district VALUES ('130204', '古冶区', '3', '130200');
INSERT INTO thinkox_district VALUES ('130205', '开平区', '3', '130200');
INSERT INTO thinkox_district VALUES ('130207', '丰南区', '3', '130200');
INSERT INTO thinkox_district VALUES ('130208', '丰润区', '3', '130200');
INSERT INTO thinkox_district VALUES ('130223', '滦　县', '3', '130200');
INSERT INTO thinkox_district VALUES ('130224', '滦南县', '3', '130200');
INSERT INTO thinkox_district VALUES ('130225', '乐亭县', '3', '130200');
INSERT INTO thinkox_district VALUES ('130227', '迁西县', '3', '130200');
INSERT INTO thinkox_district VALUES ('130229', '玉田县', '3', '130200');
INSERT INTO thinkox_district VALUES ('130230', '唐海县', '3', '130200');
INSERT INTO thinkox_district VALUES ('130281', '遵化市', '3', '130200');
INSERT INTO thinkox_district VALUES ('130283', '迁安市', '3', '130200');
INSERT INTO thinkox_district VALUES ('130301', '市辖区', '3', '130300');
INSERT INTO thinkox_district VALUES ('130302', '海港区', '3', '130300');
INSERT INTO thinkox_district VALUES ('130303', '山海关区', '3', '130300');
INSERT INTO thinkox_district VALUES ('130304', '北戴河区', '3', '130300');
INSERT INTO thinkox_district VALUES ('130321', '青龙满族自治县', '3', '130300');
INSERT INTO thinkox_district VALUES ('130322', '昌黎县', '3', '130300');
INSERT INTO thinkox_district VALUES ('130323', '抚宁县', '3', '130300');
INSERT INTO thinkox_district VALUES ('130324', '卢龙县', '3', '130300');
INSERT INTO thinkox_district VALUES ('130401', '市辖区', '3', '130400');
INSERT INTO thinkox_district VALUES ('130402', '邯山区', '3', '130400');
INSERT INTO thinkox_district VALUES ('130403', '丛台区', '3', '130400');
INSERT INTO thinkox_district VALUES ('130404', '复兴区', '3', '130400');
INSERT INTO thinkox_district VALUES ('130406', '峰峰矿区', '3', '130400');
INSERT INTO thinkox_district VALUES ('130421', '邯郸县', '3', '130400');
INSERT INTO thinkox_district VALUES ('130423', '临漳县', '3', '130400');
INSERT INTO thinkox_district VALUES ('130424', '成安县', '3', '130400');
INSERT INTO thinkox_district VALUES ('130425', '大名县', '3', '130400');
INSERT INTO thinkox_district VALUES ('130426', '涉　县', '3', '130400');
INSERT INTO thinkox_district VALUES ('130427', '磁　县', '3', '130400');
INSERT INTO thinkox_district VALUES ('130428', '肥乡县', '3', '130400');
INSERT INTO thinkox_district VALUES ('130429', '永年县', '3', '130400');
INSERT INTO thinkox_district VALUES ('130430', '邱　县', '3', '130400');
INSERT INTO thinkox_district VALUES ('130431', '鸡泽县', '3', '130400');
INSERT INTO thinkox_district VALUES ('130432', '广平县', '3', '130400');
INSERT INTO thinkox_district VALUES ('130433', '馆陶县', '3', '130400');
INSERT INTO thinkox_district VALUES ('130434', '魏　县', '3', '130400');
INSERT INTO thinkox_district VALUES ('130435', '曲周县', '3', '130400');
INSERT INTO thinkox_district VALUES ('130481', '武安市', '3', '130400');
INSERT INTO thinkox_district VALUES ('130501', '市辖区', '3', '130500');
INSERT INTO thinkox_district VALUES ('130502', '桥东区', '3', '130500');
INSERT INTO thinkox_district VALUES ('130503', '桥西区', '3', '130500');
INSERT INTO thinkox_district VALUES ('130521', '邢台县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130522', '临城县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130523', '内丘县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130524', '柏乡县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130525', '隆尧县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130526', '任　县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130527', '南和县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130528', '宁晋县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130529', '巨鹿县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130530', '新河县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130531', '广宗县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130532', '平乡县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130533', '威　县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130534', '清河县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130535', '临西县', '3', '130500');
INSERT INTO thinkox_district VALUES ('130581', '南宫市', '3', '130500');
INSERT INTO thinkox_district VALUES ('130582', '沙河市', '3', '130500');
INSERT INTO thinkox_district VALUES ('130601', '市辖区', '3', '130600');
INSERT INTO thinkox_district VALUES ('130602', '新市区', '3', '130600');
INSERT INTO thinkox_district VALUES ('130603', '北市区', '3', '130600');
INSERT INTO thinkox_district VALUES ('130604', '南市区', '3', '130600');
INSERT INTO thinkox_district VALUES ('130621', '满城县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130622', '清苑县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130623', '涞水县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130624', '阜平县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130625', '徐水县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130626', '定兴县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130627', '唐　县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130628', '高阳县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130629', '容城县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130630', '涞源县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130631', '望都县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130632', '安新县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130633', '易　县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130634', '曲阳县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130635', '蠡　县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130636', '顺平县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130637', '博野县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130638', '雄　县', '3', '130600');
INSERT INTO thinkox_district VALUES ('130681', '涿州市', '3', '130600');
INSERT INTO thinkox_district VALUES ('130682', '定州市', '3', '130600');
INSERT INTO thinkox_district VALUES ('130683', '安国市', '3', '130600');
INSERT INTO thinkox_district VALUES ('130684', '高碑店市', '3', '130600');
INSERT INTO thinkox_district VALUES ('130701', '市辖区', '3', '130700');
INSERT INTO thinkox_district VALUES ('130702', '桥东区', '3', '130700');
INSERT INTO thinkox_district VALUES ('130703', '桥西区', '3', '130700');
INSERT INTO thinkox_district VALUES ('130705', '宣化区', '3', '130700');
INSERT INTO thinkox_district VALUES ('130706', '下花园区', '3', '130700');
INSERT INTO thinkox_district VALUES ('130721', '宣化县', '3', '130700');
INSERT INTO thinkox_district VALUES ('130722', '张北县', '3', '130700');
INSERT INTO thinkox_district VALUES ('130723', '康保县', '3', '130700');
INSERT INTO thinkox_district VALUES ('130724', '沽源县', '3', '130700');
INSERT INTO thinkox_district VALUES ('130725', '尚义县', '3', '130700');
INSERT INTO thinkox_district VALUES ('130726', '蔚　县', '3', '130700');
INSERT INTO thinkox_district VALUES ('130727', '阳原县', '3', '130700');
INSERT INTO thinkox_district VALUES ('130728', '怀安县', '3', '130700');
INSERT INTO thinkox_district VALUES ('130729', '万全县', '3', '130700');
INSERT INTO thinkox_district VALUES ('130730', '怀来县', '3', '130700');
INSERT INTO thinkox_district VALUES ('130731', '涿鹿县', '3', '130700');
INSERT INTO thinkox_district VALUES ('130732', '赤城县', '3', '130700');
INSERT INTO thinkox_district VALUES ('130733', '崇礼县', '3', '130700');
INSERT INTO thinkox_district VALUES ('130801', '市辖区', '3', '130800');
INSERT INTO thinkox_district VALUES ('130802', '双桥区', '3', '130800');
INSERT INTO thinkox_district VALUES ('130803', '双滦区', '3', '130800');
INSERT INTO thinkox_district VALUES ('130804', '鹰手营子矿区', '3', '130800');
INSERT INTO thinkox_district VALUES ('130821', '承德县', '3', '130800');
INSERT INTO thinkox_district VALUES ('130822', '兴隆县', '3', '130800');
INSERT INTO thinkox_district VALUES ('130823', '平泉县', '3', '130800');
INSERT INTO thinkox_district VALUES ('130824', '滦平县', '3', '130800');
INSERT INTO thinkox_district VALUES ('130825', '隆化县', '3', '130800');
INSERT INTO thinkox_district VALUES ('130826', '丰宁满族自治县', '3', '130800');
INSERT INTO thinkox_district VALUES ('130827', '宽城满族自治县', '3', '130800');
INSERT INTO thinkox_district VALUES ('130828', '围场满族蒙古族自治县', '3', '130800');
INSERT INTO thinkox_district VALUES ('130901', '市辖区', '3', '130900');
INSERT INTO thinkox_district VALUES ('130902', '新华区', '3', '130900');
INSERT INTO thinkox_district VALUES ('130903', '运河区', '3', '130900');
INSERT INTO thinkox_district VALUES ('130921', '沧　县', '3', '130900');
INSERT INTO thinkox_district VALUES ('130922', '青　县', '3', '130900');
INSERT INTO thinkox_district VALUES ('130923', '东光县', '3', '130900');
INSERT INTO thinkox_district VALUES ('130924', '海兴县', '3', '130900');
INSERT INTO thinkox_district VALUES ('130925', '盐山县', '3', '130900');
INSERT INTO thinkox_district VALUES ('130926', '肃宁县', '3', '130900');
INSERT INTO thinkox_district VALUES ('130927', '南皮县', '3', '130900');
INSERT INTO thinkox_district VALUES ('130928', '吴桥县', '3', '130900');
INSERT INTO thinkox_district VALUES ('130929', '献　县', '3', '130900');
INSERT INTO thinkox_district VALUES ('130930', '孟村回族自治县', '3', '130900');
INSERT INTO thinkox_district VALUES ('130981', '泊头市', '3', '130900');
INSERT INTO thinkox_district VALUES ('130982', '任丘市', '3', '130900');
INSERT INTO thinkox_district VALUES ('130983', '黄骅市', '3', '130900');
INSERT INTO thinkox_district VALUES ('130984', '河间市', '3', '130900');
INSERT INTO thinkox_district VALUES ('131001', '市辖区', '3', '131000');
INSERT INTO thinkox_district VALUES ('131002', '安次区', '3', '131000');
INSERT INTO thinkox_district VALUES ('131003', '广阳区', '3', '131000');
INSERT INTO thinkox_district VALUES ('131022', '固安县', '3', '131000');
INSERT INTO thinkox_district VALUES ('131023', '永清县', '3', '131000');
INSERT INTO thinkox_district VALUES ('131024', '香河县', '3', '131000');
INSERT INTO thinkox_district VALUES ('131025', '大城县', '3', '131000');
INSERT INTO thinkox_district VALUES ('131026', '文安县', '3', '131000');
INSERT INTO thinkox_district VALUES ('131028', '大厂回族自治县', '3', '131000');
INSERT INTO thinkox_district VALUES ('131081', '霸州市', '3', '131000');
INSERT INTO thinkox_district VALUES ('131082', '三河市', '3', '131000');
INSERT INTO thinkox_district VALUES ('131101', '市辖区', '3', '131100');
INSERT INTO thinkox_district VALUES ('131102', '桃城区', '3', '131100');
INSERT INTO thinkox_district VALUES ('131121', '枣强县', '3', '131100');
INSERT INTO thinkox_district VALUES ('131122', '武邑县', '3', '131100');
INSERT INTO thinkox_district VALUES ('131123', '武强县', '3', '131100');
INSERT INTO thinkox_district VALUES ('131124', '饶阳县', '3', '131100');
INSERT INTO thinkox_district VALUES ('131125', '安平县', '3', '131100');
INSERT INTO thinkox_district VALUES ('131126', '故城县', '3', '131100');
INSERT INTO thinkox_district VALUES ('131127', '景　县', '3', '131100');
INSERT INTO thinkox_district VALUES ('131128', '阜城县', '3', '131100');
INSERT INTO thinkox_district VALUES ('131181', '冀州市', '3', '131100');
INSERT INTO thinkox_district VALUES ('131182', '深州市', '3', '131100');
INSERT INTO thinkox_district VALUES ('140101', '市辖区', '3', '140100');
INSERT INTO thinkox_district VALUES ('140105', '小店区', '3', '140100');
INSERT INTO thinkox_district VALUES ('140106', '迎泽区', '3', '140100');
INSERT INTO thinkox_district VALUES ('140107', '杏花岭区', '3', '140100');
INSERT INTO thinkox_district VALUES ('140108', '尖草坪区', '3', '140100');
INSERT INTO thinkox_district VALUES ('140109', '万柏林区', '3', '140100');
INSERT INTO thinkox_district VALUES ('140110', '晋源区', '3', '140100');
INSERT INTO thinkox_district VALUES ('140121', '清徐县', '3', '140100');
INSERT INTO thinkox_district VALUES ('140122', '阳曲县', '3', '140100');
INSERT INTO thinkox_district VALUES ('140123', '娄烦县', '3', '140100');
INSERT INTO thinkox_district VALUES ('140181', '古交市', '3', '140100');
INSERT INTO thinkox_district VALUES ('140201', '市辖区', '3', '140200');
INSERT INTO thinkox_district VALUES ('140202', '城　区', '3', '140200');
INSERT INTO thinkox_district VALUES ('140203', '矿　区', '3', '140200');
INSERT INTO thinkox_district VALUES ('140211', '南郊区', '3', '140200');
INSERT INTO thinkox_district VALUES ('140212', '新荣区', '3', '140200');
INSERT INTO thinkox_district VALUES ('140221', '阳高县', '3', '140200');
INSERT INTO thinkox_district VALUES ('140222', '天镇县', '3', '140200');
INSERT INTO thinkox_district VALUES ('140223', '广灵县', '3', '140200');
INSERT INTO thinkox_district VALUES ('140224', '灵丘县', '3', '140200');
INSERT INTO thinkox_district VALUES ('140225', '浑源县', '3', '140200');
INSERT INTO thinkox_district VALUES ('140226', '左云县', '3', '140200');
INSERT INTO thinkox_district VALUES ('140227', '大同县', '3', '140200');
INSERT INTO thinkox_district VALUES ('140301', '市辖区', '3', '140300');
INSERT INTO thinkox_district VALUES ('140302', '城　区', '3', '140300');
INSERT INTO thinkox_district VALUES ('140303', '矿　区', '3', '140300');
INSERT INTO thinkox_district VALUES ('140311', '郊　区', '3', '140300');
INSERT INTO thinkox_district VALUES ('140321', '平定县', '3', '140300');
INSERT INTO thinkox_district VALUES ('140322', '盂　县', '3', '140300');
INSERT INTO thinkox_district VALUES ('140401', '市辖区', '3', '140400');
INSERT INTO thinkox_district VALUES ('140402', '城　区', '3', '140400');
INSERT INTO thinkox_district VALUES ('140411', '郊　区', '3', '140400');
INSERT INTO thinkox_district VALUES ('140421', '长治县', '3', '140400');
INSERT INTO thinkox_district VALUES ('140423', '襄垣县', '3', '140400');
INSERT INTO thinkox_district VALUES ('140424', '屯留县', '3', '140400');
INSERT INTO thinkox_district VALUES ('140425', '平顺县', '3', '140400');
INSERT INTO thinkox_district VALUES ('140426', '黎城县', '3', '140400');
INSERT INTO thinkox_district VALUES ('140427', '壶关县', '3', '140400');
INSERT INTO thinkox_district VALUES ('140428', '长子县', '3', '140400');
INSERT INTO thinkox_district VALUES ('140429', '武乡县', '3', '140400');
INSERT INTO thinkox_district VALUES ('140430', '沁　县', '3', '140400');
INSERT INTO thinkox_district VALUES ('140431', '沁源县', '3', '140400');
INSERT INTO thinkox_district VALUES ('140481', '潞城市', '3', '140400');
INSERT INTO thinkox_district VALUES ('140501', '市辖区', '3', '140500');
INSERT INTO thinkox_district VALUES ('140502', '城　区', '3', '140500');
INSERT INTO thinkox_district VALUES ('140521', '沁水县', '3', '140500');
INSERT INTO thinkox_district VALUES ('140522', '阳城县', '3', '140500');
INSERT INTO thinkox_district VALUES ('140524', '陵川县', '3', '140500');
INSERT INTO thinkox_district VALUES ('140525', '泽州县', '3', '140500');
INSERT INTO thinkox_district VALUES ('140581', '高平市', '3', '140500');
INSERT INTO thinkox_district VALUES ('140601', '市辖区', '3', '140600');
INSERT INTO thinkox_district VALUES ('140602', '朔城区', '3', '140600');
INSERT INTO thinkox_district VALUES ('140603', '平鲁区', '3', '140600');
INSERT INTO thinkox_district VALUES ('140621', '山阴县', '3', '140600');
INSERT INTO thinkox_district VALUES ('140622', '应　县', '3', '140600');
INSERT INTO thinkox_district VALUES ('140623', '右玉县', '3', '140600');
INSERT INTO thinkox_district VALUES ('140624', '怀仁县', '3', '140600');
INSERT INTO thinkox_district VALUES ('140701', '市辖区', '3', '140700');
INSERT INTO thinkox_district VALUES ('140702', '榆次区', '3', '140700');
INSERT INTO thinkox_district VALUES ('140721', '榆社县', '3', '140700');
INSERT INTO thinkox_district VALUES ('140722', '左权县', '3', '140700');
INSERT INTO thinkox_district VALUES ('140723', '和顺县', '3', '140700');
INSERT INTO thinkox_district VALUES ('140724', '昔阳县', '3', '140700');
INSERT INTO thinkox_district VALUES ('140725', '寿阳县', '3', '140700');
INSERT INTO thinkox_district VALUES ('140726', '太谷县', '3', '140700');
INSERT INTO thinkox_district VALUES ('140727', '祁　县', '3', '140700');
INSERT INTO thinkox_district VALUES ('140728', '平遥县', '3', '140700');
INSERT INTO thinkox_district VALUES ('140729', '灵石县', '3', '140700');
INSERT INTO thinkox_district VALUES ('140781', '介休市', '3', '140700');
INSERT INTO thinkox_district VALUES ('140801', '市辖区', '3', '140800');
INSERT INTO thinkox_district VALUES ('140802', '盐湖区', '3', '140800');
INSERT INTO thinkox_district VALUES ('140821', '临猗县', '3', '140800');
INSERT INTO thinkox_district VALUES ('140822', '万荣县', '3', '140800');
INSERT INTO thinkox_district VALUES ('140823', '闻喜县', '3', '140800');
INSERT INTO thinkox_district VALUES ('140824', '稷山县', '3', '140800');
INSERT INTO thinkox_district VALUES ('140825', '新绛县', '3', '140800');
INSERT INTO thinkox_district VALUES ('140826', '绛　县', '3', '140800');
INSERT INTO thinkox_district VALUES ('140827', '垣曲县', '3', '140800');
INSERT INTO thinkox_district VALUES ('140828', '夏　县', '3', '140800');
INSERT INTO thinkox_district VALUES ('140829', '平陆县', '3', '140800');
INSERT INTO thinkox_district VALUES ('140830', '芮城县', '3', '140800');
INSERT INTO thinkox_district VALUES ('140881', '永济市', '3', '140800');
INSERT INTO thinkox_district VALUES ('140882', '河津市', '3', '140800');
INSERT INTO thinkox_district VALUES ('140901', '市辖区', '3', '140900');
INSERT INTO thinkox_district VALUES ('140902', '忻府区', '3', '140900');
INSERT INTO thinkox_district VALUES ('140921', '定襄县', '3', '140900');
INSERT INTO thinkox_district VALUES ('140922', '五台县', '3', '140900');
INSERT INTO thinkox_district VALUES ('140923', '代　县', '3', '140900');
INSERT INTO thinkox_district VALUES ('140924', '繁峙县', '3', '140900');
INSERT INTO thinkox_district VALUES ('140925', '宁武县', '3', '140900');
INSERT INTO thinkox_district VALUES ('140926', '静乐县', '3', '140900');
INSERT INTO thinkox_district VALUES ('140927', '神池县', '3', '140900');
INSERT INTO thinkox_district VALUES ('140928', '五寨县', '3', '140900');
INSERT INTO thinkox_district VALUES ('140929', '岢岚县', '3', '140900');
INSERT INTO thinkox_district VALUES ('140930', '河曲县', '3', '140900');
INSERT INTO thinkox_district VALUES ('140931', '保德县', '3', '140900');
INSERT INTO thinkox_district VALUES ('140932', '偏关县', '3', '140900');
INSERT INTO thinkox_district VALUES ('140981', '原平市', '3', '140900');
INSERT INTO thinkox_district VALUES ('141001', '市辖区', '3', '141000');
INSERT INTO thinkox_district VALUES ('141002', '尧都区', '3', '141000');
INSERT INTO thinkox_district VALUES ('141021', '曲沃县', '3', '141000');
INSERT INTO thinkox_district VALUES ('141022', '翼城县', '3', '141000');
INSERT INTO thinkox_district VALUES ('141023', '襄汾县', '3', '141000');
INSERT INTO thinkox_district VALUES ('141024', '洪洞县', '3', '141000');
INSERT INTO thinkox_district VALUES ('141025', '古　县', '3', '141000');
INSERT INTO thinkox_district VALUES ('141026', '安泽县', '3', '141000');
INSERT INTO thinkox_district VALUES ('141027', '浮山县', '3', '141000');
INSERT INTO thinkox_district VALUES ('141028', '吉　县', '3', '141000');
INSERT INTO thinkox_district VALUES ('141029', '乡宁县', '3', '141000');
INSERT INTO thinkox_district VALUES ('141030', '大宁县', '3', '141000');
INSERT INTO thinkox_district VALUES ('141031', '隰　县', '3', '141000');
INSERT INTO thinkox_district VALUES ('141032', '永和县', '3', '141000');
INSERT INTO thinkox_district VALUES ('141033', '蒲　县', '3', '141000');
INSERT INTO thinkox_district VALUES ('141034', '汾西县', '3', '141000');
INSERT INTO thinkox_district VALUES ('141081', '侯马市', '3', '141000');
INSERT INTO thinkox_district VALUES ('141082', '霍州市', '3', '141000');
INSERT INTO thinkox_district VALUES ('141101', '市辖区', '3', '141100');
INSERT INTO thinkox_district VALUES ('141102', '离石区', '3', '141100');
INSERT INTO thinkox_district VALUES ('141121', '文水县', '3', '141100');
INSERT INTO thinkox_district VALUES ('141122', '交城县', '3', '141100');
INSERT INTO thinkox_district VALUES ('141123', '兴　县', '3', '141100');
INSERT INTO thinkox_district VALUES ('141124', '临　县', '3', '141100');
INSERT INTO thinkox_district VALUES ('141125', '柳林县', '3', '141100');
INSERT INTO thinkox_district VALUES ('141126', '石楼县', '3', '141100');
INSERT INTO thinkox_district VALUES ('141127', '岚　县', '3', '141100');
INSERT INTO thinkox_district VALUES ('141128', '方山县', '3', '141100');
INSERT INTO thinkox_district VALUES ('141129', '中阳县', '3', '141100');
INSERT INTO thinkox_district VALUES ('141130', '交口县', '3', '141100');
INSERT INTO thinkox_district VALUES ('141181', '孝义市', '3', '141100');
INSERT INTO thinkox_district VALUES ('141182', '汾阳市', '3', '141100');
INSERT INTO thinkox_district VALUES ('150101', '市辖区', '3', '150100');
INSERT INTO thinkox_district VALUES ('150102', '新城区', '3', '150100');
INSERT INTO thinkox_district VALUES ('150103', '回民区', '3', '150100');
INSERT INTO thinkox_district VALUES ('150104', '玉泉区', '3', '150100');
INSERT INTO thinkox_district VALUES ('150105', '赛罕区', '3', '150100');
INSERT INTO thinkox_district VALUES ('150121', '土默特左旗', '3', '150100');
INSERT INTO thinkox_district VALUES ('150122', '托克托县', '3', '150100');
INSERT INTO thinkox_district VALUES ('150123', '和林格尔县', '3', '150100');
INSERT INTO thinkox_district VALUES ('150124', '清水河县', '3', '150100');
INSERT INTO thinkox_district VALUES ('150125', '武川县', '3', '150100');
INSERT INTO thinkox_district VALUES ('150201', '市辖区', '3', '150200');
INSERT INTO thinkox_district VALUES ('150202', '东河区', '3', '150200');
INSERT INTO thinkox_district VALUES ('150203', '昆都仑区', '3', '150200');
INSERT INTO thinkox_district VALUES ('150204', '青山区', '3', '150200');
INSERT INTO thinkox_district VALUES ('150205', '石拐区', '3', '150200');
INSERT INTO thinkox_district VALUES ('150206', '白云矿区', '3', '150200');
INSERT INTO thinkox_district VALUES ('150207', '九原区', '3', '150200');
INSERT INTO thinkox_district VALUES ('150221', '土默特右旗', '3', '150200');
INSERT INTO thinkox_district VALUES ('150222', '固阳县', '3', '150200');
INSERT INTO thinkox_district VALUES ('150223', '达尔罕茂明安联合旗', '3', '150200');
INSERT INTO thinkox_district VALUES ('150301', '市辖区', '3', '150300');
INSERT INTO thinkox_district VALUES ('150302', '海勃湾区', '3', '150300');
INSERT INTO thinkox_district VALUES ('150303', '海南区', '3', '150300');
INSERT INTO thinkox_district VALUES ('150304', '乌达区', '3', '150300');
INSERT INTO thinkox_district VALUES ('150401', '市辖区', '3', '150400');
INSERT INTO thinkox_district VALUES ('150402', '红山区', '3', '150400');
INSERT INTO thinkox_district VALUES ('150403', '元宝山区', '3', '150400');
INSERT INTO thinkox_district VALUES ('150404', '松山区', '3', '150400');
INSERT INTO thinkox_district VALUES ('150421', '阿鲁科尔沁旗', '3', '150400');
INSERT INTO thinkox_district VALUES ('150422', '巴林左旗', '3', '150400');
INSERT INTO thinkox_district VALUES ('150423', '巴林右旗', '3', '150400');
INSERT INTO thinkox_district VALUES ('150424', '林西县', '3', '150400');
INSERT INTO thinkox_district VALUES ('150425', '克什克腾旗', '3', '150400');
INSERT INTO thinkox_district VALUES ('150426', '翁牛特旗', '3', '150400');
INSERT INTO thinkox_district VALUES ('150428', '喀喇沁旗', '3', '150400');
INSERT INTO thinkox_district VALUES ('150429', '宁城县', '3', '150400');
INSERT INTO thinkox_district VALUES ('150430', '敖汉旗', '3', '150400');
INSERT INTO thinkox_district VALUES ('150501', '市辖区', '3', '150500');
INSERT INTO thinkox_district VALUES ('150502', '科尔沁区', '3', '150500');
INSERT INTO thinkox_district VALUES ('150521', '科尔沁左翼中旗', '3', '150500');
INSERT INTO thinkox_district VALUES ('150522', '科尔沁左翼后旗', '3', '150500');
INSERT INTO thinkox_district VALUES ('150523', '开鲁县', '3', '150500');
INSERT INTO thinkox_district VALUES ('150524', '库伦旗', '3', '150500');
INSERT INTO thinkox_district VALUES ('150525', '奈曼旗', '3', '150500');
INSERT INTO thinkox_district VALUES ('150526', '扎鲁特旗', '3', '150500');
INSERT INTO thinkox_district VALUES ('150581', '霍林郭勒市', '3', '150500');
INSERT INTO thinkox_district VALUES ('150602', '东胜区', '3', '150600');
INSERT INTO thinkox_district VALUES ('150621', '达拉特旗', '3', '150600');
INSERT INTO thinkox_district VALUES ('150622', '准格尔旗', '3', '150600');
INSERT INTO thinkox_district VALUES ('150623', '鄂托克前旗', '3', '150600');
INSERT INTO thinkox_district VALUES ('150624', '鄂托克旗', '3', '150600');
INSERT INTO thinkox_district VALUES ('150625', '杭锦旗', '3', '150600');
INSERT INTO thinkox_district VALUES ('150626', '乌审旗', '3', '150600');
INSERT INTO thinkox_district VALUES ('150627', '伊金霍洛旗', '3', '150600');
INSERT INTO thinkox_district VALUES ('150701', '市辖区', '3', '150700');
INSERT INTO thinkox_district VALUES ('150702', '海拉尔区', '3', '150700');
INSERT INTO thinkox_district VALUES ('150721', '阿荣旗', '3', '150700');
INSERT INTO thinkox_district VALUES ('150722', '莫力达瓦达斡尔族自治旗', '3', '150700');
INSERT INTO thinkox_district VALUES ('150723', '鄂伦春自治旗', '3', '150700');
INSERT INTO thinkox_district VALUES ('150724', '鄂温克族自治旗', '3', '150700');
INSERT INTO thinkox_district VALUES ('150725', '陈巴尔虎旗', '3', '150700');
INSERT INTO thinkox_district VALUES ('150726', '新巴尔虎左旗', '3', '150700');
INSERT INTO thinkox_district VALUES ('150727', '新巴尔虎右旗', '3', '150700');
INSERT INTO thinkox_district VALUES ('150781', '满洲里市', '3', '150700');
INSERT INTO thinkox_district VALUES ('150782', '牙克石市', '3', '150700');
INSERT INTO thinkox_district VALUES ('150783', '扎兰屯市', '3', '150700');
INSERT INTO thinkox_district VALUES ('150784', '额尔古纳市', '3', '150700');
INSERT INTO thinkox_district VALUES ('150785', '根河市', '3', '150700');
INSERT INTO thinkox_district VALUES ('150801', '市辖区', '3', '150800');
INSERT INTO thinkox_district VALUES ('150802', '临河区', '3', '150800');
INSERT INTO thinkox_district VALUES ('150821', '五原县', '3', '150800');
INSERT INTO thinkox_district VALUES ('150822', '磴口县', '3', '150800');
INSERT INTO thinkox_district VALUES ('150823', '乌拉特前旗', '3', '150800');
INSERT INTO thinkox_district VALUES ('150824', '乌拉特中旗', '3', '150800');
INSERT INTO thinkox_district VALUES ('150825', '乌拉特后旗', '3', '150800');
INSERT INTO thinkox_district VALUES ('150826', '杭锦后旗', '3', '150800');
INSERT INTO thinkox_district VALUES ('150901', '市辖区', '3', '150900');
INSERT INTO thinkox_district VALUES ('150902', '集宁区', '3', '150900');
INSERT INTO thinkox_district VALUES ('150921', '卓资县', '3', '150900');
INSERT INTO thinkox_district VALUES ('150922', '化德县', '3', '150900');
INSERT INTO thinkox_district VALUES ('150923', '商都县', '3', '150900');
INSERT INTO thinkox_district VALUES ('150924', '兴和县', '3', '150900');
INSERT INTO thinkox_district VALUES ('150925', '凉城县', '3', '150900');
INSERT INTO thinkox_district VALUES ('150926', '察哈尔右翼前旗', '3', '150900');
INSERT INTO thinkox_district VALUES ('150927', '察哈尔右翼中旗', '3', '150900');
INSERT INTO thinkox_district VALUES ('150928', '察哈尔右翼后旗', '3', '150900');
INSERT INTO thinkox_district VALUES ('150929', '四子王旗', '3', '150900');
INSERT INTO thinkox_district VALUES ('150981', '丰镇市', '3', '150900');
INSERT INTO thinkox_district VALUES ('152201', '乌兰浩特市', '3', '152200');
INSERT INTO thinkox_district VALUES ('152202', '阿尔山市', '3', '152200');
INSERT INTO thinkox_district VALUES ('152221', '科尔沁右翼前旗', '3', '152200');
INSERT INTO thinkox_district VALUES ('152222', '科尔沁右翼中旗', '3', '152200');
INSERT INTO thinkox_district VALUES ('152223', '扎赉特旗', '3', '152200');
INSERT INTO thinkox_district VALUES ('152224', '突泉县', '3', '152200');
INSERT INTO thinkox_district VALUES ('152501', '二连浩特市', '3', '152500');
INSERT INTO thinkox_district VALUES ('152502', '锡林浩特市', '3', '152500');
INSERT INTO thinkox_district VALUES ('152522', '阿巴嘎旗', '3', '152500');
INSERT INTO thinkox_district VALUES ('152523', '苏尼特左旗', '3', '152500');
INSERT INTO thinkox_district VALUES ('152524', '苏尼特右旗', '3', '152500');
INSERT INTO thinkox_district VALUES ('152525', '东乌珠穆沁旗', '3', '152500');
INSERT INTO thinkox_district VALUES ('152526', '西乌珠穆沁旗', '3', '152500');
INSERT INTO thinkox_district VALUES ('152527', '太仆寺旗', '3', '152500');
INSERT INTO thinkox_district VALUES ('152528', '镶黄旗', '3', '152500');
INSERT INTO thinkox_district VALUES ('152529', '正镶白旗', '3', '152500');
INSERT INTO thinkox_district VALUES ('152530', '正蓝旗', '3', '152500');
INSERT INTO thinkox_district VALUES ('152531', '多伦县', '3', '152500');
INSERT INTO thinkox_district VALUES ('152921', '阿拉善左旗', '3', '152900');
INSERT INTO thinkox_district VALUES ('152922', '阿拉善右旗', '3', '152900');
INSERT INTO thinkox_district VALUES ('152923', '额济纳旗', '3', '152900');
INSERT INTO thinkox_district VALUES ('210101', '市辖区', '3', '210100');
INSERT INTO thinkox_district VALUES ('210102', '和平区', '3', '210100');
INSERT INTO thinkox_district VALUES ('210103', '沈河区', '3', '210100');
INSERT INTO thinkox_district VALUES ('210104', '大东区', '3', '210100');
INSERT INTO thinkox_district VALUES ('210105', '皇姑区', '3', '210100');
INSERT INTO thinkox_district VALUES ('210106', '铁西区', '3', '210100');
INSERT INTO thinkox_district VALUES ('210111', '苏家屯区', '3', '210100');
INSERT INTO thinkox_district VALUES ('210112', '东陵区', '3', '210100');
INSERT INTO thinkox_district VALUES ('210113', '新城子区', '3', '210100');
INSERT INTO thinkox_district VALUES ('210114', '于洪区', '3', '210100');
INSERT INTO thinkox_district VALUES ('210122', '辽中县', '3', '210100');
INSERT INTO thinkox_district VALUES ('210123', '康平县', '3', '210100');
INSERT INTO thinkox_district VALUES ('210124', '法库县', '3', '210100');
INSERT INTO thinkox_district VALUES ('210181', '新民市', '3', '210100');
INSERT INTO thinkox_district VALUES ('210201', '市辖区', '3', '210200');
INSERT INTO thinkox_district VALUES ('210202', '中山区', '3', '210200');
INSERT INTO thinkox_district VALUES ('210203', '西岗区', '3', '210200');
INSERT INTO thinkox_district VALUES ('210204', '沙河口区', '3', '210200');
INSERT INTO thinkox_district VALUES ('210211', '甘井子区', '3', '210200');
INSERT INTO thinkox_district VALUES ('210212', '旅顺口区', '3', '210200');
INSERT INTO thinkox_district VALUES ('210213', '金州区', '3', '210200');
INSERT INTO thinkox_district VALUES ('210224', '长海县', '3', '210200');
INSERT INTO thinkox_district VALUES ('210281', '瓦房店市', '3', '210200');
INSERT INTO thinkox_district VALUES ('210282', '普兰店市', '3', '210200');
INSERT INTO thinkox_district VALUES ('210283', '庄河市', '3', '210200');
INSERT INTO thinkox_district VALUES ('210301', '市辖区', '3', '210300');
INSERT INTO thinkox_district VALUES ('210302', '铁东区', '3', '210300');
INSERT INTO thinkox_district VALUES ('210303', '铁西区', '3', '210300');
INSERT INTO thinkox_district VALUES ('210304', '立山区', '3', '210300');
INSERT INTO thinkox_district VALUES ('210311', '千山区', '3', '210300');
INSERT INTO thinkox_district VALUES ('210321', '台安县', '3', '210300');
INSERT INTO thinkox_district VALUES ('210323', '岫岩满族自治县', '3', '210300');
INSERT INTO thinkox_district VALUES ('210381', '海城市', '3', '210300');
INSERT INTO thinkox_district VALUES ('210401', '市辖区', '3', '210400');
INSERT INTO thinkox_district VALUES ('210402', '新抚区', '3', '210400');
INSERT INTO thinkox_district VALUES ('210403', '东洲区', '3', '210400');
INSERT INTO thinkox_district VALUES ('210404', '望花区', '3', '210400');
INSERT INTO thinkox_district VALUES ('210411', '顺城区', '3', '210400');
INSERT INTO thinkox_district VALUES ('210421', '抚顺县', '3', '210400');
INSERT INTO thinkox_district VALUES ('210422', '新宾满族自治县', '3', '210400');
INSERT INTO thinkox_district VALUES ('210423', '清原满族自治县', '3', '210400');
INSERT INTO thinkox_district VALUES ('210501', '市辖区', '3', '210500');
INSERT INTO thinkox_district VALUES ('210502', '平山区', '3', '210500');
INSERT INTO thinkox_district VALUES ('210503', '溪湖区', '3', '210500');
INSERT INTO thinkox_district VALUES ('210504', '明山区', '3', '210500');
INSERT INTO thinkox_district VALUES ('210505', '南芬区', '3', '210500');
INSERT INTO thinkox_district VALUES ('210521', '本溪满族自治县', '3', '210500');
INSERT INTO thinkox_district VALUES ('210522', '桓仁满族自治县', '3', '210500');
INSERT INTO thinkox_district VALUES ('210601', '市辖区', '3', '210600');
INSERT INTO thinkox_district VALUES ('210602', '元宝区', '3', '210600');
INSERT INTO thinkox_district VALUES ('210603', '振兴区', '3', '210600');
INSERT INTO thinkox_district VALUES ('210604', '振安区', '3', '210600');
INSERT INTO thinkox_district VALUES ('210624', '宽甸满族自治县', '3', '210600');
INSERT INTO thinkox_district VALUES ('210681', '东港市', '3', '210600');
INSERT INTO thinkox_district VALUES ('210682', '凤城市', '3', '210600');
INSERT INTO thinkox_district VALUES ('210701', '市辖区', '3', '210700');
INSERT INTO thinkox_district VALUES ('210702', '古塔区', '3', '210700');
INSERT INTO thinkox_district VALUES ('210703', '凌河区', '3', '210700');
INSERT INTO thinkox_district VALUES ('210711', '太和区', '3', '210700');
INSERT INTO thinkox_district VALUES ('210726', '黑山县', '3', '210700');
INSERT INTO thinkox_district VALUES ('210727', '义　县', '3', '210700');
INSERT INTO thinkox_district VALUES ('210781', '凌海市', '3', '210700');
INSERT INTO thinkox_district VALUES ('210782', '北宁市', '3', '210700');
INSERT INTO thinkox_district VALUES ('210801', '市辖区', '3', '210800');
INSERT INTO thinkox_district VALUES ('210802', '站前区', '3', '210800');
INSERT INTO thinkox_district VALUES ('210803', '西市区', '3', '210800');
INSERT INTO thinkox_district VALUES ('210804', '鲅鱼圈区', '3', '210800');
INSERT INTO thinkox_district VALUES ('210811', '老边区', '3', '210800');
INSERT INTO thinkox_district VALUES ('210881', '盖州市', '3', '210800');
INSERT INTO thinkox_district VALUES ('210882', '大石桥市', '3', '210800');
INSERT INTO thinkox_district VALUES ('210901', '市辖区', '3', '210900');
INSERT INTO thinkox_district VALUES ('210902', '海州区', '3', '210900');
INSERT INTO thinkox_district VALUES ('210903', '新邱区', '3', '210900');
INSERT INTO thinkox_district VALUES ('210904', '太平区', '3', '210900');
INSERT INTO thinkox_district VALUES ('210905', '清河门区', '3', '210900');
INSERT INTO thinkox_district VALUES ('210911', '细河区', '3', '210900');
INSERT INTO thinkox_district VALUES ('210921', '阜新蒙古族自治县', '3', '210900');
INSERT INTO thinkox_district VALUES ('210922', '彰武县', '3', '210900');
INSERT INTO thinkox_district VALUES ('211001', '市辖区', '3', '211000');
INSERT INTO thinkox_district VALUES ('211002', '白塔区', '3', '211000');
INSERT INTO thinkox_district VALUES ('211003', '文圣区', '3', '211000');
INSERT INTO thinkox_district VALUES ('211004', '宏伟区', '3', '211000');
INSERT INTO thinkox_district VALUES ('211005', '弓长岭区', '3', '211000');
INSERT INTO thinkox_district VALUES ('211011', '太子河区', '3', '211000');
INSERT INTO thinkox_district VALUES ('211021', '辽阳县', '3', '211000');
INSERT INTO thinkox_district VALUES ('211081', '灯塔市', '3', '211000');
INSERT INTO thinkox_district VALUES ('211101', '市辖区', '3', '211100');
INSERT INTO thinkox_district VALUES ('211102', '双台子区', '3', '211100');
INSERT INTO thinkox_district VALUES ('211103', '兴隆台区', '3', '211100');
INSERT INTO thinkox_district VALUES ('211121', '大洼县', '3', '211100');
INSERT INTO thinkox_district VALUES ('211122', '盘山县', '3', '211100');
INSERT INTO thinkox_district VALUES ('211201', '市辖区', '3', '211200');
INSERT INTO thinkox_district VALUES ('211202', '银州区', '3', '211200');
INSERT INTO thinkox_district VALUES ('211204', '清河区', '3', '211200');
INSERT INTO thinkox_district VALUES ('211221', '铁岭县', '3', '211200');
INSERT INTO thinkox_district VALUES ('211223', '西丰县', '3', '211200');
INSERT INTO thinkox_district VALUES ('211224', '昌图县', '3', '211200');
INSERT INTO thinkox_district VALUES ('211281', '调兵山市', '3', '211200');
INSERT INTO thinkox_district VALUES ('211282', '开原市', '3', '211200');
INSERT INTO thinkox_district VALUES ('211301', '市辖区', '3', '211300');
INSERT INTO thinkox_district VALUES ('211302', '双塔区', '3', '211300');
INSERT INTO thinkox_district VALUES ('211303', '龙城区', '3', '211300');
INSERT INTO thinkox_district VALUES ('211321', '朝阳县', '3', '211300');
INSERT INTO thinkox_district VALUES ('211322', '建平县', '3', '211300');
INSERT INTO thinkox_district VALUES ('211324', '喀喇沁左翼蒙古族自治县', '3', '211300');
INSERT INTO thinkox_district VALUES ('211381', '北票市', '3', '211300');
INSERT INTO thinkox_district VALUES ('211382', '凌源市', '3', '211300');
INSERT INTO thinkox_district VALUES ('211401', '市辖区', '3', '211400');
INSERT INTO thinkox_district VALUES ('211402', '连山区', '3', '211400');
INSERT INTO thinkox_district VALUES ('211403', '龙港区', '3', '211400');
INSERT INTO thinkox_district VALUES ('211404', '南票区', '3', '211400');
INSERT INTO thinkox_district VALUES ('211421', '绥中县', '3', '211400');
INSERT INTO thinkox_district VALUES ('211422', '建昌县', '3', '211400');
INSERT INTO thinkox_district VALUES ('211481', '兴城市', '3', '211400');
INSERT INTO thinkox_district VALUES ('220101', '市辖区', '3', '220100');
INSERT INTO thinkox_district VALUES ('220102', '南关区', '3', '220100');
INSERT INTO thinkox_district VALUES ('220103', '宽城区', '3', '220100');
INSERT INTO thinkox_district VALUES ('220104', '朝阳区', '3', '220100');
INSERT INTO thinkox_district VALUES ('220105', '二道区', '3', '220100');
INSERT INTO thinkox_district VALUES ('220106', '绿园区', '3', '220100');
INSERT INTO thinkox_district VALUES ('220112', '双阳区', '3', '220100');
INSERT INTO thinkox_district VALUES ('220122', '农安县', '3', '220100');
INSERT INTO thinkox_district VALUES ('220181', '九台市', '3', '220100');
INSERT INTO thinkox_district VALUES ('220182', '榆树市', '3', '220100');
INSERT INTO thinkox_district VALUES ('220183', '德惠市', '3', '220100');
INSERT INTO thinkox_district VALUES ('220201', '市辖区', '3', '220200');
INSERT INTO thinkox_district VALUES ('220202', '昌邑区', '3', '220200');
INSERT INTO thinkox_district VALUES ('220203', '龙潭区', '3', '220200');
INSERT INTO thinkox_district VALUES ('220204', '船营区', '3', '220200');
INSERT INTO thinkox_district VALUES ('220211', '丰满区', '3', '220200');
INSERT INTO thinkox_district VALUES ('220221', '永吉县', '3', '220200');
INSERT INTO thinkox_district VALUES ('220281', '蛟河市', '3', '220200');
INSERT INTO thinkox_district VALUES ('220282', '桦甸市', '3', '220200');
INSERT INTO thinkox_district VALUES ('220283', '舒兰市', '3', '220200');
INSERT INTO thinkox_district VALUES ('220284', '磐石市', '3', '220200');
INSERT INTO thinkox_district VALUES ('220301', '市辖区', '3', '220300');
INSERT INTO thinkox_district VALUES ('220302', '铁西区', '3', '220300');
INSERT INTO thinkox_district VALUES ('220303', '铁东区', '3', '220300');
INSERT INTO thinkox_district VALUES ('220322', '梨树县', '3', '220300');
INSERT INTO thinkox_district VALUES ('220323', '伊通满族自治县', '3', '220300');
INSERT INTO thinkox_district VALUES ('220381', '公主岭市', '3', '220300');
INSERT INTO thinkox_district VALUES ('220382', '双辽市', '3', '220300');
INSERT INTO thinkox_district VALUES ('220401', '市辖区', '3', '220400');
INSERT INTO thinkox_district VALUES ('220402', '龙山区', '3', '220400');
INSERT INTO thinkox_district VALUES ('220403', '西安区', '3', '220400');
INSERT INTO thinkox_district VALUES ('220421', '东丰县', '3', '220400');
INSERT INTO thinkox_district VALUES ('220422', '东辽县', '3', '220400');
INSERT INTO thinkox_district VALUES ('220501', '市辖区', '3', '220500');
INSERT INTO thinkox_district VALUES ('220502', '东昌区', '3', '220500');
INSERT INTO thinkox_district VALUES ('220503', '二道江区', '3', '220500');
INSERT INTO thinkox_district VALUES ('220521', '通化县', '3', '220500');
INSERT INTO thinkox_district VALUES ('220523', '辉南县', '3', '220500');
INSERT INTO thinkox_district VALUES ('220524', '柳河县', '3', '220500');
INSERT INTO thinkox_district VALUES ('220581', '梅河口市', '3', '220500');
INSERT INTO thinkox_district VALUES ('220582', '集安市', '3', '220500');
INSERT INTO thinkox_district VALUES ('220601', '市辖区', '3', '220600');
INSERT INTO thinkox_district VALUES ('220602', '八道江区', '3', '220600');
INSERT INTO thinkox_district VALUES ('220621', '抚松县', '3', '220600');
INSERT INTO thinkox_district VALUES ('220622', '靖宇县', '3', '220600');
INSERT INTO thinkox_district VALUES ('220623', '长白朝鲜族自治县', '3', '220600');
INSERT INTO thinkox_district VALUES ('220625', '江源县', '3', '220600');
INSERT INTO thinkox_district VALUES ('220681', '临江市', '3', '220600');
INSERT INTO thinkox_district VALUES ('220701', '市辖区', '3', '220700');
INSERT INTO thinkox_district VALUES ('220702', '宁江区', '3', '220700');
INSERT INTO thinkox_district VALUES ('220721', '前郭尔罗斯蒙古族自治县', '3', '220700');
INSERT INTO thinkox_district VALUES ('220722', '长岭县', '3', '220700');
INSERT INTO thinkox_district VALUES ('220723', '乾安县', '3', '220700');
INSERT INTO thinkox_district VALUES ('220724', '扶余县', '3', '220700');
INSERT INTO thinkox_district VALUES ('220801', '市辖区', '3', '220800');
INSERT INTO thinkox_district VALUES ('220802', '洮北区', '3', '220800');
INSERT INTO thinkox_district VALUES ('220821', '镇赉县', '3', '220800');
INSERT INTO thinkox_district VALUES ('220822', '通榆县', '3', '220800');
INSERT INTO thinkox_district VALUES ('220881', '洮南市', '3', '220800');
INSERT INTO thinkox_district VALUES ('220882', '大安市', '3', '220800');
INSERT INTO thinkox_district VALUES ('222401', '延吉市', '3', '222400');
INSERT INTO thinkox_district VALUES ('222402', '图们市', '3', '222400');
INSERT INTO thinkox_district VALUES ('222403', '敦化市', '3', '222400');
INSERT INTO thinkox_district VALUES ('222404', '珲春市', '3', '222400');
INSERT INTO thinkox_district VALUES ('222405', '龙井市', '3', '222400');
INSERT INTO thinkox_district VALUES ('222406', '和龙市', '3', '222400');
INSERT INTO thinkox_district VALUES ('222424', '汪清县', '3', '222400');
INSERT INTO thinkox_district VALUES ('222426', '安图县', '3', '222400');
INSERT INTO thinkox_district VALUES ('230101', '市辖区', '3', '230100');
INSERT INTO thinkox_district VALUES ('230102', '道里区', '3', '230100');
INSERT INTO thinkox_district VALUES ('230103', '南岗区', '3', '230100');
INSERT INTO thinkox_district VALUES ('230104', '道外区', '3', '230100');
INSERT INTO thinkox_district VALUES ('230106', '香坊区', '3', '230100');
INSERT INTO thinkox_district VALUES ('230107', '动力区', '3', '230100');
INSERT INTO thinkox_district VALUES ('230108', '平房区', '3', '230100');
INSERT INTO thinkox_district VALUES ('230109', '松北区', '3', '230100');
INSERT INTO thinkox_district VALUES ('230111', '呼兰区', '3', '230100');
INSERT INTO thinkox_district VALUES ('230123', '依兰县', '3', '230100');
INSERT INTO thinkox_district VALUES ('230124', '方正县', '3', '230100');
INSERT INTO thinkox_district VALUES ('230125', '宾　县', '3', '230100');
INSERT INTO thinkox_district VALUES ('230126', '巴彦县', '3', '230100');
INSERT INTO thinkox_district VALUES ('230127', '木兰县', '3', '230100');
INSERT INTO thinkox_district VALUES ('230128', '通河县', '3', '230100');
INSERT INTO thinkox_district VALUES ('230129', '延寿县', '3', '230100');
INSERT INTO thinkox_district VALUES ('230181', '阿城市', '3', '230100');
INSERT INTO thinkox_district VALUES ('230182', '双城市', '3', '230100');
INSERT INTO thinkox_district VALUES ('230183', '尚志市', '3', '230100');
INSERT INTO thinkox_district VALUES ('230184', '五常市', '3', '230100');
INSERT INTO thinkox_district VALUES ('230201', '市辖区', '3', '230200');
INSERT INTO thinkox_district VALUES ('230202', '龙沙区', '3', '230200');
INSERT INTO thinkox_district VALUES ('230203', '建华区', '3', '230200');
INSERT INTO thinkox_district VALUES ('230204', '铁锋区', '3', '230200');
INSERT INTO thinkox_district VALUES ('230205', '昂昂溪区', '3', '230200');
INSERT INTO thinkox_district VALUES ('230206', '富拉尔基区', '3', '230200');
INSERT INTO thinkox_district VALUES ('230207', '碾子山区', '3', '230200');
INSERT INTO thinkox_district VALUES ('230208', '梅里斯达斡尔族区', '3', '230200');
INSERT INTO thinkox_district VALUES ('230221', '龙江县', '3', '230200');
INSERT INTO thinkox_district VALUES ('230223', '依安县', '3', '230200');
INSERT INTO thinkox_district VALUES ('230224', '泰来县', '3', '230200');
INSERT INTO thinkox_district VALUES ('230225', '甘南县', '3', '230200');
INSERT INTO thinkox_district VALUES ('230227', '富裕县', '3', '230200');
INSERT INTO thinkox_district VALUES ('230229', '克山县', '3', '230200');
INSERT INTO thinkox_district VALUES ('230230', '克东县', '3', '230200');
INSERT INTO thinkox_district VALUES ('230231', '拜泉县', '3', '230200');
INSERT INTO thinkox_district VALUES ('230281', '讷河市', '3', '230200');
INSERT INTO thinkox_district VALUES ('230301', '市辖区', '3', '230300');
INSERT INTO thinkox_district VALUES ('230302', '鸡冠区', '3', '230300');
INSERT INTO thinkox_district VALUES ('230303', '恒山区', '3', '230300');
INSERT INTO thinkox_district VALUES ('230304', '滴道区', '3', '230300');
INSERT INTO thinkox_district VALUES ('230305', '梨树区', '3', '230300');
INSERT INTO thinkox_district VALUES ('230306', '城子河区', '3', '230300');
INSERT INTO thinkox_district VALUES ('230307', '麻山区', '3', '230300');
INSERT INTO thinkox_district VALUES ('230321', '鸡东县', '3', '230300');
INSERT INTO thinkox_district VALUES ('230381', '虎林市', '3', '230300');
INSERT INTO thinkox_district VALUES ('230382', '密山市', '3', '230300');
INSERT INTO thinkox_district VALUES ('230401', '市辖区', '3', '230400');
INSERT INTO thinkox_district VALUES ('230402', '向阳区', '3', '230400');
INSERT INTO thinkox_district VALUES ('230403', '工农区', '3', '230400');
INSERT INTO thinkox_district VALUES ('230404', '南山区', '3', '230400');
INSERT INTO thinkox_district VALUES ('230405', '兴安区', '3', '230400');
INSERT INTO thinkox_district VALUES ('230406', '东山区', '3', '230400');
INSERT INTO thinkox_district VALUES ('230407', '兴山区', '3', '230400');
INSERT INTO thinkox_district VALUES ('230421', '萝北县', '3', '230400');
INSERT INTO thinkox_district VALUES ('230422', '绥滨县', '3', '230400');
INSERT INTO thinkox_district VALUES ('230501', '市辖区', '3', '230500');
INSERT INTO thinkox_district VALUES ('230502', '尖山区', '3', '230500');
INSERT INTO thinkox_district VALUES ('230503', '岭东区', '3', '230500');
INSERT INTO thinkox_district VALUES ('230505', '四方台区', '3', '230500');
INSERT INTO thinkox_district VALUES ('230506', '宝山区', '3', '230500');
INSERT INTO thinkox_district VALUES ('230521', '集贤县', '3', '230500');
INSERT INTO thinkox_district VALUES ('230522', '友谊县', '3', '230500');
INSERT INTO thinkox_district VALUES ('230523', '宝清县', '3', '230500');
INSERT INTO thinkox_district VALUES ('230524', '饶河县', '3', '230500');
INSERT INTO thinkox_district VALUES ('230601', '市辖区', '3', '230600');
INSERT INTO thinkox_district VALUES ('230602', '萨尔图区', '3', '230600');
INSERT INTO thinkox_district VALUES ('230603', '龙凤区', '3', '230600');
INSERT INTO thinkox_district VALUES ('230604', '让胡路区', '3', '230600');
INSERT INTO thinkox_district VALUES ('230605', '红岗区', '3', '230600');
INSERT INTO thinkox_district VALUES ('230606', '大同区', '3', '230600');
INSERT INTO thinkox_district VALUES ('230621', '肇州县', '3', '230600');
INSERT INTO thinkox_district VALUES ('230622', '肇源县', '3', '230600');
INSERT INTO thinkox_district VALUES ('230623', '林甸县', '3', '230600');
INSERT INTO thinkox_district VALUES ('230624', '杜尔伯特蒙古族自治县', '3', '230600');
INSERT INTO thinkox_district VALUES ('230701', '市辖区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230702', '伊春区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230703', '南岔区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230704', '友好区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230705', '西林区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230706', '翠峦区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230707', '新青区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230708', '美溪区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230709', '金山屯区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230710', '五营区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230711', '乌马河区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230712', '汤旺河区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230713', '带岭区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230714', '乌伊岭区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230715', '红星区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230716', '上甘岭区', '3', '230700');
INSERT INTO thinkox_district VALUES ('230722', '嘉荫县', '3', '230700');
INSERT INTO thinkox_district VALUES ('230781', '铁力市', '3', '230700');
INSERT INTO thinkox_district VALUES ('230801', '市辖区', '3', '230800');
INSERT INTO thinkox_district VALUES ('230802', '永红区', '3', '230800');
INSERT INTO thinkox_district VALUES ('230803', '向阳区', '3', '230800');
INSERT INTO thinkox_district VALUES ('230804', '前进区', '3', '230800');
INSERT INTO thinkox_district VALUES ('230805', '东风区', '3', '230800');
INSERT INTO thinkox_district VALUES ('230811', '郊　区', '3', '230800');
INSERT INTO thinkox_district VALUES ('230822', '桦南县', '3', '230800');
INSERT INTO thinkox_district VALUES ('230826', '桦川县', '3', '230800');
INSERT INTO thinkox_district VALUES ('230828', '汤原县', '3', '230800');
INSERT INTO thinkox_district VALUES ('230833', '抚远县', '3', '230800');
INSERT INTO thinkox_district VALUES ('230881', '同江市', '3', '230800');
INSERT INTO thinkox_district VALUES ('230882', '富锦市', '3', '230800');
INSERT INTO thinkox_district VALUES ('230901', '市辖区', '3', '230900');
INSERT INTO thinkox_district VALUES ('230902', '新兴区', '3', '230900');
INSERT INTO thinkox_district VALUES ('230903', '桃山区', '3', '230900');
INSERT INTO thinkox_district VALUES ('230904', '茄子河区', '3', '230900');
INSERT INTO thinkox_district VALUES ('230921', '勃利县', '3', '230900');
INSERT INTO thinkox_district VALUES ('231001', '市辖区', '3', '231000');
INSERT INTO thinkox_district VALUES ('231002', '东安区', '3', '231000');
INSERT INTO thinkox_district VALUES ('231003', '阳明区', '3', '231000');
INSERT INTO thinkox_district VALUES ('231004', '爱民区', '3', '231000');
INSERT INTO thinkox_district VALUES ('231005', '西安区', '3', '231000');
INSERT INTO thinkox_district VALUES ('231024', '东宁县', '3', '231000');
INSERT INTO thinkox_district VALUES ('231025', '林口县', '3', '231000');
INSERT INTO thinkox_district VALUES ('231081', '绥芬河市', '3', '231000');
INSERT INTO thinkox_district VALUES ('231083', '海林市', '3', '231000');
INSERT INTO thinkox_district VALUES ('231084', '宁安市', '3', '231000');
INSERT INTO thinkox_district VALUES ('231085', '穆棱市', '3', '231000');
INSERT INTO thinkox_district VALUES ('231101', '市辖区', '3', '231100');
INSERT INTO thinkox_district VALUES ('231102', '爱辉区', '3', '231100');
INSERT INTO thinkox_district VALUES ('231121', '嫩江县', '3', '231100');
INSERT INTO thinkox_district VALUES ('231123', '逊克县', '3', '231100');
INSERT INTO thinkox_district VALUES ('231124', '孙吴县', '3', '231100');
INSERT INTO thinkox_district VALUES ('231181', '北安市', '3', '231100');
INSERT INTO thinkox_district VALUES ('231182', '五大连池市', '3', '231100');
INSERT INTO thinkox_district VALUES ('231201', '市辖区', '3', '231200');
INSERT INTO thinkox_district VALUES ('231202', '北林区', '3', '231200');
INSERT INTO thinkox_district VALUES ('231221', '望奎县', '3', '231200');
INSERT INTO thinkox_district VALUES ('231222', '兰西县', '3', '231200');
INSERT INTO thinkox_district VALUES ('231223', '青冈县', '3', '231200');
INSERT INTO thinkox_district VALUES ('231224', '庆安县', '3', '231200');
INSERT INTO thinkox_district VALUES ('231225', '明水县', '3', '231200');
INSERT INTO thinkox_district VALUES ('231226', '绥棱县', '3', '231200');
INSERT INTO thinkox_district VALUES ('231281', '安达市', '3', '231200');
INSERT INTO thinkox_district VALUES ('231282', '肇东市', '3', '231200');
INSERT INTO thinkox_district VALUES ('231283', '海伦市', '3', '231200');
INSERT INTO thinkox_district VALUES ('232721', '呼玛县', '3', '232700');
INSERT INTO thinkox_district VALUES ('232722', '塔河县', '3', '232700');
INSERT INTO thinkox_district VALUES ('232723', '漠河县', '3', '232700');
INSERT INTO thinkox_district VALUES ('310101', '黄浦区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310103', '卢湾区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310104', '徐汇区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310105', '长宁区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310106', '静安区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310107', '普陀区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310108', '闸北区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310109', '虹口区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310110', '杨浦区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310112', '闵行区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310113', '宝山区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310114', '嘉定区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310115', '浦东新区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310116', '金山区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310117', '松江区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310118', '青浦区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310119', '南汇区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310120', '奉贤区', '3', '310100');
INSERT INTO thinkox_district VALUES ('310230', '崇明县', '3', '310200');
INSERT INTO thinkox_district VALUES ('320101', '市辖区', '3', '320100');
INSERT INTO thinkox_district VALUES ('320102', '玄武区', '3', '320100');
INSERT INTO thinkox_district VALUES ('320103', '白下区', '3', '320100');
INSERT INTO thinkox_district VALUES ('320104', '秦淮区', '3', '320100');
INSERT INTO thinkox_district VALUES ('320105', '建邺区', '3', '320100');
INSERT INTO thinkox_district VALUES ('320106', '鼓楼区', '3', '320100');
INSERT INTO thinkox_district VALUES ('320107', '下关区', '3', '320100');
INSERT INTO thinkox_district VALUES ('320111', '浦口区', '3', '320100');
INSERT INTO thinkox_district VALUES ('320113', '栖霞区', '3', '320100');
INSERT INTO thinkox_district VALUES ('320114', '雨花台区', '3', '320100');
INSERT INTO thinkox_district VALUES ('320115', '江宁区', '3', '320100');
INSERT INTO thinkox_district VALUES ('320116', '六合区', '3', '320100');
INSERT INTO thinkox_district VALUES ('320124', '溧水县', '3', '320100');
INSERT INTO thinkox_district VALUES ('320125', '高淳县', '3', '320100');
INSERT INTO thinkox_district VALUES ('320201', '市辖区', '3', '320200');
INSERT INTO thinkox_district VALUES ('320202', '崇安区', '3', '320200');
INSERT INTO thinkox_district VALUES ('320203', '南长区', '3', '320200');
INSERT INTO thinkox_district VALUES ('320204', '北塘区', '3', '320200');
INSERT INTO thinkox_district VALUES ('320205', '锡山区', '3', '320200');
INSERT INTO thinkox_district VALUES ('320206', '惠山区', '3', '320200');
INSERT INTO thinkox_district VALUES ('320211', '滨湖区', '3', '320200');
INSERT INTO thinkox_district VALUES ('320281', '江阴市', '3', '320200');
INSERT INTO thinkox_district VALUES ('320282', '宜兴市', '3', '320200');
INSERT INTO thinkox_district VALUES ('320301', '市辖区', '3', '320300');
INSERT INTO thinkox_district VALUES ('320302', '鼓楼区', '3', '320300');
INSERT INTO thinkox_district VALUES ('320303', '云龙区', '3', '320300');
INSERT INTO thinkox_district VALUES ('320304', '九里区', '3', '320300');
INSERT INTO thinkox_district VALUES ('320305', '贾汪区', '3', '320300');
INSERT INTO thinkox_district VALUES ('320311', '泉山区', '3', '320300');
INSERT INTO thinkox_district VALUES ('320321', '丰　县', '3', '320300');
INSERT INTO thinkox_district VALUES ('320322', '沛　县', '3', '320300');
INSERT INTO thinkox_district VALUES ('320323', '铜山县', '3', '320300');
INSERT INTO thinkox_district VALUES ('320324', '睢宁县', '3', '320300');
INSERT INTO thinkox_district VALUES ('320381', '新沂市', '3', '320300');
INSERT INTO thinkox_district VALUES ('320382', '邳州市', '3', '320300');
INSERT INTO thinkox_district VALUES ('320401', '市辖区', '3', '320400');
INSERT INTO thinkox_district VALUES ('320402', '天宁区', '3', '320400');
INSERT INTO thinkox_district VALUES ('320404', '钟楼区', '3', '320400');
INSERT INTO thinkox_district VALUES ('320405', '戚墅堰区', '3', '320400');
INSERT INTO thinkox_district VALUES ('320411', '新北区', '3', '320400');
INSERT INTO thinkox_district VALUES ('320412', '武进区', '3', '320400');
INSERT INTO thinkox_district VALUES ('320481', '溧阳市', '3', '320400');
INSERT INTO thinkox_district VALUES ('320482', '金坛市', '3', '320400');
INSERT INTO thinkox_district VALUES ('320501', '市辖区', '3', '320500');
INSERT INTO thinkox_district VALUES ('320502', '沧浪区', '3', '320500');
INSERT INTO thinkox_district VALUES ('320503', '平江区', '3', '320500');
INSERT INTO thinkox_district VALUES ('320504', '金阊区', '3', '320500');
INSERT INTO thinkox_district VALUES ('320505', '虎丘区', '3', '320500');
INSERT INTO thinkox_district VALUES ('320506', '吴中区', '3', '320500');
INSERT INTO thinkox_district VALUES ('320507', '相城区', '3', '320500');
INSERT INTO thinkox_district VALUES ('320581', '常熟市', '3', '320500');
INSERT INTO thinkox_district VALUES ('320582', '张家港市', '3', '320500');
INSERT INTO thinkox_district VALUES ('320583', '昆山市', '3', '320500');
INSERT INTO thinkox_district VALUES ('320584', '吴江市', '3', '320500');
INSERT INTO thinkox_district VALUES ('320585', '太仓市', '3', '320500');
INSERT INTO thinkox_district VALUES ('320601', '市辖区', '3', '320600');
INSERT INTO thinkox_district VALUES ('320602', '崇川区', '3', '320600');
INSERT INTO thinkox_district VALUES ('320611', '港闸区', '3', '320600');
INSERT INTO thinkox_district VALUES ('320621', '海安县', '3', '320600');
INSERT INTO thinkox_district VALUES ('320623', '如东县', '3', '320600');
INSERT INTO thinkox_district VALUES ('320681', '启东市', '3', '320600');
INSERT INTO thinkox_district VALUES ('320682', '如皋市', '3', '320600');
INSERT INTO thinkox_district VALUES ('320683', '通州市', '3', '320600');
INSERT INTO thinkox_district VALUES ('320684', '海门市', '3', '320600');
INSERT INTO thinkox_district VALUES ('320701', '市辖区', '3', '320700');
INSERT INTO thinkox_district VALUES ('320703', '连云区', '3', '320700');
INSERT INTO thinkox_district VALUES ('320705', '新浦区', '3', '320700');
INSERT INTO thinkox_district VALUES ('320706', '海州区', '3', '320700');
INSERT INTO thinkox_district VALUES ('320721', '赣榆县', '3', '320700');
INSERT INTO thinkox_district VALUES ('320722', '东海县', '3', '320700');
INSERT INTO thinkox_district VALUES ('320723', '灌云县', '3', '320700');
INSERT INTO thinkox_district VALUES ('320724', '灌南县', '3', '320700');
INSERT INTO thinkox_district VALUES ('320801', '市辖区', '3', '320800');
INSERT INTO thinkox_district VALUES ('320802', '清河区', '3', '320800');
INSERT INTO thinkox_district VALUES ('320803', '楚州区', '3', '320800');
INSERT INTO thinkox_district VALUES ('320804', '淮阴区', '3', '320800');
INSERT INTO thinkox_district VALUES ('320811', '清浦区', '3', '320800');
INSERT INTO thinkox_district VALUES ('320826', '涟水县', '3', '320800');
INSERT INTO thinkox_district VALUES ('320829', '洪泽县', '3', '320800');
INSERT INTO thinkox_district VALUES ('320830', '盱眙县', '3', '320800');
INSERT INTO thinkox_district VALUES ('320831', '金湖县', '3', '320800');
INSERT INTO thinkox_district VALUES ('320901', '市辖区', '3', '320900');
INSERT INTO thinkox_district VALUES ('320902', '亭湖区', '3', '320900');
INSERT INTO thinkox_district VALUES ('320903', '盐都区', '3', '320900');
INSERT INTO thinkox_district VALUES ('320921', '响水县', '3', '320900');
INSERT INTO thinkox_district VALUES ('320922', '滨海县', '3', '320900');
INSERT INTO thinkox_district VALUES ('320923', '阜宁县', '3', '320900');
INSERT INTO thinkox_district VALUES ('320924', '射阳县', '3', '320900');
INSERT INTO thinkox_district VALUES ('320925', '建湖县', '3', '320900');
INSERT INTO thinkox_district VALUES ('320981', '东台市', '3', '320900');
INSERT INTO thinkox_district VALUES ('320982', '大丰市', '3', '320900');
INSERT INTO thinkox_district VALUES ('321001', '市辖区', '3', '321000');
INSERT INTO thinkox_district VALUES ('321002', '广陵区', '3', '321000');
INSERT INTO thinkox_district VALUES ('321003', '邗江区', '3', '321000');
INSERT INTO thinkox_district VALUES ('321011', '郊　区', '3', '321000');
INSERT INTO thinkox_district VALUES ('321023', '宝应县', '3', '321000');
INSERT INTO thinkox_district VALUES ('321081', '仪征市', '3', '321000');
INSERT INTO thinkox_district VALUES ('321084', '高邮市', '3', '321000');
INSERT INTO thinkox_district VALUES ('321088', '江都市', '3', '321000');
INSERT INTO thinkox_district VALUES ('321101', '市辖区', '3', '321100');
INSERT INTO thinkox_district VALUES ('321102', '京口区', '3', '321100');
INSERT INTO thinkox_district VALUES ('321111', '润州区', '3', '321100');
INSERT INTO thinkox_district VALUES ('321112', '丹徒区', '3', '321100');
INSERT INTO thinkox_district VALUES ('321181', '丹阳市', '3', '321100');
INSERT INTO thinkox_district VALUES ('321182', '扬中市', '3', '321100');
INSERT INTO thinkox_district VALUES ('321183', '句容市', '3', '321100');
INSERT INTO thinkox_district VALUES ('321201', '市辖区', '3', '321200');
INSERT INTO thinkox_district VALUES ('321202', '海陵区', '3', '321200');
INSERT INTO thinkox_district VALUES ('321203', '高港区', '3', '321200');
INSERT INTO thinkox_district VALUES ('321281', '兴化市', '3', '321200');
INSERT INTO thinkox_district VALUES ('321282', '靖江市', '3', '321200');
INSERT INTO thinkox_district VALUES ('321283', '泰兴市', '3', '321200');
INSERT INTO thinkox_district VALUES ('321284', '姜堰市', '3', '321200');
INSERT INTO thinkox_district VALUES ('321301', '市辖区', '3', '321300');
INSERT INTO thinkox_district VALUES ('321302', '宿城区', '3', '321300');
INSERT INTO thinkox_district VALUES ('321311', '宿豫区', '3', '321300');
INSERT INTO thinkox_district VALUES ('321322', '沭阳县', '3', '321300');
INSERT INTO thinkox_district VALUES ('321323', '泗阳县', '3', '321300');
INSERT INTO thinkox_district VALUES ('321324', '泗洪县', '3', '321300');
INSERT INTO thinkox_district VALUES ('330101', '市辖区', '3', '330100');
INSERT INTO thinkox_district VALUES ('330102', '上城区', '3', '330100');
INSERT INTO thinkox_district VALUES ('330103', '下城区', '3', '330100');
INSERT INTO thinkox_district VALUES ('330104', '江干区', '3', '330100');
INSERT INTO thinkox_district VALUES ('330105', '拱墅区', '3', '330100');
INSERT INTO thinkox_district VALUES ('330106', '西湖区', '3', '330100');
INSERT INTO thinkox_district VALUES ('330108', '滨江区', '3', '330100');
INSERT INTO thinkox_district VALUES ('330109', '萧山区', '3', '330100');
INSERT INTO thinkox_district VALUES ('330110', '余杭区', '3', '330100');
INSERT INTO thinkox_district VALUES ('330122', '桐庐县', '3', '330100');
INSERT INTO thinkox_district VALUES ('330127', '淳安县', '3', '330100');
INSERT INTO thinkox_district VALUES ('330182', '建德市', '3', '330100');
INSERT INTO thinkox_district VALUES ('330183', '富阳市', '3', '330100');
INSERT INTO thinkox_district VALUES ('330185', '临安市', '3', '330100');
INSERT INTO thinkox_district VALUES ('330201', '市辖区', '3', '330200');
INSERT INTO thinkox_district VALUES ('330203', '海曙区', '3', '330200');
INSERT INTO thinkox_district VALUES ('330204', '江东区', '3', '330200');
INSERT INTO thinkox_district VALUES ('330205', '江北区', '3', '330200');
INSERT INTO thinkox_district VALUES ('330206', '北仑区', '3', '330200');
INSERT INTO thinkox_district VALUES ('330211', '镇海区', '3', '330200');
INSERT INTO thinkox_district VALUES ('330212', '鄞州区', '3', '330200');
INSERT INTO thinkox_district VALUES ('330225', '象山县', '3', '330200');
INSERT INTO thinkox_district VALUES ('330226', '宁海县', '3', '330200');
INSERT INTO thinkox_district VALUES ('330281', '余姚市', '3', '330200');
INSERT INTO thinkox_district VALUES ('330282', '慈溪市', '3', '330200');
INSERT INTO thinkox_district VALUES ('330283', '奉化市', '3', '330200');
INSERT INTO thinkox_district VALUES ('330301', '市辖区', '3', '330300');
INSERT INTO thinkox_district VALUES ('330302', '鹿城区', '3', '330300');
INSERT INTO thinkox_district VALUES ('330303', '龙湾区', '3', '330300');
INSERT INTO thinkox_district VALUES ('330304', '瓯海区', '3', '330300');
INSERT INTO thinkox_district VALUES ('330322', '洞头县', '3', '330300');
INSERT INTO thinkox_district VALUES ('330324', '永嘉县', '3', '330300');
INSERT INTO thinkox_district VALUES ('330326', '平阳县', '3', '330300');
INSERT INTO thinkox_district VALUES ('330327', '苍南县', '3', '330300');
INSERT INTO thinkox_district VALUES ('330328', '文成县', '3', '330300');
INSERT INTO thinkox_district VALUES ('330329', '泰顺县', '3', '330300');
INSERT INTO thinkox_district VALUES ('330381', '瑞安市', '3', '330300');
INSERT INTO thinkox_district VALUES ('330382', '乐清市', '3', '330300');
INSERT INTO thinkox_district VALUES ('330401', '市辖区', '3', '330400');
INSERT INTO thinkox_district VALUES ('330402', '秀城区', '3', '330400');
INSERT INTO thinkox_district VALUES ('330411', '秀洲区', '3', '330400');
INSERT INTO thinkox_district VALUES ('330421', '嘉善县', '3', '330400');
INSERT INTO thinkox_district VALUES ('330424', '海盐县', '3', '330400');
INSERT INTO thinkox_district VALUES ('330481', '海宁市', '3', '330400');
INSERT INTO thinkox_district VALUES ('330482', '平湖市', '3', '330400');
INSERT INTO thinkox_district VALUES ('330483', '桐乡市', '3', '330400');
INSERT INTO thinkox_district VALUES ('330501', '市辖区', '3', '330500');
INSERT INTO thinkox_district VALUES ('330502', '吴兴区', '3', '330500');
INSERT INTO thinkox_district VALUES ('330503', '南浔区', '3', '330500');
INSERT INTO thinkox_district VALUES ('330521', '德清县', '3', '330500');
INSERT INTO thinkox_district VALUES ('330522', '长兴县', '3', '330500');
INSERT INTO thinkox_district VALUES ('330523', '安吉县', '3', '330500');
INSERT INTO thinkox_district VALUES ('330601', '市辖区', '3', '330600');
INSERT INTO thinkox_district VALUES ('330602', '越城区', '3', '330600');
INSERT INTO thinkox_district VALUES ('330621', '绍兴县', '3', '330600');
INSERT INTO thinkox_district VALUES ('330624', '新昌县', '3', '330600');
INSERT INTO thinkox_district VALUES ('330681', '诸暨市', '3', '330600');
INSERT INTO thinkox_district VALUES ('330682', '上虞市', '3', '330600');
INSERT INTO thinkox_district VALUES ('330683', '嵊州市', '3', '330600');
INSERT INTO thinkox_district VALUES ('330701', '市辖区', '3', '330700');
INSERT INTO thinkox_district VALUES ('330702', '婺城区', '3', '330700');
INSERT INTO thinkox_district VALUES ('330703', '金东区', '3', '330700');
INSERT INTO thinkox_district VALUES ('330723', '武义县', '3', '330700');
INSERT INTO thinkox_district VALUES ('330726', '浦江县', '3', '330700');
INSERT INTO thinkox_district VALUES ('330727', '磐安县', '3', '330700');
INSERT INTO thinkox_district VALUES ('330781', '兰溪市', '3', '330700');
INSERT INTO thinkox_district VALUES ('330782', '义乌市', '3', '330700');
INSERT INTO thinkox_district VALUES ('330783', '东阳市', '3', '330700');
INSERT INTO thinkox_district VALUES ('330784', '永康市', '3', '330700');
INSERT INTO thinkox_district VALUES ('330801', '市辖区', '3', '330800');
INSERT INTO thinkox_district VALUES ('330802', '柯城区', '3', '330800');
INSERT INTO thinkox_district VALUES ('330803', '衢江区', '3', '330800');
INSERT INTO thinkox_district VALUES ('330822', '常山县', '3', '330800');
INSERT INTO thinkox_district VALUES ('330824', '开化县', '3', '330800');
INSERT INTO thinkox_district VALUES ('330825', '龙游县', '3', '330800');
INSERT INTO thinkox_district VALUES ('330881', '江山市', '3', '330800');
INSERT INTO thinkox_district VALUES ('330901', '市辖区', '3', '330900');
INSERT INTO thinkox_district VALUES ('330902', '定海区', '3', '330900');
INSERT INTO thinkox_district VALUES ('330903', '普陀区', '3', '330900');
INSERT INTO thinkox_district VALUES ('330921', '岱山县', '3', '330900');
INSERT INTO thinkox_district VALUES ('330922', '嵊泗县', '3', '330900');
INSERT INTO thinkox_district VALUES ('331001', '市辖区', '3', '331000');
INSERT INTO thinkox_district VALUES ('331002', '椒江区', '3', '331000');
INSERT INTO thinkox_district VALUES ('331003', '黄岩区', '3', '331000');
INSERT INTO thinkox_district VALUES ('331004', '路桥区', '3', '331000');
INSERT INTO thinkox_district VALUES ('331021', '玉环县', '3', '331000');
INSERT INTO thinkox_district VALUES ('331022', '三门县', '3', '331000');
INSERT INTO thinkox_district VALUES ('331023', '天台县', '3', '331000');
INSERT INTO thinkox_district VALUES ('331024', '仙居县', '3', '331000');
INSERT INTO thinkox_district VALUES ('331081', '温岭市', '3', '331000');
INSERT INTO thinkox_district VALUES ('331082', '临海市', '3', '331000');
INSERT INTO thinkox_district VALUES ('331101', '市辖区', '3', '331100');
INSERT INTO thinkox_district VALUES ('331102', '莲都区', '3', '331100');
INSERT INTO thinkox_district VALUES ('331121', '青田县', '3', '331100');
INSERT INTO thinkox_district VALUES ('331122', '缙云县', '3', '331100');
INSERT INTO thinkox_district VALUES ('331123', '遂昌县', '3', '331100');
INSERT INTO thinkox_district VALUES ('331124', '松阳县', '3', '331100');
INSERT INTO thinkox_district VALUES ('331125', '云和县', '3', '331100');
INSERT INTO thinkox_district VALUES ('331126', '庆元县', '3', '331100');
INSERT INTO thinkox_district VALUES ('331127', '景宁畲族自治县', '3', '331100');
INSERT INTO thinkox_district VALUES ('331181', '龙泉市', '3', '331100');
INSERT INTO thinkox_district VALUES ('340101', '市辖区', '3', '340100');
INSERT INTO thinkox_district VALUES ('340102', '瑶海区', '3', '340100');
INSERT INTO thinkox_district VALUES ('340103', '庐阳区', '3', '340100');
INSERT INTO thinkox_district VALUES ('340104', '蜀山区', '3', '340100');
INSERT INTO thinkox_district VALUES ('340111', '包河区', '3', '340100');
INSERT INTO thinkox_district VALUES ('340121', '长丰县', '3', '340100');
INSERT INTO thinkox_district VALUES ('340122', '肥东县', '3', '340100');
INSERT INTO thinkox_district VALUES ('340123', '肥西县', '3', '340100');
INSERT INTO thinkox_district VALUES ('340201', '市辖区', '3', '340200');
INSERT INTO thinkox_district VALUES ('340202', '镜湖区', '3', '340200');
INSERT INTO thinkox_district VALUES ('340203', '马塘区', '3', '340200');
INSERT INTO thinkox_district VALUES ('340204', '新芜区', '3', '340200');
INSERT INTO thinkox_district VALUES ('340207', '鸠江区', '3', '340200');
INSERT INTO thinkox_district VALUES ('340221', '芜湖县', '3', '340200');
INSERT INTO thinkox_district VALUES ('340222', '繁昌县', '3', '340200');
INSERT INTO thinkox_district VALUES ('340223', '南陵县', '3', '340200');
INSERT INTO thinkox_district VALUES ('340301', '市辖区', '3', '340300');
INSERT INTO thinkox_district VALUES ('340302', '龙子湖区', '3', '340300');
INSERT INTO thinkox_district VALUES ('340303', '蚌山区', '3', '340300');
INSERT INTO thinkox_district VALUES ('340304', '禹会区', '3', '340300');
INSERT INTO thinkox_district VALUES ('340311', '淮上区', '3', '340300');
INSERT INTO thinkox_district VALUES ('340321', '怀远县', '3', '340300');
INSERT INTO thinkox_district VALUES ('340322', '五河县', '3', '340300');
INSERT INTO thinkox_district VALUES ('340323', '固镇县', '3', '340300');
INSERT INTO thinkox_district VALUES ('340401', '市辖区', '3', '340400');
INSERT INTO thinkox_district VALUES ('340402', '大通区', '3', '340400');
INSERT INTO thinkox_district VALUES ('340403', '田家庵区', '3', '340400');
INSERT INTO thinkox_district VALUES ('340404', '谢家集区', '3', '340400');
INSERT INTO thinkox_district VALUES ('340405', '八公山区', '3', '340400');
INSERT INTO thinkox_district VALUES ('340406', '潘集区', '3', '340400');
INSERT INTO thinkox_district VALUES ('340421', '凤台县', '3', '340400');
INSERT INTO thinkox_district VALUES ('340501', '市辖区', '3', '340500');
INSERT INTO thinkox_district VALUES ('340502', '金家庄区', '3', '340500');
INSERT INTO thinkox_district VALUES ('340503', '花山区', '3', '340500');
INSERT INTO thinkox_district VALUES ('340504', '雨山区', '3', '340500');
INSERT INTO thinkox_district VALUES ('340521', '当涂县', '3', '340500');
INSERT INTO thinkox_district VALUES ('340601', '市辖区', '3', '340600');
INSERT INTO thinkox_district VALUES ('340602', '杜集区', '3', '340600');
INSERT INTO thinkox_district VALUES ('340603', '相山区', '3', '340600');
INSERT INTO thinkox_district VALUES ('340604', '烈山区', '3', '340600');
INSERT INTO thinkox_district VALUES ('340621', '濉溪县', '3', '340600');
INSERT INTO thinkox_district VALUES ('340701', '市辖区', '3', '340700');
INSERT INTO thinkox_district VALUES ('340702', '铜官山区', '3', '340700');
INSERT INTO thinkox_district VALUES ('340703', '狮子山区', '3', '340700');
INSERT INTO thinkox_district VALUES ('340711', '郊　区', '3', '340700');
INSERT INTO thinkox_district VALUES ('340721', '铜陵县', '3', '340700');
INSERT INTO thinkox_district VALUES ('340801', '市辖区', '3', '340800');
INSERT INTO thinkox_district VALUES ('340802', '迎江区', '3', '340800');
INSERT INTO thinkox_district VALUES ('340803', '大观区', '3', '340800');
INSERT INTO thinkox_district VALUES ('340811', '郊　区', '3', '340800');
INSERT INTO thinkox_district VALUES ('340822', '怀宁县', '3', '340800');
INSERT INTO thinkox_district VALUES ('340823', '枞阳县', '3', '340800');
INSERT INTO thinkox_district VALUES ('340824', '潜山县', '3', '340800');
INSERT INTO thinkox_district VALUES ('340825', '太湖县', '3', '340800');
INSERT INTO thinkox_district VALUES ('340826', '宿松县', '3', '340800');
INSERT INTO thinkox_district VALUES ('340827', '望江县', '3', '340800');
INSERT INTO thinkox_district VALUES ('340828', '岳西县', '3', '340800');
INSERT INTO thinkox_district VALUES ('340881', '桐城市', '3', '340800');
INSERT INTO thinkox_district VALUES ('341001', '市辖区', '3', '341000');
INSERT INTO thinkox_district VALUES ('341002', '屯溪区', '3', '341000');
INSERT INTO thinkox_district VALUES ('341003', '黄山区', '3', '341000');
INSERT INTO thinkox_district VALUES ('341004', '徽州区', '3', '341000');
INSERT INTO thinkox_district VALUES ('341021', '歙　县', '3', '341000');
INSERT INTO thinkox_district VALUES ('341022', '休宁县', '3', '341000');
INSERT INTO thinkox_district VALUES ('341023', '黟　县', '3', '341000');
INSERT INTO thinkox_district VALUES ('341024', '祁门县', '3', '341000');
INSERT INTO thinkox_district VALUES ('341101', '市辖区', '3', '341100');
INSERT INTO thinkox_district VALUES ('341102', '琅琊区', '3', '341100');
INSERT INTO thinkox_district VALUES ('341103', '南谯区', '3', '341100');
INSERT INTO thinkox_district VALUES ('341122', '来安县', '3', '341100');
INSERT INTO thinkox_district VALUES ('341124', '全椒县', '3', '341100');
INSERT INTO thinkox_district VALUES ('341125', '定远县', '3', '341100');
INSERT INTO thinkox_district VALUES ('341126', '凤阳县', '3', '341100');
INSERT INTO thinkox_district VALUES ('341181', '天长市', '3', '341100');
INSERT INTO thinkox_district VALUES ('341182', '明光市', '3', '341100');
INSERT INTO thinkox_district VALUES ('341201', '市辖区', '3', '341200');
INSERT INTO thinkox_district VALUES ('341202', '颍州区', '3', '341200');
INSERT INTO thinkox_district VALUES ('341203', '颍东区', '3', '341200');
INSERT INTO thinkox_district VALUES ('341204', '颍泉区', '3', '341200');
INSERT INTO thinkox_district VALUES ('341221', '临泉县', '3', '341200');
INSERT INTO thinkox_district VALUES ('341222', '太和县', '3', '341200');
INSERT INTO thinkox_district VALUES ('341225', '阜南县', '3', '341200');
INSERT INTO thinkox_district VALUES ('341226', '颍上县', '3', '341200');
INSERT INTO thinkox_district VALUES ('341282', '界首市', '3', '341200');
INSERT INTO thinkox_district VALUES ('341301', '市辖区', '3', '341300');
INSERT INTO thinkox_district VALUES ('341302', '墉桥区', '3', '341300');
INSERT INTO thinkox_district VALUES ('341321', '砀山县', '3', '341300');
INSERT INTO thinkox_district VALUES ('341322', '萧　县', '3', '341300');
INSERT INTO thinkox_district VALUES ('341323', '灵璧县', '3', '341300');
INSERT INTO thinkox_district VALUES ('341324', '泗　县', '3', '341300');
INSERT INTO thinkox_district VALUES ('341401', '庐江县', '3', '340100');
INSERT INTO thinkox_district VALUES ('341402', '巢湖市', '3', '340100');
INSERT INTO thinkox_district VALUES ('341422', '无为县', '3', '340200');
INSERT INTO thinkox_district VALUES ('341423', '含山县', '3', '340500');
INSERT INTO thinkox_district VALUES ('341424', '和　县', '3', '340500');
INSERT INTO thinkox_district VALUES ('341501', '市辖区', '3', '341500');
INSERT INTO thinkox_district VALUES ('341502', '金安区', '3', '341500');
INSERT INTO thinkox_district VALUES ('341503', '裕安区', '3', '341500');
INSERT INTO thinkox_district VALUES ('341521', '寿　县', '3', '341500');
INSERT INTO thinkox_district VALUES ('341522', '霍邱县', '3', '341500');
INSERT INTO thinkox_district VALUES ('341523', '舒城县', '3', '341500');
INSERT INTO thinkox_district VALUES ('341524', '金寨县', '3', '341500');
INSERT INTO thinkox_district VALUES ('341525', '霍山县', '3', '341500');
INSERT INTO thinkox_district VALUES ('341601', '市辖区', '3', '341600');
INSERT INTO thinkox_district VALUES ('341602', '谯城区', '3', '341600');
INSERT INTO thinkox_district VALUES ('341621', '涡阳县', '3', '341600');
INSERT INTO thinkox_district VALUES ('341622', '蒙城县', '3', '341600');
INSERT INTO thinkox_district VALUES ('341623', '利辛县', '3', '341600');
INSERT INTO thinkox_district VALUES ('341701', '市辖区', '3', '341700');
INSERT INTO thinkox_district VALUES ('341702', '贵池区', '3', '341700');
INSERT INTO thinkox_district VALUES ('341721', '东至县', '3', '341700');
INSERT INTO thinkox_district VALUES ('341722', '石台县', '3', '341700');
INSERT INTO thinkox_district VALUES ('341723', '青阳县', '3', '341700');
INSERT INTO thinkox_district VALUES ('341801', '市辖区', '3', '341800');
INSERT INTO thinkox_district VALUES ('341802', '宣州区', '3', '341800');
INSERT INTO thinkox_district VALUES ('341821', '郎溪县', '3', '341800');
INSERT INTO thinkox_district VALUES ('341822', '广德县', '3', '341800');
INSERT INTO thinkox_district VALUES ('341823', '泾　县', '3', '341800');
INSERT INTO thinkox_district VALUES ('341824', '绩溪县', '3', '341800');
INSERT INTO thinkox_district VALUES ('341825', '旌德县', '3', '341800');
INSERT INTO thinkox_district VALUES ('341881', '宁国市', '3', '341800');
INSERT INTO thinkox_district VALUES ('350101', '市辖区', '3', '350100');
INSERT INTO thinkox_district VALUES ('350102', '鼓楼区', '3', '350100');
INSERT INTO thinkox_district VALUES ('350103', '台江区', '3', '350100');
INSERT INTO thinkox_district VALUES ('350104', '仓山区', '3', '350100');
INSERT INTO thinkox_district VALUES ('350105', '马尾区', '3', '350100');
INSERT INTO thinkox_district VALUES ('350111', '晋安区', '3', '350100');
INSERT INTO thinkox_district VALUES ('350121', '闽侯县', '3', '350100');
INSERT INTO thinkox_district VALUES ('350122', '连江县', '3', '350100');
INSERT INTO thinkox_district VALUES ('350123', '罗源县', '3', '350100');
INSERT INTO thinkox_district VALUES ('350124', '闽清县', '3', '350100');
INSERT INTO thinkox_district VALUES ('350125', '永泰县', '3', '350100');
INSERT INTO thinkox_district VALUES ('350128', '平潭县', '3', '350100');
INSERT INTO thinkox_district VALUES ('350181', '福清市', '3', '350100');
INSERT INTO thinkox_district VALUES ('350182', '长乐市', '3', '350100');
INSERT INTO thinkox_district VALUES ('350201', '市辖区', '3', '350200');
INSERT INTO thinkox_district VALUES ('350203', '思明区', '3', '350200');
INSERT INTO thinkox_district VALUES ('350205', '海沧区', '3', '350200');
INSERT INTO thinkox_district VALUES ('350206', '湖里区', '3', '350200');
INSERT INTO thinkox_district VALUES ('350211', '集美区', '3', '350200');
INSERT INTO thinkox_district VALUES ('350212', '同安区', '3', '350200');
INSERT INTO thinkox_district VALUES ('350213', '翔安区', '3', '350200');
INSERT INTO thinkox_district VALUES ('350301', '市辖区', '3', '350300');
INSERT INTO thinkox_district VALUES ('350302', '城厢区', '3', '350300');
INSERT INTO thinkox_district VALUES ('350303', '涵江区', '3', '350300');
INSERT INTO thinkox_district VALUES ('350304', '荔城区', '3', '350300');
INSERT INTO thinkox_district VALUES ('350305', '秀屿区', '3', '350300');
INSERT INTO thinkox_district VALUES ('350322', '仙游县', '3', '350300');
INSERT INTO thinkox_district VALUES ('350401', '市辖区', '3', '350400');
INSERT INTO thinkox_district VALUES ('350402', '梅列区', '3', '350400');
INSERT INTO thinkox_district VALUES ('350403', '三元区', '3', '350400');
INSERT INTO thinkox_district VALUES ('350421', '明溪县', '3', '350400');
INSERT INTO thinkox_district VALUES ('350423', '清流县', '3', '350400');
INSERT INTO thinkox_district VALUES ('350424', '宁化县', '3', '350400');
INSERT INTO thinkox_district VALUES ('350425', '大田县', '3', '350400');
INSERT INTO thinkox_district VALUES ('350426', '尤溪县', '3', '350400');
INSERT INTO thinkox_district VALUES ('350427', '沙　县', '3', '350400');
INSERT INTO thinkox_district VALUES ('350428', '将乐县', '3', '350400');
INSERT INTO thinkox_district VALUES ('350429', '泰宁县', '3', '350400');
INSERT INTO thinkox_district VALUES ('350430', '建宁县', '3', '350400');
INSERT INTO thinkox_district VALUES ('350481', '永安市', '3', '350400');
INSERT INTO thinkox_district VALUES ('350501', '市辖区', '3', '350500');
INSERT INTO thinkox_district VALUES ('350502', '鲤城区', '3', '350500');
INSERT INTO thinkox_district VALUES ('350503', '丰泽区', '3', '350500');
INSERT INTO thinkox_district VALUES ('350504', '洛江区', '3', '350500');
INSERT INTO thinkox_district VALUES ('350505', '泉港区', '3', '350500');
INSERT INTO thinkox_district VALUES ('350521', '惠安县', '3', '350500');
INSERT INTO thinkox_district VALUES ('350524', '安溪县', '3', '350500');
INSERT INTO thinkox_district VALUES ('350525', '永春县', '3', '350500');
INSERT INTO thinkox_district VALUES ('350526', '德化县', '3', '350500');
INSERT INTO thinkox_district VALUES ('350527', '金门县', '3', '350500');
INSERT INTO thinkox_district VALUES ('350581', '石狮市', '3', '350500');
INSERT INTO thinkox_district VALUES ('350582', '晋江市', '3', '350500');
INSERT INTO thinkox_district VALUES ('350583', '南安市', '3', '350500');
INSERT INTO thinkox_district VALUES ('350601', '市辖区', '3', '350600');
INSERT INTO thinkox_district VALUES ('350602', '芗城区', '3', '350600');
INSERT INTO thinkox_district VALUES ('350603', '龙文区', '3', '350600');
INSERT INTO thinkox_district VALUES ('350622', '云霄县', '3', '350600');
INSERT INTO thinkox_district VALUES ('350623', '漳浦县', '3', '350600');
INSERT INTO thinkox_district VALUES ('350624', '诏安县', '3', '350600');
INSERT INTO thinkox_district VALUES ('350625', '长泰县', '3', '350600');
INSERT INTO thinkox_district VALUES ('350626', '东山县', '3', '350600');
INSERT INTO thinkox_district VALUES ('350627', '南靖县', '3', '350600');
INSERT INTO thinkox_district VALUES ('350628', '平和县', '3', '350600');
INSERT INTO thinkox_district VALUES ('350629', '华安县', '3', '350600');
INSERT INTO thinkox_district VALUES ('350681', '龙海市', '3', '350600');
INSERT INTO thinkox_district VALUES ('350701', '市辖区', '3', '350700');
INSERT INTO thinkox_district VALUES ('350702', '延平区', '3', '350700');
INSERT INTO thinkox_district VALUES ('350721', '顺昌县', '3', '350700');
INSERT INTO thinkox_district VALUES ('350722', '浦城县', '3', '350700');
INSERT INTO thinkox_district VALUES ('350723', '光泽县', '3', '350700');
INSERT INTO thinkox_district VALUES ('350724', '松溪县', '3', '350700');
INSERT INTO thinkox_district VALUES ('350725', '政和县', '3', '350700');
INSERT INTO thinkox_district VALUES ('350781', '邵武市', '3', '350700');
INSERT INTO thinkox_district VALUES ('350782', '武夷山市', '3', '350700');
INSERT INTO thinkox_district VALUES ('350783', '建瓯市', '3', '350700');
INSERT INTO thinkox_district VALUES ('350784', '建阳市', '3', '350700');
INSERT INTO thinkox_district VALUES ('350801', '市辖区', '3', '350800');
INSERT INTO thinkox_district VALUES ('350802', '新罗区', '3', '350800');
INSERT INTO thinkox_district VALUES ('350821', '长汀县', '3', '350800');
INSERT INTO thinkox_district VALUES ('350822', '永定县', '3', '350800');
INSERT INTO thinkox_district VALUES ('350823', '上杭县', '3', '350800');
INSERT INTO thinkox_district VALUES ('350824', '武平县', '3', '350800');
INSERT INTO thinkox_district VALUES ('350825', '连城县', '3', '350800');
INSERT INTO thinkox_district VALUES ('350881', '漳平市', '3', '350800');
INSERT INTO thinkox_district VALUES ('350901', '市辖区', '3', '350900');
INSERT INTO thinkox_district VALUES ('350902', '蕉城区', '3', '350900');
INSERT INTO thinkox_district VALUES ('350921', '霞浦县', '3', '350900');
INSERT INTO thinkox_district VALUES ('350922', '古田县', '3', '350900');
INSERT INTO thinkox_district VALUES ('350923', '屏南县', '3', '350900');
INSERT INTO thinkox_district VALUES ('350924', '寿宁县', '3', '350900');
INSERT INTO thinkox_district VALUES ('350925', '周宁县', '3', '350900');
INSERT INTO thinkox_district VALUES ('350926', '柘荣县', '3', '350900');
INSERT INTO thinkox_district VALUES ('350981', '福安市', '3', '350900');
INSERT INTO thinkox_district VALUES ('350982', '福鼎市', '3', '350900');
INSERT INTO thinkox_district VALUES ('360101', '市辖区', '3', '360100');
INSERT INTO thinkox_district VALUES ('360102', '东湖区', '3', '360100');
INSERT INTO thinkox_district VALUES ('360103', '西湖区', '3', '360100');
INSERT INTO thinkox_district VALUES ('360104', '青云谱区', '3', '360100');
INSERT INTO thinkox_district VALUES ('360105', '湾里区', '3', '360100');
INSERT INTO thinkox_district VALUES ('360111', '青山湖区', '3', '360100');
INSERT INTO thinkox_district VALUES ('360121', '南昌县', '3', '360100');
INSERT INTO thinkox_district VALUES ('360122', '新建县', '3', '360100');
INSERT INTO thinkox_district VALUES ('360123', '安义县', '3', '360100');
INSERT INTO thinkox_district VALUES ('360124', '进贤县', '3', '360100');
INSERT INTO thinkox_district VALUES ('360201', '市辖区', '3', '360200');
INSERT INTO thinkox_district VALUES ('360202', '昌江区', '3', '360200');
INSERT INTO thinkox_district VALUES ('360203', '珠山区', '3', '360200');
INSERT INTO thinkox_district VALUES ('360222', '浮梁县', '3', '360200');
INSERT INTO thinkox_district VALUES ('360281', '乐平市', '3', '360200');
INSERT INTO thinkox_district VALUES ('360301', '市辖区', '3', '360300');
INSERT INTO thinkox_district VALUES ('360302', '安源区', '3', '360300');
INSERT INTO thinkox_district VALUES ('360313', '湘东区', '3', '360300');
INSERT INTO thinkox_district VALUES ('360321', '莲花县', '3', '360300');
INSERT INTO thinkox_district VALUES ('360322', '上栗县', '3', '360300');
INSERT INTO thinkox_district VALUES ('360323', '芦溪县', '3', '360300');
INSERT INTO thinkox_district VALUES ('360401', '市辖区', '3', '360400');
INSERT INTO thinkox_district VALUES ('360402', '庐山区', '3', '360400');
INSERT INTO thinkox_district VALUES ('360403', '浔阳区', '3', '360400');
INSERT INTO thinkox_district VALUES ('360421', '九江县', '3', '360400');
INSERT INTO thinkox_district VALUES ('360423', '武宁县', '3', '360400');
INSERT INTO thinkox_district VALUES ('360424', '修水县', '3', '360400');
INSERT INTO thinkox_district VALUES ('360425', '永修县', '3', '360400');
INSERT INTO thinkox_district VALUES ('360426', '德安县', '3', '360400');
INSERT INTO thinkox_district VALUES ('360427', '星子县', '3', '360400');
INSERT INTO thinkox_district VALUES ('360428', '都昌县', '3', '360400');
INSERT INTO thinkox_district VALUES ('360429', '湖口县', '3', '360400');
INSERT INTO thinkox_district VALUES ('360430', '彭泽县', '3', '360400');
INSERT INTO thinkox_district VALUES ('360481', '瑞昌市', '3', '360400');
INSERT INTO thinkox_district VALUES ('360501', '市辖区', '3', '360500');
INSERT INTO thinkox_district VALUES ('360502', '渝水区', '3', '360500');
INSERT INTO thinkox_district VALUES ('360521', '分宜县', '3', '360500');
INSERT INTO thinkox_district VALUES ('360601', '市辖区', '3', '360600');
INSERT INTO thinkox_district VALUES ('360602', '月湖区', '3', '360600');
INSERT INTO thinkox_district VALUES ('360622', '余江县', '3', '360600');
INSERT INTO thinkox_district VALUES ('360681', '贵溪市', '3', '360600');
INSERT INTO thinkox_district VALUES ('360701', '市辖区', '3', '360700');
INSERT INTO thinkox_district VALUES ('360702', '章贡区', '3', '360700');
INSERT INTO thinkox_district VALUES ('360721', '赣　县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360722', '信丰县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360723', '大余县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360724', '上犹县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360725', '崇义县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360726', '安远县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360727', '龙南县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360728', '定南县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360729', '全南县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360730', '宁都县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360731', '于都县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360732', '兴国县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360733', '会昌县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360734', '寻乌县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360735', '石城县', '3', '360700');
INSERT INTO thinkox_district VALUES ('360781', '瑞金市', '3', '360700');
INSERT INTO thinkox_district VALUES ('360782', '南康市', '3', '360700');
INSERT INTO thinkox_district VALUES ('360801', '市辖区', '3', '360800');
INSERT INTO thinkox_district VALUES ('360802', '吉州区', '3', '360800');
INSERT INTO thinkox_district VALUES ('360803', '青原区', '3', '360800');
INSERT INTO thinkox_district VALUES ('360821', '吉安县', '3', '360800');
INSERT INTO thinkox_district VALUES ('360822', '吉水县', '3', '360800');
INSERT INTO thinkox_district VALUES ('360823', '峡江县', '3', '360800');
INSERT INTO thinkox_district VALUES ('360824', '新干县', '3', '360800');
INSERT INTO thinkox_district VALUES ('360825', '永丰县', '3', '360800');
INSERT INTO thinkox_district VALUES ('360826', '泰和县', '3', '360800');
INSERT INTO thinkox_district VALUES ('360827', '遂川县', '3', '360800');
INSERT INTO thinkox_district VALUES ('360828', '万安县', '3', '360800');
INSERT INTO thinkox_district VALUES ('360829', '安福县', '3', '360800');
INSERT INTO thinkox_district VALUES ('360830', '永新县', '3', '360800');
INSERT INTO thinkox_district VALUES ('360881', '井冈山市', '3', '360800');
INSERT INTO thinkox_district VALUES ('360901', '市辖区', '3', '360900');
INSERT INTO thinkox_district VALUES ('360902', '袁州区', '3', '360900');
INSERT INTO thinkox_district VALUES ('360921', '奉新县', '3', '360900');
INSERT INTO thinkox_district VALUES ('360922', '万载县', '3', '360900');
INSERT INTO thinkox_district VALUES ('360923', '上高县', '3', '360900');
INSERT INTO thinkox_district VALUES ('360924', '宜丰县', '3', '360900');
INSERT INTO thinkox_district VALUES ('360925', '靖安县', '3', '360900');
INSERT INTO thinkox_district VALUES ('360926', '铜鼓县', '3', '360900');
INSERT INTO thinkox_district VALUES ('360981', '丰城市', '3', '360900');
INSERT INTO thinkox_district VALUES ('360982', '樟树市', '3', '360900');
INSERT INTO thinkox_district VALUES ('360983', '高安市', '3', '360900');
INSERT INTO thinkox_district VALUES ('361001', '市辖区', '3', '361000');
INSERT INTO thinkox_district VALUES ('361002', '临川区', '3', '361000');
INSERT INTO thinkox_district VALUES ('361021', '南城县', '3', '361000');
INSERT INTO thinkox_district VALUES ('361022', '黎川县', '3', '361000');
INSERT INTO thinkox_district VALUES ('361023', '南丰县', '3', '361000');
INSERT INTO thinkox_district VALUES ('361024', '崇仁县', '3', '361000');
INSERT INTO thinkox_district VALUES ('361025', '乐安县', '3', '361000');
INSERT INTO thinkox_district VALUES ('361026', '宜黄县', '3', '361000');
INSERT INTO thinkox_district VALUES ('361027', '金溪县', '3', '361000');
INSERT INTO thinkox_district VALUES ('361028', '资溪县', '3', '361000');
INSERT INTO thinkox_district VALUES ('361029', '东乡县', '3', '361000');
INSERT INTO thinkox_district VALUES ('361030', '广昌县', '3', '361000');
INSERT INTO thinkox_district VALUES ('361101', '市辖区', '3', '361100');
INSERT INTO thinkox_district VALUES ('361102', '信州区', '3', '361100');
INSERT INTO thinkox_district VALUES ('361121', '上饶县', '3', '361100');
INSERT INTO thinkox_district VALUES ('361122', '广丰县', '3', '361100');
INSERT INTO thinkox_district VALUES ('361123', '玉山县', '3', '361100');
INSERT INTO thinkox_district VALUES ('361124', '铅山县', '3', '361100');
INSERT INTO thinkox_district VALUES ('361125', '横峰县', '3', '361100');
INSERT INTO thinkox_district VALUES ('361126', '弋阳县', '3', '361100');
INSERT INTO thinkox_district VALUES ('361127', '余干县', '3', '361100');
INSERT INTO thinkox_district VALUES ('361128', '鄱阳县', '3', '361100');
INSERT INTO thinkox_district VALUES ('361129', '万年县', '3', '361100');
INSERT INTO thinkox_district VALUES ('361130', '婺源县', '3', '361100');
INSERT INTO thinkox_district VALUES ('361181', '德兴市', '3', '361100');
INSERT INTO thinkox_district VALUES ('370101', '市辖区', '3', '370100');
INSERT INTO thinkox_district VALUES ('370102', '历下区', '3', '370100');
INSERT INTO thinkox_district VALUES ('370103', '市中区', '3', '370100');
INSERT INTO thinkox_district VALUES ('370104', '槐荫区', '3', '370100');
INSERT INTO thinkox_district VALUES ('370105', '天桥区', '3', '370100');
INSERT INTO thinkox_district VALUES ('370112', '历城区', '3', '370100');
INSERT INTO thinkox_district VALUES ('370113', '长清区', '3', '370100');
INSERT INTO thinkox_district VALUES ('370124', '平阴县', '3', '370100');
INSERT INTO thinkox_district VALUES ('370125', '济阳县', '3', '370100');
INSERT INTO thinkox_district VALUES ('370126', '商河县', '3', '370100');
INSERT INTO thinkox_district VALUES ('370181', '章丘市', '3', '370100');
INSERT INTO thinkox_district VALUES ('370201', '市辖区', '3', '370200');
INSERT INTO thinkox_district VALUES ('370202', '市南区', '3', '370200');
INSERT INTO thinkox_district VALUES ('370203', '市北区', '3', '370200');
INSERT INTO thinkox_district VALUES ('370205', '四方区', '3', '370200');
INSERT INTO thinkox_district VALUES ('370211', '黄岛区', '3', '370200');
INSERT INTO thinkox_district VALUES ('370212', '崂山区', '3', '370200');
INSERT INTO thinkox_district VALUES ('370213', '李沧区', '3', '370200');
INSERT INTO thinkox_district VALUES ('370214', '城阳区', '3', '370200');
INSERT INTO thinkox_district VALUES ('370281', '胶州市', '3', '370200');
INSERT INTO thinkox_district VALUES ('370282', '即墨市', '3', '370200');
INSERT INTO thinkox_district VALUES ('370283', '平度市', '3', '370200');
INSERT INTO thinkox_district VALUES ('370284', '胶南市', '3', '370200');
INSERT INTO thinkox_district VALUES ('370285', '莱西市', '3', '370200');
INSERT INTO thinkox_district VALUES ('370301', '市辖区', '3', '370300');
INSERT INTO thinkox_district VALUES ('370302', '淄川区', '3', '370300');
INSERT INTO thinkox_district VALUES ('370303', '张店区', '3', '370300');
INSERT INTO thinkox_district VALUES ('370304', '博山区', '3', '370300');
INSERT INTO thinkox_district VALUES ('370305', '临淄区', '3', '370300');
INSERT INTO thinkox_district VALUES ('370306', '周村区', '3', '370300');
INSERT INTO thinkox_district VALUES ('370321', '桓台县', '3', '370300');
INSERT INTO thinkox_district VALUES ('370322', '高青县', '3', '370300');
INSERT INTO thinkox_district VALUES ('370323', '沂源县', '3', '370300');
INSERT INTO thinkox_district VALUES ('370401', '市辖区', '3', '370400');
INSERT INTO thinkox_district VALUES ('370402', '市中区', '3', '370400');
INSERT INTO thinkox_district VALUES ('370403', '薛城区', '3', '370400');
INSERT INTO thinkox_district VALUES ('370404', '峄城区', '3', '370400');
INSERT INTO thinkox_district VALUES ('370405', '台儿庄区', '3', '370400');
INSERT INTO thinkox_district VALUES ('370406', '山亭区', '3', '370400');
INSERT INTO thinkox_district VALUES ('370481', '滕州市', '3', '370400');
INSERT INTO thinkox_district VALUES ('370501', '市辖区', '3', '370500');
INSERT INTO thinkox_district VALUES ('370502', '东营区', '3', '370500');
INSERT INTO thinkox_district VALUES ('370503', '河口区', '3', '370500');
INSERT INTO thinkox_district VALUES ('370521', '垦利县', '3', '370500');
INSERT INTO thinkox_district VALUES ('370522', '利津县', '3', '370500');
INSERT INTO thinkox_district VALUES ('370523', '广饶县', '3', '370500');
INSERT INTO thinkox_district VALUES ('370601', '市辖区', '3', '370600');
INSERT INTO thinkox_district VALUES ('370602', '芝罘区', '3', '370600');
INSERT INTO thinkox_district VALUES ('370611', '福山区', '3', '370600');
INSERT INTO thinkox_district VALUES ('370612', '牟平区', '3', '370600');
INSERT INTO thinkox_district VALUES ('370613', '莱山区', '3', '370600');
INSERT INTO thinkox_district VALUES ('370634', '长岛县', '3', '370600');
INSERT INTO thinkox_district VALUES ('370681', '龙口市', '3', '370600');
INSERT INTO thinkox_district VALUES ('370682', '莱阳市', '3', '370600');
INSERT INTO thinkox_district VALUES ('370683', '莱州市', '3', '370600');
INSERT INTO thinkox_district VALUES ('370684', '蓬莱市', '3', '370600');
INSERT INTO thinkox_district VALUES ('370685', '招远市', '3', '370600');
INSERT INTO thinkox_district VALUES ('370686', '栖霞市', '3', '370600');
INSERT INTO thinkox_district VALUES ('370687', '海阳市', '3', '370600');
INSERT INTO thinkox_district VALUES ('370701', '市辖区', '3', '370700');
INSERT INTO thinkox_district VALUES ('370702', '潍城区', '3', '370700');
INSERT INTO thinkox_district VALUES ('370703', '寒亭区', '3', '370700');
INSERT INTO thinkox_district VALUES ('370704', '坊子区', '3', '370700');
INSERT INTO thinkox_district VALUES ('370705', '奎文区', '3', '370700');
INSERT INTO thinkox_district VALUES ('370724', '临朐县', '3', '370700');
INSERT INTO thinkox_district VALUES ('370725', '昌乐县', '3', '370700');
INSERT INTO thinkox_district VALUES ('370781', '青州市', '3', '370700');
INSERT INTO thinkox_district VALUES ('370782', '诸城市', '3', '370700');
INSERT INTO thinkox_district VALUES ('370783', '寿光市', '3', '370700');
INSERT INTO thinkox_district VALUES ('370784', '安丘市', '3', '370700');
INSERT INTO thinkox_district VALUES ('370785', '高密市', '3', '370700');
INSERT INTO thinkox_district VALUES ('370786', '昌邑市', '3', '370700');
INSERT INTO thinkox_district VALUES ('370801', '市辖区', '3', '370800');
INSERT INTO thinkox_district VALUES ('370802', '市中区', '3', '370800');
INSERT INTO thinkox_district VALUES ('370811', '任城区', '3', '370800');
INSERT INTO thinkox_district VALUES ('370826', '微山县', '3', '370800');
INSERT INTO thinkox_district VALUES ('370827', '鱼台县', '3', '370800');
INSERT INTO thinkox_district VALUES ('370828', '金乡县', '3', '370800');
INSERT INTO thinkox_district VALUES ('370829', '嘉祥县', '3', '370800');
INSERT INTO thinkox_district VALUES ('370830', '汶上县', '3', '370800');
INSERT INTO thinkox_district VALUES ('370831', '泗水县', '3', '370800');
INSERT INTO thinkox_district VALUES ('370832', '梁山县', '3', '370800');
INSERT INTO thinkox_district VALUES ('370881', '曲阜市', '3', '370800');
INSERT INTO thinkox_district VALUES ('370882', '兖州市', '3', '370800');
INSERT INTO thinkox_district VALUES ('370883', '邹城市', '3', '370800');
INSERT INTO thinkox_district VALUES ('370901', '市辖区', '3', '370900');
INSERT INTO thinkox_district VALUES ('370902', '泰山区', '3', '370900');
INSERT INTO thinkox_district VALUES ('370903', '岱岳区', '3', '370900');
INSERT INTO thinkox_district VALUES ('370921', '宁阳县', '3', '370900');
INSERT INTO thinkox_district VALUES ('370923', '东平县', '3', '370900');
INSERT INTO thinkox_district VALUES ('370982', '新泰市', '3', '370900');
INSERT INTO thinkox_district VALUES ('370983', '肥城市', '3', '370900');
INSERT INTO thinkox_district VALUES ('371001', '市辖区', '3', '371000');
INSERT INTO thinkox_district VALUES ('371002', '环翠区', '3', '371000');
INSERT INTO thinkox_district VALUES ('371081', '文登市', '3', '371000');
INSERT INTO thinkox_district VALUES ('371082', '荣成市', '3', '371000');
INSERT INTO thinkox_district VALUES ('371083', '乳山市', '3', '371000');
INSERT INTO thinkox_district VALUES ('371101', '市辖区', '3', '371100');
INSERT INTO thinkox_district VALUES ('371102', '东港区', '3', '371100');
INSERT INTO thinkox_district VALUES ('371103', '岚山区', '3', '371100');
INSERT INTO thinkox_district VALUES ('371121', '五莲县', '3', '371100');
INSERT INTO thinkox_district VALUES ('371122', '莒　县', '3', '371100');
INSERT INTO thinkox_district VALUES ('371201', '市辖区', '3', '371200');
INSERT INTO thinkox_district VALUES ('371202', '莱城区', '3', '371200');
INSERT INTO thinkox_district VALUES ('371203', '钢城区', '3', '371200');
INSERT INTO thinkox_district VALUES ('371301', '市辖区', '3', '371300');
INSERT INTO thinkox_district VALUES ('371302', '兰山区', '3', '371300');
INSERT INTO thinkox_district VALUES ('371311', '罗庄区', '3', '371300');
INSERT INTO thinkox_district VALUES ('371312', '河东区', '3', '371300');
INSERT INTO thinkox_district VALUES ('371321', '沂南县', '3', '371300');
INSERT INTO thinkox_district VALUES ('371322', '郯城县', '3', '371300');
INSERT INTO thinkox_district VALUES ('371323', '沂水县', '3', '371300');
INSERT INTO thinkox_district VALUES ('371324', '苍山县', '3', '371300');
INSERT INTO thinkox_district VALUES ('371325', '费　县', '3', '371300');
INSERT INTO thinkox_district VALUES ('371326', '平邑县', '3', '371300');
INSERT INTO thinkox_district VALUES ('371327', '莒南县', '3', '371300');
INSERT INTO thinkox_district VALUES ('371328', '蒙阴县', '3', '371300');
INSERT INTO thinkox_district VALUES ('371329', '临沭县', '3', '371300');
INSERT INTO thinkox_district VALUES ('371401', '市辖区', '3', '371400');
INSERT INTO thinkox_district VALUES ('371402', '德城区', '3', '371400');
INSERT INTO thinkox_district VALUES ('371421', '陵　县', '3', '371400');
INSERT INTO thinkox_district VALUES ('371422', '宁津县', '3', '371400');
INSERT INTO thinkox_district VALUES ('371423', '庆云县', '3', '371400');
INSERT INTO thinkox_district VALUES ('371424', '临邑县', '3', '371400');
INSERT INTO thinkox_district VALUES ('371425', '齐河县', '3', '371400');
INSERT INTO thinkox_district VALUES ('371426', '平原县', '3', '371400');
INSERT INTO thinkox_district VALUES ('371427', '夏津县', '3', '371400');
INSERT INTO thinkox_district VALUES ('371428', '武城县', '3', '371400');
INSERT INTO thinkox_district VALUES ('371481', '乐陵市', '3', '371400');
INSERT INTO thinkox_district VALUES ('371482', '禹城市', '3', '371400');
INSERT INTO thinkox_district VALUES ('371501', '市辖区', '3', '371500');
INSERT INTO thinkox_district VALUES ('371502', '东昌府区', '3', '371500');
INSERT INTO thinkox_district VALUES ('371521', '阳谷县', '3', '371500');
INSERT INTO thinkox_district VALUES ('371522', '莘　县', '3', '371500');
INSERT INTO thinkox_district VALUES ('371523', '茌平县', '3', '371500');
INSERT INTO thinkox_district VALUES ('371524', '东阿县', '3', '371500');
INSERT INTO thinkox_district VALUES ('371525', '冠　县', '3', '371500');
INSERT INTO thinkox_district VALUES ('371526', '高唐县', '3', '371500');
INSERT INTO thinkox_district VALUES ('371581', '临清市', '3', '371500');
INSERT INTO thinkox_district VALUES ('371601', '市辖区', '3', '371600');
INSERT INTO thinkox_district VALUES ('371602', '滨城区', '3', '371600');
INSERT INTO thinkox_district VALUES ('371621', '惠民县', '3', '371600');
INSERT INTO thinkox_district VALUES ('371622', '阳信县', '3', '371600');
INSERT INTO thinkox_district VALUES ('371623', '无棣县', '3', '371600');
INSERT INTO thinkox_district VALUES ('371624', '沾化县', '3', '371600');
INSERT INTO thinkox_district VALUES ('371625', '博兴县', '3', '371600');
INSERT INTO thinkox_district VALUES ('371626', '邹平县', '3', '371600');
INSERT INTO thinkox_district VALUES ('371701', '市辖区', '3', '371700');
INSERT INTO thinkox_district VALUES ('371702', '牡丹区', '3', '371700');
INSERT INTO thinkox_district VALUES ('371721', '曹　县', '3', '371700');
INSERT INTO thinkox_district VALUES ('371722', '单　县', '3', '371700');
INSERT INTO thinkox_district VALUES ('371723', '成武县', '3', '371700');
INSERT INTO thinkox_district VALUES ('371724', '巨野县', '3', '371700');
INSERT INTO thinkox_district VALUES ('371725', '郓城县', '3', '371700');
INSERT INTO thinkox_district VALUES ('371726', '鄄城县', '3', '371700');
INSERT INTO thinkox_district VALUES ('371727', '定陶县', '3', '371700');
INSERT INTO thinkox_district VALUES ('371728', '东明县', '3', '371700');
INSERT INTO thinkox_district VALUES ('410101', '市辖区', '3', '410100');
INSERT INTO thinkox_district VALUES ('410102', '中原区', '3', '410100');
INSERT INTO thinkox_district VALUES ('410103', '二七区', '3', '410100');
INSERT INTO thinkox_district VALUES ('410104', '管城回族区', '3', '410100');
INSERT INTO thinkox_district VALUES ('410105', '金水区', '3', '410100');
INSERT INTO thinkox_district VALUES ('410106', '上街区', '3', '410100');
INSERT INTO thinkox_district VALUES ('410108', '邙山区', '3', '410100');
INSERT INTO thinkox_district VALUES ('410122', '中牟县', '3', '410100');
INSERT INTO thinkox_district VALUES ('410181', '巩义市', '3', '410100');
INSERT INTO thinkox_district VALUES ('410182', '荥阳市', '3', '410100');
INSERT INTO thinkox_district VALUES ('410183', '新密市', '3', '410100');
INSERT INTO thinkox_district VALUES ('410184', '新郑市', '3', '410100');
INSERT INTO thinkox_district VALUES ('410185', '登封市', '3', '410100');
INSERT INTO thinkox_district VALUES ('410201', '市辖区', '3', '410200');
INSERT INTO thinkox_district VALUES ('410202', '龙亭区', '3', '410200');
INSERT INTO thinkox_district VALUES ('410203', '顺河回族区', '3', '410200');
INSERT INTO thinkox_district VALUES ('410204', '鼓楼区', '3', '410200');
INSERT INTO thinkox_district VALUES ('410205', '南关区', '3', '410200');
INSERT INTO thinkox_district VALUES ('410211', '郊　区', '3', '410200');
INSERT INTO thinkox_district VALUES ('410221', '杞　县', '3', '410200');
INSERT INTO thinkox_district VALUES ('410222', '通许县', '3', '410200');
INSERT INTO thinkox_district VALUES ('410223', '尉氏县', '3', '410200');
INSERT INTO thinkox_district VALUES ('410224', '开封县', '3', '410200');
INSERT INTO thinkox_district VALUES ('410225', '兰考县', '3', '410200');
INSERT INTO thinkox_district VALUES ('410301', '市辖区', '3', '410300');
INSERT INTO thinkox_district VALUES ('410302', '老城区', '3', '410300');
INSERT INTO thinkox_district VALUES ('410303', '西工区', '3', '410300');
INSERT INTO thinkox_district VALUES ('410304', '廛河回族区', '3', '410300');
INSERT INTO thinkox_district VALUES ('410305', '涧西区', '3', '410300');
INSERT INTO thinkox_district VALUES ('410306', '吉利区', '3', '410300');
INSERT INTO thinkox_district VALUES ('410307', '洛龙区', '3', '410300');
INSERT INTO thinkox_district VALUES ('410322', '孟津县', '3', '410300');
INSERT INTO thinkox_district VALUES ('410323', '新安县', '3', '410300');
INSERT INTO thinkox_district VALUES ('410324', '栾川县', '3', '410300');
INSERT INTO thinkox_district VALUES ('410325', '嵩　县', '3', '410300');
INSERT INTO thinkox_district VALUES ('410326', '汝阳县', '3', '410300');
INSERT INTO thinkox_district VALUES ('410327', '宜阳县', '3', '410300');
INSERT INTO thinkox_district VALUES ('410328', '洛宁县', '3', '410300');
INSERT INTO thinkox_district VALUES ('410329', '伊川县', '3', '410300');
INSERT INTO thinkox_district VALUES ('410381', '偃师市', '3', '410300');
INSERT INTO thinkox_district VALUES ('410401', '市辖区', '3', '410400');
INSERT INTO thinkox_district VALUES ('410402', '新华区', '3', '410400');
INSERT INTO thinkox_district VALUES ('410403', '卫东区', '3', '410400');
INSERT INTO thinkox_district VALUES ('410404', '石龙区', '3', '410400');
INSERT INTO thinkox_district VALUES ('410411', '湛河区', '3', '410400');
INSERT INTO thinkox_district VALUES ('410421', '宝丰县', '3', '410400');
INSERT INTO thinkox_district VALUES ('410422', '叶　县', '3', '410400');
INSERT INTO thinkox_district VALUES ('410423', '鲁山县', '3', '410400');
INSERT INTO thinkox_district VALUES ('410425', '郏　县', '3', '410400');
INSERT INTO thinkox_district VALUES ('410481', '舞钢市', '3', '410400');
INSERT INTO thinkox_district VALUES ('410482', '汝州市', '3', '410400');
INSERT INTO thinkox_district VALUES ('410501', '市辖区', '3', '410500');
INSERT INTO thinkox_district VALUES ('410502', '文峰区', '3', '410500');
INSERT INTO thinkox_district VALUES ('410503', '北关区', '3', '410500');
INSERT INTO thinkox_district VALUES ('410505', '殷都区', '3', '410500');
INSERT INTO thinkox_district VALUES ('410506', '龙安区', '3', '410500');
INSERT INTO thinkox_district VALUES ('410522', '安阳县', '3', '410500');
INSERT INTO thinkox_district VALUES ('410523', '汤阴县', '3', '410500');
INSERT INTO thinkox_district VALUES ('410526', '滑　县', '3', '410500');
INSERT INTO thinkox_district VALUES ('410527', '内黄县', '3', '410500');
INSERT INTO thinkox_district VALUES ('410581', '林州市', '3', '410500');
INSERT INTO thinkox_district VALUES ('410601', '市辖区', '3', '410600');
INSERT INTO thinkox_district VALUES ('410602', '鹤山区', '3', '410600');
INSERT INTO thinkox_district VALUES ('410603', '山城区', '3', '410600');
INSERT INTO thinkox_district VALUES ('410611', '淇滨区', '3', '410600');
INSERT INTO thinkox_district VALUES ('410621', '浚　县', '3', '410600');
INSERT INTO thinkox_district VALUES ('410622', '淇　县', '3', '410600');
INSERT INTO thinkox_district VALUES ('410701', '市辖区', '3', '410700');
INSERT INTO thinkox_district VALUES ('410702', '红旗区', '3', '410700');
INSERT INTO thinkox_district VALUES ('410703', '卫滨区', '3', '410700');
INSERT INTO thinkox_district VALUES ('410704', '凤泉区', '3', '410700');
INSERT INTO thinkox_district VALUES ('410711', '牧野区', '3', '410700');
INSERT INTO thinkox_district VALUES ('410721', '新乡县', '3', '410700');
INSERT INTO thinkox_district VALUES ('410724', '获嘉县', '3', '410700');
INSERT INTO thinkox_district VALUES ('410725', '原阳县', '3', '410700');
INSERT INTO thinkox_district VALUES ('410726', '延津县', '3', '410700');
INSERT INTO thinkox_district VALUES ('410727', '封丘县', '3', '410700');
INSERT INTO thinkox_district VALUES ('410728', '长垣县', '3', '410700');
INSERT INTO thinkox_district VALUES ('410781', '卫辉市', '3', '410700');
INSERT INTO thinkox_district VALUES ('410782', '辉县市', '3', '410700');
INSERT INTO thinkox_district VALUES ('410801', '市辖区', '3', '410800');
INSERT INTO thinkox_district VALUES ('410802', '解放区', '3', '410800');
INSERT INTO thinkox_district VALUES ('410803', '中站区', '3', '410800');
INSERT INTO thinkox_district VALUES ('410804', '马村区', '3', '410800');
INSERT INTO thinkox_district VALUES ('410811', '山阳区', '3', '410800');
INSERT INTO thinkox_district VALUES ('410821', '修武县', '3', '410800');
INSERT INTO thinkox_district VALUES ('410822', '博爱县', '3', '410800');
INSERT INTO thinkox_district VALUES ('410823', '武陟县', '3', '410800');
INSERT INTO thinkox_district VALUES ('410825', '温　县', '3', '410800');
INSERT INTO thinkox_district VALUES ('410881', '济源市', '3', '410800');
INSERT INTO thinkox_district VALUES ('410882', '沁阳市', '3', '410800');
INSERT INTO thinkox_district VALUES ('410883', '孟州市', '3', '410800');
INSERT INTO thinkox_district VALUES ('410901', '市辖区', '3', '410900');
INSERT INTO thinkox_district VALUES ('410902', '华龙区', '3', '410900');
INSERT INTO thinkox_district VALUES ('410922', '清丰县', '3', '410900');
INSERT INTO thinkox_district VALUES ('410923', '南乐县', '3', '410900');
INSERT INTO thinkox_district VALUES ('410926', '范　县', '3', '410900');
INSERT INTO thinkox_district VALUES ('410927', '台前县', '3', '410900');
INSERT INTO thinkox_district VALUES ('410928', '濮阳县', '3', '410900');
INSERT INTO thinkox_district VALUES ('411001', '市辖区', '3', '411000');
INSERT INTO thinkox_district VALUES ('411002', '魏都区', '3', '411000');
INSERT INTO thinkox_district VALUES ('411023', '许昌县', '3', '411000');
INSERT INTO thinkox_district VALUES ('411024', '鄢陵县', '3', '411000');
INSERT INTO thinkox_district VALUES ('411025', '襄城县', '3', '411000');
INSERT INTO thinkox_district VALUES ('411081', '禹州市', '3', '411000');
INSERT INTO thinkox_district VALUES ('411082', '长葛市', '3', '411000');
INSERT INTO thinkox_district VALUES ('411101', '市辖区', '3', '411100');
INSERT INTO thinkox_district VALUES ('411102', '源汇区', '3', '411100');
INSERT INTO thinkox_district VALUES ('411103', '郾城区', '3', '411100');
INSERT INTO thinkox_district VALUES ('411104', '召陵区', '3', '411100');
INSERT INTO thinkox_district VALUES ('411121', '舞阳县', '3', '411100');
INSERT INTO thinkox_district VALUES ('411122', '临颍县', '3', '411100');
INSERT INTO thinkox_district VALUES ('411201', '市辖区', '3', '411200');
INSERT INTO thinkox_district VALUES ('411202', '湖滨区', '3', '411200');
INSERT INTO thinkox_district VALUES ('411221', '渑池县', '3', '411200');
INSERT INTO thinkox_district VALUES ('411222', '陕　县', '3', '411200');
INSERT INTO thinkox_district VALUES ('411224', '卢氏县', '3', '411200');
INSERT INTO thinkox_district VALUES ('411281', '义马市', '3', '411200');
INSERT INTO thinkox_district VALUES ('411282', '灵宝市', '3', '411200');
INSERT INTO thinkox_district VALUES ('411301', '市辖区', '3', '411300');
INSERT INTO thinkox_district VALUES ('411302', '宛城区', '3', '411300');
INSERT INTO thinkox_district VALUES ('411303', '卧龙区', '3', '411300');
INSERT INTO thinkox_district VALUES ('411321', '南召县', '3', '411300');
INSERT INTO thinkox_district VALUES ('411322', '方城县', '3', '411300');
INSERT INTO thinkox_district VALUES ('411323', '西峡县', '3', '411300');
INSERT INTO thinkox_district VALUES ('411324', '镇平县', '3', '411300');
INSERT INTO thinkox_district VALUES ('411325', '内乡县', '3', '411300');
INSERT INTO thinkox_district VALUES ('411326', '淅川县', '3', '411300');
INSERT INTO thinkox_district VALUES ('411327', '社旗县', '3', '411300');
INSERT INTO thinkox_district VALUES ('411328', '唐河县', '3', '411300');
INSERT INTO thinkox_district VALUES ('411329', '新野县', '3', '411300');
INSERT INTO thinkox_district VALUES ('411330', '桐柏县', '3', '411300');
INSERT INTO thinkox_district VALUES ('411381', '邓州市', '3', '411300');
INSERT INTO thinkox_district VALUES ('411401', '市辖区', '3', '411400');
INSERT INTO thinkox_district VALUES ('411402', '梁园区', '3', '411400');
INSERT INTO thinkox_district VALUES ('411403', '睢阳区', '3', '411400');
INSERT INTO thinkox_district VALUES ('411421', '民权县', '3', '411400');
INSERT INTO thinkox_district VALUES ('411422', '睢　县', '3', '411400');
INSERT INTO thinkox_district VALUES ('411423', '宁陵县', '3', '411400');
INSERT INTO thinkox_district VALUES ('411424', '柘城县', '3', '411400');
INSERT INTO thinkox_district VALUES ('411425', '虞城县', '3', '411400');
INSERT INTO thinkox_district VALUES ('411426', '夏邑县', '3', '411400');
INSERT INTO thinkox_district VALUES ('411481', '永城市', '3', '411400');
INSERT INTO thinkox_district VALUES ('411501', '市辖区', '3', '411500');
INSERT INTO thinkox_district VALUES ('411502', '师河区', '3', '411500');
INSERT INTO thinkox_district VALUES ('411503', '平桥区', '3', '411500');
INSERT INTO thinkox_district VALUES ('411521', '罗山县', '3', '411500');
INSERT INTO thinkox_district VALUES ('411522', '光山县', '3', '411500');
INSERT INTO thinkox_district VALUES ('411523', '新　县', '3', '411500');
INSERT INTO thinkox_district VALUES ('411524', '商城县', '3', '411500');
INSERT INTO thinkox_district VALUES ('411525', '固始县', '3', '411500');
INSERT INTO thinkox_district VALUES ('411526', '潢川县', '3', '411500');
INSERT INTO thinkox_district VALUES ('411527', '淮滨县', '3', '411500');
INSERT INTO thinkox_district VALUES ('411528', '息　县', '3', '411500');
INSERT INTO thinkox_district VALUES ('411601', '市辖区', '3', '411600');
INSERT INTO thinkox_district VALUES ('411602', '川汇区', '3', '411600');
INSERT INTO thinkox_district VALUES ('411621', '扶沟县', '3', '411600');
INSERT INTO thinkox_district VALUES ('411622', '西华县', '3', '411600');
INSERT INTO thinkox_district VALUES ('411623', '商水县', '3', '411600');
INSERT INTO thinkox_district VALUES ('411624', '沈丘县', '3', '411600');
INSERT INTO thinkox_district VALUES ('411625', '郸城县', '3', '411600');
INSERT INTO thinkox_district VALUES ('411626', '淮阳县', '3', '411600');
INSERT INTO thinkox_district VALUES ('411627', '太康县', '3', '411600');
INSERT INTO thinkox_district VALUES ('411628', '鹿邑县', '3', '411600');
INSERT INTO thinkox_district VALUES ('411681', '项城市', '3', '411600');
INSERT INTO thinkox_district VALUES ('411701', '市辖区', '3', '411700');
INSERT INTO thinkox_district VALUES ('411702', '驿城区', '3', '411700');
INSERT INTO thinkox_district VALUES ('411721', '西平县', '3', '411700');
INSERT INTO thinkox_district VALUES ('411722', '上蔡县', '3', '411700');
INSERT INTO thinkox_district VALUES ('411723', '平舆县', '3', '411700');
INSERT INTO thinkox_district VALUES ('411724', '正阳县', '3', '411700');
INSERT INTO thinkox_district VALUES ('411725', '确山县', '3', '411700');
INSERT INTO thinkox_district VALUES ('411726', '泌阳县', '3', '411700');
INSERT INTO thinkox_district VALUES ('411727', '汝南县', '3', '411700');
INSERT INTO thinkox_district VALUES ('411728', '遂平县', '3', '411700');
INSERT INTO thinkox_district VALUES ('411729', '新蔡县', '3', '411700');
INSERT INTO thinkox_district VALUES ('420101', '市辖区', '3', '420100');
INSERT INTO thinkox_district VALUES ('420102', '江岸区', '3', '420100');
INSERT INTO thinkox_district VALUES ('420103', '江汉区', '3', '420100');
INSERT INTO thinkox_district VALUES ('420104', '乔口区', '3', '420100');
INSERT INTO thinkox_district VALUES ('420105', '汉阳区', '3', '420100');
INSERT INTO thinkox_district VALUES ('420106', '武昌区', '3', '420100');
INSERT INTO thinkox_district VALUES ('420107', '青山区', '3', '420100');
INSERT INTO thinkox_district VALUES ('420111', '洪山区', '3', '420100');
INSERT INTO thinkox_district VALUES ('420112', '东西湖区', '3', '420100');
INSERT INTO thinkox_district VALUES ('420113', '汉南区', '3', '420100');
INSERT INTO thinkox_district VALUES ('420114', '蔡甸区', '3', '420100');
INSERT INTO thinkox_district VALUES ('420115', '江夏区', '3', '420100');
INSERT INTO thinkox_district VALUES ('420116', '黄陂区', '3', '420100');
INSERT INTO thinkox_district VALUES ('420117', '新洲区', '3', '420100');
INSERT INTO thinkox_district VALUES ('420201', '市辖区', '3', '420200');
INSERT INTO thinkox_district VALUES ('420202', '黄石港区', '3', '420200');
INSERT INTO thinkox_district VALUES ('420203', '西塞山区', '3', '420200');
INSERT INTO thinkox_district VALUES ('420204', '下陆区', '3', '420200');
INSERT INTO thinkox_district VALUES ('420205', '铁山区', '3', '420200');
INSERT INTO thinkox_district VALUES ('420222', '阳新县', '3', '420200');
INSERT INTO thinkox_district VALUES ('420281', '大冶市', '3', '420200');
INSERT INTO thinkox_district VALUES ('420301', '市辖区', '3', '420300');
INSERT INTO thinkox_district VALUES ('420302', '茅箭区', '3', '420300');
INSERT INTO thinkox_district VALUES ('420303', '张湾区', '3', '420300');
INSERT INTO thinkox_district VALUES ('420321', '郧　县', '3', '420300');
INSERT INTO thinkox_district VALUES ('420322', '郧西县', '3', '420300');
INSERT INTO thinkox_district VALUES ('420323', '竹山县', '3', '420300');
INSERT INTO thinkox_district VALUES ('420324', '竹溪县', '3', '420300');
INSERT INTO thinkox_district VALUES ('420325', '房　县', '3', '420300');
INSERT INTO thinkox_district VALUES ('420381', '丹江口市', '3', '420300');
INSERT INTO thinkox_district VALUES ('420501', '市辖区', '3', '420500');
INSERT INTO thinkox_district VALUES ('420502', '西陵区', '3', '420500');
INSERT INTO thinkox_district VALUES ('420503', '伍家岗区', '3', '420500');
INSERT INTO thinkox_district VALUES ('420504', '点军区', '3', '420500');
INSERT INTO thinkox_district VALUES ('420505', '猇亭区', '3', '420500');
INSERT INTO thinkox_district VALUES ('420506', '夷陵区', '3', '420500');
INSERT INTO thinkox_district VALUES ('420525', '远安县', '3', '420500');
INSERT INTO thinkox_district VALUES ('420526', '兴山县', '3', '420500');
INSERT INTO thinkox_district VALUES ('420527', '秭归县', '3', '420500');
INSERT INTO thinkox_district VALUES ('420528', '长阳土家族自治县', '3', '420500');
INSERT INTO thinkox_district VALUES ('420529', '五峰土家族自治县', '3', '420500');
INSERT INTO thinkox_district VALUES ('420581', '宜都市', '3', '420500');
INSERT INTO thinkox_district VALUES ('420582', '当阳市', '3', '420500');
INSERT INTO thinkox_district VALUES ('420583', '枝江市', '3', '420500');
INSERT INTO thinkox_district VALUES ('420601', '市辖区', '3', '420600');
INSERT INTO thinkox_district VALUES ('420602', '襄城区', '3', '420600');
INSERT INTO thinkox_district VALUES ('420606', '樊城区', '3', '420600');
INSERT INTO thinkox_district VALUES ('420607', '襄阳区', '3', '420600');
INSERT INTO thinkox_district VALUES ('420624', '南漳县', '3', '420600');
INSERT INTO thinkox_district VALUES ('420625', '谷城县', '3', '420600');
INSERT INTO thinkox_district VALUES ('420626', '保康县', '3', '420600');
INSERT INTO thinkox_district VALUES ('420682', '老河口市', '3', '420600');
INSERT INTO thinkox_district VALUES ('420683', '枣阳市', '3', '420600');
INSERT INTO thinkox_district VALUES ('420684', '宜城市', '3', '420600');
INSERT INTO thinkox_district VALUES ('420701', '市辖区', '3', '420700');
INSERT INTO thinkox_district VALUES ('420702', '梁子湖区', '3', '420700');
INSERT INTO thinkox_district VALUES ('420703', '华容区', '3', '420700');
INSERT INTO thinkox_district VALUES ('420704', '鄂城区', '3', '420700');
INSERT INTO thinkox_district VALUES ('420801', '市辖区', '3', '420800');
INSERT INTO thinkox_district VALUES ('420802', '东宝区', '3', '420800');
INSERT INTO thinkox_district VALUES ('420804', '掇刀区', '3', '420800');
INSERT INTO thinkox_district VALUES ('420821', '京山县', '3', '420800');
INSERT INTO thinkox_district VALUES ('420822', '沙洋县', '3', '420800');
INSERT INTO thinkox_district VALUES ('420881', '钟祥市', '3', '420800');
INSERT INTO thinkox_district VALUES ('420901', '市辖区', '3', '420900');
INSERT INTO thinkox_district VALUES ('420902', '孝南区', '3', '420900');
INSERT INTO thinkox_district VALUES ('420921', '孝昌县', '3', '420900');
INSERT INTO thinkox_district VALUES ('420922', '大悟县', '3', '420900');
INSERT INTO thinkox_district VALUES ('420923', '云梦县', '3', '420900');
INSERT INTO thinkox_district VALUES ('420981', '应城市', '3', '420900');
INSERT INTO thinkox_district VALUES ('420982', '安陆市', '3', '420900');
INSERT INTO thinkox_district VALUES ('420984', '汉川市', '3', '420900');
INSERT INTO thinkox_district VALUES ('421001', '市辖区', '3', '421000');
INSERT INTO thinkox_district VALUES ('421002', '沙市区', '3', '421000');
INSERT INTO thinkox_district VALUES ('421003', '荆州区', '3', '421000');
INSERT INTO thinkox_district VALUES ('421022', '公安县', '3', '421000');
INSERT INTO thinkox_district VALUES ('421023', '监利县', '3', '421000');
INSERT INTO thinkox_district VALUES ('421024', '江陵县', '3', '421000');
INSERT INTO thinkox_district VALUES ('421081', '石首市', '3', '421000');
INSERT INTO thinkox_district VALUES ('421083', '洪湖市', '3', '421000');
INSERT INTO thinkox_district VALUES ('421087', '松滋市', '3', '421000');
INSERT INTO thinkox_district VALUES ('421101', '市辖区', '3', '421100');
INSERT INTO thinkox_district VALUES ('421102', '黄州区', '3', '421100');
INSERT INTO thinkox_district VALUES ('421121', '团风县', '3', '421100');
INSERT INTO thinkox_district VALUES ('421122', '红安县', '3', '421100');
INSERT INTO thinkox_district VALUES ('421123', '罗田县', '3', '421100');
INSERT INTO thinkox_district VALUES ('421124', '英山县', '3', '421100');
INSERT INTO thinkox_district VALUES ('421125', '浠水县', '3', '421100');
INSERT INTO thinkox_district VALUES ('421126', '蕲春县', '3', '421100');
INSERT INTO thinkox_district VALUES ('421127', '黄梅县', '3', '421100');
INSERT INTO thinkox_district VALUES ('421181', '麻城市', '3', '421100');
INSERT INTO thinkox_district VALUES ('421182', '武穴市', '3', '421100');
INSERT INTO thinkox_district VALUES ('421201', '市辖区', '3', '421200');
INSERT INTO thinkox_district VALUES ('421202', '咸安区', '3', '421200');
INSERT INTO thinkox_district VALUES ('421221', '嘉鱼县', '3', '421200');
INSERT INTO thinkox_district VALUES ('421222', '通城县', '3', '421200');
INSERT INTO thinkox_district VALUES ('421223', '崇阳县', '3', '421200');
INSERT INTO thinkox_district VALUES ('421224', '通山县', '3', '421200');
INSERT INTO thinkox_district VALUES ('421281', '赤壁市', '3', '421200');
INSERT INTO thinkox_district VALUES ('421301', '市辖区', '3', '421300');
INSERT INTO thinkox_district VALUES ('421302', '曾都区', '3', '421300');
INSERT INTO thinkox_district VALUES ('421381', '广水市', '3', '421300');
INSERT INTO thinkox_district VALUES ('422801', '恩施市', '3', '422800');
INSERT INTO thinkox_district VALUES ('422802', '利川市', '3', '422800');
INSERT INTO thinkox_district VALUES ('422822', '建始县', '3', '422800');
INSERT INTO thinkox_district VALUES ('422823', '巴东县', '3', '422800');
INSERT INTO thinkox_district VALUES ('422825', '宣恩县', '3', '422800');
INSERT INTO thinkox_district VALUES ('422826', '咸丰县', '3', '422800');
INSERT INTO thinkox_district VALUES ('422827', '来凤县', '3', '422800');
INSERT INTO thinkox_district VALUES ('422828', '鹤峰县', '3', '422800');
INSERT INTO thinkox_district VALUES ('429004', '仙桃市', '3', '429000');
INSERT INTO thinkox_district VALUES ('429005', '潜江市', '3', '429000');
INSERT INTO thinkox_district VALUES ('429006', '天门市', '3', '429000');
INSERT INTO thinkox_district VALUES ('429021', '神农架林区', '3', '429000');
INSERT INTO thinkox_district VALUES ('430101', '市辖区', '3', '430100');
INSERT INTO thinkox_district VALUES ('430102', '芙蓉区', '3', '430100');
INSERT INTO thinkox_district VALUES ('430103', '天心区', '3', '430100');
INSERT INTO thinkox_district VALUES ('430104', '岳麓区', '3', '430100');
INSERT INTO thinkox_district VALUES ('430105', '开福区', '3', '430100');
INSERT INTO thinkox_district VALUES ('430111', '雨花区', '3', '430100');
INSERT INTO thinkox_district VALUES ('430121', '长沙县', '3', '430100');
INSERT INTO thinkox_district VALUES ('430122', '望城县', '3', '430100');
INSERT INTO thinkox_district VALUES ('430124', '宁乡县', '3', '430100');
INSERT INTO thinkox_district VALUES ('430181', '浏阳市', '3', '430100');
INSERT INTO thinkox_district VALUES ('430201', '市辖区', '3', '430200');
INSERT INTO thinkox_district VALUES ('430202', '荷塘区', '3', '430200');
INSERT INTO thinkox_district VALUES ('430203', '芦淞区', '3', '430200');
INSERT INTO thinkox_district VALUES ('430204', '石峰区', '3', '430200');
INSERT INTO thinkox_district VALUES ('430211', '天元区', '3', '430200');
INSERT INTO thinkox_district VALUES ('430221', '株洲县', '3', '430200');
INSERT INTO thinkox_district VALUES ('430223', '攸　县', '3', '430200');
INSERT INTO thinkox_district VALUES ('430224', '茶陵县', '3', '430200');
INSERT INTO thinkox_district VALUES ('430225', '炎陵县', '3', '430200');
INSERT INTO thinkox_district VALUES ('430281', '醴陵市', '3', '430200');
INSERT INTO thinkox_district VALUES ('430301', '市辖区', '3', '430300');
INSERT INTO thinkox_district VALUES ('430302', '雨湖区', '3', '430300');
INSERT INTO thinkox_district VALUES ('430304', '岳塘区', '3', '430300');
INSERT INTO thinkox_district VALUES ('430321', '湘潭县', '3', '430300');
INSERT INTO thinkox_district VALUES ('430381', '湘乡市', '3', '430300');
INSERT INTO thinkox_district VALUES ('430382', '韶山市', '3', '430300');
INSERT INTO thinkox_district VALUES ('430401', '市辖区', '3', '430400');
INSERT INTO thinkox_district VALUES ('430405', '珠晖区', '3', '430400');
INSERT INTO thinkox_district VALUES ('430406', '雁峰区', '3', '430400');
INSERT INTO thinkox_district VALUES ('430407', '石鼓区', '3', '430400');
INSERT INTO thinkox_district VALUES ('430408', '蒸湘区', '3', '430400');
INSERT INTO thinkox_district VALUES ('430412', '南岳区', '3', '430400');
INSERT INTO thinkox_district VALUES ('430421', '衡阳县', '3', '430400');
INSERT INTO thinkox_district VALUES ('430422', '衡南县', '3', '430400');
INSERT INTO thinkox_district VALUES ('430423', '衡山县', '3', '430400');
INSERT INTO thinkox_district VALUES ('430424', '衡东县', '3', '430400');
INSERT INTO thinkox_district VALUES ('430426', '祁东县', '3', '430400');
INSERT INTO thinkox_district VALUES ('430481', '耒阳市', '3', '430400');
INSERT INTO thinkox_district VALUES ('430482', '常宁市', '3', '430400');
INSERT INTO thinkox_district VALUES ('430501', '市辖区', '3', '430500');
INSERT INTO thinkox_district VALUES ('430502', '双清区', '3', '430500');
INSERT INTO thinkox_district VALUES ('430503', '大祥区', '3', '430500');
INSERT INTO thinkox_district VALUES ('430511', '北塔区', '3', '430500');
INSERT INTO thinkox_district VALUES ('430521', '邵东县', '3', '430500');
INSERT INTO thinkox_district VALUES ('430522', '新邵县', '3', '430500');
INSERT INTO thinkox_district VALUES ('430523', '邵阳县', '3', '430500');
INSERT INTO thinkox_district VALUES ('430524', '隆回县', '3', '430500');
INSERT INTO thinkox_district VALUES ('430525', '洞口县', '3', '430500');
INSERT INTO thinkox_district VALUES ('430527', '绥宁县', '3', '430500');
INSERT INTO thinkox_district VALUES ('430528', '新宁县', '3', '430500');
INSERT INTO thinkox_district VALUES ('430529', '城步苗族自治县', '3', '430500');
INSERT INTO thinkox_district VALUES ('430581', '武冈市', '3', '430500');
INSERT INTO thinkox_district VALUES ('430601', '市辖区', '3', '430600');
INSERT INTO thinkox_district VALUES ('430602', '岳阳楼区', '3', '430600');
INSERT INTO thinkox_district VALUES ('430603', '云溪区', '3', '430600');
INSERT INTO thinkox_district VALUES ('430611', '君山区', '3', '430600');
INSERT INTO thinkox_district VALUES ('430621', '岳阳县', '3', '430600');
INSERT INTO thinkox_district VALUES ('430623', '华容县', '3', '430600');
INSERT INTO thinkox_district VALUES ('430624', '湘阴县', '3', '430600');
INSERT INTO thinkox_district VALUES ('430626', '平江县', '3', '430600');
INSERT INTO thinkox_district VALUES ('430681', '汨罗市', '3', '430600');
INSERT INTO thinkox_district VALUES ('430682', '临湘市', '3', '430600');
INSERT INTO thinkox_district VALUES ('430701', '市辖区', '3', '430700');
INSERT INTO thinkox_district VALUES ('430702', '武陵区', '3', '430700');
INSERT INTO thinkox_district VALUES ('430703', '鼎城区', '3', '430700');
INSERT INTO thinkox_district VALUES ('430721', '安乡县', '3', '430700');
INSERT INTO thinkox_district VALUES ('430722', '汉寿县', '3', '430700');
INSERT INTO thinkox_district VALUES ('430723', '澧　县', '3', '430700');
INSERT INTO thinkox_district VALUES ('430724', '临澧县', '3', '430700');
INSERT INTO thinkox_district VALUES ('430725', '桃源县', '3', '430700');
INSERT INTO thinkox_district VALUES ('430726', '石门县', '3', '430700');
INSERT INTO thinkox_district VALUES ('430781', '津市市', '3', '430700');
INSERT INTO thinkox_district VALUES ('430801', '市辖区', '3', '430800');
INSERT INTO thinkox_district VALUES ('430802', '永定区', '3', '430800');
INSERT INTO thinkox_district VALUES ('430811', '武陵源区', '3', '430800');
INSERT INTO thinkox_district VALUES ('430821', '慈利县', '3', '430800');
INSERT INTO thinkox_district VALUES ('430822', '桑植县', '3', '430800');
INSERT INTO thinkox_district VALUES ('430901', '市辖区', '3', '430900');
INSERT INTO thinkox_district VALUES ('430902', '资阳区', '3', '430900');
INSERT INTO thinkox_district VALUES ('430903', '赫山区', '3', '430900');
INSERT INTO thinkox_district VALUES ('430921', '南　县', '3', '430900');
INSERT INTO thinkox_district VALUES ('430922', '桃江县', '3', '430900');
INSERT INTO thinkox_district VALUES ('430923', '安化县', '3', '430900');
INSERT INTO thinkox_district VALUES ('430981', '沅江市', '3', '430900');
INSERT INTO thinkox_district VALUES ('431001', '市辖区', '3', '431000');
INSERT INTO thinkox_district VALUES ('431002', '北湖区', '3', '431000');
INSERT INTO thinkox_district VALUES ('431003', '苏仙区', '3', '431000');
INSERT INTO thinkox_district VALUES ('431021', '桂阳县', '3', '431000');
INSERT INTO thinkox_district VALUES ('431022', '宜章县', '3', '431000');
INSERT INTO thinkox_district VALUES ('431023', '永兴县', '3', '431000');
INSERT INTO thinkox_district VALUES ('431024', '嘉禾县', '3', '431000');
INSERT INTO thinkox_district VALUES ('431025', '临武县', '3', '431000');
INSERT INTO thinkox_district VALUES ('431026', '汝城县', '3', '431000');
INSERT INTO thinkox_district VALUES ('431027', '桂东县', '3', '431000');
INSERT INTO thinkox_district VALUES ('431028', '安仁县', '3', '431000');
INSERT INTO thinkox_district VALUES ('431081', '资兴市', '3', '431000');
INSERT INTO thinkox_district VALUES ('431101', '市辖区', '3', '431100');
INSERT INTO thinkox_district VALUES ('431102', '芝山区', '3', '431100');
INSERT INTO thinkox_district VALUES ('431103', '冷水滩区', '3', '431100');
INSERT INTO thinkox_district VALUES ('431121', '祁阳县', '3', '431100');
INSERT INTO thinkox_district VALUES ('431122', '东安县', '3', '431100');
INSERT INTO thinkox_district VALUES ('431123', '双牌县', '3', '431100');
INSERT INTO thinkox_district VALUES ('431124', '道　县', '3', '431100');
INSERT INTO thinkox_district VALUES ('431125', '江永县', '3', '431100');
INSERT INTO thinkox_district VALUES ('431126', '宁远县', '3', '431100');
INSERT INTO thinkox_district VALUES ('431127', '蓝山县', '3', '431100');
INSERT INTO thinkox_district VALUES ('431128', '新田县', '3', '431100');
INSERT INTO thinkox_district VALUES ('431129', '江华瑶族自治县', '3', '431100');
INSERT INTO thinkox_district VALUES ('431201', '市辖区', '3', '431200');
INSERT INTO thinkox_district VALUES ('431202', '鹤城区', '3', '431200');
INSERT INTO thinkox_district VALUES ('431221', '中方县', '3', '431200');
INSERT INTO thinkox_district VALUES ('431222', '沅陵县', '3', '431200');
INSERT INTO thinkox_district VALUES ('431223', '辰溪县', '3', '431200');
INSERT INTO thinkox_district VALUES ('431224', '溆浦县', '3', '431200');
INSERT INTO thinkox_district VALUES ('431225', '会同县', '3', '431200');
INSERT INTO thinkox_district VALUES ('431226', '麻阳苗族自治县', '3', '431200');
INSERT INTO thinkox_district VALUES ('431227', '新晃侗族自治县', '3', '431200');
INSERT INTO thinkox_district VALUES ('431228', '芷江侗族自治县', '3', '431200');
INSERT INTO thinkox_district VALUES ('431229', '靖州苗族侗族自治县', '3', '431200');
INSERT INTO thinkox_district VALUES ('431230', '通道侗族自治县', '3', '431200');
INSERT INTO thinkox_district VALUES ('431281', '洪江市', '3', '431200');
INSERT INTO thinkox_district VALUES ('431301', '市辖区', '3', '431300');
INSERT INTO thinkox_district VALUES ('431302', '娄星区', '3', '431300');
INSERT INTO thinkox_district VALUES ('431321', '双峰县', '3', '431300');
INSERT INTO thinkox_district VALUES ('431322', '新化县', '3', '431300');
INSERT INTO thinkox_district VALUES ('431381', '冷水江市', '3', '431300');
INSERT INTO thinkox_district VALUES ('431382', '涟源市', '3', '431300');
INSERT INTO thinkox_district VALUES ('433101', '吉首市', '3', '433100');
INSERT INTO thinkox_district VALUES ('433122', '泸溪县', '3', '433100');
INSERT INTO thinkox_district VALUES ('433123', '凤凰县', '3', '433100');
INSERT INTO thinkox_district VALUES ('433124', '花垣县', '3', '433100');
INSERT INTO thinkox_district VALUES ('433125', '保靖县', '3', '433100');
INSERT INTO thinkox_district VALUES ('433126', '古丈县', '3', '433100');
INSERT INTO thinkox_district VALUES ('433127', '永顺县', '3', '433100');
INSERT INTO thinkox_district VALUES ('433130', '龙山县', '3', '433100');
INSERT INTO thinkox_district VALUES ('440101', '市辖区', '3', '440100');
INSERT INTO thinkox_district VALUES ('440102', '东山区', '3', '440100');
INSERT INTO thinkox_district VALUES ('440103', '荔湾区', '3', '440100');
INSERT INTO thinkox_district VALUES ('440104', '越秀区', '3', '440100');
INSERT INTO thinkox_district VALUES ('440105', '海珠区', '3', '440100');
INSERT INTO thinkox_district VALUES ('440106', '天河区', '3', '440100');
INSERT INTO thinkox_district VALUES ('440107', '芳村区', '3', '440100');
INSERT INTO thinkox_district VALUES ('440111', '白云区', '3', '440100');
INSERT INTO thinkox_district VALUES ('440112', '黄埔区', '3', '440100');
INSERT INTO thinkox_district VALUES ('440113', '番禺区', '3', '440100');
INSERT INTO thinkox_district VALUES ('440114', '花都区', '3', '440100');
INSERT INTO thinkox_district VALUES ('440183', '增城市', '3', '440100');
INSERT INTO thinkox_district VALUES ('440184', '从化市', '3', '440100');
INSERT INTO thinkox_district VALUES ('440201', '市辖区', '3', '440200');
INSERT INTO thinkox_district VALUES ('440203', '武江区', '3', '440200');
INSERT INTO thinkox_district VALUES ('440204', '浈江区', '3', '440200');
INSERT INTO thinkox_district VALUES ('440205', '曲江区', '3', '440200');
INSERT INTO thinkox_district VALUES ('440222', '始兴县', '3', '440200');
INSERT INTO thinkox_district VALUES ('440224', '仁化县', '3', '440200');
INSERT INTO thinkox_district VALUES ('440229', '翁源县', '3', '440200');
INSERT INTO thinkox_district VALUES ('440232', '乳源瑶族自治县', '3', '440200');
INSERT INTO thinkox_district VALUES ('440233', '新丰县', '3', '440200');
INSERT INTO thinkox_district VALUES ('440281', '乐昌市', '3', '440200');
INSERT INTO thinkox_district VALUES ('440282', '南雄市', '3', '440200');
INSERT INTO thinkox_district VALUES ('440301', '市辖区', '3', '440300');
INSERT INTO thinkox_district VALUES ('440303', '罗湖区', '3', '440300');
INSERT INTO thinkox_district VALUES ('440304', '福田区', '3', '440300');
INSERT INTO thinkox_district VALUES ('440305', '南山区', '3', '440300');
INSERT INTO thinkox_district VALUES ('440306', '宝安区', '3', '440300');
INSERT INTO thinkox_district VALUES ('440307', '龙岗区', '3', '440300');
INSERT INTO thinkox_district VALUES ('440308', '盐田区', '3', '440300');
INSERT INTO thinkox_district VALUES ('440401', '市辖区', '3', '440400');
INSERT INTO thinkox_district VALUES ('440402', '香洲区', '3', '440400');
INSERT INTO thinkox_district VALUES ('440403', '斗门区', '3', '440400');
INSERT INTO thinkox_district VALUES ('440404', '金湾区', '3', '440400');
INSERT INTO thinkox_district VALUES ('440501', '市辖区', '3', '440500');
INSERT INTO thinkox_district VALUES ('440507', '龙湖区', '3', '440500');
INSERT INTO thinkox_district VALUES ('440511', '金平区', '3', '440500');
INSERT INTO thinkox_district VALUES ('440512', '濠江区', '3', '440500');
INSERT INTO thinkox_district VALUES ('440513', '潮阳区', '3', '440500');
INSERT INTO thinkox_district VALUES ('440514', '潮南区', '3', '440500');
INSERT INTO thinkox_district VALUES ('440515', '澄海区', '3', '440500');
INSERT INTO thinkox_district VALUES ('440523', '南澳县', '3', '440500');
INSERT INTO thinkox_district VALUES ('440601', '市辖区', '3', '440600');
INSERT INTO thinkox_district VALUES ('440604', '禅城区', '3', '440600');
INSERT INTO thinkox_district VALUES ('440605', '南海区', '3', '440600');
INSERT INTO thinkox_district VALUES ('440606', '顺德区', '3', '440600');
INSERT INTO thinkox_district VALUES ('440607', '三水区', '3', '440600');
INSERT INTO thinkox_district VALUES ('440608', '高明区', '3', '440600');
INSERT INTO thinkox_district VALUES ('440701', '市辖区', '3', '440700');
INSERT INTO thinkox_district VALUES ('440703', '蓬江区', '3', '440700');
INSERT INTO thinkox_district VALUES ('440704', '江海区', '3', '440700');
INSERT INTO thinkox_district VALUES ('440705', '新会区', '3', '440700');
INSERT INTO thinkox_district VALUES ('440781', '台山市', '3', '440700');
INSERT INTO thinkox_district VALUES ('440783', '开平市', '3', '440700');
INSERT INTO thinkox_district VALUES ('440784', '鹤山市', '3', '440700');
INSERT INTO thinkox_district VALUES ('440785', '恩平市', '3', '440700');
INSERT INTO thinkox_district VALUES ('440801', '市辖区', '3', '440800');
INSERT INTO thinkox_district VALUES ('440802', '赤坎区', '3', '440800');
INSERT INTO thinkox_district VALUES ('440803', '霞山区', '3', '440800');
INSERT INTO thinkox_district VALUES ('440804', '坡头区', '3', '440800');
INSERT INTO thinkox_district VALUES ('440811', '麻章区', '3', '440800');
INSERT INTO thinkox_district VALUES ('440823', '遂溪县', '3', '440800');
INSERT INTO thinkox_district VALUES ('440825', '徐闻县', '3', '440800');
INSERT INTO thinkox_district VALUES ('440881', '廉江市', '3', '440800');
INSERT INTO thinkox_district VALUES ('440882', '雷州市', '3', '440800');
INSERT INTO thinkox_district VALUES ('440883', '吴川市', '3', '440800');
INSERT INTO thinkox_district VALUES ('440901', '市辖区', '3', '440900');
INSERT INTO thinkox_district VALUES ('440902', '茂南区', '3', '440900');
INSERT INTO thinkox_district VALUES ('440903', '茂港区', '3', '440900');
INSERT INTO thinkox_district VALUES ('440923', '电白县', '3', '440900');
INSERT INTO thinkox_district VALUES ('440981', '高州市', '3', '440900');
INSERT INTO thinkox_district VALUES ('440982', '化州市', '3', '440900');
INSERT INTO thinkox_district VALUES ('440983', '信宜市', '3', '440900');
INSERT INTO thinkox_district VALUES ('441201', '市辖区', '3', '441200');
INSERT INTO thinkox_district VALUES ('441202', '端州区', '3', '441200');
INSERT INTO thinkox_district VALUES ('441203', '鼎湖区', '3', '441200');
INSERT INTO thinkox_district VALUES ('441223', '广宁县', '3', '441200');
INSERT INTO thinkox_district VALUES ('441224', '怀集县', '3', '441200');
INSERT INTO thinkox_district VALUES ('441225', '封开县', '3', '441200');
INSERT INTO thinkox_district VALUES ('441226', '德庆县', '3', '441200');
INSERT INTO thinkox_district VALUES ('441283', '高要市', '3', '441200');
INSERT INTO thinkox_district VALUES ('441284', '四会市', '3', '441200');
INSERT INTO thinkox_district VALUES ('441301', '市辖区', '3', '441300');
INSERT INTO thinkox_district VALUES ('441302', '惠城区', '3', '441300');
INSERT INTO thinkox_district VALUES ('441303', '惠阳区', '3', '441300');
INSERT INTO thinkox_district VALUES ('441322', '博罗县', '3', '441300');
INSERT INTO thinkox_district VALUES ('441323', '惠东县', '3', '441300');
INSERT INTO thinkox_district VALUES ('441324', '龙门县', '3', '441300');
INSERT INTO thinkox_district VALUES ('441401', '市辖区', '3', '441400');
INSERT INTO thinkox_district VALUES ('441402', '梅江区', '3', '441400');
INSERT INTO thinkox_district VALUES ('441421', '梅　县', '3', '441400');
INSERT INTO thinkox_district VALUES ('441422', '大埔县', '3', '441400');
INSERT INTO thinkox_district VALUES ('441423', '丰顺县', '3', '441400');
INSERT INTO thinkox_district VALUES ('441424', '五华县', '3', '441400');
INSERT INTO thinkox_district VALUES ('441426', '平远县', '3', '441400');
INSERT INTO thinkox_district VALUES ('441427', '蕉岭县', '3', '441400');
INSERT INTO thinkox_district VALUES ('441481', '兴宁市', '3', '441400');
INSERT INTO thinkox_district VALUES ('441501', '市辖区', '3', '441500');
INSERT INTO thinkox_district VALUES ('441502', '城　区', '3', '441500');
INSERT INTO thinkox_district VALUES ('441521', '海丰县', '3', '441500');
INSERT INTO thinkox_district VALUES ('441523', '陆河县', '3', '441500');
INSERT INTO thinkox_district VALUES ('441581', '陆丰市', '3', '441500');
INSERT INTO thinkox_district VALUES ('441601', '市辖区', '3', '441600');
INSERT INTO thinkox_district VALUES ('441602', '源城区', '3', '441600');
INSERT INTO thinkox_district VALUES ('441621', '紫金县', '3', '441600');
INSERT INTO thinkox_district VALUES ('441622', '龙川县', '3', '441600');
INSERT INTO thinkox_district VALUES ('441623', '连平县', '3', '441600');
INSERT INTO thinkox_district VALUES ('441624', '和平县', '3', '441600');
INSERT INTO thinkox_district VALUES ('441625', '东源县', '3', '441600');
INSERT INTO thinkox_district VALUES ('441701', '市辖区', '3', '441700');
INSERT INTO thinkox_district VALUES ('441702', '江城区', '3', '441700');
INSERT INTO thinkox_district VALUES ('441721', '阳西县', '3', '441700');
INSERT INTO thinkox_district VALUES ('441723', '阳东县', '3', '441700');
INSERT INTO thinkox_district VALUES ('441781', '阳春市', '3', '441700');
INSERT INTO thinkox_district VALUES ('441801', '市辖区', '3', '441800');
INSERT INTO thinkox_district VALUES ('441802', '清城区', '3', '441800');
INSERT INTO thinkox_district VALUES ('441821', '佛冈县', '3', '441800');
INSERT INTO thinkox_district VALUES ('441823', '阳山县', '3', '441800');
INSERT INTO thinkox_district VALUES ('441825', '连山壮族瑶族自治县', '3', '441800');
INSERT INTO thinkox_district VALUES ('441826', '连南瑶族自治县', '3', '441800');
INSERT INTO thinkox_district VALUES ('441827', '清新县', '3', '441800');
INSERT INTO thinkox_district VALUES ('441881', '英德市', '3', '441800');
INSERT INTO thinkox_district VALUES ('441882', '连州市', '3', '441800');
INSERT INTO thinkox_district VALUES ('445101', '市辖区', '3', '445100');
INSERT INTO thinkox_district VALUES ('445102', '湘桥区', '3', '445100');
INSERT INTO thinkox_district VALUES ('445121', '潮安县', '3', '445100');
INSERT INTO thinkox_district VALUES ('445122', '饶平县', '3', '445100');
INSERT INTO thinkox_district VALUES ('445201', '市辖区', '3', '445200');
INSERT INTO thinkox_district VALUES ('445202', '榕城区', '3', '445200');
INSERT INTO thinkox_district VALUES ('445221', '揭东县', '3', '445200');
INSERT INTO thinkox_district VALUES ('445222', '揭西县', '3', '445200');
INSERT INTO thinkox_district VALUES ('445224', '惠来县', '3', '445200');
INSERT INTO thinkox_district VALUES ('445281', '普宁市', '3', '445200');
INSERT INTO thinkox_district VALUES ('445301', '市辖区', '3', '445300');
INSERT INTO thinkox_district VALUES ('445302', '云城区', '3', '445300');
INSERT INTO thinkox_district VALUES ('445321', '新兴县', '3', '445300');
INSERT INTO thinkox_district VALUES ('445322', '郁南县', '3', '445300');
INSERT INTO thinkox_district VALUES ('445323', '云安县', '3', '445300');
INSERT INTO thinkox_district VALUES ('445381', '罗定市', '3', '445300');
INSERT INTO thinkox_district VALUES ('450101', '市辖区', '3', '450100');
INSERT INTO thinkox_district VALUES ('450102', '兴宁区', '3', '450100');
INSERT INTO thinkox_district VALUES ('450103', '青秀区', '3', '450100');
INSERT INTO thinkox_district VALUES ('450105', '江南区', '3', '450100');
INSERT INTO thinkox_district VALUES ('450107', '西乡塘区', '3', '450100');
INSERT INTO thinkox_district VALUES ('450108', '良庆区', '3', '450100');
INSERT INTO thinkox_district VALUES ('450109', '邕宁区', '3', '450100');
INSERT INTO thinkox_district VALUES ('450122', '武鸣县', '3', '450100');
INSERT INTO thinkox_district VALUES ('450123', '隆安县', '3', '450100');
INSERT INTO thinkox_district VALUES ('450124', '马山县', '3', '450100');
INSERT INTO thinkox_district VALUES ('450125', '上林县', '3', '450100');
INSERT INTO thinkox_district VALUES ('450126', '宾阳县', '3', '450100');
INSERT INTO thinkox_district VALUES ('450127', '横　县', '3', '450100');
INSERT INTO thinkox_district VALUES ('450201', '市辖区', '3', '450200');
INSERT INTO thinkox_district VALUES ('450202', '城中区', '3', '450200');
INSERT INTO thinkox_district VALUES ('450203', '鱼峰区', '3', '450200');
INSERT INTO thinkox_district VALUES ('450204', '柳南区', '3', '450200');
INSERT INTO thinkox_district VALUES ('450205', '柳北区', '3', '450200');
INSERT INTO thinkox_district VALUES ('450221', '柳江县', '3', '450200');
INSERT INTO thinkox_district VALUES ('450222', '柳城县', '3', '450200');
INSERT INTO thinkox_district VALUES ('450223', '鹿寨县', '3', '450200');
INSERT INTO thinkox_district VALUES ('450224', '融安县', '3', '450200');
INSERT INTO thinkox_district VALUES ('450225', '融水苗族自治县', '3', '450200');
INSERT INTO thinkox_district VALUES ('450226', '三江侗族自治县', '3', '450200');
INSERT INTO thinkox_district VALUES ('450301', '市辖区', '3', '450300');
INSERT INTO thinkox_district VALUES ('450302', '秀峰区', '3', '450300');
INSERT INTO thinkox_district VALUES ('450303', '叠彩区', '3', '450300');
INSERT INTO thinkox_district VALUES ('450304', '象山区', '3', '450300');
INSERT INTO thinkox_district VALUES ('450305', '七星区', '3', '450300');
INSERT INTO thinkox_district VALUES ('450311', '雁山区', '3', '450300');
INSERT INTO thinkox_district VALUES ('450321', '阳朔县', '3', '450300');
INSERT INTO thinkox_district VALUES ('450322', '临桂县', '3', '450300');
INSERT INTO thinkox_district VALUES ('450323', '灵川县', '3', '450300');
INSERT INTO thinkox_district VALUES ('450324', '全州县', '3', '450300');
INSERT INTO thinkox_district VALUES ('450325', '兴安县', '3', '450300');
INSERT INTO thinkox_district VALUES ('450326', '永福县', '3', '450300');
INSERT INTO thinkox_district VALUES ('450327', '灌阳县', '3', '450300');
INSERT INTO thinkox_district VALUES ('450328', '龙胜各族自治县', '3', '450300');
INSERT INTO thinkox_district VALUES ('450329', '资源县', '3', '450300');
INSERT INTO thinkox_district VALUES ('450330', '平乐县', '3', '450300');
INSERT INTO thinkox_district VALUES ('450331', '荔蒲县', '3', '450300');
INSERT INTO thinkox_district VALUES ('450332', '恭城瑶族自治县', '3', '450300');
INSERT INTO thinkox_district VALUES ('450401', '市辖区', '3', '450400');
INSERT INTO thinkox_district VALUES ('450403', '万秀区', '3', '450400');
INSERT INTO thinkox_district VALUES ('450404', '蝶山区', '3', '450400');
INSERT INTO thinkox_district VALUES ('450405', '长洲区', '3', '450400');
INSERT INTO thinkox_district VALUES ('450421', '苍梧县', '3', '450400');
INSERT INTO thinkox_district VALUES ('450422', '藤　县', '3', '450400');
INSERT INTO thinkox_district VALUES ('450423', '蒙山县', '3', '450400');
INSERT INTO thinkox_district VALUES ('450481', '岑溪市', '3', '450400');
INSERT INTO thinkox_district VALUES ('450501', '市辖区', '3', '450500');
INSERT INTO thinkox_district VALUES ('450502', '海城区', '3', '450500');
INSERT INTO thinkox_district VALUES ('450503', '银海区', '3', '450500');
INSERT INTO thinkox_district VALUES ('450512', '铁山港区', '3', '450500');
INSERT INTO thinkox_district VALUES ('450521', '合浦县', '3', '450500');
INSERT INTO thinkox_district VALUES ('450601', '市辖区', '3', '450600');
INSERT INTO thinkox_district VALUES ('450602', '港口区', '3', '450600');
INSERT INTO thinkox_district VALUES ('450603', '防城区', '3', '450600');
INSERT INTO thinkox_district VALUES ('450621', '上思县', '3', '450600');
INSERT INTO thinkox_district VALUES ('450681', '东兴市', '3', '450600');
INSERT INTO thinkox_district VALUES ('450701', '市辖区', '3', '450700');
INSERT INTO thinkox_district VALUES ('450702', '钦南区', '3', '450700');
INSERT INTO thinkox_district VALUES ('450703', '钦北区', '3', '450700');
INSERT INTO thinkox_district VALUES ('450721', '灵山县', '3', '450700');
INSERT INTO thinkox_district VALUES ('450722', '浦北县', '3', '450700');
INSERT INTO thinkox_district VALUES ('450801', '市辖区', '3', '450800');
INSERT INTO thinkox_district VALUES ('450802', '港北区', '3', '450800');
INSERT INTO thinkox_district VALUES ('450803', '港南区', '3', '450800');
INSERT INTO thinkox_district VALUES ('450804', '覃塘区', '3', '450800');
INSERT INTO thinkox_district VALUES ('450821', '平南县', '3', '450800');
INSERT INTO thinkox_district VALUES ('450881', '桂平市', '3', '450800');
INSERT INTO thinkox_district VALUES ('450901', '市辖区', '3', '450900');
INSERT INTO thinkox_district VALUES ('450902', '玉州区', '3', '450900');
INSERT INTO thinkox_district VALUES ('450921', '容　县', '3', '450900');
INSERT INTO thinkox_district VALUES ('450922', '陆川县', '3', '450900');
INSERT INTO thinkox_district VALUES ('450923', '博白县', '3', '450900');
INSERT INTO thinkox_district VALUES ('450924', '兴业县', '3', '450900');
INSERT INTO thinkox_district VALUES ('450981', '北流市', '3', '450900');
INSERT INTO thinkox_district VALUES ('451001', '市辖区', '3', '451000');
INSERT INTO thinkox_district VALUES ('451002', '右江区', '3', '451000');
INSERT INTO thinkox_district VALUES ('451021', '田阳县', '3', '451000');
INSERT INTO thinkox_district VALUES ('451022', '田东县', '3', '451000');
INSERT INTO thinkox_district VALUES ('451023', '平果县', '3', '451000');
INSERT INTO thinkox_district VALUES ('451024', '德保县', '3', '451000');
INSERT INTO thinkox_district VALUES ('451025', '靖西县', '3', '451000');
INSERT INTO thinkox_district VALUES ('451026', '那坡县', '3', '451000');
INSERT INTO thinkox_district VALUES ('451027', '凌云县', '3', '451000');
INSERT INTO thinkox_district VALUES ('451028', '乐业县', '3', '451000');
INSERT INTO thinkox_district VALUES ('451029', '田林县', '3', '451000');
INSERT INTO thinkox_district VALUES ('451030', '西林县', '3', '451000');
INSERT INTO thinkox_district VALUES ('451031', '隆林各族自治县', '3', '451000');
INSERT INTO thinkox_district VALUES ('451101', '市辖区', '3', '451100');
INSERT INTO thinkox_district VALUES ('451102', '八步区', '3', '451100');
INSERT INTO thinkox_district VALUES ('451121', '昭平县', '3', '451100');
INSERT INTO thinkox_district VALUES ('451122', '钟山县', '3', '451100');
INSERT INTO thinkox_district VALUES ('451123', '富川瑶族自治县', '3', '451100');
INSERT INTO thinkox_district VALUES ('451201', '市辖区', '3', '451200');
INSERT INTO thinkox_district VALUES ('451202', '金城江区', '3', '451200');
INSERT INTO thinkox_district VALUES ('451221', '南丹县', '3', '451200');
INSERT INTO thinkox_district VALUES ('451222', '天峨县', '3', '451200');
INSERT INTO thinkox_district VALUES ('451223', '凤山县', '3', '451200');
INSERT INTO thinkox_district VALUES ('451224', '东兰县', '3', '451200');
INSERT INTO thinkox_district VALUES ('451225', '罗城仫佬族自治县', '3', '451200');
INSERT INTO thinkox_district VALUES ('451226', '环江毛南族自治县', '3', '451200');
INSERT INTO thinkox_district VALUES ('451227', '巴马瑶族自治县', '3', '451200');
INSERT INTO thinkox_district VALUES ('451228', '都安瑶族自治县', '3', '451200');
INSERT INTO thinkox_district VALUES ('451229', '大化瑶族自治县', '3', '451200');
INSERT INTO thinkox_district VALUES ('451281', '宜州市', '3', '451200');
INSERT INTO thinkox_district VALUES ('451301', '市辖区', '3', '451300');
INSERT INTO thinkox_district VALUES ('451302', '兴宾区', '3', '451300');
INSERT INTO thinkox_district VALUES ('451321', '忻城县', '3', '451300');
INSERT INTO thinkox_district VALUES ('451322', '象州县', '3', '451300');
INSERT INTO thinkox_district VALUES ('451323', '武宣县', '3', '451300');
INSERT INTO thinkox_district VALUES ('451324', '金秀瑶族自治县', '3', '451300');
INSERT INTO thinkox_district VALUES ('451381', '合山市', '3', '451300');
INSERT INTO thinkox_district VALUES ('451401', '市辖区', '3', '451400');
INSERT INTO thinkox_district VALUES ('451402', '江洲区', '3', '451400');
INSERT INTO thinkox_district VALUES ('451421', '扶绥县', '3', '451400');
INSERT INTO thinkox_district VALUES ('451422', '宁明县', '3', '451400');
INSERT INTO thinkox_district VALUES ('451423', '龙州县', '3', '451400');
INSERT INTO thinkox_district VALUES ('451424', '大新县', '3', '451400');
INSERT INTO thinkox_district VALUES ('451425', '天等县', '3', '451400');
INSERT INTO thinkox_district VALUES ('451481', '凭祥市', '3', '451400');
INSERT INTO thinkox_district VALUES ('460101', '市辖区', '3', '460100');
INSERT INTO thinkox_district VALUES ('460105', '秀英区', '3', '460100');
INSERT INTO thinkox_district VALUES ('460106', '龙华区', '3', '460100');
INSERT INTO thinkox_district VALUES ('460107', '琼山区', '3', '460100');
INSERT INTO thinkox_district VALUES ('460108', '美兰区', '3', '460100');
INSERT INTO thinkox_district VALUES ('460201', '市辖区', '3', '460200');
INSERT INTO thinkox_district VALUES ('469001', '五指山市', '3', '469000');
INSERT INTO thinkox_district VALUES ('469002', '琼海市', '3', '469000');
INSERT INTO thinkox_district VALUES ('469003', '儋州市', '3', '469000');
INSERT INTO thinkox_district VALUES ('469005', '文昌市', '3', '469000');
INSERT INTO thinkox_district VALUES ('469006', '万宁市', '3', '469000');
INSERT INTO thinkox_district VALUES ('469007', '东方市', '3', '469000');
INSERT INTO thinkox_district VALUES ('469025', '定安县', '3', '469000');
INSERT INTO thinkox_district VALUES ('469026', '屯昌县', '3', '469000');
INSERT INTO thinkox_district VALUES ('469027', '澄迈县', '3', '469000');
INSERT INTO thinkox_district VALUES ('469028', '临高县', '3', '469000');
INSERT INTO thinkox_district VALUES ('469030', '白沙黎族自治县', '3', '469000');
INSERT INTO thinkox_district VALUES ('469031', '昌江黎族自治县', '3', '469000');
INSERT INTO thinkox_district VALUES ('469033', '乐东黎族自治县', '3', '469000');
INSERT INTO thinkox_district VALUES ('469034', '陵水黎族自治县', '3', '469000');
INSERT INTO thinkox_district VALUES ('469035', '保亭黎族苗族自治县', '3', '469000');
INSERT INTO thinkox_district VALUES ('469036', '琼中黎族苗族自治县', '3', '469000');
INSERT INTO thinkox_district VALUES ('469037', '西沙群岛', '3', '469000');
INSERT INTO thinkox_district VALUES ('469038', '南沙群岛', '3', '469000');
INSERT INTO thinkox_district VALUES ('469039', '中沙群岛的岛礁及其海域', '3', '469000');
INSERT INTO thinkox_district VALUES ('500101', '万州区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500102', '涪陵区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500103', '渝中区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500104', '大渡口区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500105', '江北区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500106', '沙坪坝区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500107', '九龙坡区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500108', '南岸区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500109', '北碚区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500110', '万盛区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500111', '双桥区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500112', '渝北区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500113', '巴南区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500114', '黔江区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500115', '长寿区', '3', '500100');
INSERT INTO thinkox_district VALUES ('500222', '綦江县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500223', '潼南县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500224', '铜梁县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500225', '大足县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500226', '荣昌县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500227', '璧山县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500228', '梁平县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500229', '城口县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500230', '丰都县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500231', '垫江县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500232', '武隆县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500233', '忠　县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500234', '开　县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500235', '云阳县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500236', '奉节县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500237', '巫山县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500238', '巫溪县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500240', '石柱土家族自治县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500241', '秀山土家族苗族自治县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500242', '酉阳土家族苗族自治县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500243', '彭水苗族土家族自治县', '3', '500200');
INSERT INTO thinkox_district VALUES ('500381', '江津市', '3', '500300');
INSERT INTO thinkox_district VALUES ('500382', '合川市', '3', '500300');
INSERT INTO thinkox_district VALUES ('500383', '永川市', '3', '500300');
INSERT INTO thinkox_district VALUES ('500384', '南川市', '3', '500300');
INSERT INTO thinkox_district VALUES ('510101', '市辖区', '3', '510100');
INSERT INTO thinkox_district VALUES ('510104', '锦江区', '3', '510100');
INSERT INTO thinkox_district VALUES ('510105', '青羊区', '3', '510100');
INSERT INTO thinkox_district VALUES ('510106', '金牛区', '3', '510100');
INSERT INTO thinkox_district VALUES ('510107', '武侯区', '3', '510100');
INSERT INTO thinkox_district VALUES ('510108', '成华区', '3', '510100');
INSERT INTO thinkox_district VALUES ('510112', '龙泉驿区', '3', '510100');
INSERT INTO thinkox_district VALUES ('510113', '青白江区', '3', '510100');
INSERT INTO thinkox_district VALUES ('510114', '新都区', '3', '510100');
INSERT INTO thinkox_district VALUES ('510115', '温江区', '3', '510100');
INSERT INTO thinkox_district VALUES ('510121', '金堂县', '3', '510100');
INSERT INTO thinkox_district VALUES ('510122', '双流县', '3', '510100');
INSERT INTO thinkox_district VALUES ('510124', '郫　县', '3', '510100');
INSERT INTO thinkox_district VALUES ('510129', '大邑县', '3', '510100');
INSERT INTO thinkox_district VALUES ('510131', '蒲江县', '3', '510100');
INSERT INTO thinkox_district VALUES ('510132', '新津县', '3', '510100');
INSERT INTO thinkox_district VALUES ('510181', '都江堰市', '3', '510100');
INSERT INTO thinkox_district VALUES ('510182', '彭州市', '3', '510100');
INSERT INTO thinkox_district VALUES ('510183', '邛崃市', '3', '510100');
INSERT INTO thinkox_district VALUES ('510184', '崇州市', '3', '510100');
INSERT INTO thinkox_district VALUES ('510301', '市辖区', '3', '510300');
INSERT INTO thinkox_district VALUES ('510302', '自流井区', '3', '510300');
INSERT INTO thinkox_district VALUES ('510303', '贡井区', '3', '510300');
INSERT INTO thinkox_district VALUES ('510304', '大安区', '3', '510300');
INSERT INTO thinkox_district VALUES ('510311', '沿滩区', '3', '510300');
INSERT INTO thinkox_district VALUES ('510321', '荣　县', '3', '510300');
INSERT INTO thinkox_district VALUES ('510322', '富顺县', '3', '510300');
INSERT INTO thinkox_district VALUES ('510401', '市辖区', '3', '510400');
INSERT INTO thinkox_district VALUES ('510402', '东　区', '3', '510400');
INSERT INTO thinkox_district VALUES ('510403', '西　区', '3', '510400');
INSERT INTO thinkox_district VALUES ('510411', '仁和区', '3', '510400');
INSERT INTO thinkox_district VALUES ('510421', '米易县', '3', '510400');
INSERT INTO thinkox_district VALUES ('510422', '盐边县', '3', '510400');
INSERT INTO thinkox_district VALUES ('510501', '市辖区', '3', '510500');
INSERT INTO thinkox_district VALUES ('510502', '江阳区', '3', '510500');
INSERT INTO thinkox_district VALUES ('510503', '纳溪区', '3', '510500');
INSERT INTO thinkox_district VALUES ('510504', '龙马潭区', '3', '510500');
INSERT INTO thinkox_district VALUES ('510521', '泸　县', '3', '510500');
INSERT INTO thinkox_district VALUES ('510522', '合江县', '3', '510500');
INSERT INTO thinkox_district VALUES ('510524', '叙永县', '3', '510500');
INSERT INTO thinkox_district VALUES ('510525', '古蔺县', '3', '510500');
INSERT INTO thinkox_district VALUES ('510601', '市辖区', '3', '510600');
INSERT INTO thinkox_district VALUES ('510603', '旌阳区', '3', '510600');
INSERT INTO thinkox_district VALUES ('510623', '中江县', '3', '510600');
INSERT INTO thinkox_district VALUES ('510626', '罗江县', '3', '510600');
INSERT INTO thinkox_district VALUES ('510681', '广汉市', '3', '510600');
INSERT INTO thinkox_district VALUES ('510682', '什邡市', '3', '510600');
INSERT INTO thinkox_district VALUES ('510683', '绵竹市', '3', '510600');
INSERT INTO thinkox_district VALUES ('510701', '市辖区', '3', '510700');
INSERT INTO thinkox_district VALUES ('510703', '涪城区', '3', '510700');
INSERT INTO thinkox_district VALUES ('510704', '游仙区', '3', '510700');
INSERT INTO thinkox_district VALUES ('510722', '三台县', '3', '510700');
INSERT INTO thinkox_district VALUES ('510723', '盐亭县', '3', '510700');
INSERT INTO thinkox_district VALUES ('510724', '安　县', '3', '510700');
INSERT INTO thinkox_district VALUES ('510725', '梓潼县', '3', '510700');
INSERT INTO thinkox_district VALUES ('510726', '北川羌族自治县', '3', '510700');
INSERT INTO thinkox_district VALUES ('510727', '平武县', '3', '510700');
INSERT INTO thinkox_district VALUES ('510781', '江油市', '3', '510700');
INSERT INTO thinkox_district VALUES ('510801', '市辖区', '3', '510800');
INSERT INTO thinkox_district VALUES ('510802', '市中区', '3', '510800');
INSERT INTO thinkox_district VALUES ('510811', '元坝区', '3', '510800');
INSERT INTO thinkox_district VALUES ('510812', '朝天区', '3', '510800');
INSERT INTO thinkox_district VALUES ('510821', '旺苍县', '3', '510800');
INSERT INTO thinkox_district VALUES ('510822', '青川县', '3', '510800');
INSERT INTO thinkox_district VALUES ('510823', '剑阁县', '3', '510800');
INSERT INTO thinkox_district VALUES ('510824', '苍溪县', '3', '510800');
INSERT INTO thinkox_district VALUES ('510901', '市辖区', '3', '510900');
INSERT INTO thinkox_district VALUES ('510903', '船山区', '3', '510900');
INSERT INTO thinkox_district VALUES ('510904', '安居区', '3', '510900');
INSERT INTO thinkox_district VALUES ('510921', '蓬溪县', '3', '510900');
INSERT INTO thinkox_district VALUES ('510922', '射洪县', '3', '510900');
INSERT INTO thinkox_district VALUES ('510923', '大英县', '3', '510900');
INSERT INTO thinkox_district VALUES ('511001', '市辖区', '3', '511000');
INSERT INTO thinkox_district VALUES ('511002', '市中区', '3', '511000');
INSERT INTO thinkox_district VALUES ('511011', '东兴区', '3', '511000');
INSERT INTO thinkox_district VALUES ('511024', '威远县', '3', '511000');
INSERT INTO thinkox_district VALUES ('511025', '资中县', '3', '511000');
INSERT INTO thinkox_district VALUES ('511028', '隆昌县', '3', '511000');
INSERT INTO thinkox_district VALUES ('511101', '市辖区', '3', '511100');
INSERT INTO thinkox_district VALUES ('511102', '市中区', '3', '511100');
INSERT INTO thinkox_district VALUES ('511111', '沙湾区', '3', '511100');
INSERT INTO thinkox_district VALUES ('511112', '五通桥区', '3', '511100');
INSERT INTO thinkox_district VALUES ('511113', '金口河区', '3', '511100');
INSERT INTO thinkox_district VALUES ('511123', '犍为县', '3', '511100');
INSERT INTO thinkox_district VALUES ('511124', '井研县', '3', '511100');
INSERT INTO thinkox_district VALUES ('511126', '夹江县', '3', '511100');
INSERT INTO thinkox_district VALUES ('511129', '沐川县', '3', '511100');
INSERT INTO thinkox_district VALUES ('511132', '峨边彝族自治县', '3', '511100');
INSERT INTO thinkox_district VALUES ('511133', '马边彝族自治县', '3', '511100');
INSERT INTO thinkox_district VALUES ('511181', '峨眉山市', '3', '511100');
INSERT INTO thinkox_district VALUES ('511301', '市辖区', '3', '511300');
INSERT INTO thinkox_district VALUES ('511302', '顺庆区', '3', '511300');
INSERT INTO thinkox_district VALUES ('511303', '高坪区', '3', '511300');
INSERT INTO thinkox_district VALUES ('511304', '嘉陵区', '3', '511300');
INSERT INTO thinkox_district VALUES ('511321', '南部县', '3', '511300');
INSERT INTO thinkox_district VALUES ('511322', '营山县', '3', '511300');
INSERT INTO thinkox_district VALUES ('511323', '蓬安县', '3', '511300');
INSERT INTO thinkox_district VALUES ('511324', '仪陇县', '3', '511300');
INSERT INTO thinkox_district VALUES ('511325', '西充县', '3', '511300');
INSERT INTO thinkox_district VALUES ('511381', '阆中市', '3', '511300');
INSERT INTO thinkox_district VALUES ('511401', '市辖区', '3', '511400');
INSERT INTO thinkox_district VALUES ('511402', '东坡区', '3', '511400');
INSERT INTO thinkox_district VALUES ('511421', '仁寿县', '3', '511400');
INSERT INTO thinkox_district VALUES ('511422', '彭山县', '3', '511400');
INSERT INTO thinkox_district VALUES ('511423', '洪雅县', '3', '511400');
INSERT INTO thinkox_district VALUES ('511424', '丹棱县', '3', '511400');
INSERT INTO thinkox_district VALUES ('511425', '青神县', '3', '511400');
INSERT INTO thinkox_district VALUES ('511501', '市辖区', '3', '511500');
INSERT INTO thinkox_district VALUES ('511502', '翠屏区', '3', '511500');
INSERT INTO thinkox_district VALUES ('511521', '宜宾县', '3', '511500');
INSERT INTO thinkox_district VALUES ('511522', '南溪县', '3', '511500');
INSERT INTO thinkox_district VALUES ('511523', '江安县', '3', '511500');
INSERT INTO thinkox_district VALUES ('511524', '长宁县', '3', '511500');
INSERT INTO thinkox_district VALUES ('511525', '高　县', '3', '511500');
INSERT INTO thinkox_district VALUES ('511526', '珙　县', '3', '511500');
INSERT INTO thinkox_district VALUES ('511527', '筠连县', '3', '511500');
INSERT INTO thinkox_district VALUES ('511528', '兴文县', '3', '511500');
INSERT INTO thinkox_district VALUES ('511529', '屏山县', '3', '511500');
INSERT INTO thinkox_district VALUES ('511601', '市辖区', '3', '511600');
INSERT INTO thinkox_district VALUES ('511602', '广安区', '3', '511600');
INSERT INTO thinkox_district VALUES ('511621', '岳池县', '3', '511600');
INSERT INTO thinkox_district VALUES ('511622', '武胜县', '3', '511600');
INSERT INTO thinkox_district VALUES ('511623', '邻水县', '3', '511600');
INSERT INTO thinkox_district VALUES ('511681', '华莹市', '3', '511600');
INSERT INTO thinkox_district VALUES ('511701', '市辖区', '3', '511700');
INSERT INTO thinkox_district VALUES ('511702', '通川区', '3', '511700');
INSERT INTO thinkox_district VALUES ('511721', '达　县', '3', '511700');
INSERT INTO thinkox_district VALUES ('511722', '宣汉县', '3', '511700');
INSERT INTO thinkox_district VALUES ('511723', '开江县', '3', '511700');
INSERT INTO thinkox_district VALUES ('511724', '大竹县', '3', '511700');
INSERT INTO thinkox_district VALUES ('511725', '渠　县', '3', '511700');
INSERT INTO thinkox_district VALUES ('511781', '万源市', '3', '511700');
INSERT INTO thinkox_district VALUES ('511801', '市辖区', '3', '511800');
INSERT INTO thinkox_district VALUES ('511802', '雨城区', '3', '511800');
INSERT INTO thinkox_district VALUES ('511821', '名山县', '3', '511800');
INSERT INTO thinkox_district VALUES ('511822', '荥经县', '3', '511800');
INSERT INTO thinkox_district VALUES ('511823', '汉源县', '3', '511800');
INSERT INTO thinkox_district VALUES ('511824', '石棉县', '3', '511800');
INSERT INTO thinkox_district VALUES ('511825', '天全县', '3', '511800');
INSERT INTO thinkox_district VALUES ('511826', '芦山县', '3', '511800');
INSERT INTO thinkox_district VALUES ('511827', '宝兴县', '3', '511800');
INSERT INTO thinkox_district VALUES ('511901', '市辖区', '3', '511900');
INSERT INTO thinkox_district VALUES ('511902', '巴州区', '3', '511900');
INSERT INTO thinkox_district VALUES ('511921', '通江县', '3', '511900');
INSERT INTO thinkox_district VALUES ('511922', '南江县', '3', '511900');
INSERT INTO thinkox_district VALUES ('511923', '平昌县', '3', '511900');
INSERT INTO thinkox_district VALUES ('512001', '市辖区', '3', '512000');
INSERT INTO thinkox_district VALUES ('512002', '雁江区', '3', '512000');
INSERT INTO thinkox_district VALUES ('512021', '安岳县', '3', '512000');
INSERT INTO thinkox_district VALUES ('512022', '乐至县', '3', '512000');
INSERT INTO thinkox_district VALUES ('512081', '简阳市', '3', '512000');
INSERT INTO thinkox_district VALUES ('513221', '汶川县', '3', '513200');
INSERT INTO thinkox_district VALUES ('513222', '理　县', '3', '513200');
INSERT INTO thinkox_district VALUES ('513223', '茂　县', '3', '513200');
INSERT INTO thinkox_district VALUES ('513224', '松潘县', '3', '513200');
INSERT INTO thinkox_district VALUES ('513225', '九寨沟县', '3', '513200');
INSERT INTO thinkox_district VALUES ('513226', '金川县', '3', '513200');
INSERT INTO thinkox_district VALUES ('513227', '小金县', '3', '513200');
INSERT INTO thinkox_district VALUES ('513228', '黑水县', '3', '513200');
INSERT INTO thinkox_district VALUES ('513229', '马尔康县', '3', '513200');
INSERT INTO thinkox_district VALUES ('513230', '壤塘县', '3', '513200');
INSERT INTO thinkox_district VALUES ('513231', '阿坝县', '3', '513200');
INSERT INTO thinkox_district VALUES ('513232', '若尔盖县', '3', '513200');
INSERT INTO thinkox_district VALUES ('513233', '红原县', '3', '513200');
INSERT INTO thinkox_district VALUES ('513321', '康定县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513322', '泸定县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513323', '丹巴县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513324', '九龙县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513325', '雅江县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513326', '道孚县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513327', '炉霍县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513328', '甘孜县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513329', '新龙县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513330', '德格县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513331', '白玉县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513332', '石渠县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513333', '色达县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513334', '理塘县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513335', '巴塘县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513336', '乡城县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513337', '稻城县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513338', '得荣县', '3', '513300');
INSERT INTO thinkox_district VALUES ('513401', '西昌市', '3', '513400');
INSERT INTO thinkox_district VALUES ('513422', '木里藏族自治县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513423', '盐源县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513424', '德昌县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513425', '会理县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513426', '会东县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513427', '宁南县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513428', '普格县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513429', '布拖县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513430', '金阳县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513431', '昭觉县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513432', '喜德县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513433', '冕宁县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513434', '越西县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513435', '甘洛县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513436', '美姑县', '3', '513400');
INSERT INTO thinkox_district VALUES ('513437', '雷波县', '3', '513400');
INSERT INTO thinkox_district VALUES ('520101', '市辖区', '3', '520100');
INSERT INTO thinkox_district VALUES ('520102', '南明区', '3', '520100');
INSERT INTO thinkox_district VALUES ('520103', '云岩区', '3', '520100');
INSERT INTO thinkox_district VALUES ('520111', '花溪区', '3', '520100');
INSERT INTO thinkox_district VALUES ('520112', '乌当区', '3', '520100');
INSERT INTO thinkox_district VALUES ('520113', '白云区', '3', '520100');
INSERT INTO thinkox_district VALUES ('520114', '小河区', '3', '520100');
INSERT INTO thinkox_district VALUES ('520121', '开阳县', '3', '520100');
INSERT INTO thinkox_district VALUES ('520122', '息烽县', '3', '520100');
INSERT INTO thinkox_district VALUES ('520123', '修文县', '3', '520100');
INSERT INTO thinkox_district VALUES ('520181', '清镇市', '3', '520100');
INSERT INTO thinkox_district VALUES ('520201', '钟山区', '3', '520200');
INSERT INTO thinkox_district VALUES ('520203', '六枝特区', '3', '520200');
INSERT INTO thinkox_district VALUES ('520221', '水城县', '3', '520200');
INSERT INTO thinkox_district VALUES ('520222', '盘　县', '3', '520200');
INSERT INTO thinkox_district VALUES ('520301', '市辖区', '3', '520300');
INSERT INTO thinkox_district VALUES ('520302', '红花岗区', '3', '520300');
INSERT INTO thinkox_district VALUES ('520303', '汇川区', '3', '520300');
INSERT INTO thinkox_district VALUES ('520321', '遵义县', '3', '520300');
INSERT INTO thinkox_district VALUES ('520322', '桐梓县', '3', '520300');
INSERT INTO thinkox_district VALUES ('520323', '绥阳县', '3', '520300');
INSERT INTO thinkox_district VALUES ('520324', '正安县', '3', '520300');
INSERT INTO thinkox_district VALUES ('520325', '道真仡佬族苗族自治县', '3', '520300');
INSERT INTO thinkox_district VALUES ('520326', '务川仡佬族苗族自治县', '3', '520300');
INSERT INTO thinkox_district VALUES ('520327', '凤冈县', '3', '520300');
INSERT INTO thinkox_district VALUES ('520328', '湄潭县', '3', '520300');
INSERT INTO thinkox_district VALUES ('520329', '余庆县', '3', '520300');
INSERT INTO thinkox_district VALUES ('520330', '习水县', '3', '520300');
INSERT INTO thinkox_district VALUES ('520381', '赤水市', '3', '520300');
INSERT INTO thinkox_district VALUES ('520382', '仁怀市', '3', '520300');
INSERT INTO thinkox_district VALUES ('520401', '市辖区', '3', '520400');
INSERT INTO thinkox_district VALUES ('520402', '西秀区', '3', '520400');
INSERT INTO thinkox_district VALUES ('520421', '平坝县', '3', '520400');
INSERT INTO thinkox_district VALUES ('520422', '普定县', '3', '520400');
INSERT INTO thinkox_district VALUES ('520423', '镇宁布依族苗族自治县', '3', '520400');
INSERT INTO thinkox_district VALUES ('520424', '关岭布依族苗族自治县', '3', '520400');
INSERT INTO thinkox_district VALUES ('520425', '紫云苗族布依族自治县', '3', '520400');
INSERT INTO thinkox_district VALUES ('522201', '铜仁市', '3', '522200');
INSERT INTO thinkox_district VALUES ('522222', '江口县', '3', '522200');
INSERT INTO thinkox_district VALUES ('522223', '玉屏侗族自治县', '3', '522200');
INSERT INTO thinkox_district VALUES ('522224', '石阡县', '3', '522200');
INSERT INTO thinkox_district VALUES ('522225', '思南县', '3', '522200');
INSERT INTO thinkox_district VALUES ('522226', '印江土家族苗族自治县', '3', '522200');
INSERT INTO thinkox_district VALUES ('522227', '德江县', '3', '522200');
INSERT INTO thinkox_district VALUES ('522228', '沿河土家族自治县', '3', '522200');
INSERT INTO thinkox_district VALUES ('522229', '松桃苗族自治县', '3', '522200');
INSERT INTO thinkox_district VALUES ('522230', '万山特区', '3', '522200');
INSERT INTO thinkox_district VALUES ('522301', '兴义市', '3', '522300');
INSERT INTO thinkox_district VALUES ('522322', '兴仁县', '3', '522300');
INSERT INTO thinkox_district VALUES ('522323', '普安县', '3', '522300');
INSERT INTO thinkox_district VALUES ('522324', '晴隆县', '3', '522300');
INSERT INTO thinkox_district VALUES ('522325', '贞丰县', '3', '522300');
INSERT INTO thinkox_district VALUES ('522326', '望谟县', '3', '522300');
INSERT INTO thinkox_district VALUES ('522327', '册亨县', '3', '522300');
INSERT INTO thinkox_district VALUES ('522328', '安龙县', '3', '522300');
INSERT INTO thinkox_district VALUES ('522401', '毕节市', '3', '522400');
INSERT INTO thinkox_district VALUES ('522422', '大方县', '3', '522400');
INSERT INTO thinkox_district VALUES ('522423', '黔西县', '3', '522400');
INSERT INTO thinkox_district VALUES ('522424', '金沙县', '3', '522400');
INSERT INTO thinkox_district VALUES ('522425', '织金县', '3', '522400');
INSERT INTO thinkox_district VALUES ('522426', '纳雍县', '3', '522400');
INSERT INTO thinkox_district VALUES ('522427', '威宁彝族回族苗族自治县', '3', '522400');
INSERT INTO thinkox_district VALUES ('522428', '赫章县', '3', '522400');
INSERT INTO thinkox_district VALUES ('522601', '凯里市', '3', '522600');
INSERT INTO thinkox_district VALUES ('522622', '黄平县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522623', '施秉县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522624', '三穗县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522625', '镇远县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522626', '岑巩县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522627', '天柱县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522628', '锦屏县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522629', '剑河县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522630', '台江县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522631', '黎平县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522632', '榕江县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522633', '从江县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522634', '雷山县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522635', '麻江县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522636', '丹寨县', '3', '522600');
INSERT INTO thinkox_district VALUES ('522701', '都匀市', '3', '522700');
INSERT INTO thinkox_district VALUES ('522702', '福泉市', '3', '522700');
INSERT INTO thinkox_district VALUES ('522722', '荔波县', '3', '522700');
INSERT INTO thinkox_district VALUES ('522723', '贵定县', '3', '522700');
INSERT INTO thinkox_district VALUES ('522725', '瓮安县', '3', '522700');
INSERT INTO thinkox_district VALUES ('522726', '独山县', '3', '522700');
INSERT INTO thinkox_district VALUES ('522727', '平塘县', '3', '522700');
INSERT INTO thinkox_district VALUES ('522728', '罗甸县', '3', '522700');
INSERT INTO thinkox_district VALUES ('522729', '长顺县', '3', '522700');
INSERT INTO thinkox_district VALUES ('522730', '龙里县', '3', '522700');
INSERT INTO thinkox_district VALUES ('522731', '惠水县', '3', '522700');
INSERT INTO thinkox_district VALUES ('522732', '三都水族自治县', '3', '522700');
INSERT INTO thinkox_district VALUES ('530101', '市辖区', '3', '530100');
INSERT INTO thinkox_district VALUES ('530102', '五华区', '3', '530100');
INSERT INTO thinkox_district VALUES ('530103', '盘龙区', '3', '530100');
INSERT INTO thinkox_district VALUES ('530111', '官渡区', '3', '530100');
INSERT INTO thinkox_district VALUES ('530112', '西山区', '3', '530100');
INSERT INTO thinkox_district VALUES ('530113', '东川区', '3', '530100');
INSERT INTO thinkox_district VALUES ('530121', '呈贡县', '3', '530100');
INSERT INTO thinkox_district VALUES ('530122', '晋宁县', '3', '530100');
INSERT INTO thinkox_district VALUES ('530124', '富民县', '3', '530100');
INSERT INTO thinkox_district VALUES ('530125', '宜良县', '3', '530100');
INSERT INTO thinkox_district VALUES ('530126', '石林彝族自治县', '3', '530100');
INSERT INTO thinkox_district VALUES ('530127', '嵩明县', '3', '530100');
INSERT INTO thinkox_district VALUES ('530128', '禄劝彝族苗族自治县', '3', '530100');
INSERT INTO thinkox_district VALUES ('530129', '寻甸回族彝族自治县', '3', '530100');
INSERT INTO thinkox_district VALUES ('530181', '安宁市', '3', '530100');
INSERT INTO thinkox_district VALUES ('530301', '市辖区', '3', '530300');
INSERT INTO thinkox_district VALUES ('530302', '麒麟区', '3', '530300');
INSERT INTO thinkox_district VALUES ('530321', '马龙县', '3', '530300');
INSERT INTO thinkox_district VALUES ('530322', '陆良县', '3', '530300');
INSERT INTO thinkox_district VALUES ('530323', '师宗县', '3', '530300');
INSERT INTO thinkox_district VALUES ('530324', '罗平县', '3', '530300');
INSERT INTO thinkox_district VALUES ('530325', '富源县', '3', '530300');
INSERT INTO thinkox_district VALUES ('530326', '会泽县', '3', '530300');
INSERT INTO thinkox_district VALUES ('530328', '沾益县', '3', '530300');
INSERT INTO thinkox_district VALUES ('530381', '宣威市', '3', '530300');
INSERT INTO thinkox_district VALUES ('530401', '市辖区', '3', '530400');
INSERT INTO thinkox_district VALUES ('530402', '红塔区', '3', '530400');
INSERT INTO thinkox_district VALUES ('530421', '江川县', '3', '530400');
INSERT INTO thinkox_district VALUES ('530422', '澄江县', '3', '530400');
INSERT INTO thinkox_district VALUES ('530423', '通海县', '3', '530400');
INSERT INTO thinkox_district VALUES ('530424', '华宁县', '3', '530400');
INSERT INTO thinkox_district VALUES ('530425', '易门县', '3', '530400');
INSERT INTO thinkox_district VALUES ('530426', '峨山彝族自治县', '3', '530400');
INSERT INTO thinkox_district VALUES ('530427', '新平彝族傣族自治县', '3', '530400');
INSERT INTO thinkox_district VALUES ('530428', '元江哈尼族彝族傣族自治县', '3', '530400');
INSERT INTO thinkox_district VALUES ('530501', '市辖区', '3', '530500');
INSERT INTO thinkox_district VALUES ('530502', '隆阳区', '3', '530500');
INSERT INTO thinkox_district VALUES ('530521', '施甸县', '3', '530500');
INSERT INTO thinkox_district VALUES ('530522', '腾冲县', '3', '530500');
INSERT INTO thinkox_district VALUES ('530523', '龙陵县', '3', '530500');
INSERT INTO thinkox_district VALUES ('530524', '昌宁县', '3', '530500');
INSERT INTO thinkox_district VALUES ('530601', '市辖区', '3', '530600');
INSERT INTO thinkox_district VALUES ('530602', '昭阳区', '3', '530600');
INSERT INTO thinkox_district VALUES ('530621', '鲁甸县', '3', '530600');
INSERT INTO thinkox_district VALUES ('530622', '巧家县', '3', '530600');
INSERT INTO thinkox_district VALUES ('530623', '盐津县', '3', '530600');
INSERT INTO thinkox_district VALUES ('530624', '大关县', '3', '530600');
INSERT INTO thinkox_district VALUES ('530625', '永善县', '3', '530600');
INSERT INTO thinkox_district VALUES ('530626', '绥江县', '3', '530600');
INSERT INTO thinkox_district VALUES ('530627', '镇雄县', '3', '530600');
INSERT INTO thinkox_district VALUES ('530628', '彝良县', '3', '530600');
INSERT INTO thinkox_district VALUES ('530629', '威信县', '3', '530600');
INSERT INTO thinkox_district VALUES ('530630', '水富县', '3', '530600');
INSERT INTO thinkox_district VALUES ('530701', '市辖区', '3', '530700');
INSERT INTO thinkox_district VALUES ('530702', '古城区', '3', '530700');
INSERT INTO thinkox_district VALUES ('530721', '玉龙纳西族自治县', '3', '530700');
INSERT INTO thinkox_district VALUES ('530722', '永胜县', '3', '530700');
INSERT INTO thinkox_district VALUES ('530723', '华坪县', '3', '530700');
INSERT INTO thinkox_district VALUES ('530724', '宁蒗彝族自治县', '3', '530700');
INSERT INTO thinkox_district VALUES ('530801', '市辖区', '3', '530800');
INSERT INTO thinkox_district VALUES ('530802', '翠云区', '3', '530800');
INSERT INTO thinkox_district VALUES ('530821', '普洱哈尼族彝族自治县', '3', '530800');
INSERT INTO thinkox_district VALUES ('530822', '墨江哈尼族自治县', '3', '530800');
INSERT INTO thinkox_district VALUES ('530823', '景东彝族自治县', '3', '530800');
INSERT INTO thinkox_district VALUES ('530824', '景谷傣族彝族自治县', '3', '530800');
INSERT INTO thinkox_district VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '3', '530800');
INSERT INTO thinkox_district VALUES ('530826', '江城哈尼族彝族自治县', '3', '530800');
INSERT INTO thinkox_district VALUES ('530827', '孟连傣族拉祜族佤族自治县', '3', '530800');
INSERT INTO thinkox_district VALUES ('530828', '澜沧拉祜族自治县', '3', '530800');
INSERT INTO thinkox_district VALUES ('530829', '西盟佤族自治县', '3', '530800');
INSERT INTO thinkox_district VALUES ('530901', '市辖区', '3', '530900');
INSERT INTO thinkox_district VALUES ('530902', '临翔区', '3', '530900');
INSERT INTO thinkox_district VALUES ('530921', '凤庆县', '3', '530900');
INSERT INTO thinkox_district VALUES ('530922', '云　县', '3', '530900');
INSERT INTO thinkox_district VALUES ('530923', '永德县', '3', '530900');
INSERT INTO thinkox_district VALUES ('530924', '镇康县', '3', '530900');
INSERT INTO thinkox_district VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '3', '530900');
INSERT INTO thinkox_district VALUES ('530926', '耿马傣族佤族自治县', '3', '530900');
INSERT INTO thinkox_district VALUES ('530927', '沧源佤族自治县', '3', '530900');
INSERT INTO thinkox_district VALUES ('532301', '楚雄市', '3', '532300');
INSERT INTO thinkox_district VALUES ('532322', '双柏县', '3', '532300');
INSERT INTO thinkox_district VALUES ('532323', '牟定县', '3', '532300');
INSERT INTO thinkox_district VALUES ('532324', '南华县', '3', '532300');
INSERT INTO thinkox_district VALUES ('532325', '姚安县', '3', '532300');
INSERT INTO thinkox_district VALUES ('532326', '大姚县', '3', '532300');
INSERT INTO thinkox_district VALUES ('532327', '永仁县', '3', '532300');
INSERT INTO thinkox_district VALUES ('532328', '元谋县', '3', '532300');
INSERT INTO thinkox_district VALUES ('532329', '武定县', '3', '532300');
INSERT INTO thinkox_district VALUES ('532331', '禄丰县', '3', '532300');
INSERT INTO thinkox_district VALUES ('532501', '个旧市', '3', '532500');
INSERT INTO thinkox_district VALUES ('532502', '开远市', '3', '532500');
INSERT INTO thinkox_district VALUES ('532522', '蒙自县', '3', '532500');
INSERT INTO thinkox_district VALUES ('532523', '屏边苗族自治县', '3', '532500');
INSERT INTO thinkox_district VALUES ('532524', '建水县', '3', '532500');
INSERT INTO thinkox_district VALUES ('532525', '石屏县', '3', '532500');
INSERT INTO thinkox_district VALUES ('532526', '弥勒县', '3', '532500');
INSERT INTO thinkox_district VALUES ('532527', '泸西县', '3', '532500');
INSERT INTO thinkox_district VALUES ('532528', '元阳县', '3', '532500');
INSERT INTO thinkox_district VALUES ('532529', '红河县', '3', '532500');
INSERT INTO thinkox_district VALUES ('532530', '金平苗族瑶族傣族自治县', '3', '532500');
INSERT INTO thinkox_district VALUES ('532531', '绿春县', '3', '532500');
INSERT INTO thinkox_district VALUES ('532532', '河口瑶族自治县', '3', '532500');
INSERT INTO thinkox_district VALUES ('532621', '文山县', '3', '532600');
INSERT INTO thinkox_district VALUES ('532622', '砚山县', '3', '532600');
INSERT INTO thinkox_district VALUES ('532623', '西畴县', '3', '532600');
INSERT INTO thinkox_district VALUES ('532624', '麻栗坡县', '3', '532600');
INSERT INTO thinkox_district VALUES ('532625', '马关县', '3', '532600');
INSERT INTO thinkox_district VALUES ('532626', '丘北县', '3', '532600');
INSERT INTO thinkox_district VALUES ('532627', '广南县', '3', '532600');
INSERT INTO thinkox_district VALUES ('532628', '富宁县', '3', '532600');
INSERT INTO thinkox_district VALUES ('532801', '景洪市', '3', '532800');
INSERT INTO thinkox_district VALUES ('532822', '勐海县', '3', '532800');
INSERT INTO thinkox_district VALUES ('532823', '勐腊县', '3', '532800');
INSERT INTO thinkox_district VALUES ('532901', '大理市', '3', '532900');
INSERT INTO thinkox_district VALUES ('532922', '漾濞彝族自治县', '3', '532900');
INSERT INTO thinkox_district VALUES ('532923', '祥云县', '3', '532900');
INSERT INTO thinkox_district VALUES ('532924', '宾川县', '3', '532900');
INSERT INTO thinkox_district VALUES ('532925', '弥渡县', '3', '532900');
INSERT INTO thinkox_district VALUES ('532926', '南涧彝族自治县', '3', '532900');
INSERT INTO thinkox_district VALUES ('532927', '巍山彝族回族自治县', '3', '532900');
INSERT INTO thinkox_district VALUES ('532928', '永平县', '3', '532900');
INSERT INTO thinkox_district VALUES ('532929', '云龙县', '3', '532900');
INSERT INTO thinkox_district VALUES ('532930', '洱源县', '3', '532900');
INSERT INTO thinkox_district VALUES ('532931', '剑川县', '3', '532900');
INSERT INTO thinkox_district VALUES ('532932', '鹤庆县', '3', '532900');
INSERT INTO thinkox_district VALUES ('533102', '瑞丽市', '3', '533100');
INSERT INTO thinkox_district VALUES ('533103', '潞西市', '3', '533100');
INSERT INTO thinkox_district VALUES ('533122', '梁河县', '3', '533100');
INSERT INTO thinkox_district VALUES ('533123', '盈江县', '3', '533100');
INSERT INTO thinkox_district VALUES ('533124', '陇川县', '3', '533100');
INSERT INTO thinkox_district VALUES ('533321', '泸水县', '3', '533300');
INSERT INTO thinkox_district VALUES ('533323', '福贡县', '3', '533300');
INSERT INTO thinkox_district VALUES ('533324', '贡山独龙族怒族自治县', '3', '533300');
INSERT INTO thinkox_district VALUES ('533325', '兰坪白族普米族自治县', '3', '533300');
INSERT INTO thinkox_district VALUES ('533421', '香格里拉县', '3', '533400');
INSERT INTO thinkox_district VALUES ('533422', '德钦县', '3', '533400');
INSERT INTO thinkox_district VALUES ('533423', '维西傈僳族自治县', '3', '533400');
INSERT INTO thinkox_district VALUES ('540101', '市辖区', '3', '540100');
INSERT INTO thinkox_district VALUES ('540102', '城关区', '3', '540100');
INSERT INTO thinkox_district VALUES ('540121', '林周县', '3', '540100');
INSERT INTO thinkox_district VALUES ('540122', '当雄县', '3', '540100');
INSERT INTO thinkox_district VALUES ('540123', '尼木县', '3', '540100');
INSERT INTO thinkox_district VALUES ('540124', '曲水县', '3', '540100');
INSERT INTO thinkox_district VALUES ('540125', '堆龙德庆县', '3', '540100');
INSERT INTO thinkox_district VALUES ('540126', '达孜县', '3', '540100');
INSERT INTO thinkox_district VALUES ('540127', '墨竹工卡县', '3', '540100');
INSERT INTO thinkox_district VALUES ('542121', '昌都县', '3', '542100');
INSERT INTO thinkox_district VALUES ('542122', '江达县', '3', '542100');
INSERT INTO thinkox_district VALUES ('542123', '贡觉县', '3', '542100');
INSERT INTO thinkox_district VALUES ('542124', '类乌齐县', '3', '542100');
INSERT INTO thinkox_district VALUES ('542125', '丁青县', '3', '542100');
INSERT INTO thinkox_district VALUES ('542126', '察雅县', '3', '542100');
INSERT INTO thinkox_district VALUES ('542127', '八宿县', '3', '542100');
INSERT INTO thinkox_district VALUES ('542128', '左贡县', '3', '542100');
INSERT INTO thinkox_district VALUES ('542129', '芒康县', '3', '542100');
INSERT INTO thinkox_district VALUES ('542132', '洛隆县', '3', '542100');
INSERT INTO thinkox_district VALUES ('542133', '边坝县', '3', '542100');
INSERT INTO thinkox_district VALUES ('542221', '乃东县', '3', '542200');
INSERT INTO thinkox_district VALUES ('542222', '扎囊县', '3', '542200');
INSERT INTO thinkox_district VALUES ('542223', '贡嘎县', '3', '542200');
INSERT INTO thinkox_district VALUES ('542224', '桑日县', '3', '542200');
INSERT INTO thinkox_district VALUES ('542225', '琼结县', '3', '542200');
INSERT INTO thinkox_district VALUES ('542226', '曲松县', '3', '542200');
INSERT INTO thinkox_district VALUES ('542227', '措美县', '3', '542200');
INSERT INTO thinkox_district VALUES ('542228', '洛扎县', '3', '542200');
INSERT INTO thinkox_district VALUES ('542229', '加查县', '3', '542200');
INSERT INTO thinkox_district VALUES ('542231', '隆子县', '3', '542200');
INSERT INTO thinkox_district VALUES ('542232', '错那县', '3', '542200');
INSERT INTO thinkox_district VALUES ('542233', '浪卡子县', '3', '542200');
INSERT INTO thinkox_district VALUES ('542301', '日喀则市', '3', '542300');
INSERT INTO thinkox_district VALUES ('542322', '南木林县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542323', '江孜县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542324', '定日县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542325', '萨迦县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542326', '拉孜县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542327', '昂仁县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542328', '谢通门县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542329', '白朗县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542330', '仁布县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542331', '康马县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542332', '定结县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542333', '仲巴县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542334', '亚东县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542335', '吉隆县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542336', '聂拉木县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542337', '萨嘎县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542338', '岗巴县', '3', '542300');
INSERT INTO thinkox_district VALUES ('542421', '那曲县', '3', '542400');
INSERT INTO thinkox_district VALUES ('542422', '嘉黎县', '3', '542400');
INSERT INTO thinkox_district VALUES ('542423', '比如县', '3', '542400');
INSERT INTO thinkox_district VALUES ('542424', '聂荣县', '3', '542400');
INSERT INTO thinkox_district VALUES ('542425', '安多县', '3', '542400');
INSERT INTO thinkox_district VALUES ('542426', '申扎县', '3', '542400');
INSERT INTO thinkox_district VALUES ('542427', '索　县', '3', '542400');
INSERT INTO thinkox_district VALUES ('542428', '班戈县', '3', '542400');
INSERT INTO thinkox_district VALUES ('542429', '巴青县', '3', '542400');
INSERT INTO thinkox_district VALUES ('542430', '尼玛县', '3', '542400');
INSERT INTO thinkox_district VALUES ('542521', '普兰县', '3', '542500');
INSERT INTO thinkox_district VALUES ('542522', '札达县', '3', '542500');
INSERT INTO thinkox_district VALUES ('542523', '噶尔县', '3', '542500');
INSERT INTO thinkox_district VALUES ('542524', '日土县', '3', '542500');
INSERT INTO thinkox_district VALUES ('542525', '革吉县', '3', '542500');
INSERT INTO thinkox_district VALUES ('542526', '改则县', '3', '542500');
INSERT INTO thinkox_district VALUES ('542527', '措勤县', '3', '542500');
INSERT INTO thinkox_district VALUES ('542621', '林芝县', '3', '542600');
INSERT INTO thinkox_district VALUES ('542622', '工布江达县', '3', '542600');
INSERT INTO thinkox_district VALUES ('542623', '米林县', '3', '542600');
INSERT INTO thinkox_district VALUES ('542624', '墨脱县', '3', '542600');
INSERT INTO thinkox_district VALUES ('542625', '波密县', '3', '542600');
INSERT INTO thinkox_district VALUES ('542626', '察隅县', '3', '542600');
INSERT INTO thinkox_district VALUES ('542627', '朗　县', '3', '542600');
INSERT INTO thinkox_district VALUES ('610101', '市辖区', '3', '610100');
INSERT INTO thinkox_district VALUES ('610102', '新城区', '3', '610100');
INSERT INTO thinkox_district VALUES ('610103', '碑林区', '3', '610100');
INSERT INTO thinkox_district VALUES ('610104', '莲湖区', '3', '610100');
INSERT INTO thinkox_district VALUES ('610111', '灞桥区', '3', '610100');
INSERT INTO thinkox_district VALUES ('610112', '未央区', '3', '610100');
INSERT INTO thinkox_district VALUES ('610113', '雁塔区', '3', '610100');
INSERT INTO thinkox_district VALUES ('610114', '阎良区', '3', '610100');
INSERT INTO thinkox_district VALUES ('610115', '临潼区', '3', '610100');
INSERT INTO thinkox_district VALUES ('610116', '长安区', '3', '610100');
INSERT INTO thinkox_district VALUES ('610122', '蓝田县', '3', '610100');
INSERT INTO thinkox_district VALUES ('610124', '周至县', '3', '610100');
INSERT INTO thinkox_district VALUES ('610125', '户　县', '3', '610100');
INSERT INTO thinkox_district VALUES ('610126', '高陵县', '3', '610100');
INSERT INTO thinkox_district VALUES ('610201', '市辖区', '3', '610200');
INSERT INTO thinkox_district VALUES ('610202', '王益区', '3', '610200');
INSERT INTO thinkox_district VALUES ('610203', '印台区', '3', '610200');
INSERT INTO thinkox_district VALUES ('610204', '耀州区', '3', '610200');
INSERT INTO thinkox_district VALUES ('610222', '宜君县', '3', '610200');
INSERT INTO thinkox_district VALUES ('610301', '市辖区', '3', '610300');
INSERT INTO thinkox_district VALUES ('610302', '渭滨区', '3', '610300');
INSERT INTO thinkox_district VALUES ('610303', '金台区', '3', '610300');
INSERT INTO thinkox_district VALUES ('610304', '陈仓区', '3', '610300');
INSERT INTO thinkox_district VALUES ('610322', '凤翔县', '3', '610300');
INSERT INTO thinkox_district VALUES ('610323', '岐山县', '3', '610300');
INSERT INTO thinkox_district VALUES ('610324', '扶风县', '3', '610300');
INSERT INTO thinkox_district VALUES ('610326', '眉　县', '3', '610300');
INSERT INTO thinkox_district VALUES ('610327', '陇　县', '3', '610300');
INSERT INTO thinkox_district VALUES ('610328', '千阳县', '3', '610300');
INSERT INTO thinkox_district VALUES ('610329', '麟游县', '3', '610300');
INSERT INTO thinkox_district VALUES ('610330', '凤　县', '3', '610300');
INSERT INTO thinkox_district VALUES ('610331', '太白县', '3', '610300');
INSERT INTO thinkox_district VALUES ('610401', '市辖区', '3', '610400');
INSERT INTO thinkox_district VALUES ('610402', '秦都区', '3', '610400');
INSERT INTO thinkox_district VALUES ('610403', '杨凌区', '3', '610400');
INSERT INTO thinkox_district VALUES ('610404', '渭城区', '3', '610400');
INSERT INTO thinkox_district VALUES ('610422', '三原县', '3', '610400');
INSERT INTO thinkox_district VALUES ('610423', '泾阳县', '3', '610400');
INSERT INTO thinkox_district VALUES ('610424', '乾　县', '3', '610400');
INSERT INTO thinkox_district VALUES ('610425', '礼泉县', '3', '610400');
INSERT INTO thinkox_district VALUES ('610426', '永寿县', '3', '610400');
INSERT INTO thinkox_district VALUES ('610427', '彬　县', '3', '610400');
INSERT INTO thinkox_district VALUES ('610428', '长武县', '3', '610400');
INSERT INTO thinkox_district VALUES ('610429', '旬邑县', '3', '610400');
INSERT INTO thinkox_district VALUES ('610430', '淳化县', '3', '610400');
INSERT INTO thinkox_district VALUES ('610431', '武功县', '3', '610400');
INSERT INTO thinkox_district VALUES ('610481', '兴平市', '3', '610400');
INSERT INTO thinkox_district VALUES ('610501', '市辖区', '3', '610500');
INSERT INTO thinkox_district VALUES ('610502', '临渭区', '3', '610500');
INSERT INTO thinkox_district VALUES ('610521', '华　县', '3', '610500');
INSERT INTO thinkox_district VALUES ('610522', '潼关县', '3', '610500');
INSERT INTO thinkox_district VALUES ('610523', '大荔县', '3', '610500');
INSERT INTO thinkox_district VALUES ('610524', '合阳县', '3', '610500');
INSERT INTO thinkox_district VALUES ('610525', '澄城县', '3', '610500');
INSERT INTO thinkox_district VALUES ('610526', '蒲城县', '3', '610500');
INSERT INTO thinkox_district VALUES ('610527', '白水县', '3', '610500');
INSERT INTO thinkox_district VALUES ('610528', '富平县', '3', '610500');
INSERT INTO thinkox_district VALUES ('610581', '韩城市', '3', '610500');
INSERT INTO thinkox_district VALUES ('610582', '华阴市', '3', '610500');
INSERT INTO thinkox_district VALUES ('610601', '市辖区', '3', '610600');
INSERT INTO thinkox_district VALUES ('610602', '宝塔区', '3', '610600');
INSERT INTO thinkox_district VALUES ('610621', '延长县', '3', '610600');
INSERT INTO thinkox_district VALUES ('610622', '延川县', '3', '610600');
INSERT INTO thinkox_district VALUES ('610623', '子长县', '3', '610600');
INSERT INTO thinkox_district VALUES ('610624', '安塞县', '3', '610600');
INSERT INTO thinkox_district VALUES ('610625', '志丹县', '3', '610600');
INSERT INTO thinkox_district VALUES ('610626', '吴旗县', '3', '610600');
INSERT INTO thinkox_district VALUES ('610627', '甘泉县', '3', '610600');
INSERT INTO thinkox_district VALUES ('610628', '富　县', '3', '610600');
INSERT INTO thinkox_district VALUES ('610629', '洛川县', '3', '610600');
INSERT INTO thinkox_district VALUES ('610630', '宜川县', '3', '610600');
INSERT INTO thinkox_district VALUES ('610631', '黄龙县', '3', '610600');
INSERT INTO thinkox_district VALUES ('610632', '黄陵县', '3', '610600');
INSERT INTO thinkox_district VALUES ('610701', '市辖区', '3', '610700');
INSERT INTO thinkox_district VALUES ('610702', '汉台区', '3', '610700');
INSERT INTO thinkox_district VALUES ('610721', '南郑县', '3', '610700');
INSERT INTO thinkox_district VALUES ('610722', '城固县', '3', '610700');
INSERT INTO thinkox_district VALUES ('610723', '洋　县', '3', '610700');
INSERT INTO thinkox_district VALUES ('610724', '西乡县', '3', '610700');
INSERT INTO thinkox_district VALUES ('610725', '勉　县', '3', '610700');
INSERT INTO thinkox_district VALUES ('610726', '宁强县', '3', '610700');
INSERT INTO thinkox_district VALUES ('610727', '略阳县', '3', '610700');
INSERT INTO thinkox_district VALUES ('610728', '镇巴县', '3', '610700');
INSERT INTO thinkox_district VALUES ('610729', '留坝县', '3', '610700');
INSERT INTO thinkox_district VALUES ('610730', '佛坪县', '3', '610700');
INSERT INTO thinkox_district VALUES ('610801', '市辖区', '3', '610800');
INSERT INTO thinkox_district VALUES ('610802', '榆阳区', '3', '610800');
INSERT INTO thinkox_district VALUES ('610821', '神木县', '3', '610800');
INSERT INTO thinkox_district VALUES ('610822', '府谷县', '3', '610800');
INSERT INTO thinkox_district VALUES ('610823', '横山县', '3', '610800');
INSERT INTO thinkox_district VALUES ('610824', '靖边县', '3', '610800');
INSERT INTO thinkox_district VALUES ('610825', '定边县', '3', '610800');
INSERT INTO thinkox_district VALUES ('610826', '绥德县', '3', '610800');
INSERT INTO thinkox_district VALUES ('610827', '米脂县', '3', '610800');
INSERT INTO thinkox_district VALUES ('610828', '佳　县', '3', '610800');
INSERT INTO thinkox_district VALUES ('610829', '吴堡县', '3', '610800');
INSERT INTO thinkox_district VALUES ('610830', '清涧县', '3', '610800');
INSERT INTO thinkox_district VALUES ('610831', '子洲县', '3', '610800');
INSERT INTO thinkox_district VALUES ('610901', '市辖区', '3', '610900');
INSERT INTO thinkox_district VALUES ('610902', '汉滨区', '3', '610900');
INSERT INTO thinkox_district VALUES ('610921', '汉阴县', '3', '610900');
INSERT INTO thinkox_district VALUES ('610922', '石泉县', '3', '610900');
INSERT INTO thinkox_district VALUES ('610923', '宁陕县', '3', '610900');
INSERT INTO thinkox_district VALUES ('610924', '紫阳县', '3', '610900');
INSERT INTO thinkox_district VALUES ('610925', '岚皋县', '3', '610900');
INSERT INTO thinkox_district VALUES ('610926', '平利县', '3', '610900');
INSERT INTO thinkox_district VALUES ('610927', '镇坪县', '3', '610900');
INSERT INTO thinkox_district VALUES ('610928', '旬阳县', '3', '610900');
INSERT INTO thinkox_district VALUES ('610929', '白河县', '3', '610900');
INSERT INTO thinkox_district VALUES ('611001', '市辖区', '3', '611000');
INSERT INTO thinkox_district VALUES ('611002', '商州区', '3', '611000');
INSERT INTO thinkox_district VALUES ('611021', '洛南县', '3', '611000');
INSERT INTO thinkox_district VALUES ('611022', '丹凤县', '3', '611000');
INSERT INTO thinkox_district VALUES ('611023', '商南县', '3', '611000');
INSERT INTO thinkox_district VALUES ('611024', '山阳县', '3', '611000');
INSERT INTO thinkox_district VALUES ('611025', '镇安县', '3', '611000');
INSERT INTO thinkox_district VALUES ('611026', '柞水县', '3', '611000');
INSERT INTO thinkox_district VALUES ('620101', '市辖区', '3', '620100');
INSERT INTO thinkox_district VALUES ('620102', '城关区', '3', '620100');
INSERT INTO thinkox_district VALUES ('620103', '七里河区', '3', '620100');
INSERT INTO thinkox_district VALUES ('620104', '西固区', '3', '620100');
INSERT INTO thinkox_district VALUES ('620105', '安宁区', '3', '620100');
INSERT INTO thinkox_district VALUES ('620111', '红古区', '3', '620100');
INSERT INTO thinkox_district VALUES ('620121', '永登县', '3', '620100');
INSERT INTO thinkox_district VALUES ('620122', '皋兰县', '3', '620100');
INSERT INTO thinkox_district VALUES ('620123', '榆中县', '3', '620100');
INSERT INTO thinkox_district VALUES ('620201', '市辖区', '3', '620200');
INSERT INTO thinkox_district VALUES ('620301', '市辖区', '3', '620300');
INSERT INTO thinkox_district VALUES ('620302', '金川区', '3', '620300');
INSERT INTO thinkox_district VALUES ('620321', '永昌县', '3', '620300');
INSERT INTO thinkox_district VALUES ('620401', '市辖区', '3', '620400');
INSERT INTO thinkox_district VALUES ('620402', '白银区', '3', '620400');
INSERT INTO thinkox_district VALUES ('620403', '平川区', '3', '620400');
INSERT INTO thinkox_district VALUES ('620421', '靖远县', '3', '620400');
INSERT INTO thinkox_district VALUES ('620422', '会宁县', '3', '620400');
INSERT INTO thinkox_district VALUES ('620423', '景泰县', '3', '620400');
INSERT INTO thinkox_district VALUES ('620501', '市辖区', '3', '620500');
INSERT INTO thinkox_district VALUES ('620502', '秦城区', '3', '620500');
INSERT INTO thinkox_district VALUES ('620503', '北道区', '3', '620500');
INSERT INTO thinkox_district VALUES ('620521', '清水县', '3', '620500');
INSERT INTO thinkox_district VALUES ('620522', '秦安县', '3', '620500');
INSERT INTO thinkox_district VALUES ('620523', '甘谷县', '3', '620500');
INSERT INTO thinkox_district VALUES ('620524', '武山县', '3', '620500');
INSERT INTO thinkox_district VALUES ('620525', '张家川回族自治县', '3', '620500');
INSERT INTO thinkox_district VALUES ('620601', '市辖区', '3', '620600');
INSERT INTO thinkox_district VALUES ('620602', '凉州区', '3', '620600');
INSERT INTO thinkox_district VALUES ('620621', '民勤县', '3', '620600');
INSERT INTO thinkox_district VALUES ('620622', '古浪县', '3', '620600');
INSERT INTO thinkox_district VALUES ('620623', '天祝藏族自治县', '3', '620600');
INSERT INTO thinkox_district VALUES ('620701', '市辖区', '3', '620700');
INSERT INTO thinkox_district VALUES ('620702', '甘州区', '3', '620700');
INSERT INTO thinkox_district VALUES ('620721', '肃南裕固族自治县', '3', '620700');
INSERT INTO thinkox_district VALUES ('620722', '民乐县', '3', '620700');
INSERT INTO thinkox_district VALUES ('620723', '临泽县', '3', '620700');
INSERT INTO thinkox_district VALUES ('620724', '高台县', '3', '620700');
INSERT INTO thinkox_district VALUES ('620725', '山丹县', '3', '620700');
INSERT INTO thinkox_district VALUES ('620801', '市辖区', '3', '620800');
INSERT INTO thinkox_district VALUES ('620802', '崆峒区', '3', '620800');
INSERT INTO thinkox_district VALUES ('620821', '泾川县', '3', '620800');
INSERT INTO thinkox_district VALUES ('620822', '灵台县', '3', '620800');
INSERT INTO thinkox_district VALUES ('620823', '崇信县', '3', '620800');
INSERT INTO thinkox_district VALUES ('620824', '华亭县', '3', '620800');
INSERT INTO thinkox_district VALUES ('620825', '庄浪县', '3', '620800');
INSERT INTO thinkox_district VALUES ('620826', '静宁县', '3', '620800');
INSERT INTO thinkox_district VALUES ('620901', '市辖区', '3', '620900');
INSERT INTO thinkox_district VALUES ('620902', '肃州区', '3', '620900');
INSERT INTO thinkox_district VALUES ('620921', '金塔县', '3', '620900');
INSERT INTO thinkox_district VALUES ('620922', '安西县', '3', '620900');
INSERT INTO thinkox_district VALUES ('620923', '肃北蒙古族自治县', '3', '620900');
INSERT INTO thinkox_district VALUES ('620924', '阿克塞哈萨克族自治县', '3', '620900');
INSERT INTO thinkox_district VALUES ('620981', '玉门市', '3', '620900');
INSERT INTO thinkox_district VALUES ('620982', '敦煌市', '3', '620900');
INSERT INTO thinkox_district VALUES ('621001', '市辖区', '3', '621000');
INSERT INTO thinkox_district VALUES ('621002', '西峰区', '3', '621000');
INSERT INTO thinkox_district VALUES ('621021', '庆城县', '3', '621000');
INSERT INTO thinkox_district VALUES ('621022', '环　县', '3', '621000');
INSERT INTO thinkox_district VALUES ('621023', '华池县', '3', '621000');
INSERT INTO thinkox_district VALUES ('621024', '合水县', '3', '621000');
INSERT INTO thinkox_district VALUES ('621025', '正宁县', '3', '621000');
INSERT INTO thinkox_district VALUES ('621026', '宁　县', '3', '621000');
INSERT INTO thinkox_district VALUES ('621027', '镇原县', '3', '621000');
INSERT INTO thinkox_district VALUES ('621101', '市辖区', '3', '621100');
INSERT INTO thinkox_district VALUES ('621102', '安定区', '3', '621100');
INSERT INTO thinkox_district VALUES ('621121', '通渭县', '3', '621100');
INSERT INTO thinkox_district VALUES ('621122', '陇西县', '3', '621100');
INSERT INTO thinkox_district VALUES ('621123', '渭源县', '3', '621100');
INSERT INTO thinkox_district VALUES ('621124', '临洮县', '3', '621100');
INSERT INTO thinkox_district VALUES ('621125', '漳　县', '3', '621100');
INSERT INTO thinkox_district VALUES ('621126', '岷　县', '3', '621100');
INSERT INTO thinkox_district VALUES ('621201', '市辖区', '3', '621200');
INSERT INTO thinkox_district VALUES ('621202', '武都区', '3', '621200');
INSERT INTO thinkox_district VALUES ('621221', '成　县', '3', '621200');
INSERT INTO thinkox_district VALUES ('621222', '文　县', '3', '621200');
INSERT INTO thinkox_district VALUES ('621223', '宕昌县', '3', '621200');
INSERT INTO thinkox_district VALUES ('621224', '康　县', '3', '621200');
INSERT INTO thinkox_district VALUES ('621225', '西和县', '3', '621200');
INSERT INTO thinkox_district VALUES ('621226', '礼　县', '3', '621200');
INSERT INTO thinkox_district VALUES ('621227', '徽　县', '3', '621200');
INSERT INTO thinkox_district VALUES ('621228', '两当县', '3', '621200');
INSERT INTO thinkox_district VALUES ('622901', '临夏市', '3', '622900');
INSERT INTO thinkox_district VALUES ('622921', '临夏县', '3', '622900');
INSERT INTO thinkox_district VALUES ('622922', '康乐县', '3', '622900');
INSERT INTO thinkox_district VALUES ('622923', '永靖县', '3', '622900');
INSERT INTO thinkox_district VALUES ('622924', '广河县', '3', '622900');
INSERT INTO thinkox_district VALUES ('622925', '和政县', '3', '622900');
INSERT INTO thinkox_district VALUES ('622926', '东乡族自治县', '3', '622900');
INSERT INTO thinkox_district VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '3', '622900');
INSERT INTO thinkox_district VALUES ('623001', '合作市', '3', '623000');
INSERT INTO thinkox_district VALUES ('623021', '临潭县', '3', '623000');
INSERT INTO thinkox_district VALUES ('623022', '卓尼县', '3', '623000');
INSERT INTO thinkox_district VALUES ('623023', '舟曲县', '3', '623000');
INSERT INTO thinkox_district VALUES ('623024', '迭部县', '3', '623000');
INSERT INTO thinkox_district VALUES ('623025', '玛曲县', '3', '623000');
INSERT INTO thinkox_district VALUES ('623026', '碌曲县', '3', '623000');
INSERT INTO thinkox_district VALUES ('623027', '夏河县', '3', '623000');
INSERT INTO thinkox_district VALUES ('630101', '市辖区', '3', '630100');
INSERT INTO thinkox_district VALUES ('630102', '城东区', '3', '630100');
INSERT INTO thinkox_district VALUES ('630103', '城中区', '3', '630100');
INSERT INTO thinkox_district VALUES ('630104', '城西区', '3', '630100');
INSERT INTO thinkox_district VALUES ('630105', '城北区', '3', '630100');
INSERT INTO thinkox_district VALUES ('630121', '大通回族土族自治县', '3', '630100');
INSERT INTO thinkox_district VALUES ('630122', '湟中县', '3', '630100');
INSERT INTO thinkox_district VALUES ('630123', '湟源县', '3', '630100');
INSERT INTO thinkox_district VALUES ('632121', '平安县', '3', '632100');
INSERT INTO thinkox_district VALUES ('632122', '民和回族土族自治县', '3', '632100');
INSERT INTO thinkox_district VALUES ('632123', '乐都县', '3', '632100');
INSERT INTO thinkox_district VALUES ('632126', '互助土族自治县', '3', '632100');
INSERT INTO thinkox_district VALUES ('632127', '化隆回族自治县', '3', '632100');
INSERT INTO thinkox_district VALUES ('632128', '循化撒拉族自治县', '3', '632100');
INSERT INTO thinkox_district VALUES ('632221', '门源回族自治县', '3', '632200');
INSERT INTO thinkox_district VALUES ('632222', '祁连县', '3', '632200');
INSERT INTO thinkox_district VALUES ('632223', '海晏县', '3', '632200');
INSERT INTO thinkox_district VALUES ('632224', '刚察县', '3', '632200');
INSERT INTO thinkox_district VALUES ('632321', '同仁县', '3', '632300');
INSERT INTO thinkox_district VALUES ('632322', '尖扎县', '3', '632300');
INSERT INTO thinkox_district VALUES ('632323', '泽库县', '3', '632300');
INSERT INTO thinkox_district VALUES ('632324', '河南蒙古族自治县', '3', '632300');
INSERT INTO thinkox_district VALUES ('632521', '共和县', '3', '632500');
INSERT INTO thinkox_district VALUES ('632522', '同德县', '3', '632500');
INSERT INTO thinkox_district VALUES ('632523', '贵德县', '3', '632500');
INSERT INTO thinkox_district VALUES ('632524', '兴海县', '3', '632500');
INSERT INTO thinkox_district VALUES ('632525', '贵南县', '3', '632500');
INSERT INTO thinkox_district VALUES ('632621', '玛沁县', '3', '632600');
INSERT INTO thinkox_district VALUES ('632622', '班玛县', '3', '632600');
INSERT INTO thinkox_district VALUES ('632623', '甘德县', '3', '632600');
INSERT INTO thinkox_district VALUES ('632624', '达日县', '3', '632600');
INSERT INTO thinkox_district VALUES ('632625', '久治县', '3', '632600');
INSERT INTO thinkox_district VALUES ('632626', '玛多县', '3', '632600');
INSERT INTO thinkox_district VALUES ('632721', '玉树县', '3', '632700');
INSERT INTO thinkox_district VALUES ('632722', '杂多县', '3', '632700');
INSERT INTO thinkox_district VALUES ('632723', '称多县', '3', '632700');
INSERT INTO thinkox_district VALUES ('632724', '治多县', '3', '632700');
INSERT INTO thinkox_district VALUES ('632725', '囊谦县', '3', '632700');
INSERT INTO thinkox_district VALUES ('632726', '曲麻莱县', '3', '632700');
INSERT INTO thinkox_district VALUES ('632801', '格尔木市', '3', '632800');
INSERT INTO thinkox_district VALUES ('632802', '德令哈市', '3', '632800');
INSERT INTO thinkox_district VALUES ('632821', '乌兰县', '3', '632800');
INSERT INTO thinkox_district VALUES ('632822', '都兰县', '3', '632800');
INSERT INTO thinkox_district VALUES ('632823', '天峻县', '3', '632800');
INSERT INTO thinkox_district VALUES ('640101', '市辖区', '3', '640100');
INSERT INTO thinkox_district VALUES ('640104', '兴庆区', '3', '640100');
INSERT INTO thinkox_district VALUES ('640105', '西夏区', '3', '640100');
INSERT INTO thinkox_district VALUES ('640106', '金凤区', '3', '640100');
INSERT INTO thinkox_district VALUES ('640121', '永宁县', '3', '640100');
INSERT INTO thinkox_district VALUES ('640122', '贺兰县', '3', '640100');
INSERT INTO thinkox_district VALUES ('640181', '灵武市', '3', '640100');
INSERT INTO thinkox_district VALUES ('640201', '市辖区', '3', '640200');
INSERT INTO thinkox_district VALUES ('640202', '大武口区', '3', '640200');
INSERT INTO thinkox_district VALUES ('640205', '惠农区', '3', '640200');
INSERT INTO thinkox_district VALUES ('640221', '平罗县', '3', '640200');
INSERT INTO thinkox_district VALUES ('640301', '市辖区', '3', '640300');
INSERT INTO thinkox_district VALUES ('640302', '利通区', '3', '640300');
INSERT INTO thinkox_district VALUES ('640323', '盐池县', '3', '640300');
INSERT INTO thinkox_district VALUES ('640324', '同心县', '3', '640300');
INSERT INTO thinkox_district VALUES ('640381', '青铜峡市', '3', '640300');
INSERT INTO thinkox_district VALUES ('640401', '市辖区', '3', '640400');
INSERT INTO thinkox_district VALUES ('640402', '原州区', '3', '640400');
INSERT INTO thinkox_district VALUES ('640422', '西吉县', '3', '640400');
INSERT INTO thinkox_district VALUES ('640423', '隆德县', '3', '640400');
INSERT INTO thinkox_district VALUES ('640424', '泾源县', '3', '640400');
INSERT INTO thinkox_district VALUES ('640425', '彭阳县', '3', '640400');
INSERT INTO thinkox_district VALUES ('640501', '市辖区', '3', '640500');
INSERT INTO thinkox_district VALUES ('640502', '沙坡头区', '3', '640500');
INSERT INTO thinkox_district VALUES ('640521', '中宁县', '3', '640500');
INSERT INTO thinkox_district VALUES ('640522', '海原县', '3', '640500');
INSERT INTO thinkox_district VALUES ('650101', '市辖区', '3', '650100');
INSERT INTO thinkox_district VALUES ('650102', '天山区', '3', '650100');
INSERT INTO thinkox_district VALUES ('650103', '沙依巴克区', '3', '650100');
INSERT INTO thinkox_district VALUES ('650104', '新市区', '3', '650100');
INSERT INTO thinkox_district VALUES ('650105', '水磨沟区', '3', '650100');
INSERT INTO thinkox_district VALUES ('650106', '头屯河区', '3', '650100');
INSERT INTO thinkox_district VALUES ('650107', '达坂城区', '3', '650100');
INSERT INTO thinkox_district VALUES ('650108', '东山区', '3', '650100');
INSERT INTO thinkox_district VALUES ('650121', '乌鲁木齐县', '3', '650100');
INSERT INTO thinkox_district VALUES ('650201', '市辖区', '3', '650200');
INSERT INTO thinkox_district VALUES ('650202', '独山子区', '3', '650200');
INSERT INTO thinkox_district VALUES ('650203', '克拉玛依区', '3', '650200');
INSERT INTO thinkox_district VALUES ('650204', '白碱滩区', '3', '650200');
INSERT INTO thinkox_district VALUES ('650205', '乌尔禾区', '3', '650200');
INSERT INTO thinkox_district VALUES ('652101', '吐鲁番市', '3', '652100');
INSERT INTO thinkox_district VALUES ('652122', '鄯善县', '3', '652100');
INSERT INTO thinkox_district VALUES ('652123', '托克逊县', '3', '652100');
INSERT INTO thinkox_district VALUES ('652201', '哈密市', '3', '652200');
INSERT INTO thinkox_district VALUES ('652222', '巴里坤哈萨克自治县', '3', '652200');
INSERT INTO thinkox_district VALUES ('652223', '伊吾县', '3', '652200');
INSERT INTO thinkox_district VALUES ('652301', '昌吉市', '3', '652300');
INSERT INTO thinkox_district VALUES ('652302', '阜康市', '3', '652300');
INSERT INTO thinkox_district VALUES ('652303', '米泉市', '3', '652300');
INSERT INTO thinkox_district VALUES ('652323', '呼图壁县', '3', '652300');
INSERT INTO thinkox_district VALUES ('652324', '玛纳斯县', '3', '652300');
INSERT INTO thinkox_district VALUES ('652325', '奇台县', '3', '652300');
INSERT INTO thinkox_district VALUES ('652327', '吉木萨尔县', '3', '652300');
INSERT INTO thinkox_district VALUES ('652328', '木垒哈萨克自治县', '3', '652300');
INSERT INTO thinkox_district VALUES ('652701', '博乐市', '3', '652700');
INSERT INTO thinkox_district VALUES ('652722', '精河县', '3', '652700');
INSERT INTO thinkox_district VALUES ('652723', '温泉县', '3', '652700');
INSERT INTO thinkox_district VALUES ('652801', '库尔勒市', '3', '652800');
INSERT INTO thinkox_district VALUES ('652822', '轮台县', '3', '652800');
INSERT INTO thinkox_district VALUES ('652823', '尉犁县', '3', '652800');
INSERT INTO thinkox_district VALUES ('652824', '若羌县', '3', '652800');
INSERT INTO thinkox_district VALUES ('652825', '且末县', '3', '652800');
INSERT INTO thinkox_district VALUES ('652826', '焉耆回族自治县', '3', '652800');
INSERT INTO thinkox_district VALUES ('652827', '和静县', '3', '652800');
INSERT INTO thinkox_district VALUES ('652828', '和硕县', '3', '652800');
INSERT INTO thinkox_district VALUES ('652829', '博湖县', '3', '652800');
INSERT INTO thinkox_district VALUES ('652901', '阿克苏市', '3', '652900');
INSERT INTO thinkox_district VALUES ('652922', '温宿县', '3', '652900');
INSERT INTO thinkox_district VALUES ('652923', '库车县', '3', '652900');
INSERT INTO thinkox_district VALUES ('652924', '沙雅县', '3', '652900');
INSERT INTO thinkox_district VALUES ('652925', '新和县', '3', '652900');
INSERT INTO thinkox_district VALUES ('652926', '拜城县', '3', '652900');
INSERT INTO thinkox_district VALUES ('652927', '乌什县', '3', '652900');
INSERT INTO thinkox_district VALUES ('652928', '阿瓦提县', '3', '652900');
INSERT INTO thinkox_district VALUES ('652929', '柯坪县', '3', '652900');
INSERT INTO thinkox_district VALUES ('653001', '阿图什市', '3', '653000');
INSERT INTO thinkox_district VALUES ('653022', '阿克陶县', '3', '653000');
INSERT INTO thinkox_district VALUES ('653023', '阿合奇县', '3', '653000');
INSERT INTO thinkox_district VALUES ('653024', '乌恰县', '3', '653000');
INSERT INTO thinkox_district VALUES ('653101', '喀什市', '3', '653100');
INSERT INTO thinkox_district VALUES ('653121', '疏附县', '3', '653100');
INSERT INTO thinkox_district VALUES ('653122', '疏勒县', '3', '653100');
INSERT INTO thinkox_district VALUES ('653123', '英吉沙县', '3', '653100');
INSERT INTO thinkox_district VALUES ('653124', '泽普县', '3', '653100');
INSERT INTO thinkox_district VALUES ('653125', '莎车县', '3', '653100');
INSERT INTO thinkox_district VALUES ('653126', '叶城县', '3', '653100');
INSERT INTO thinkox_district VALUES ('653127', '麦盖提县', '3', '653100');
INSERT INTO thinkox_district VALUES ('653128', '岳普湖县', '3', '653100');
INSERT INTO thinkox_district VALUES ('653129', '伽师县', '3', '653100');
INSERT INTO thinkox_district VALUES ('653130', '巴楚县', '3', '653100');
INSERT INTO thinkox_district VALUES ('653131', '塔什库尔干塔吉克自治县', '3', '653100');
INSERT INTO thinkox_district VALUES ('653201', '和田市', '3', '653200');
INSERT INTO thinkox_district VALUES ('653221', '和田县', '3', '653200');
INSERT INTO thinkox_district VALUES ('653222', '墨玉县', '3', '653200');
INSERT INTO thinkox_district VALUES ('653223', '皮山县', '3', '653200');
INSERT INTO thinkox_district VALUES ('653224', '洛浦县', '3', '653200');
INSERT INTO thinkox_district VALUES ('653225', '策勒县', '3', '653200');
INSERT INTO thinkox_district VALUES ('653226', '于田县', '3', '653200');
INSERT INTO thinkox_district VALUES ('653227', '民丰县', '3', '653200');
INSERT INTO thinkox_district VALUES ('654002', '伊宁市', '3', '654000');
INSERT INTO thinkox_district VALUES ('654003', '奎屯市', '3', '654000');
INSERT INTO thinkox_district VALUES ('654021', '伊宁县', '3', '654000');
INSERT INTO thinkox_district VALUES ('654022', '察布查尔锡伯自治县', '3', '654000');
INSERT INTO thinkox_district VALUES ('654023', '霍城县', '3', '654000');
INSERT INTO thinkox_district VALUES ('654024', '巩留县', '3', '654000');
INSERT INTO thinkox_district VALUES ('654025', '新源县', '3', '654000');
INSERT INTO thinkox_district VALUES ('654026', '昭苏县', '3', '654000');
INSERT INTO thinkox_district VALUES ('654027', '特克斯县', '3', '654000');
INSERT INTO thinkox_district VALUES ('654028', '尼勒克县', '3', '654000');
INSERT INTO thinkox_district VALUES ('654201', '塔城市', '3', '654200');
INSERT INTO thinkox_district VALUES ('654202', '乌苏市', '3', '654200');
INSERT INTO thinkox_district VALUES ('654221', '额敏县', '3', '654200');
INSERT INTO thinkox_district VALUES ('654223', '沙湾县', '3', '654200');
INSERT INTO thinkox_district VALUES ('654224', '托里县', '3', '654200');
INSERT INTO thinkox_district VALUES ('654225', '裕民县', '3', '654200');
INSERT INTO thinkox_district VALUES ('654226', '和布克赛尔蒙古自治县', '3', '654200');
INSERT INTO thinkox_district VALUES ('654301', '阿勒泰市', '3', '654300');
INSERT INTO thinkox_district VALUES ('654321', '布尔津县', '3', '654300');
INSERT INTO thinkox_district VALUES ('654322', '富蕴县', '3', '654300');
INSERT INTO thinkox_district VALUES ('654323', '福海县', '3', '654300');
INSERT INTO thinkox_district VALUES ('654324', '哈巴河县', '3', '654300');
INSERT INTO thinkox_district VALUES ('654325', '青河县', '3', '654300');
INSERT INTO thinkox_district VALUES ('654326', '吉木乃县', '3', '654300');
INSERT INTO thinkox_district VALUES ('659001', '石河子市', '3', '659000');
INSERT INTO thinkox_district VALUES ('659002', '阿拉尔市', '3', '659000');
INSERT INTO thinkox_district VALUES ('659003', '图木舒克市', '3', '659000');
INSERT INTO thinkox_district VALUES ('659004', '五家渠市', '3', '659000');
INSERT INTO thinkox_district VALUES ('810001', '香港', '2', '810000');
INSERT INTO thinkox_district VALUES ('810002', '中西区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810003', '九龙城区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810004', '南区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810005', '黄大仙区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810006', '油尖旺区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810007', '葵青区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810008', '西贡区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810009', '屯门区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810010', '荃湾区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810011', '东区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810012', '观塘区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810013', '深水步区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810014', '湾仔区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810015', '离岛区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810016', '北区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810017', '沙田区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810018', '大埔区', '3', '810001');
INSERT INTO thinkox_district VALUES ('810019', '元朗区', '3', '810001');
INSERT INTO thinkox_district VALUES ('820001', '澳门', '2', '820000');
INSERT INTO thinkox_district VALUES ('820002', '澳门', '3', '820001');
INSERT INTO thinkox_district VALUES ('710001', '台北市', '2', '710000');
INSERT INTO thinkox_district VALUES ('710002', '台北县', '3', '710001');
INSERT INTO thinkox_district VALUES ('710003', '基隆市', '2', '710000');
INSERT INTO thinkox_district VALUES ('910005', '中山市', '3', '442000');
INSERT INTO thinkox_district VALUES ('710004', '花莲县', '3', '710003');
INSERT INTO thinkox_district VALUES ('910006', '东莞市', '3', '441900');

-- ----------------------------
-- Table structure for `thinkox_document`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_document`;
CREATE TABLE `thinkox_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` char(55) NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of thinkox_document
-- ----------------------------
INSERT INTO thinkox_document VALUES ('15', '1', '', '关于戒撸的文章标题', '50', '', '0', '0', '2', '2', '0', '0', '128', '1', '0', '0', '3', '0', '0', '0', '1418023380', '1419068702', '1');
INSERT INTO thinkox_document VALUES ('16', '1', '', '关于戒撸的文章2', '50', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1418024040', '1419069079', '1');
INSERT INTO thinkox_document VALUES ('21', '1', 'add_yun_3', '固肾功', '48', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419067565', '1419067565', '1');
INSERT INTO thinkox_document VALUES ('23', '1', 'add_yun_2', '平板支撑', '48', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419067632', '1419067632', '1');
INSERT INTO thinkox_document VALUES ('24', '1', 'add_yun_2', '扎马步20分钟', '48', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419067678', '1419067678', '1');
INSERT INTO thinkox_document VALUES ('25', '1', 'add_yun_2', '慢跑20分钟', '48', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419067691', '1419067691', '1');
INSERT INTO thinkox_document VALUES ('26', '1', 'add_yun_5', '深蹲30下', '48', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419067705', '1419067705', '1');
INSERT INTO thinkox_document VALUES ('27', '1', 'add_yun_3', '打坐冥想', '48', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419067722', '1419067722', '1');
INSERT INTO thinkox_document VALUES ('28', '1', 'add_yun_2', '提肛运动', '48', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419067736', '1419067736', '1');
INSERT INTO thinkox_document VALUES ('29', '1', '', '戒撸视频，测试外链接', '52', '戒撸视频外链接描述！', '0', '0', '2', '2', '0', 'http://www.baidu.com', '0', '1', '0', '0', '0', '0', '0', '0', '1419214860', '1419215430', '1');
INSERT INTO thinkox_document VALUES ('30', '1', '', '吃东西疗伤戒撸', '49', '吃东西就能戒撸', '0', '0', '2', '2', '0', 'http://www.hao123.com', '0', '1', '0', '0', '0', '0', '0', '0', '1419215580', '1419215797', '1');
INSERT INTO thinkox_document VALUES ('31', '1', '', '戒撸游戏', '51', '玩了就可以戒撸的游戏，限量版！', '0', '0', '2', '2', '0', 'http://www.demo.com', '0', '1', '0', '0', '0', '0', '0', '0', '1419216074', '1419216074', '1');
INSERT INTO thinkox_document VALUES ('46', '1', '', '吃伟哥', '49', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419497271', '1419497271', '1');

-- ----------------------------
-- Table structure for `thinkox_document_article`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_document_article`;
CREATE TABLE `thinkox_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `zx` int(10) unsigned NOT NULL COMMENT '附近',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of thinkox_document_article
-- ----------------------------
INSERT INTO thinkox_document_article VALUES ('15', '0', '关于戒撸的文章内容', '', '0', '0');
INSERT INTO thinkox_document_article VALUES ('16', '0', '啊实打实的撒是非得失vfd', '', '0', '0');
INSERT INTO thinkox_document_article VALUES ('29', '0', '戒撸视频，测试外链接戒撸视频，测试外链接戒撸视频，测试外链接戒撸视频，测试外链接。', '', '0', '0');
INSERT INTO thinkox_document_article VALUES ('30', '0', '吃东西就能戒撸了，呵呵！', '', '0', '0');
INSERT INTO thinkox_document_article VALUES ('31', '0', '玩了就可以戒撸的游戏，限量版！', '', '0', '0');
INSERT INTO thinkox_document_article VALUES ('21', '0', '啊', '', '0', '0');
INSERT INTO thinkox_document_article VALUES ('23', '0', '是', '', '0', '0');
INSERT INTO thinkox_document_article VALUES ('24', '0', '<p>\r\n	此\r\n</p>', '', '0', '0');
INSERT INTO thinkox_document_article VALUES ('25', '0', '下', '', '0', '0');
INSERT INTO thinkox_document_article VALUES ('26', '0', '是', '', '0', '0');
INSERT INTO thinkox_document_article VALUES ('27', '0', '是', '', '0', '0');
INSERT INTO thinkox_document_article VALUES ('28', '0', '是', '', '0', '0');
INSERT INTO thinkox_document_article VALUES ('46', '0', '啊', '', '0', '0');

-- ----------------------------
-- Table structure for `thinkox_document_download`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_document_download`;
CREATE TABLE `thinkox_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of thinkox_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_event`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_event`;
CREATE TABLE `thinkox_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '发起人',
  `title` varchar(255) NOT NULL COMMENT '活动名称',
  `explain` text NOT NULL COMMENT '详细内容',
  `sTime` int(11) NOT NULL COMMENT '活动开始时间',
  `eTime` int(11) NOT NULL COMMENT '活动结束时间',
  `address` varchar(255) NOT NULL COMMENT '活动地点',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `limitCount` int(11) NOT NULL COMMENT '限制人数',
  `cover_id` int(11) NOT NULL COMMENT '封面ID',
  `deadline` int(11) NOT NULL,
  `attentionCount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `signCount` int(11) NOT NULL,
  `is_recommend` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_event
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_event_attend`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_event_attend`;
CREATE TABLE `thinkox_event_attend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `creat_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0为报名，1为参加',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_event_attend
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_event_type`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_event_type`;
CREATE TABLE `thinkox_event_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `allow_post` tinyint(4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_event_type
-- ----------------------------
INSERT INTO thinkox_event_type VALUES ('1', '慈善活动', '1403859500', '1403859485', '1', '0', '0', '0');
INSERT INTO thinkox_event_type VALUES ('2', '公益活动', '1403859511', '1403859502', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for `thinkox_field`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_field`;
CREATE TABLE `thinkox_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `field_data` varchar(1000) NOT NULL,
  `createTime` int(11) NOT NULL,
  `changeTime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_field
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_field_group`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_field_group`;
CREATE TABLE `thinkox_field_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_field_group
-- ----------------------------
INSERT INTO thinkox_field_group VALUES ('13', '个人资料', '1', '1403847366', '0', '1');

-- ----------------------------
-- Table structure for `thinkox_field_setting`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_field_setting`;
CREATE TABLE `thinkox_field_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(25) NOT NULL,
  `profile_group_id` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL,
  `form_type` varchar(25) NOT NULL,
  `form_default_value` varchar(200) NOT NULL,
  `validation` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `child_form_type` varchar(25) NOT NULL,
  `input_tips` varchar(100) NOT NULL COMMENT '输入提示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_field_setting
-- ----------------------------
INSERT INTO thinkox_field_setting VALUES ('36', 'qq', '13', '1', '1', '0', 'input', '', '', '1', '1409045825', 'string', '');

-- ----------------------------
-- Table structure for `thinkox_file`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_file`;
CREATE TABLE `thinkox_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  `driver` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of thinkox_file
-- ----------------------------
INSERT INTO thinkox_file VALUES ('8', 'u=960507438,2801518368&fm=23&g', '54856520b6805.jpg', '2014-12-08/', 'jpg', 'application/octet-stream', '27251', '636de904315fbebcaf75083b6bcf15d6', '96d8593a013fa10b4c1e9e827f5931966baa8a39', '0', '1418028320', 'local');
INSERT INTO thinkox_file VALUES ('9', 'u=1808515080,3426785321&fm=23&', '54856fa19f3a1.jpg', '2014-12-08/', 'jpg', 'application/octet-stream', '24804', '6c28f1a44b078cb12485ab4317ea9896', '5b7eef358acc711ca707210fd75068adaa443291', '0', '1418031009', 'local');
INSERT INTO thinkox_file VALUES ('10', 'shuiguo_logo.jpg', '548574cbe356c.jpg', '2014-12-08/', 'jpg', 'application/octet-stream', '6907', '4ed2a68e9839a2258159775de031fe03', '8fc011e3c041673492fd9f2d5b4f7bf097e5021c', '0', '1418032331', 'local');
INSERT INTO thinkox_file VALUES ('11', 'u=90917912,983620829&fm=23&gp=', '548575022c94a.jpg', '2014-12-08/', 'jpg', 'application/octet-stream', '22968', '628f7a4acd4ccc003e60aab9a91d66c8', '85b79ab9af153379516916471b8835d99281b6ad', '0', '1418032386', 'local');
INSERT INTO thinkox_file VALUES ('12', 'u=74718118,2408363817&fm=21&gp', '548653565f624.jpg', '2014-12-09/', 'jpg', 'application/octet-stream', '9797', '6636e6fd6c2a599e3b4f255442f29fb3', '36ecf21474e258855dc470ceeaaa30a25091c731', '0', '1418089302', 'local');
INSERT INTO thinkox_file VALUES ('13', 'dangdang.jpg', '54865385c2e64.jpg', '2014-12-09/', 'jpg', 'application/octet-stream', '6028', '7c1e9f9dc6ba9e38cd328100acee980d', '9d44ffbc375694bc5232e9e892d52632592f3c61', '0', '1418089349', 'local');
INSERT INTO thinkox_file VALUES ('14', 'jd.jpg', '5486569976c1d.jpg', '2014-12-09/', 'jpg', 'application/octet-stream', '8964', '1410b673b7e139d2ddfb290d7c0a9e3f', '74dd975148cd7cb5a3e4b91cf8350b068db5f0d3', '0', '1418090137', 'local');
INSERT INTO thinkox_file VALUES ('15', 'u=2327233886,3232213465&fm=23&', '549545b624c25.jpg', '2014-12-20/', 'jpg', 'application/octet-stream', '20958', '9db8940342f6f5bd2e1091a5afd43cfc', 'e1ff87dafb7df28411da5c8817b93e399206c470', '0', '1419068853', 'local');
INSERT INTO thinkox_file VALUES ('16', 'd175beca2c6c712a6418641a2a5820', '549546967a02f.jpg', '2014-12-20/', 'jpg', 'application/octet-stream', '82516', '192a74b689aeb789d94c4f806742fb3b', '850cbd9ca87cdbf0953e2132a65e347469274290', '0', '1419069078', 'local');
INSERT INTO thinkox_file VALUES ('17', 'doc.zip', '549783976b286.zip', '2014-12-22/', 'zip', 'application/octet-stream', '341458', 'b38f977df79128e17de0222175c7c077', '49d02be9cd9d7bf762235383689203139f0291a0', '0', '1419215767', 'local');
INSERT INTO thinkox_file VALUES ('18', '戒撸接口大全.doc', '54978661435d9.doc', '2014-12-22/', 'doc', 'application/octet-stream', '875520', '16e4f2fbbc977423a1f514bfee77a8c8', '88ce7ac055ebd2ea68ffcc62a53c975ace2dc3fa', '0', '1419216481', 'local');
INSERT INTO thinkox_file VALUES ('19', '洋芋团.doc', '54978aee63ae6.doc', '2014-12-22/', 'doc', 'application/octet-stream', '920064', '6152024cb1d8b3a4ad2d66c6bc90e757', 'aa9909bb9fb53ab76e21ab6ccb2adfedf7f1285d', '0', '1419217646', 'local');

-- ----------------------------
-- Table structure for `thinkox_follow`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_follow`;
CREATE TABLE `thinkox_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `follow_who` int(11) NOT NULL COMMENT '关注谁',
  `who_follow` int(11) NOT NULL COMMENT '谁关注',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='关注表';

-- ----------------------------
-- Records of thinkox_follow
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_forum`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_forum`;
CREATE TABLE `thinkox_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `post_count` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `allow_user_group` text NOT NULL,
  `sort` int(11) NOT NULL,
  `logo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_forum
-- ----------------------------
INSERT INTO thinkox_forum VALUES ('1', '大厅', '1417837576', '25', '1', '1', '0', '130');
INSERT INTO thinkox_forum VALUES ('2', '问题求助', '1417837635', '43', '1', '1', '0', '131');

-- ----------------------------
-- Table structure for `thinkox_forum_bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_forum_bookmark`;
CREATE TABLE `thinkox_forum_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_forum_bookmark
-- ----------------------------
INSERT INTO thinkox_forum_bookmark VALUES ('3', '1', '22', '1417858215');
INSERT INTO thinkox_forum_bookmark VALUES ('6', '58', '27', '1418007387');
INSERT INTO thinkox_forum_bookmark VALUES ('19', '59', '25', '1418355841');
INSERT INTO thinkox_forum_bookmark VALUES ('22', '59', '27', '1418356316');
INSERT INTO thinkox_forum_bookmark VALUES ('24', '58', '22', '1418356825');
INSERT INTO thinkox_forum_bookmark VALUES ('26', '59', '76', '1418356962');
INSERT INTO thinkox_forum_bookmark VALUES ('27', '59', '75', '1418356964');
INSERT INTO thinkox_forum_bookmark VALUES ('28', '59', '22', '1418360380');
INSERT INTO thinkox_forum_bookmark VALUES ('29', '59', '78', '1418362783');
INSERT INTO thinkox_forum_bookmark VALUES ('30', '59', '77', '1418362786');
INSERT INTO thinkox_forum_bookmark VALUES ('31', '59', '79', '1418363130');
INSERT INTO thinkox_forum_bookmark VALUES ('32', '59', '26', '1418363135');
INSERT INTO thinkox_forum_bookmark VALUES ('33', '59', '24', '1418363141');
INSERT INTO thinkox_forum_bookmark VALUES ('34', '59', '23', '1418374590');

-- ----------------------------
-- Table structure for `thinkox_forum_image`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_forum_image`;
CREATE TABLE `thinkox_forum_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `path` char(45) NOT NULL,
  `ctime` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `mpath` char(55) DEFAULT NULL,
  `cpath` char(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_forum_image
-- ----------------------------
INSERT INTO thinkox_forum_image VALUES ('61', '/Uploads/Editor/2014-12-31/54a3996de5548.jpg', '1420007788', '110', '/Uploads/Editor/2014-12-31/min_54a3996de5548.jpg', '/Uploads/Editor/2014-12-31/cen_54a3996de5548.jpg');
INSERT INTO thinkox_forum_image VALUES ('62', '/Uploads/Editor/2014-12-31/54a3a08323dba.jpg', '1420009598', '111', '/Uploads/Editor/2014-12-31/min_54a3a08323dba.jpg', '/Uploads/Editor/2014-12-31/cen_54a3a08323dba.jpg');
INSERT INTO thinkox_forum_image VALUES ('63', '/Uploads/Editor/2014-12-31/54a3a1eda7a1c.jpg', '1420009965', '112', '/Uploads/Editor/2014-12-31/min_54a3a1eda7a1c.jpg', '/Uploads/Editor/2014-12-31/cen_54a3a1eda7a1c.jpg');
INSERT INTO thinkox_forum_image VALUES ('64', '/Uploads/Editor/2014-12-31/54a3a31cb93e7.jpg', '1420010268', '119', '/Uploads/Editor/2014-12-31/min_54a3a31cb93e7.jpg', '/Uploads/Editor/2014-12-31/cen_54a3a31cb93e7.jpg');
INSERT INTO thinkox_forum_image VALUES ('65', '/Uploads/Editor/2014-12-31/54a3a35298b16.jpg', '1420010322', '121', '/Uploads/Editor/2014-12-31/min_54a3a35298b16.jpg', '/Uploads/Editor/2014-12-31/cen_54a3a35298b16.jpg');
INSERT INTO thinkox_forum_image VALUES ('66', '/Uploads/Editor/2014-12-31/54a3a37470d2d.jpg', '1420010348', '122', '/Uploads/Editor/2014-12-31/min_54a3a37470d2d.jpg', '/Uploads/Editor/2014-12-31/cen_54a3a37470d2d.jpg');
INSERT INTO thinkox_forum_image VALUES ('67', '/Uploads/Editor/2014-12-31/54a3a3e5aae62.jpg', '1420010469', '123', '/Uploads/Editor/2014-12-31/min_54a3a3e5aae62.jpg', '/Uploads/Editor/2014-12-31/cen_54a3a3e5aae62.jpg');
INSERT INTO thinkox_forum_image VALUES ('68', '/Uploads/Editor/2014-12-31/54a3a43a9c1ac.jpg', '1420010553', '124', '/Uploads/Editor/2014-12-31/min_54a3a43a9c1ac.jpg', '/Uploads/Editor/2014-12-31/cen_54a3a43a9c1ac.jpg');
INSERT INTO thinkox_forum_image VALUES ('69', '/Uploads/Editor/2014-12-31/54a3a47543c13.jpg', '1420010612', '125', '/Uploads/Editor/2014-12-31/min_54a3a47543c13.jpg', '/Uploads/Editor/2014-12-31/cen_54a3a47543c13.jpg');
INSERT INTO thinkox_forum_image VALUES ('78', '/Uploads/Editor/2014-12-31/54a3aaf6e310f.jpg', '1420012277', '145', '/Uploads/Editor/2014-12-31/min_54a3aaf6e310f.jpg', '/Uploads/Editor/2014-12-31/cen_54a3aaf6e310f.jpg');
INSERT INTO thinkox_forum_image VALUES ('79', '/Uploads/Editor/2014-12-31/54a3aaf6e616c.jpg', '1420012277', '145', '/Uploads/Editor/2014-12-31/min_54a3aaf6e616c.jpg', '/Uploads/Editor/2014-12-31/cen_54a3aaf6e616c.jpg');
INSERT INTO thinkox_forum_image VALUES ('80', '/Uploads/Editor/2014-12-31/54a3aaf6e9242.jpg', '1420012277', '145', '/Uploads/Editor/2014-12-31/min_54a3aaf6e9242.jpg', '/Uploads/Editor/2014-12-31/cen_54a3aaf6e9242.jpg');

-- ----------------------------
-- Table structure for `thinkox_forum_lzl_reply`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_forum_lzl_reply`;
CREATE TABLE `thinkox_forum_lzl_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `to_f_reply_id` int(11) NOT NULL,
  `to_reply_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `is_del` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_forum_lzl_reply
-- ----------------------------
INSERT INTO thinkox_forum_lzl_reply VALUES ('84', '22', '12', '0', '测试评论的接口', '1', '58', '1418014143', '0');

-- ----------------------------
-- Table structure for `thinkox_forum_post`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_forum_post`;
CREATE TABLE `thinkox_forum_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `parse` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `last_reply_time` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `is_top` tinyint(4) NOT NULL COMMENT '是否置顶',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_forum_post
-- ----------------------------
INSERT INTO thinkox_forum_post VALUES ('22', '58', '1', '—————这篇文章能让你戒撸—————', '0', '<p><br/><span style=\"color: rgb(0, 0, 0); font-family: Arial, SimSun; font-size: 14px; line-height: 24px; white-space: normal;\">本文核心内容提炼于《这本书能让你戒烟》。部分内容有改动，核心与宗旨不变。整篇文章分为三章：第一章理解，第二章接受，第三章醒悟。每晚更新，直到结束。希望对大家有帮助！</span></p>', '1417838132', '1417838132', '1', '1418014143', '22', '3', '0');
INSERT INTO thinkox_forum_post VALUES ('23', '58', '1', '心落无声----乱弹八卦', '0', '<p><br/></p><p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(68, 68, 68); font-family: Simsun; font-size: 14px; line-height: 28px; white-space: normal;\">十二生肖，环环相扣，情谊相同，步伐相知，<a href=\"http://www.sanwen8.cn/z/pinwei/\" target=\"_blank\" style=\"color: rgb(68, 68, 68);\">品味</a>相识，路上相逢，一生相护，一世相守，<a href=\"http://www.sanwen8.cn/sanwen/love/\" target=\"_blank\" style=\"color: rgb(68, 68, 68);\">爱</a>恨无怨，<a href=\"http://www.sanwen8.cn/z/youshang/\" target=\"_blank\" style=\"color: rgb(68, 68, 68);\">伤痕</a>无诉，痴情回味，如诗如画---------题记</p><p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(68, 68, 68); font-family: Simsun; font-size: 14px; line-height: 28px; white-space: normal;\">。字难描，话难讲，事迹难倾覆，人间有人诉愤怒，百般回首，也有它怕的，它虽然灵敏，会招人烦，讨人厌，但是它也有心知，不到穷人家去，专吃富人家的粮，闹的心惶惶，抓不住，锁不安，不明几何把它领来让意动。</p><p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(68, 68, 68); font-family: Simsun; font-size: 14px; line-height: 28px; white-space: normal;\">心横之力，无人不服，无人不惧，即担心又心不平，不得不去向它讲一些好听的话语，因为担心眼前<a href=\"http://www.sanwen8.cn/z/xiangxinziji/\" target=\"_blank\" style=\"color: rgb(68, 68, 68);\">自己</a>不保，所以只能拿一些碎落的话语和谎言来欺骗对方，让它感觉沧海桑田很多的心儿都对它折服，让它走在无助的行列中，离上西天进一步。</p><p style=\"margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(68, 68, 68); font-family: Simsun; font-size: 14px; line-height: 28px; white-space: normal;\">眼灵，心明，反应速度快，不观赏眼前的物资，<a href=\"http://www.sanwen8.cn/z/yongheng/\" target=\"_blank\" style=\"color: rgb(68, 68, 68);\">永远</a>留恋着外方的资源，一字一幕一期盼，点语的<a href=\"http://www.sanwen8.cn/z/shijian/\" target=\"_blank\" style=\"color: rgb(68, 68, 68);\">时候</a>，想着外方的变动，点事的时候，想象着内部的感慨，内外调动，心思出门外迎，<a href=\"http://www.sanwen8.cn/z/shijian/\" target=\"_blank\" style=\"color: rgb(68, 68, 68);\">时光</a>转，天地悬，而它独坐那影楼。</p><p><br/></p>', '1418003882', '1418003882', '1', '1418279516', '2', '1', '0');
INSERT INTO thinkox_forum_post VALUES ('24', '58', '1', '今年24，撸龄10年，想戒撸', '0', '<p><br/></p><pre class=\"line mt-10 q-content\" accuse=\"qContent\" style=\"margin-top: 10px; margin-bottom: 0px; padding: 0px; font-family: arial, \'courier new\', courier, 宋体, monospace; white-space: pre-wrap; font-size: 14px; line-height: 24px;\">我介绍下情况大神帮我分析分析，这些年一直撸的过来的，间隔时间没准，有的时候间隔短，有的时候间隔长，这些年我为什么还不瘦，只要我按正常饭量就会很胖，身高165体重却75公斤，瘦的时候60公斤，这些年身高就没长过，和撸有关系么？<br/>还有要戒撸我感觉比戒烟都难，我有9年的烟龄，去年一狠心戒掉了，现在一点都不想抽，戒烟后嗓子好多了感觉，但是撸，感觉没有超人一般的意志力戒不掉啊，主要是诱惑力太多了，没事的时候老是想着片片里面容练好的女优身段，不想的时候，电影里总是有那种电影里涉及到令人兴奋的情节，比如强x，或者女主角露点了什么的，就这么和谐，那么和谐，电影里也会有这样的情节，不看电影吧，看动漫，动漫里面更多，看过的都懂得，我觉得要想戒撸，除非看到h的东西也不会有任何想法，割包皮对戒撸会不会有帮助啊？</pre><p><br/></p>', '1418003949', '1418003949', '1', '1418004319', '2', '3', '0');
INSERT INTO thinkox_forum_post VALUES ('25', '58', '1', '我自己的标题i', '0', 'content的内容', '1418005995', '1418005995', '1', '1418364002', '0', '2', '0');
INSERT INTO thinkox_forum_post VALUES ('26', '58', '1', '再来发布一篇', '0', '再来一篇的内容', '1418006404', '1418006404', '1', '1418006404', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('27', '58', '1', '再来的篇+扁家', '0', '的撒娇的杀戮', '1418007009', '1418007056', '1', '1418007009', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('74', '1', '1', '高手求助的标题', '0', '<p><br/>高手求助的内容，<span style=\"line-height: 22.8571434020996px; white-space: normal;\">高手求助的内容，</span><span style=\"line-height: 22.8571434020996px; white-space: normal;\">高手求助的内容，</span><span style=\"line-height: 22.8571434020996px; white-space: normal;\">高手求助的内容，</span><span style=\"line-height: 22.8571434020996px; white-space: normal;\">高手求助的内容，</span><span style=\"line-height: 22.8571434020996px; white-space: normal;\">高手求助的内容，</span><span style=\"line-height: 22.8571434020996px; white-space: normal;\">高手求助的内容，</span><span style=\"line-height: 22.8571434020996px; white-space: normal;\">高手求助的内容，</span><span style=\"line-height: 22.8571434020996px; white-space: normal;\">高手求助的内容，</span><span style=\"line-height: 22.8571434020996px; white-space: normal;\">高手求助的内容，</span><span style=\"line-height: 22.8571434020996px; white-space: normal;\">高手求助的内容，</span><span style=\"line-height: 22.8571434020996px; white-space: normal;\">高手求助的内容，</span><span style=\"line-height: 22.8571434020996px; white-space: normal;\">高手求助的内容。</span></p>', '1418191140', '1418191140', '1', '1418191140', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('75', '1', '1', '健康调理身体', '0', '<p><br/><strong style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">【1】</strong><span style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">健康的四大基石之平和的心态：心态永远在第一位，一天笑三笑，医生要上吊，一天笑三笑，远离病和药。</span><br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/><span style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">    “中医八纲”： 寒热  里外  虚实  阴阳，八纲不平和人就容易得病。</span><br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/><span style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">    </span><strong style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">【2】</strong><span style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">要想身体好，先把饭吃好，要想身体棒，先把钙吃掉，食疗胜药，把饭当成药吃，千万别把药当成饭吃。</span><br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/><span style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">    </span><strong style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">【3】</strong><span style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">有一句话说得好， 腾不出时间睡觉，迟早要腾出时间生病，咱们中国有一句老话， 天天失眠，少活十年 。</span><br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/><span style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">    </span><strong style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">【4】</strong><span style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">女性终生不要离开豆，因为豆类里面有“大豆益黄酮”，刺激雌激素分泌，保护妇科。</span><br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/><span style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">    </span><strong style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">【5】肝<br/></strong><span style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">    养肝：绿豆、绿色蔬菜、醋</span><br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/><span style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\">    绿豆汤：水沸后再煮七八分钟（夏天五六分钟），不放糖，脾气不好、老生气，近视、高血压、高血脂、高血糖。 </span><br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/><br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/>    降肝火蔬菜：吃晚饭的时候吃生拌菜，放芝麻酱（补肾），放适量醋。酸奶不好：成分表：牛奶、砂糖、增凝剂、增稠剂，防腐剂，天天喝，血粘稠。  <br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/><br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/>    牛奶不好：过去是很好，因为过去穷，没有大鱼大肉；现在都大鱼大肉了，再喝奶，火上浇油，两者只能选其一。<br/>    <strong>【6】脾</strong><br/>    脾不好：大便一天多次，唇干，口腔溃疡，妇科、前列腺问题，不育不孕，痛经，脸蜡黄    养脾：喝豆浆    国外有豆腐节，外国人都吃豆浆了，中国人都改吃牛奶了，营养过胜，不好。    健脾：水果（除西瓜），玉米、小米    伤脾：饮料，冰饮料，甜健脾，过甜伤脾<br/>    <strong>【7】肺<br/></strong>    鼻炎为什么不能根治，因为光治鼻子了，根在肺，治肺就能根治。<br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/><br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/>    打呼噜：心肺都不好    肺不好：容易忧伤，一忧伤，肺更不好。 伤肺：少吃辣，不能过 <br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/><br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/>    养肺：晚上生吃白萝卜    白萝卜（生吃养肺，熟吃润肠）  <br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/><br style=\"color: rgb(0, 0, 0); font-family: \'sans serif\', tahoma, verdana, helvetica; font-size: 14px; line-height: 21px; white-space: normal;\"/>    <strong>【8】心<br/></strong>    舌头不好：心肝脾不好，腰酸背痛腿抽筋，上面热，下面凉    </p>', '1418193090', '1418193090', '1', '1418193090', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('76', '1', '1', '饮食调理亚健康', '0', '<p><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: Arial; line-height: 30.7999992370605px; color: rgb(102, 102, 102); font-size: 14px; white-space: normal; -color: rgb(245, 250, 254);\">人体的“第三状态”，是近年来为医学界和社会学界人士所确认的一种介乎于病与非病之间的亚健康状态。中医认为，人体阴阳平衡才是健康，然而这种平衡是动态的平衡，且受外界环境的影响，显然要使之达到绝对的平衡是不可能的，也就是说“第三状态”是客观存在的。于是祖国医学有了调和阴阳、补偏救弊、促进阴阳平衡的治疗原则。选用食疗是调整人体“第三状态”的较佳方案。不同状态可用不同食疗：</p><p><br style=\"color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; line-height: 18px; white-space: normal; -color: rgb(245, 250, 254);\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: Arial; line-height: 30.7999992370605px; color: rgb(102, 102, 102); font-size: 14px; white-space: normal; -color: rgb(245, 250, 254);\">肺气虚状态有气短、多汗、易感冒等表现，可多食用百合、蜂蜜、白木耳、红枣、桔、杏仁等食物。</p><p><br style=\"color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; line-height: 18px; white-space: normal; -color: rgb(245, 250, 254);\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: Arial; line-height: 30.7999992370605px; color: rgb(102, 102, 102); font-size: 14px; white-space: normal; -color: rgb(245, 250, 254);\">脾阳虚状态有便秘、腹胀、肠鸣、嗳气等表现，可多食用山药、莲子、百合、山楂、苡仁米、饴糖。</p><p><br style=\"color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; line-height: 18px; white-space: normal; -color: rgb(245, 250, 254);\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: Arial; line-height: 30.7999992370605px; color: rgb(102, 102, 102); font-size: 14px; white-space: normal; -color: rgb(245, 250, 254);\">肾阳虚状态有腰疼膝软、畏寒肢冷、头晕耳鸣、发须早白、性功能衰退等表现，可多食用羊肉、牛肉、芝麻、胡桃、豆类及豆制品、坚果食物。</p><p><br style=\"color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; line-height: 18px; white-space: normal; -color: rgb(245, 250, 254);\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: Arial; line-height: 30.7999992370605px; color: rgb(102, 102, 102); font-size: 14px; white-space: normal; -color: rgb(245, 250, 254);\">肥胖疲劳状态有许多身体过于肥胖者，因体重过重不仅会使身体疲劳，而且会造成心理疲劳，应少吃淀粉类和糖类，多食用萝卜、卷心菜、白菜、青辣椒、西红柿、香菇等蔬菜和水果。</p><p><br style=\"color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; line-height: 18px; white-space: normal; -color: rgb(245, 250, 254);\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: Arial; line-height: 30.7999992370605px; color: rgb(102, 102, 102); font-size: 14px; white-space: normal; -color: rgb(245, 250, 254);\">心烦意乱状态有失眠、头晕、心烦表现，可多食用养心安神的食品，如煎服龙眼肉、酸枣仁、柏子仁。</p><p><br style=\"color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; line-height: 18px; white-space: normal; -color: rgb(245, 250, 254);\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: Arial; line-height: 30.7999992370605px; color: rgb(102, 102, 102); font-size: 14px; white-space: normal; -color: rgb(245, 250, 254);\">神经衰弱状态有视力下降、记忆减退、行动笨拙等表现，可以莲子、龙眼肉、百合、猪骨、大枣、糯米等煮粥食，若是血虚、紧张引起的神经衰弱，可吃桑椹，也可配合熟地、白芍煎服。</p><p><br/></p>', '1418193156', '1418193156', '1', '1418193156', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('77', '1', '1', '大学生创业成功十大典型案例', '0', '<p><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 10px; color: rgb(43, 43, 43); font-family: 宋体; font-size: 14px; line-height: 24px; text-indent: 28px; white-space: normal;\">无论是“大学生心灵导师”李开复，还是“创业教主“周鸿祎，他们都在不停的奉劝：“大学生不要直接创业，要先进入社会积累一些经验…”，似乎大学生创业或大学毕业就创业，成为了创业失败的另一种说法。但是真实情况真的是这样吗?</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 10px; color: rgb(43, 43, 43); font-family: 宋体; font-size: 14px; line-height: 24px; text-indent: 28px; white-space: normal;\">经过黑马哥的调查，发现很多创业成功者其实都是典型的“大学生创业者”，他们用自己的实例证明了，中国大学生创业者也可以如硅谷的扎克伯克，比尔盖茨那样，做一个成功的大学生创业者。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 10px; color: rgb(43, 43, 43); font-family: 宋体; font-size: 14px; line-height: 24px; text-indent: 28px; white-space: normal;\">当然，创业有风险，入行需谨慎，一个创业者必备的素质是能清楚判断形势作出决策，究竟你是否要直接创业，还得你自己说了算。</p><p><br/></p>', '1418193554', '1418193554', '1', '1418193554', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('78', '1', '1', '成功案例怎么写', '0', '<p><br/></p><pre id=\"best-content-519128147\" accuse=\"aContent\" class=\"best-text mb-10\" style=\"padding: 0px; font-family: arial, \'courier new\', courier, 宋体, monospace; white-space: pre-wrap; font-size: 14px; line-height: 24px; -color: rgb(241, 254, 221);\">给你一些案例书写提示,具体如下:<br/>1、食品公司情况分析；<br/>2、物流公司背景介绍；<br/>3、食品产品特点与对物流的要求；<br/>4、物流合作伙伴的要求与选择；<br/>5、物流合作伙伴的业务介绍；<br/>6、物流合作伙伴的理念、文化等介绍；<br/>7、合作过程中，食品公司的配合行动描述；<br/>8、物流业务合作（外包）的理想情景描述；<br/>9、物流业务外包的不足点；<br/>10、物流业务的操作流程（按产品分类描述）；<br/>11、物流外包的常见问题的处理；<br/>12、合作过程中的控制与监督。</pre><p><br/></p>', '1418193609', '1418193609', '1', '1418373499', '0', '1', '0');
INSERT INTO thinkox_forum_post VALUES ('79', '63', '1', '戒撸拿积分', '0', '戒撸拿积分戒撸拿积分', '1418273221', '1418273221', '1', '1418370550', '0', '1', '0');
INSERT INTO thinkox_forum_post VALUES ('80', '59', '1', '戒撸第一天', '0', '今天是我们大家一起戒撸的第一天。', '1418366551', '1418366551', '1', '1418366551', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('81', '59', '1', '你你你你你你', '0', 'v风风光光哈哈', '1418372751', '1418372751', '1', '1418372751', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('82', '70', '1', '得积分第一次', '0', '得积分第一次得积分第一次得积分第一次', '1419489532', '1419489532', '1', '1419489532', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('83', '70', '1', '得积分第二次', '0', '得积分第一次得积分第一次得积分第一次', '1419489695', '1419489695', '1', '1419489695', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('84', '70', '1', '得积分第三次', '0', '得积分第一次得积分第一次得积分第一次', '1419489711', '1419489711', '1', '1419489711', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('85', '70', '1', '第四次是否得积分', '0', '第四次是否得积分第四次是否得积分', '1419489782', '1419489782', '1', '1419489782', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('86', '70', '7', '第四次是否得积分', '0', '第四次是否得积分第四次是否得积分', '1419489794', '1419489794', '1', '1419490636', '1', '19', '2');
INSERT INTO thinkox_forum_post VALUES ('105', '71', '1', '111111', '0', '222222222222222', '1420003564', '1420003564', '1', '1420003564', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('110', '71', '1', '趣图', '0', '后来就哭了', '1420007788', '1420007788', '1', '1420007788', '2', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('111', '71', '1', '呵呵', '0', '踢足球', '1420009598', '1420009598', '1', '1420009598', '1', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('112', '1', '2', 'sa', '0', 'sa', '1420009965', '1420009965', '1', '1420009965', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('113', '1', '2', 'sa', '0', 'sa', '1420010135', '1420010135', '1', '1420010135', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('114', '1', '2', 'sa', '0', 'sa', '1420010173', '1420010173', '1', '1420010173', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('115', '1', '2', 'sa', '0', 'sa', '1420010207', '1420010207', '1', '1420010207', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('116', '1', '2', 'sa', '0', 'sa', '1420010218', '1420010218', '1', '1420010218', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('117', '1', '2', 'sa', '0', 'sa', '1420010226', '1420010226', '1', '1420010226', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('118', '1', '2', 'sa', '0', 'sa', '1420010246', '1420010246', '1', '1420010246', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('119', '1', '2', 'sa', '0', 'sa', '1420010268', '1420010268', '1', '1420010268', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('120', '1', '2', 'sa', '0', 'sa', '1420010304', '1420010304', '1', '1420010304', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('121', '1', '2', 'sa', '0', 'sa', '1420010322', '1420010322', '1', '1420010322', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('122', '71', '1', '回来了', '0', '拉咯咯嘛', '1420010348', '1420010348', '1', '1420010348', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('123', '1', '2', 'sa', '0', 'sa', '1420010469', '1420010469', '1', '1420010469', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('124', '71', '1', '破纪录', '0', '口头发吧？', '1420010553', '1420010553', '1', '1420010553', '2', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('125', '1', '2', 'sa', '0', 'sa', '1420010612', '1420010612', '1', '1420010612', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('126', '1', '2', 'sa', '0', 'sa', '1420010900', '1420010900', '1', '1420010900', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('127', '1', '2', 'sa', '0', 'sa', '1420010910', '1420010910', '1', '1420010910', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('128', '1', '2', 'sa', '0', 'sa', '1420010983', '1420010983', '1', '1420010983', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('129', '1', '2', 'sa', '0', 'sa', '1420011016', '1420011016', '1', '1420011016', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('130', '1', '2', 'sa', '0', 'sa', '1420011058', '1420011058', '1', '1420011058', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('131', '1', '2', 'sa', '0', 'sa', '1420011088', '1420011088', '1', '1420011088', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('132', '1', '2', 'sa', '0', 'sa', '1420011145', '1420011145', '1', '1420011145', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('133', '1', '2', 'sa', '0', 'sa', '1420011210', '1420011210', '1', '1420011210', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('134', '1', '2', 'sa', '0', 'sa', '1420011276', '1420011276', '1', '1420011276', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('135', '1', '2', 'sa', '0', 'sa', '1420011284', '1420011284', '1', '1420011284', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('136', '1', '2', 'sa', '0', 'sa', '1420011306', '1420011306', '1', '1420011306', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('137', '1', '2', 'sa', '0', 'sa', '1420011340', '1420011340', '1', '1420011340', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('138', '1', '2', 'sa', '0', 'sa', '1420011347', '1420011347', '1', '1420011347', '1', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('139', '1', '2', 'sa', '0', 'sa', '1420011698', '1420011698', '1', '1420011698', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('140', '1', '2', 'sa', '0', 'sa', '1420011810', '1420011810', '1', '1420011810', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('141', '1', '2', 'qsw', '0', 'wqs', '1420011866', '1420011866', '1', '1420011866', '3', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('142', '1', '2', 'qsw', '0', 'wqs', '1420011887', '1420011887', '1', '1420011887', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('143', '1', '2', 'qsw', '0', 'wqs', '1420011955', '1420011955', '1', '1420011955', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('144', '1', '2', 'qsw', '0', 'wqs', '1420011984', '1420011984', '1', '1420011984', '0', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('145', '71', '1', '思路', '0', '后天', '1420012277', '1420012277', '1', '1420012277', '7', '0', '0');
INSERT INTO thinkox_forum_post VALUES ('146', '1', '2', 'qsw', '0', 'wqs', '1420012338', '1420012338', '1', '1420012338', '1', '0', '0');

-- ----------------------------
-- Table structure for `thinkox_forum_post_reply`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_forum_post_reply`;
CREATE TABLE `thinkox_forum_post_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `parse` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_forum_post_reply
-- ----------------------------
INSERT INTO thinkox_forum_post_reply VALUES ('5', '58', '22', '0', '<p>我回复戒撸板块的第一个回复</p>', '1417845505', '1417845505', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('6', '58', '22', '0', '这个是我测试的回头', '1417851754', '1417851754', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('7', '60', '22', '0', '这个是我测试的回头', '1417851905', '1417851905', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('8', '58', '24', '0', '<p>测试和回复一</p>', '1418003991', '1418003991', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('9', '58', '24', '0', '<p>测试和回复二</p>', '1418004003', '1418004003', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('10', '58', '24', '0', '回复戒撸的回复', '1418004319', '1418004319', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('11', '58', '25', '0', '测试添加的', '1418006161', '1418006161', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('12', '58', '22', '0', '来测试post为22', '1418008514', '1418008514', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('13', '63', '23', '0', '我才拿积分的', '1418279516', '1418279516', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('14', '58', '25', '0', '嗯。', '1418364002', '1418364002', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('15', '63', '79', '0', '雨u', '1418370550', '1418370550', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('16', '1', '78', '0', '扭扭捏捏', '1418373499', '1418373499', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('17', '70', '86', '0', '回帖积分一次', '1419490182', '1419490182', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('18', '70', '86', '0', '回帖积分一次', '1419490311', '1419490311', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('19', '70', '86', '0', '回帖积分二次', '1419490331', '1419490331', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('20', '70', '86', '0', '回帖积分三次', '1419490343', '1419490343', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('21', '70', '86', '0', '回帖积分四次', '1419490418', '1419490418', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('22', '70', '86', '0', '回帖积分五次', '1419490439', '1419490439', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('23', '70', '86', '0', '回帖积分六次', '1419490452', '1419490452', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('24', '70', '86', '0', '回帖积分七次', '1419490464', '1419490464', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('25', '70', '86', '0', '回帖积分八次', '1419490476', '1419490476', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('26', '70', '86', '0', '回帖积分九次', '1419490488', '1419490488', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('27', '70', '86', '0', '回帖积分十次', '1419490502', '1419490502', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('28', '70', '86', '0', '回帖积分十一次', '1419490517', '1419490517', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('29', '70', '86', '0', '回帖积分十一次', '1419490528', '1419490528', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('30', '70', '86', '0', '回帖积分十一次', '1419490587', '1419490587', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('31', '70', '86', '0', '回帖积分十一次', '1419490589', '1419490589', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('32', '70', '86', '0', '回帖积分十一次', '1419490591', '1419490591', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('33', '70', '86', '0', '回帖积分十一次', '1419490593', '1419490593', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('34', '70', '86', '0', '回帖积分十一次', '1419490634', '1419490634', '1');
INSERT INTO thinkox_forum_post_reply VALUES ('35', '70', '86', '0', '回帖积分十一次', '1419490636', '1419490636', '1');

-- ----------------------------
-- Table structure for `thinkox_group`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_group`;
CREATE TABLE `thinkox_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `title` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `post_count` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `allow_user_group` text NOT NULL,
  `sort` int(11) NOT NULL,
  `logo` int(11) NOT NULL,
  `background` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '群组类型，0为公共的，1为私有的',
  `activity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_group
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_group_bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_group_bookmark`;
CREATE TABLE `thinkox_group_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_group_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_group_dynamic`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_group_dynamic`;
CREATE TABLE `thinkox_group_dynamic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `row_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_group_dynamic
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_group_lzl_reply`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_group_lzl_reply`;
CREATE TABLE `thinkox_group_lzl_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `to_f_reply_id` int(11) NOT NULL,
  `to_reply_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_del` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_group_lzl_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_group_member`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_group_member`;
CREATE TABLE `thinkox_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `activity` int(11) NOT NULL,
  `last_view` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_group_member
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_group_notice`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_group_notice`;
CREATE TABLE `thinkox_group_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_group_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_group_post`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_group_post`;
CREATE TABLE `thinkox_group_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `parse` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `last_reply_time` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `is_top` tinyint(4) NOT NULL COMMENT '是否置顶',
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_group_post
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_group_post_category`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_group_post_category`;
CREATE TABLE `thinkox_group_post_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '所属群组',
  `title` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_group_post_category
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_group_post_reply`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_group_post_reply`;
CREATE TABLE `thinkox_group_post_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `parse` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_group_post_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_group_type`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_group_type`;
CREATE TABLE `thinkox_group_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `status` tinyint(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='群组的分类表';

-- ----------------------------
-- Records of thinkox_group_type
-- ----------------------------
INSERT INTO thinkox_group_type VALUES ('1', '群组默认分类', '1', '0', '1409811696');

-- ----------------------------
-- Table structure for `thinkox_hooks`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_hooks`;
CREATE TABLE `thinkox_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_hooks
-- ----------------------------
INSERT INTO thinkox_hooks VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', 'ImageSlider');
INSERT INTO thinkox_hooks VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'SuperLinks');
INSERT INTO thinkox_hooks VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO thinkox_hooks VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment,Avatar,demo');
INSERT INTO thinkox_hooks VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO thinkox_hooks VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO thinkox_hooks VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO thinkox_hooks VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO thinkox_hooks VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,SyncLogin,Advertising,DevTeam');
INSERT INTO thinkox_hooks VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO thinkox_hooks VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', 'Iswaf');
INSERT INTO thinkox_hooks VALUES ('17', 'checkin', '签到', '1', '1395371353', 'Checkin');
INSERT INTO thinkox_hooks VALUES ('18', 'Rank', '签到排名钩子', '1', '1395387442', 'Rank_checkin');
INSERT INTO thinkox_hooks VALUES ('20', 'support', '赞', '1', '1398264759', 'Support');
INSERT INTO thinkox_hooks VALUES ('21', 'localComment', '本地评论插件', '1', '1399440321', 'LocalComment');
INSERT INTO thinkox_hooks VALUES ('22', 'weiboType', '微博类型', '1', '1409121894', 'InsertImage');
INSERT INTO thinkox_hooks VALUES ('23', 'repost', '转发钩子', '1', '1403668286', 'Repost');
INSERT INTO thinkox_hooks VALUES ('24', 'syncLogin', '第三方登陆位置', '1', '1403700579', 'SyncLogin');
INSERT INTO thinkox_hooks VALUES ('25', 'syncMeta', '第三方登陆meta接口', '1', '1403700633', 'SyncLogin');
INSERT INTO thinkox_hooks VALUES ('26', 'J_China_City', '每个系统都需要的一个中国省市区三级联动插件。', '1', '1403841931', 'ChinaCity');
INSERT INTO thinkox_hooks VALUES ('27', 'Advs', '广告位插件', '1', '1406687667', 'Advs');
INSERT INTO thinkox_hooks VALUES ('28', 'imageSlider', '图片轮播钩子', '1', '1407144022', 'ImageSlider');
INSERT INTO thinkox_hooks VALUES ('29', 'friendLink', '友情链接插件', '1', '1407156413', 'SuperLinks');
INSERT INTO thinkox_hooks VALUES ('30', 'beforeSendWeibo', '在发微博之前预处理微博', '2', '1408084504', 'InsertFile');
INSERT INTO thinkox_hooks VALUES ('31', 'beforeSendRepost', '转发微博前的预处理钩子', '2', '1408085689', '');
INSERT INTO thinkox_hooks VALUES ('32', 'parseWeiboContent', '解析微博内容钩子', '2', '1409121261', '');
INSERT INTO thinkox_hooks VALUES ('33', 'demo', 'where写来测试的', '1', '1418104821', 'demo');

-- ----------------------------
-- Table structure for `thinkox_issue`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_issue`;
CREATE TABLE `thinkox_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `allow_post` tinyint(4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_issue
-- ----------------------------
INSERT INTO thinkox_issue VALUES ('13', '默认一级', '1409712474', '1409712467', '1', '0', '0', '0');
INSERT INTO thinkox_issue VALUES ('14', '默认二级', '1409712480', '1409712475', '1', '0', '13', '0');

-- ----------------------------
-- Table structure for `thinkox_issue_content`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_issue_content`;
CREATE TABLE `thinkox_issue_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `view_count` int(11) NOT NULL COMMENT '阅读数量',
  `cover_id` int(11) NOT NULL COMMENT '封面图片id',
  `issue_id` int(11) NOT NULL COMMENT '所在专辑',
  `uid` int(11) NOT NULL COMMENT '发布者id',
  `reply_count` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='专辑内容表';

-- ----------------------------
-- Records of thinkox_issue_content
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_jingchong`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_jingchong`;
CREATE TABLE `thinkox_jingchong` (
  `uid` int(11) DEFAULT NULL,
  `con_num` int(11) DEFAULT '1',
  `total_num` int(11) DEFAULT '1',
  `ctime` int(11) DEFAULT '0',
  `content` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_jingchong
-- ----------------------------
INSERT INTO thinkox_jingchong VALUES ('2', '1', '1', '1418618430', '');
INSERT INTO thinkox_jingchong VALUES ('2', '1', '1', '1418718445', '');
INSERT INTO thinkox_jingchong VALUES ('5', '1', '1', '1418718723', '');
INSERT INTO thinkox_jingchong VALUES ('71', '1', '1', '1419906882', '毛片看多了………呵呵');
INSERT INTO thinkox_jingchong VALUES ('71', '1', '1', '1419946615', '我很矮');

-- ----------------------------
-- Table structure for `thinkox_local_comment`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_local_comment`;
CREATE TABLE `thinkox_local_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `app` text NOT NULL,
  `mod` text NOT NULL,
  `row_id` int(11) NOT NULL,
  `parse` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `create_time` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_local_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_member`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_member`;
CREATE TABLE `thinkox_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `age_lu` tinyint(4) DEFAULT '0',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `age` tinyint(4) DEFAULT '0',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `signature` text NOT NULL,
  `tox_money` int(11) NOT NULL,
  `pos_province` char(16) DEFAULT NULL,
  `pos_city` char(16) DEFAULT NULL,
  `pos_district` char(16) DEFAULT NULL,
  `pos_community` char(16) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `status` (`status`),
  KEY `name` (`nickname`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of thinkox_member
-- ----------------------------
INSERT INTO thinkox_member VALUES ('1', '超级管理员', null, '0', '0', '0000-00-00', '', '131', '117', '0', '1417835202', '0', '1420162931', '1', '', '12', '0', '0', '0', '0');
INSERT INTO thinkox_member VALUES ('58', '999', null, '2', '10', '0000-00-00', '', '43', '26', '3232235649', '1417835725', '3232235649', '1418003519', '1', '', '6', '0', '0', '0', '0');
INSERT INTO thinkox_member VALUES ('59', '测试人员', null, '0', '0', '0000-00-00', '', '36', '28', '3232235693', '1417841330', '3232235652', '1418363105', '1', '', '2', '0', '0', '0', '0');
INSERT INTO thinkox_member VALUES ('60', 'xlm001', null, '1', '22', '0000-00-00', '', '10', '2', '3232235693', '1417846956', '3232235693', '1417846972', '1', '', '0', '0', '0', '0', '0');
INSERT INTO thinkox_member VALUES ('61', 'ceshi2', null, '0', null, '0000-00-00', '', '20', '18', '3232235649', '1418196849', '3232235649', '1418280234', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('62', 'ceshi3', null, '0', null, '0000-00-00', '', '10', '4', '3232235649', '1418196991', '3232235649', '1419840804', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('63', 'ceshi4', null, '0', null, '0000-00-00', '', '320', '71', '3232235649', '1418197030', '3232235649', '1418290203', '1', '', '3', null, null, null, null);
INSERT INTO thinkox_member VALUES ('64', '黑光科技', '0', '1', '66', '0000-00-00', '', '16', '1', '3232235649', '1418285689', '3232235649', '1418285713', '1', '', '2', '', '', '', '');
INSERT INTO thinkox_member VALUES ('65', 'display-none', '10', '1', '22', '0000-00-00', '', '10', '4', '3232235649', '1418701657', '3232235649', '1418708892', '1', '', '0', '', '', '', '');
INSERT INTO thinkox_member VALUES ('66', 'admin1', '0', '0', null, '0000-00-00', '', '10', '1', '3232235649', '1418968904', '3232235649', '1418968904', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('67', 'admin@', '0', '0', null, '0000-00-00', '', '10', '1', '3232235649', '1418970353', '3232235649', '1418970353', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('68', 'admin-@qq.com', '0', '0', null, '0000-00-00', '', '10', '1', '3232235649', '1418970911', '3232235649', '1418970911', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('69', '测试逆臣', '21', '1', '21', '0000-00-00', '', '20', '1', '3232235649', '1418973384', '3232235649', '1418973384', '1', '', '0', '中文地区', '中文地区', '中文地区', '中文地区');
INSERT INTO thinkox_member VALUES ('70', 'king123', '0', '0', null, '0000-00-00', '', '59', '4', '3232235649', '1418975905', '3232235649', '1419840776', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('71', 'Veblen', '0', '0', '0', '0000-00-00', '', '14', '31', '3232235692', '1419835138', '3232235693', '1420173020', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('72', 'wokaonimei', '0', '0', '0', '0000-00-00', '', '0', '1', '3232235649', '1419835147', '3232235649', '1419835147', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('73', 'aaa', '0', '0', '0', '0000-00-00', '', '0', '1', '3232235692', '1419836033', '3232235692', '1419836033', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('74', 'as', '0', '0', '0', '0000-00-00', '', '0', '2', '3232235692', '1419837036', '3232235692', '1419837041', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('75', 'wocajw', '0', '0', '0', '0000-00-00', '', '0', '1', '3232235649', '1419837663', '3232235649', '1419837663', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('76', 'xlm001', '0', '0', '0', '0000-00-00', '', '0', '7', '3232235651', '1419906056', '3232235651', '1420166004', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('77', 'youyinbest', '0', '0', '0', '0000-00-00', '', '0', '2', '3232235657', '1420005771', '3232235657', '1420005869', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('78', 'youyin', '0', '0', '0', '0000-00-00', '', '0', '1', '3232235657', '1420005971', '3232235657', '1420005971', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('79', 'ceshi888', '0', '0', '0', '0000-00-00', '', '0', '1', '3232235649', '1420006399', '3232235649', '1420006399', '1', '', '0', null, null, null, null);
INSERT INTO thinkox_member VALUES ('80', 'youman', '0', '0', '0', '0000-00-00', '', '0', '1', '3232235657', '1420017530', '3232235657', '1420017530', '1', '', '0', null, null, null, null);

-- ----------------------------
-- Table structure for `thinkox_menu`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_menu`;
CREATE TABLE `thinkox_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=2244 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_menu
-- ----------------------------
INSERT INTO thinkox_menu VALUES ('1', '首页', '0', '1', 'Index/index', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('2', '资讯', '0', '2', 'Article/mydocument', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0');
INSERT INTO thinkox_menu VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0');
INSERT INTO thinkox_menu VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('16', '用户', '0', '3', 'User/index', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0');
INSERT INTO thinkox_menu VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO thinkox_menu VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0');
INSERT INTO thinkox_menu VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO thinkox_menu VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO thinkox_menu VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO thinkox_menu VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO thinkox_menu VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO thinkox_menu VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0');
INSERT INTO thinkox_menu VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO thinkox_menu VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO thinkox_menu VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO thinkox_menu VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO thinkox_menu VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO thinkox_menu VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO thinkox_menu VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO thinkox_menu VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO thinkox_menu VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO thinkox_menu VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO thinkox_menu VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO thinkox_menu VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO thinkox_menu VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO thinkox_menu VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO thinkox_menu VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO thinkox_menu VALUES ('43', '扩展', '0', '998', 'Addons/index', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0');
INSERT INTO thinkox_menu VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO thinkox_menu VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO thinkox_menu VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO thinkox_menu VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO thinkox_menu VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO thinkox_menu VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO thinkox_menu VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO thinkox_menu VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO thinkox_menu VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO thinkox_menu VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO thinkox_menu VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO thinkox_menu VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO thinkox_menu VALUES ('58', '模型管理', '2', '3', 'Model/index', '0', '', '系统设置', '0');
INSERT INTO thinkox_menu VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0');
INSERT INTO thinkox_menu VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('68', '系统', '0', '9999', 'Config/group', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO thinkox_menu VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0');
INSERT INTO thinkox_menu VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO thinkox_menu VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO thinkox_menu VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO thinkox_menu VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO thinkox_menu VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO thinkox_menu VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0');
INSERT INTO thinkox_menu VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('80', '分类管理', '2', '2', 'Category/index', '0', '', '系统设置', '0');
INSERT INTO thinkox_menu VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO thinkox_menu VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO thinkox_menu VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO thinkox_menu VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO thinkox_menu VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO thinkox_menu VALUES ('86', '备份数据库', '68', '20', 'Database/index?type=export', '0', '', '数据备份', '0');
INSERT INTO thinkox_menu VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO thinkox_menu VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO thinkox_menu VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO thinkox_menu VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0');
INSERT INTO thinkox_menu VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO thinkox_menu VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO thinkox_menu VALUES ('93', '其他', '0', '5', 'other', '1', '', '', '0');
INSERT INTO thinkox_menu VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO thinkox_menu VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0');
INSERT INTO thinkox_menu VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0');
INSERT INTO thinkox_menu VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0');
INSERT INTO thinkox_menu VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO thinkox_menu VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO thinkox_menu VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO thinkox_menu VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0');
INSERT INTO thinkox_menu VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0');
INSERT INTO thinkox_menu VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0');
INSERT INTO thinkox_menu VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0');
INSERT INTO thinkox_menu VALUES ('122', '论坛', '0', '7', 'Forum/index', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('123', '微博', '0', '8', 'Weibo/weibo', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('124', '板块管理', '122', '1', 'Forum/forum', '0', '', '板块', '0');
INSERT INTO thinkox_menu VALUES ('125', '帖子管理', '122', '3', 'Forum/post', '0', '', '帖子', '0');
INSERT INTO thinkox_menu VALUES ('126', '编辑／发表帖子', '124', '0', 'Forum/editForum', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('127', 'edit pots', '125', '0', 'Forum/editPost', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('128', '排序', '124', '0', 'Forum/sortForum', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('130', '新增、编辑', '132', '0', 'SEO/editRule', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('131', '排序', '132', '0', 'SEO/sortRule', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('132', '规则管理', '68', '0', 'SEO/index', '0', '', 'SEO规则', '0');
INSERT INTO thinkox_menu VALUES ('133', '回复管理', '122', '5', '/Admin/Forum/reply', '0', '', '回复', '0');
INSERT INTO thinkox_menu VALUES ('134', '新增 编辑', '133', '0', 'Forum/editReply', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('140', '编辑回复', '138', '0', 'Weibo/editComment', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('139', '编辑微博', '137', '0', 'Weibo/editWeibo', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('137', '微博管理', '123', '1', 'Weibo/weibo', '0', '', '微博', '0');
INSERT INTO thinkox_menu VALUES ('138', '回复管理', '123', '3', 'Weibo/comment', '0', '', '回复', '0');
INSERT INTO thinkox_menu VALUES ('141', '板块回收站', '122', '2', 'Forum/forumTrash', '0', '', '板块', '0');
INSERT INTO thinkox_menu VALUES ('142', '帖子回收站', '122', '4', 'Forum/postTrash', '0', '', '帖子', '0');
INSERT INTO thinkox_menu VALUES ('143', '回复回收站', '122', '6', 'Forum/replyTrash', '0', '', '回复', '0');
INSERT INTO thinkox_menu VALUES ('144', '微博回收站', '123', '2', 'Weibo/weiboTrash', '0', '', '微博', '0');
INSERT INTO thinkox_menu VALUES ('145', '回复回收站', '123', '4', 'Weibo/commentTrash', '0', '', '回复', '0');
INSERT INTO thinkox_menu VALUES ('146', '规则回收站', '68', '0', 'SEO/ruleTrash', '0', '', 'SEO规则', '0');
INSERT INTO thinkox_menu VALUES ('147', '头衔列表', '16', '10', 'Rank/index', '0', '', '头衔管理', '0');
INSERT INTO thinkox_menu VALUES ('149', '添加头衔', '16', '2', 'Rank/editRank', '0', '', '头衔管理', '0');
INSERT INTO thinkox_menu VALUES ('150', '查看用户', '16', '0', 'Rank/userList', '0', '', '头衔管理', '0');
INSERT INTO thinkox_menu VALUES ('151', '用户头衔列表', '150', '0', 'Rank/userRankList', '1', '', '', '0');
INSERT INTO thinkox_menu VALUES ('152', '关联新头衔', '150', '0', 'Rank/userAddRank', '1', '', '', '0');
INSERT INTO thinkox_menu VALUES ('153', '编辑头衔关联', '150', '0', 'Rank/userChangeRank', '1', '', '', '0');
INSERT INTO thinkox_menu VALUES ('154', '专辑', '0', '20', 'Issue/issue', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('155', '编辑专辑', '154', '0', 'Issue/add', '1', '', '专辑', '0');
INSERT INTO thinkox_menu VALUES ('156', '专辑管理', '154', '0', 'Issue/issue', '0', '', '专辑', '0');
INSERT INTO thinkox_menu VALUES ('157', '专辑回收站', '154', '4', 'Issue/issueTrash', '0', '', '专辑', '0');
INSERT INTO thinkox_menu VALUES ('158', '专辑操作', '154', '0', 'Issue/operate', '1', '', '专辑', '0');
INSERT INTO thinkox_menu VALUES ('159', '内容审核', '154', '1', 'Issue/verify', '0', '', '内容管理', '0');
INSERT INTO thinkox_menu VALUES ('160', '内容回收站', '154', '5', 'Issue/contentTrash', '0', '', '内容管理', '0');
INSERT INTO thinkox_menu VALUES ('161', '内容管理', '154', '0', 'Issue/contents', '0', '', '内容管理', '0');
INSERT INTO thinkox_menu VALUES ('162', '扩展资料', '16', '0', 'Admin/User/profile', '0', '', '用户管理', '0');
INSERT INTO thinkox_menu VALUES ('163', '添加、编辑分组', '162', '0', 'Admin/User/editProfile', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('164', '分组排序', '162', '0', 'Admin/User/sortProfile', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('165', '字段列表', '162', '0', 'Admin/User/field', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('166', '添加、编辑字段', '165', '0', 'Admin/User/editFieldSetting', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('167', '字段排序', '165', '0', 'Admin/User/sortField', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('168', '全部补丁', '68', '0', 'Admin/Update/quick', '0', '', '升级补丁', '0');
INSERT INTO thinkox_menu VALUES ('169', '新增补丁', '68', '0', 'Admin/Update/addpack', '0', '', '升级补丁', '0');
INSERT INTO thinkox_menu VALUES ('170', '用户扩展资料列表', '16', '0', 'Admin/User/expandinfo_select', '0', '', '用户管理', '0');
INSERT INTO thinkox_menu VALUES ('171', '扩展资料详情', '170', '0', 'User/expandinfo_details', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('185', '商城信息记录', '172', '0', 'Shop/shopLog', '0', '', '商城记录', '0');
INSERT INTO thinkox_menu VALUES ('184', '待发货交易', '172', '4', 'Shop/verify', '0', '', '交易管理', '0');
INSERT INTO thinkox_menu VALUES ('183', '交易成功记录', '172', '5', 'Shop/goodsBuySuccess', '0', '', '交易管理', '0');
INSERT INTO thinkox_menu VALUES ('182', '商品分类状态设置', '176', '0', 'Shop/setStatus', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('181', '商品状态设置', '174', '0', 'Shop/setGoodsStatus', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('180', '商品回收站', '172', '7', 'Shop/goodsTrash', '0', '', '商品管理', '0');
INSERT INTO thinkox_menu VALUES ('179', '商品分类回收站', '172', '3', 'Shop/categoryTrash', '0', '', '商城配置', '0');
INSERT INTO thinkox_menu VALUES ('178', '商品分类操作', '176', '0', 'Shop/operate', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('176', '商品分类配置', '172', '2', 'Shop/shopCategory', '0', '', '商城配置', '0');
INSERT INTO thinkox_menu VALUES ('177', '商品分类添加', '176', '0', 'Shop/add', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('175', '添加、编辑商品', '174', '0', 'Shop/goodsEdit', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('174', '商品列表', '172', '1', 'Shop/goodsList', '0', '', '商品管理', '0');
INSERT INTO thinkox_menu VALUES ('173', '货币配置', '172', '8', 'Shop/toxMoneyConfig', '0', '', '商城配置', '0');
INSERT INTO thinkox_menu VALUES ('172', '商城', '0', '8', 'Shop/shopCategory', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('186', '热销商品阀值配置', '172', '0', 'Shop/hotSellConfig', '0', '', '商城配置', '0');
INSERT INTO thinkox_menu VALUES ('187', '设置新品', '174', '0', 'Shop/setNew', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('188', '活动', '0', '21', 'EventType/index', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('189', '活动分类管理', '188', '0', 'EventType/index', '0', '', '活动分类管理', '0');
INSERT INTO thinkox_menu VALUES ('190', '内容管理', '188', '0', 'Event/event', '0', '', '内容管理', '0');
INSERT INTO thinkox_menu VALUES ('191', '活动分类回收站', '188', '0', 'EventType/eventTypeTrash', '0', '', '活动分类管理', '0');
INSERT INTO thinkox_menu VALUES ('192', '内容审核', '188', '0', 'Event/verify', '0', '', '内容管理', '0');
INSERT INTO thinkox_menu VALUES ('193', '内容回收站', '188', '0', 'Event/contentTrash', '0', '', '内容管理', '0');
INSERT INTO thinkox_menu VALUES ('216', '待审核用户头衔', '16', '0', 'Rank/rankVerify', '0', '', '头衔管理', '0');
INSERT INTO thinkox_menu VALUES ('217', '被驳回的头衔申请', '16', '0', 'Rank/rankVerifyFailure', '0', '', '头衔管理', '0');
INSERT INTO thinkox_menu VALUES ('218', '微博设置', '123', '0', 'Weibo/config', '0', '微博的基本配置', '设置', '0');
INSERT INTO thinkox_menu VALUES ('219', '论坛设置', '122', '10', 'Forum/config', '0', '', '设置', '0');
INSERT INTO thinkox_menu VALUES ('220', '专辑设置', '154', '0', 'Issue/config', '0', '', '设置', '0');
INSERT INTO thinkox_menu VALUES ('221', '活动设置', '188', '0', 'Event/config', '0', '', '设置', '0');
INSERT INTO thinkox_menu VALUES ('222', '等级管理', '16', '0', 'User/level', '0', '', '用户管理', '0');
INSERT INTO thinkox_menu VALUES ('2216', '群组', '0', '22', 'admin/group/index', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('2217', '群组管理', '2216', '0', 'admin/group/group', '0', '', '群组', '0');
INSERT INTO thinkox_menu VALUES ('2218', '分类管理', '2216', '0', 'group/groupType', '0', '', '群组', '0');
INSERT INTO thinkox_menu VALUES ('2219', '文章分类', '2216', '0', 'group/postType', '0', '', '文章', '0');
INSERT INTO thinkox_menu VALUES ('2220', '修改分类', '2216', '0', 'group/editPostCate', '1', '', '文章', '0');
INSERT INTO thinkox_menu VALUES ('2221', '类型排序', '2216', '0', 'group/sortPostCate', '1', '', '文章', '0');
INSERT INTO thinkox_menu VALUES ('2222', '修改群组分类', '2216', '0', 'group/editGroupType', '1', '', '群组', '0');
INSERT INTO thinkox_menu VALUES ('2223', '群组类型排序', '2216', '0', 'group/sortGroupType', '1', '', '群组', '0');
INSERT INTO thinkox_menu VALUES ('2224', '编辑楼中楼回复', '2216', '0', 'group/editLzlReply', '1', '', '回复', '0');
INSERT INTO thinkox_menu VALUES ('2225', '楼中楼回复', '2216', '0', 'group/lzlreply', '1', '', '回复', '0');
INSERT INTO thinkox_menu VALUES ('2226', '楼中楼回复回收站', '2216', '0', 'group/lzlreplyTrash', '1', '', '回复', '0');
INSERT INTO thinkox_menu VALUES ('2227', '编辑回复', '2216', '0', 'group/editReply', '1', '', '回复', '0');
INSERT INTO thinkox_menu VALUES ('2228', '群组回收站', '2216', '0', 'group/groupTrash', '0', '', '群组', '0');
INSERT INTO thinkox_menu VALUES ('2229', '文章管理', '2216', '0', 'group/post', '0', '', '文章', '0');
INSERT INTO thinkox_menu VALUES ('2230', '文章回收站', '2216', '0', 'group/postTrash', '0', '', '文章', '0');
INSERT INTO thinkox_menu VALUES ('2231', '回复管理', '2216', '0', 'group/reply', '0', '', '回复', '0');
INSERT INTO thinkox_menu VALUES ('2232', '回复回收站', '2216', '0', 'group/replyTrash', '0', '', '回复', '0');
INSERT INTO thinkox_menu VALUES ('2233', '群组设置', '2216', '0', 'group/config', '0', '', '设置', '0');
INSERT INTO thinkox_menu VALUES ('2234', '未审核群组', '2216', '0', 'group/unverify', '0', '', '群组', '0');
INSERT INTO thinkox_menu VALUES ('2235', '症状', '0', '1', 'Zhengzhuang/changjian', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('2236', '系统症状', '2235', '0', 'Zhengzhuang/changjian', '0', '', '症状管理', '0');
INSERT INTO thinkox_menu VALUES ('2237', '回收站', '2235', '10', 'Zhengzhuang/listHui', '0', '', '', '0');
INSERT INTO thinkox_menu VALUES ('2238', '意见列表', '2235', '0', 'Zhengzhuang/yijian', '0', '', '意见管理', '0');
INSERT INTO thinkox_menu VALUES ('2240', '以处理意见', '2235', '0', 'Zhengzhuang/doYijian', '0', '', '意见管理', '0');
INSERT INTO thinkox_menu VALUES ('2241', '用户症状', '2235', '0', 'Zhengzhuang/user', '0', '用户自己创建的症状', '症状管理', '0');
INSERT INTO thinkox_menu VALUES ('2242', '用户常见症状', '2235', '0', 'Zhengzhuang/mostZheng', '0', '最常见的症状', '症状管理', '0');
INSERT INTO thinkox_menu VALUES ('2243', '运动健身', '2235', '0', 'Zhengzhuang/yundong', '0', '运动健身管理', '运动健身', '0');

-- ----------------------------
-- Table structure for `thinkox_message`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_message`;
CREATE TABLE `thinkox_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0系统消息,1用户消息,2应用消息',
  `is_read` tinyint(4) NOT NULL,
  `last_toast` int(11) NOT NULL,
  `url` varchar(400) NOT NULL,
  `talk_id` int(11) NOT NULL,
  `appname` varchar(30) NOT NULL,
  `apptype` varchar(30) NOT NULL,
  `source_id` int(11) NOT NULL,
  `find_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 COMMENT='thinkox新增消息表';

-- ----------------------------
-- Records of thinkox_message
-- ----------------------------
INSERT INTO thinkox_message VALUES ('322', '58', '0', 'ipipipip赞了您。', 'ipipipip给您点了个赞。', '1418016143', '0', '0', '1418088675', '/thinkox4/index.php?s=/index/detail.html', '0', 'home', '', '0', '0', '0');
INSERT INTO thinkox_message VALUES ('323', '63', '58', 'ceshi4回复了您的帖子。', '回复内容：我才拿积分的', '1418279516', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/23/page/1.html#13', '0', 'forum', 'reply', '23', '13', '0');
INSERT INTO thinkox_message VALUES ('324', '0', '58', '回复了您的帖子。', '回复内容：嗯。', '1418364002', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/25/page/1.html#14', '0', 'forum', 'reply', '25', '14', '0');
INSERT INTO thinkox_message VALUES ('325', '0', '63', '回复了您的帖子。', '回复内容：雨u', '1418370550', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/79/page/1.html#15', '0', 'forum', 'reply', '79', '15', '0');
INSERT INTO thinkox_message VALUES ('326', '0', '1', '回复了您的帖子。', '回复内容：扭扭捏捏', '1418373499', '2', '0', '1418781025', '/thinkox4/index.php?s=/forum/index/detail/id/78/page/1.html#16', '0', 'forum', 'reply', '78', '16', '0');
INSERT INTO thinkox_message VALUES ('327', '0', '70', '回复了您的帖子。', '回复内容：回帖积分一次', '1419490183', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/1.html#17', '0', 'forum', 'reply', '86', '17', '0');
INSERT INTO thinkox_message VALUES ('328', '0', '70', '回复了您的帖子。', '回复内容：回帖积分一次', '1419490311', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/1.html#18', '0', 'forum', 'reply', '86', '18', '0');
INSERT INTO thinkox_message VALUES ('329', '0', '70', '回复了您的帖子。', '回复内容：回帖积分二次', '1419490331', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/1.html#19', '0', 'forum', 'reply', '86', '19', '0');
INSERT INTO thinkox_message VALUES ('330', '0', '70', '回复了您的帖子。', '回复内容：回帖积分三次', '1419490344', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/1.html#20', '0', 'forum', 'reply', '86', '20', '0');
INSERT INTO thinkox_message VALUES ('331', '0', '70', '回复了您的帖子。', '回复内容：回帖积分四次', '1419490419', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/1.html#21', '0', 'forum', 'reply', '86', '21', '0');
INSERT INTO thinkox_message VALUES ('332', '0', '70', '回复了您的帖子。', '回复内容：回帖积分五次', '1419490439', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/1.html#22', '0', 'forum', 'reply', '86', '22', '0');
INSERT INTO thinkox_message VALUES ('333', '0', '70', '回复了您的帖子。', '回复内容：回帖积分六次', '1419490452', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/1.html#23', '0', 'forum', 'reply', '86', '23', '0');
INSERT INTO thinkox_message VALUES ('334', '0', '70', '回复了您的帖子。', '回复内容：回帖积分七次', '1419490465', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/1.html#24', '0', 'forum', 'reply', '86', '24', '0');
INSERT INTO thinkox_message VALUES ('335', '0', '70', '回复了您的帖子。', '回复内容：回帖积分八次', '1419490477', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/1.html#25', '0', 'forum', 'reply', '86', '25', '0');
INSERT INTO thinkox_message VALUES ('336', '0', '70', '回复了您的帖子。', '回复内容：回帖积分九次', '1419490488', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/1.html#26', '0', 'forum', 'reply', '86', '26', '0');
INSERT INTO thinkox_message VALUES ('337', '0', '70', '回复了您的帖子。', '回复内容：回帖积分十次', '1419490503', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/2.html#27', '0', 'forum', 'reply', '86', '27', '0');
INSERT INTO thinkox_message VALUES ('338', '0', '70', '回复了您的帖子。', '回复内容：回帖积分十一', '1419490517', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/2.html#28', '0', 'forum', 'reply', '86', '28', '0');
INSERT INTO thinkox_message VALUES ('339', '0', '70', '回复了您的帖子。', '回复内容：回帖积分十一', '1419490528', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/2.html#29', '0', 'forum', 'reply', '86', '29', '0');
INSERT INTO thinkox_message VALUES ('340', '0', '70', '回复了您的帖子。', '回复内容：回帖积分十一', '1419490588', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/2.html#30', '0', 'forum', 'reply', '86', '30', '0');
INSERT INTO thinkox_message VALUES ('341', '0', '70', '回复了您的帖子。', '回复内容：回帖积分十一', '1419490590', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/2.html#31', '0', 'forum', 'reply', '86', '31', '0');
INSERT INTO thinkox_message VALUES ('342', '0', '70', '回复了您的帖子。', '回复内容：回帖积分十一', '1419490591', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/2.html#32', '0', 'forum', 'reply', '86', '32', '0');
INSERT INTO thinkox_message VALUES ('343', '0', '70', '回复了您的帖子。', '回复内容：回帖积分十一', '1419490593', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/2.html#33', '0', 'forum', 'reply', '86', '33', '0');
INSERT INTO thinkox_message VALUES ('344', '0', '70', '回复了您的帖子。', '回复内容：回帖积分十一', '1419490634', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/2.html#34', '0', 'forum', 'reply', '86', '34', '0');
INSERT INTO thinkox_message VALUES ('345', '0', '70', '回复了您的帖子。', '回复内容：回帖积分十一', '1419490636', '2', '0', '0', '/thinkox4/index.php?s=/forum/index/detail/id/86/page/2.html#35', '0', 'forum', 'reply', '86', '35', '0');

-- ----------------------------
-- Table structure for `thinkox_model`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_model`;
CREATE TABLE `thinkox_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of thinkox_model
-- ----------------------------
INSERT INTO thinkox_model VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM');
INSERT INTO thinkox_model VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1387260622', '1', 'MyISAM');
INSERT INTO thinkox_model VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');

-- ----------------------------
-- Table structure for `thinkox_picture`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_picture`;
CREATE TABLE `thinkox_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `type` varchar(50) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_picture
-- ----------------------------
INSERT INTO thinkox_picture VALUES ('128', 'local', '/Uploads/Picture/2014-12-20/5495451c47ab9.jpg', '', 'd896d2dd7e188f7cb266a3634a1ab551', '7ea98c8ff4d2a3ca4c3f3e84293fb36424cb6c3d', '1', '1419068700');
INSERT INTO thinkox_picture VALUES ('127', 'local', '/Uploads/Picture/2014-12-20/5495384d71bdc.jpg', '', 'fdbc7bd57486a8a580beb1e4f7c88a91', 'afe848e20b65383eeec2c8f29bd4dd92e3b50f49', '1', '1419065421');
INSERT INTO thinkox_picture VALUES ('129', 'local', '/Uploads/Picture/2014-12-22/5497c36148bd1.jpg', '', 'ead0d8d0f3f2e11ba25039d14fbe6857', '7ead03113f30ff6246429bdceded675bf18665f9', '1', '1419232097');
INSERT INTO thinkox_picture VALUES ('130', 'local', '/Uploads/Picture/2014-12-22/5497c4df89f47.jpg', '', '566a90d4fb7e96ccf8f051c9fecda1ae', '59cd2dc4a700999d4a0f6ad8927ba42c9dbe4dd5', '1', '1419232479');
INSERT INTO thinkox_picture VALUES ('131', 'local', '/Uploads/Picture/2014-12-22/5497c507138d1.jpg', '', '6cc6e525555ded155972a22692774150', '960e95bbc21e920b03dffab20c81d849d7333b30', '1', '1419232518');
INSERT INTO thinkox_picture VALUES ('132', 'local', '/Uploads/Picture/2014-12-22/5497c51cddc3d.jpg', '', 'eeaf6bc6e8e78e4fa7548e94dcef4791', '22e0f4582d0df5e878210f9a27fa656cfa220345', '1', '1419232540');
INSERT INTO thinkox_picture VALUES ('133', 'local', '/Uploads/Picture/2014-12-22/5497c52bda7b3.jpg', '', '394b4eacead4c3eb1d400c6e1d51972e', 'a5e296d57628e310d7cf538fdfa1d928efb040a7', '1', '1419232555');
INSERT INTO thinkox_picture VALUES ('134', 'local', '/Uploads/Picture/2014-12-22/5497c54a4bf3e.jpg', '', '64fb66252b8b651dda6d0832d1ea9f1b', '76b97ced5b7e0adb1f35a743659a3b98e7ba27e5', '1', '1419232586');

-- ----------------------------
-- Table structure for `thinkox_rank`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_rank`;
CREATE TABLE `thinkox_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '上传者id',
  `title` varchar(50) NOT NULL,
  `logo` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `types` tinyint(2) NOT NULL DEFAULT '1' COMMENT '前台是否可申请',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_rank
-- ----------------------------
INSERT INTO thinkox_rank VALUES ('5', '1', '董事长', '125', '1418270282', '1');
INSERT INTO thinkox_rank VALUES ('6', '1', '秘书', '118', '1418270299', '1');
INSERT INTO thinkox_rank VALUES ('7', '1', '经理', '121', '1418283042', '1');

-- ----------------------------
-- Table structure for `thinkox_rank_user`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_rank_user`;
CREATE TABLE `thinkox_rank_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `is_show` tinyint(4) NOT NULL COMMENT '是否显示在昵称右侧（必须有图片才可）',
  `create_time` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_rank_user
-- ----------------------------
INSERT INTO thinkox_rank_user VALUES ('6', '1', '5', '我看上你了', '1', '1418282948', '1');

-- ----------------------------
-- Table structure for `thinkox_seo_rule`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_seo_rule`;
CREATE TABLE `thinkox_seo_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `app` varchar(40) NOT NULL,
  `controller` varchar(40) NOT NULL,
  `action` varchar(40) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `seo_keywords` text NOT NULL,
  `seo_description` text NOT NULL,
  `seo_title` text NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_seo_rule
-- ----------------------------
INSERT INTO thinkox_seo_rule VALUES ('4', '整站标题', '', '', '', '1', '', '', 'ThinkOX', '7');
INSERT INTO thinkox_seo_rule VALUES ('6', '论坛版块页', 'forum', 'index', 'forum', '1', '{$forum.title} ', '{$forum.title} ', '{$forum.title} —— ThinkOX论坛', '2');
INSERT INTO thinkox_seo_rule VALUES ('7', '微博首页', 'Weibo', 'Index', 'index', '1', '微博', '微博首页', 'ThinkOX轻量化社交框架', '5');
INSERT INTO thinkox_seo_rule VALUES ('8', '微博详情页', 'Weibo', 'Index', 'weiboDetail', '1', '{$weibo.title|op_t},Thinkox,ox,微博', '{$weibo.content|op_t}\r\n', '{$weibo.content|op_t}——ThinkOX微博', '6');
INSERT INTO thinkox_seo_rule VALUES ('9', '用户中心', 'usercenter', 'index', 'index', '1', '{$user_info.nickname|op_t},Thinkox', '{$user_info.username|op_t}的个人主页', '{$user_info.nickname|op_t}的个人主页', '3');
INSERT INTO thinkox_seo_rule VALUES ('10', '会员页面', 'people', 'index', 'index', '1', '会员', '会员', '会员', '4');
INSERT INTO thinkox_seo_rule VALUES ('11', '论坛帖子详情页', 'forum', 'index', 'detail', '1', '{$post.title|op_t},论坛,thinkox', '{$post.title|op_t}', '{$post.title|op_t} —— ThinkOX论坛', '1');
INSERT INTO thinkox_seo_rule VALUES ('12', '商城首页', 'shop', 'index', 'index', '1', '商城,积分', '积分商城', '商城首页——ThinkOX', '0');
INSERT INTO thinkox_seo_rule VALUES ('13', '商城商品详情页', 'shop', 'index', 'goodsdetail', '1', '{$content.goods_name|op_t},商城', '{$content.goods_name|op_t}', '{$content.goods_name|op_t}——ThinkOX商城', '0');
INSERT INTO thinkox_seo_rule VALUES ('14', '资讯首页', 'blog', 'index', 'index', '1', '资讯首页', '资讯首页\r\n', '资讯——ThinkOX', '0');
INSERT INTO thinkox_seo_rule VALUES ('15', '资讯列表页', 'blog', 'article', 'lists', '1', '{$category.title|op_t}', '{$category.title|op_t}', '{$category.title|op_t}', '0');
INSERT INTO thinkox_seo_rule VALUES ('16', '资讯文章页', 'blog', 'article', 'detail', '1', '{$info.title|op_t}', '{$info.title|op_t}', '{$info.title|op_t}——ThinkOX', '0');
INSERT INTO thinkox_seo_rule VALUES ('17', '活动首页', 'event', 'index', 'index', '1', '活动', '活动首页', '活动首页——ThinkOX', '0');
INSERT INTO thinkox_seo_rule VALUES ('18', '活动详情页', 'event', 'index', 'detail', '1', '{$content.title|op_t}', '{$content.title|op_t}', '{$content.title|op_t}——ThinkOX', '0');
INSERT INTO thinkox_seo_rule VALUES ('19', '专辑首页', 'issue', 'index', 'index', '1', '专辑', '专辑首页', '专辑首页——ThinkOX', '0');
INSERT INTO thinkox_seo_rule VALUES ('20', '专辑详情页', 'issue', 'index', 'issuecontentdetail', '1', '{$content.title|op_t}', '{$content.title|op_t}', '{$content.title|op_t}——ThinkOX', '0');

-- ----------------------------
-- Table structure for `thinkox_shibu_user`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_shibu_user`;
CREATE TABLE `thinkox_shibu_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` smallint(5) unsigned DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_shibu_user
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_shop`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_shop`;
CREATE TABLE `thinkox_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(25) NOT NULL COMMENT '商品名称',
  `goods_ico` int(11) NOT NULL COMMENT '商品图标',
  `goods_introduct` varchar(100) NOT NULL COMMENT '商品简介',
  `goods_detail` text NOT NULL COMMENT '商品详情',
  `tox_money_need` int(11) NOT NULL COMMENT '需要金币数',
  `goods_num` int(11) NOT NULL COMMENT '商品余量',
  `changetime` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态，-1：删除；0：禁用；1：启用',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `category_id` int(11) NOT NULL,
  `is_new` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为新品',
  `sell_num` int(11) NOT NULL DEFAULT '0' COMMENT '已出售量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='商品信息';

-- ----------------------------
-- Records of thinkox_shop
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_shop_address`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_shop_address`;
CREATE TABLE `thinkox_shop_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `change_time` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `phone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of thinkox_shop_address
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_shop_buy`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_shop_buy`;
CREATE TABLE `thinkox_shop_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_num` int(11) NOT NULL COMMENT '购买数量',
  `status` tinyint(4) NOT NULL COMMENT '状态，-1：未领取；0：申请领取；1：已领取',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `createtime` int(11) NOT NULL COMMENT '购买时间',
  `gettime` int(11) NOT NULL COMMENT '交易结束时间',
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='购买商品信息表';

-- ----------------------------
-- Records of thinkox_shop_buy
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_shop_category`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_shop_category`;
CREATE TABLE `thinkox_shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_shop_category
-- ----------------------------
INSERT INTO thinkox_shop_category VALUES ('1', '奖品', '1403507725', '1403507717', '1', '0', '0');

-- ----------------------------
-- Table structure for `thinkox_shop_config`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_shop_config`;
CREATE TABLE `thinkox_shop_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(25) NOT NULL COMMENT '标识',
  `cname` varchar(25) NOT NULL COMMENT '中文名称',
  `changetime` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商店配置';

-- ----------------------------
-- Records of thinkox_shop_config
-- ----------------------------
INSERT INTO thinkox_shop_config VALUES ('1', 'tox_money', '金币', '1403507688');
INSERT INTO thinkox_shop_config VALUES ('2', 'min_sell_num', '10', '1403489181');

-- ----------------------------
-- Table structure for `thinkox_shop_log`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_shop_log`;
CREATE TABLE `thinkox_shop_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_shop_log
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_shop_see`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_shop_see`;
CREATE TABLE `thinkox_shop_see` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_shop_see
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_super_links`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_super_links`;
CREATE TABLE `thinkox_super_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '类别（1：图片，2：普通）',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '站点名称',
  `cover_id` int(10) NOT NULL COMMENT '图片ID',
  `link` char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
  `level` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='友情连接表';

-- ----------------------------
-- Records of thinkox_super_links
-- ----------------------------
INSERT INTO thinkox_super_links VALUES ('5', '2', '想天科技', '0', 'http://www.ourstu.com', '0', '1', '1407156786');
INSERT INTO thinkox_super_links VALUES ('6', '2', 'Onethink', '0', 'http://www.onethink.cn', '0', '1', '1407156813');
INSERT INTO thinkox_super_links VALUES ('7', '1', 'ThinkOX', '92', 'http://tox.ourstu.com', '0', '1', '1407156830');

-- ----------------------------
-- Table structure for `thinkox_support`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_support`;
CREATE TABLE `thinkox_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appname` varchar(20) NOT NULL COMMENT '应用名',
  `row` int(11) NOT NULL COMMENT '应用标识',
  `uid` int(11) NOT NULL COMMENT '用户',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `table` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='支持的表';

-- ----------------------------
-- Records of thinkox_support
-- ----------------------------
INSERT INTO thinkox_support VALUES ('53', 'Forum', '27', '58', '1418021920', 'post');
INSERT INTO thinkox_support VALUES ('54', 'Forum', '78', '1', '1418284213', 'post');
INSERT INTO thinkox_support VALUES ('55', 'Forum', '26', '58', '1418284797', 'post');
INSERT INTO thinkox_support VALUES ('56', 'Forum', '79', '63', '1418352474', 'post');
INSERT INTO thinkox_support VALUES ('57', 'Forum', '25', '58', '1418356546', 'post');
INSERT INTO thinkox_support VALUES ('58', 'Forum', '22', '58', '1418356687', 'post');
INSERT INTO thinkox_support VALUES ('59', 'Forum', '24', '58', '1418356694', 'post');
INSERT INTO thinkox_support VALUES ('60', 'Forum', '77', '1', '1418356930', 'post');
INSERT INTO thinkox_support VALUES ('61', 'Forum', '76', '1', '1418356947', 'post');
INSERT INTO thinkox_support VALUES ('62', 'Forum', '75', '1', '1418356950', 'post');
INSERT INTO thinkox_support VALUES ('63', 'Forum', '22', '2', '1418360374', 'post');
INSERT INTO thinkox_support VALUES ('64', 'Forum', '79', '59', '1418370814', 'post');
INSERT INTO thinkox_support VALUES ('65', 'Forum', '86', '71', '1419991860', 'post');
INSERT INTO thinkox_support VALUES ('66', 'Forum', '110', '71', '1420008739', 'post');
INSERT INTO thinkox_support VALUES ('67', 'Forum', '105', '71', '1420008744', 'post');
INSERT INTO thinkox_support VALUES ('68', 'Forum', '85', '71', '1420008749', 'post');
INSERT INTO thinkox_support VALUES ('69', 'Forum', '84', '71', '1420008752', 'post');
INSERT INTO thinkox_support VALUES ('70', 'Forum', '141', '71', '1420018181', 'post');

-- ----------------------------
-- Table structure for `thinkox_sync_login`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_sync_login`;
CREATE TABLE `thinkox_sync_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type_uid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `oauth_token` varchar(255) NOT NULL,
  `oauth_token_secret` varchar(255) NOT NULL,
  `is_sync` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_sync_login
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_talk`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_talk`;
CREATE TABLE `thinkox_talk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `uids` varchar(100) NOT NULL,
  `appname` varchar(30) NOT NULL,
  `apptype` varchar(30) NOT NULL,
  `source_id` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `source_title` varchar(100) NOT NULL,
  `source_content` text NOT NULL,
  `source_url` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `message_id` int(11) NOT NULL,
  `other_uid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='会话表';

-- ----------------------------
-- Records of thinkox_talk
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_talk_message`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_talk_message`;
CREATE TABLE `thinkox_talk_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `talk_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 COMMENT='聊天消息表';

-- ----------------------------
-- Records of thinkox_talk_message
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_talk_message_push`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_talk_message_push`;
CREATE TABLE `thinkox_talk_message_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `source_id` int(11) NOT NULL COMMENT '来源消息id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL,
  `talk_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=gbk COMMENT='状态，0为未提示，1为未点击，-1为已点击';

-- ----------------------------
-- Records of thinkox_talk_message_push
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_talk_push`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_talk_push`;
CREATE TABLE `thinkox_talk_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '接收推送的用户id',
  `source_id` int(11) NOT NULL COMMENT '来源id',
  `create_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态，0为未提示，1为未点击，-1为已点击',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='对话推送表';

-- ----------------------------
-- Records of thinkox_talk_push
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_ucenter_admin`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_ucenter_admin`;
CREATE TABLE `thinkox_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of thinkox_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_ucenter_member`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_ucenter_member`;
CREATE TABLE `thinkox_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(25) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) DEFAULT NULL COMMENT '用户邮箱',
  `mobile` char(15) DEFAULT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of thinkox_ucenter_member
-- ----------------------------
INSERT INTO thinkox_ucenter_member VALUES ('1', 'admin', 'dbd40831c7f4c5ca688c9342379e0504', 'admin@admin.com', '', '1417835202', '0', '1420162931', '0', '1417835202', '1');
INSERT INTO thinkox_ucenter_member VALUES ('58', 'ipipipip', 'f90dbfeab3028058115d2f071aeb49c8', 'ipipipip', null, '1417835725', '3232235649', '1418003519', '3232235649', '1417835725', '1');
INSERT INTO thinkox_ucenter_member VALUES ('59', '13101351386', 'deb5a2f0f819a9edfe82ba94c1c02980', null, '13101351386', '1417841330', '3232235693', '1418363105', '3232235652', '1417841330', '1');
INSERT INTO thinkox_ucenter_member VALUES ('60', '13101351388', 'deb5a2f0f819a9edfe82ba94c1c02980', null, '13101351388', '1417846956', '3232235693', '1417846972', '3232235693', '1417846956', '1');
INSERT INTO thinkox_ucenter_member VALUES ('61', 'ceshi2', '27702110a61d66a0527491f610665e69', 'ceshi2', null, '1418196849', '3232235649', '1418280234', '3232235649', '1418196849', '1');
INSERT INTO thinkox_ucenter_member VALUES ('62', 'ceshi3', 'dbd40831c7f4c5ca688c9342379e0504', 'ceshi3', null, '1418196991', '3232235649', '1419840804', '3232235649', '1418196991', '1');
INSERT INTO thinkox_ucenter_member VALUES ('63', 'ceshi4', 'dbd40831c7f4c5ca688c9342379e0504', 'ceshi4', null, '1418197030', '3232235649', '1418290203', '3232235649', '1418197030', '1');
INSERT INTO thinkox_ucenter_member VALUES ('64', 'heiguang', '1e704710699b471dcd011f3d441a27db', 'heiguang', null, '1418285689', '3232235649', '1418607820', '3232235649', '1418285689', '1');
INSERT INTO thinkox_ucenter_member VALUES ('65', 'display', 'f2e8e6ec30a1dccd0d80225f685d6bd6', 'display', null, '1418701657', '3232235649', '1418708892', '3232235649', '1418701657', '1');
INSERT INTO thinkox_ucenter_member VALUES ('66', 'admin1', 'dbd40831c7f4c5ca688c9342379e0504', 'admin1', null, '1418968904', '3232235649', '1418968904', '3232235649', '1418968904', '1');
INSERT INTO thinkox_ucenter_member VALUES ('67', 'admin@', 'd503123a4f9c1db05077935a1b1950dd', 'admin@', null, '1418970353', '3232235649', '1418970353', '3232235649', '1418970353', '1');
INSERT INTO thinkox_ucenter_member VALUES ('68', 'admin-@qq.com', 'dbd40831c7f4c5ca688c9342379e0504', 'admin-@qq.com', null, '1418970911', '3232235649', '1418970911', '3232235649', '1418970911', '1');
INSERT INTO thinkox_ucenter_member VALUES ('69', 'wocao123', '863779ac327b8d2c8ea78159d5ad3efd', null, null, '1418973384', '3232235649', '1418973384', '3232235649', '1418973384', '1');
INSERT INTO thinkox_ucenter_member VALUES ('70', 'king123', 'dbd40831c7f4c5ca688c9342379e0504', null, null, '1418975905', '3232235649', '1419840776', '3232235649', '1418975905', '1');
INSERT INTO thinkox_ucenter_member VALUES ('71', 'Veblen', 'f3f76cea02796fe6d8c0e1b8dd419f62', null, null, '1419835138', '3232235692', '1420173020', '3232235693', '1419835138', '1');
INSERT INTO thinkox_ucenter_member VALUES ('72', 'wokaonimei', 'dbd40831c7f4c5ca688c9342379e0504', null, null, '1419835147', '3232235649', '1419835147', '3232235649', '1419835147', '1');
INSERT INTO thinkox_ucenter_member VALUES ('73', 'aaa', '1eec8cb30a0d6fe70ef339975be19013', null, null, '1419836033', '3232235692', '1419836033', '3232235692', '1419836033', '1');
INSERT INTO thinkox_ucenter_member VALUES ('74', 'as', 'f3f76cea02796fe6d8c0e1b8dd419f62', null, null, '1419837036', '3232235692', '1419837041', '3232235692', '1419837036', '1');
INSERT INTO thinkox_ucenter_member VALUES ('75', 'wocajw', 'dbd40831c7f4c5ca688c9342379e0504', null, null, '1419837663', '3232235649', '1419837663', '3232235649', '1419837663', '1');
INSERT INTO thinkox_ucenter_member VALUES ('76', 'xlm001', 'f3f76cea02796fe6d8c0e1b8dd419f62', null, null, '1419906056', '3232235651', '1420166004', '3232235651', '1419906056', '1');
INSERT INTO thinkox_ucenter_member VALUES ('77', 'youyinbest', 'f3f76cea02796fe6d8c0e1b8dd419f62', null, null, '1420005771', '3232235657', '1420005869', '3232235657', '1420005771', '1');
INSERT INTO thinkox_ucenter_member VALUES ('78', 'youyin', 'f3f76cea02796fe6d8c0e1b8dd419f62', null, null, '1420005971', '3232235657', '1420005971', '3232235657', '1420005971', '1');
INSERT INTO thinkox_ucenter_member VALUES ('79', 'ceshi888', 'dbd40831c7f4c5ca688c9342379e0504', null, null, '1420006399', '3232235649', '1420006399', '3232235649', '1420006399', '1');
INSERT INTO thinkox_ucenter_member VALUES ('80', 'youman', 'f3f76cea02796fe6d8c0e1b8dd419f62', null, null, '1420017530', '3232235657', '1420017530', '3232235657', '1420017530', '1');

-- ----------------------------
-- Table structure for `thinkox_ucenter_setting`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_ucenter_setting`;
CREATE TABLE `thinkox_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of thinkox_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_url`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_url`;
CREATE TABLE `thinkox_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of thinkox_url
-- ----------------------------
INSERT INTO thinkox_url VALUES ('1', 'http://www.baidu.com', '', '1', '1419214860');

-- ----------------------------
-- Table structure for `thinkox_user_token`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_user_token`;
CREATE TABLE `thinkox_user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_user_token
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_weibo`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_weibo`;
CREATE TABLE `thinkox_weibo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_top` tinyint(4) NOT NULL,
  `type` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `repost_count` int(11) NOT NULL,
  `from` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=407 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_weibo
-- ----------------------------
INSERT INTO thinkox_weibo VALUES ('403', '58', '我发表了一个新的帖子【—————这篇文章能让你戒撸—————】：http://192.168.0.129:8080/thinkox4/index.php?s=/forum/index/detail/id/22.html', '1417838132', '0', '1', '0', 'feed', 'a:0:{}', '0', '');
INSERT INTO thinkox_weibo VALUES ('404', '58', '我发表了一个新的帖子【心落无声----乱弹八卦】：http://192.168.0.129:8080/thinkox4/index.php?s=/forum/index/detail/id/23.html', '1418003882', '0', '1', '0', 'feed', 'a:0:{}', '0', '');
INSERT INTO thinkox_weibo VALUES ('405', '58', '我发表了一个新的帖子【今年24，撸龄10年，想戒撸】：http://192.168.0.129:8080/thinkox4/index.php?s=/forum/index/detail/id/24.html', '1418003949', '0', '1', '0', 'feed', 'a:0:{}', '0', '');
INSERT INTO thinkox_weibo VALUES ('406', '1', '管理员给@admin 颁发了新的头衔：[董事长]，颁发理由：我看上你了', '1418282654', '0', '1', '0', 'feed', 'a:0:{}', '0', '');

-- ----------------------------
-- Table structure for `thinkox_weibo_comment`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_weibo_comment`;
CREATE TABLE `thinkox_weibo_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `weibo_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `to_comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_weibo_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_weibo_top`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_weibo_top`;
CREATE TABLE `thinkox_weibo_top` (
  `weibo_id` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`weibo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='置顶微博表';

-- ----------------------------
-- Records of thinkox_weibo_top
-- ----------------------------

-- ----------------------------
-- Table structure for `thinkox_yijian`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_yijian`;
CREATE TABLE `thinkox_yijian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_yijian
-- ----------------------------
INSERT INTO thinkox_yijian VALUES ('6', '你们的app很有创意哟', '1418633736', '0');
INSERT INTO thinkox_yijian VALUES ('7', '你们的app很有创意哟2', '1418633743', '0');
INSERT INTO thinkox_yijian VALUES ('8', '你们的app很有创意哟3', '1418633748', '0');

-- ----------------------------
-- Table structure for `thinkox_yundong`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_yundong`;
CREATE TABLE `thinkox_yundong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `sort` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_yundong
-- ----------------------------
INSERT INTO thinkox_yundong VALUES ('1', '固肾功', '1419047267', '1419052705', '1', '0');
INSERT INTO thinkox_yundong VALUES ('2', '平板支撑', '1419052779', null, '1', '1');
INSERT INTO thinkox_yundong VALUES ('3', '扎马步20分钟', '1419052794', null, '1', '2');
INSERT INTO thinkox_yundong VALUES ('4', '慢跑20分钟', '1419052808', '1419052816', '1', '3');
INSERT INTO thinkox_yundong VALUES ('5', '深蹲30下', '1419052828', null, '1', '4');
INSERT INTO thinkox_yundong VALUES ('6', '打坐冥想', '1419052842', null, '1', '5');
INSERT INTO thinkox_yundong VALUES ('7', '提肛运动', '1419052858', null, '1', '6');

-- ----------------------------
-- Table structure for `thinkox_yundong_user`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_yundong_user`;
CREATE TABLE `thinkox_yundong_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `yid` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_yundong_user
-- ----------------------------
INSERT INTO thinkox_yundong_user VALUES ('1', '70', '21', '1419220325');
INSERT INTO thinkox_yundong_user VALUES ('2', '70', '21', '1419220340');
INSERT INTO thinkox_yundong_user VALUES ('3', '69', '21', '1419220785');
INSERT INTO thinkox_yundong_user VALUES ('4', '1', '21', '1419228307');
INSERT INTO thinkox_yundong_user VALUES ('5', '1', '23', '1419228423');
INSERT INTO thinkox_yundong_user VALUES ('6', '70', '23', '1419228493');

-- ----------------------------
-- Table structure for `thinkox_zhengzhuang`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_zhengzhuang`;
CREATE TABLE `thinkox_zhengzhuang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(25) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `sort` int(4) DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_zhengzhuang
-- ----------------------------
INSERT INTO thinkox_zhengzhuang VALUES ('4', '阳痿早泄', null, null, '0', '1', '0', '1418872567');
INSERT INTO thinkox_zhengzhuang VALUES ('10', '血尿', null, '1418870911', '0', '1', '0', null);
INSERT INTO thinkox_zhengzhuang VALUES ('11', '尿隐', null, '1418870932', '0', '1', '1', null);
INSERT INTO thinkox_zhengzhuang VALUES ('12', '前列腺', null, '1418870946', '0', '1', '3', null);
INSERT INTO thinkox_zhengzhuang VALUES ('13', '尿道痛', null, '1418870977', '0', '1', '4', null);
INSERT INTO thinkox_zhengzhuang VALUES ('14', '排尿困难', null, '1418870992', '0', '1', '5', null);
INSERT INTO thinkox_zhengzhuang VALUES ('15', '膀胱痛', null, '1418871010', '0', '1', '6', null);
INSERT INTO thinkox_zhengzhuang VALUES ('16', '肾脏疼痛', null, '1418871084', '0', '1', '7', null);
INSERT INTO thinkox_zhengzhuang VALUES ('17', '附睾痛', null, '1418871337', '0', '1', '8', null);
INSERT INTO thinkox_zhengzhuang VALUES ('18', '睾丸痛', null, '1418871355', '0', '1', '9', null);
INSERT INTO thinkox_zhengzhuang VALUES ('19', '隐睾痛', null, '1418871380', '0', '1', '10', null);
INSERT INTO thinkox_zhengzhuang VALUES ('20', '静脉曲张', null, '1418871403', '0', '1', '11', null);
INSERT INTO thinkox_zhengzhuang VALUES ('21', '包皮过长', null, '1418871415', '0', '1', '12', null);
INSERT INTO thinkox_zhengzhuang VALUES ('22', '频繁遗精', null, '1418871434', '0', '1', '13', null);
INSERT INTO thinkox_zhengzhuang VALUES ('23', '生殖器痛症', null, '1418871455', '0', '1', '14', null);
INSERT INTO thinkox_zhengzhuang VALUES ('24', '早泄', '1', '1418871501', '0', '1', '15', null);
INSERT INTO thinkox_zhengzhuang VALUES ('25', '阳痿', '1', '1418871510', '0', '1', '16', null);
INSERT INTO thinkox_zhengzhuang VALUES ('26', '性欲减退', '1', '1418871524', '0', '1', '17', null);
INSERT INTO thinkox_zhengzhuang VALUES ('27', '不射精', '1', '1418871544', '0', '1', '18', null);
INSERT INTO thinkox_zhengzhuang VALUES ('28', '心里障碍', '1', '1418871573', '0', '1', '19', null);
INSERT INTO thinkox_zhengzhuang VALUES ('29', '神经衰弱', '1', '1418871591', '0', '1', '20', null);
INSERT INTO thinkox_zhengzhuang VALUES ('30', '口臭', '1', '1418871601', '0', '1', '21', null);
INSERT INTO thinkox_zhengzhuang VALUES ('31', '精神萎靡', '1', '1418871625', '0', '1', '22', null);
INSERT INTO thinkox_zhengzhuang VALUES ('32', '尿频尿急', '1', '1418871636', '0', '1', '23', null);
INSERT INTO thinkox_zhengzhuang VALUES ('33', '不育', '1', '1418871647', '0', '1', '24', null);
INSERT INTO thinkox_zhengzhuang VALUES ('34', '脱发', '1', '1418871662', '0', '1', '25', null);
INSERT INTO thinkox_zhengzhuang VALUES ('35', '前列腺异样', '1', '1418871682', '0', '1', '26', null);
INSERT INTO thinkox_zhengzhuang VALUES ('36', '生殖器部位长期潮汗', '1', '1418871714', '0', '1', '27', null);
INSERT INTO thinkox_zhengzhuang VALUES ('37', '腰酸', '1', '1418871737', '0', '1', '28', null);
INSERT INTO thinkox_zhengzhuang VALUES ('38', '遗精盗汗', '1', '1418871753', '0', '1', '29', null);
INSERT INTO thinkox_zhengzhuang VALUES ('39', '记忆力衰退', '1', '1418871769', '0', '1', '30', null);
INSERT INTO thinkox_zhengzhuang VALUES ('40', '失眠多梦', '1', '1418871786', '0', '1', '31', null);
INSERT INTO thinkox_zhengzhuang VALUES ('43', '勃起障碍', '64', '1418885916', '1', '1', '1', '1418886828');
INSERT INTO thinkox_zhengzhuang VALUES ('44', '1111', '71', '1420165847', '1', '1', '0', null);
INSERT INTO thinkox_zhengzhuang VALUES ('45', '我操', '2', '1420165964', '1', '1', '0', null);
INSERT INTO thinkox_zhengzhuang VALUES ('46', '我操1', '3', '1420166046', '1', '1', '0', null);
INSERT INTO thinkox_zhengzhuang VALUES ('47', '222222', '71', '1420166127', '1', '1', '0', null);
INSERT INTO thinkox_zhengzhuang VALUES ('48', '3333', '71', '1420167891', '1', '1', '0', null);
INSERT INTO thinkox_zhengzhuang VALUES ('49', '44444', '71', '1420168017', '1', '1', '0', null);
INSERT INTO thinkox_zhengzhuang VALUES ('50', '5555', '71', '1420168025', '1', '1', '0', null);

-- ----------------------------
-- Table structure for `thinkox_zhengzhuang_score`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_zhengzhuang_score`;
CREATE TABLE `thinkox_zhengzhuang_score` (
  `zid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `score` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_zhengzhuang_score
-- ----------------------------
INSERT INTO thinkox_zhengzhuang_score VALUES ('4', '1', '1418722867', '9');
INSERT INTO thinkox_zhengzhuang_score VALUES ('4', '1', '1418889527', '1');

-- ----------------------------
-- Table structure for `thinkox_zhengzhuang_user`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox_zhengzhuang_user`;
CREATE TABLE `thinkox_zhengzhuang_user` (
  `zid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thinkox_zhengzhuang_user
-- ----------------------------
INSERT INTO thinkox_zhengzhuang_user VALUES ('39', '64', '1418879937');
INSERT INTO thinkox_zhengzhuang_user VALUES ('40', '63', '1418883506');
INSERT INTO thinkox_zhengzhuang_user VALUES ('43', '64', '1418885916');
INSERT INTO thinkox_zhengzhuang_user VALUES ('22', '64', null);
INSERT INTO thinkox_zhengzhuang_user VALUES ('22', '1', null);
INSERT INTO thinkox_zhengzhuang_user VALUES ('43', '5', null);
INSERT INTO thinkox_zhengzhuang_user VALUES ('43', '3', null);
INSERT INTO thinkox_zhengzhuang_user VALUES ('40', '3', null);
INSERT INTO thinkox_zhengzhuang_user VALUES ('22', '3', null);
INSERT INTO thinkox_zhengzhuang_user VALUES ('40', '4', null);
INSERT INTO thinkox_zhengzhuang_user VALUES ('43', '4', null);
INSERT INTO thinkox_zhengzhuang_user VALUES ('22', '3', null);
INSERT INTO thinkox_zhengzhuang_user VALUES ('43', '5', null);
INSERT INTO thinkox_zhengzhuang_user VALUES ('22', '3', null);
INSERT INTO thinkox_zhengzhuang_user VALUES ('45', '2', '1420165964');
INSERT INTO thinkox_zhengzhuang_user VALUES ('46', '3', '1420166046');

-- ----------------------------
-- Table structure for `thinkox__article`
-- ----------------------------
DROP TABLE IF EXISTS `thinkox__article`;
CREATE TABLE `thinkox__article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT 'title',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of thinkox__article
-- ----------------------------
