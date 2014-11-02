/*
Navicat MySQL Data Transfer

Source Server         : localhost_mysql
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : litt

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-11-02 17:28:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `login_name` varchar(30) DEFAULT NULL COMMENT '登录帐号名',
  `password` varchar(30) DEFAULT NULL COMMENT '密码',
  `true_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `phone` varchar(15) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('123', 'abc', '123', '张三', '2014-11-02', '123456');
