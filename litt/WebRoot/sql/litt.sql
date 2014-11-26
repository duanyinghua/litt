/*
Navicat MySQL Data Transfer

Source Server         : localhost_mysql
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : litt

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-11-26 17:19:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `level` tinyint(1) DEFAULT NULL COMMENT '字典项级别(分为0,1,2,3 0代表最高级，即字典的分类，其后依次下分)',
  `code` varchar(40) DEFAULT NULL COMMENT '字典项代码',
  `parent_code` varchar(40) DEFAULT NULL COMMENT '父项代码',
  `name` varchar(50) DEFAULT NULL COMMENT '字典项名称',
  `py_code` varchar(20) DEFAULT NULL COMMENT '拼音码',
  `is_valid` tinyint(1) DEFAULT NULL COMMENT '是否有效 1为有效，0为无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modify_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `role_name` varchar(40) DEFAULT NULL COMMENT '权限名',
  `role_code` varchar(20) DEFAULT NULL COMMENT '权限代码',
  `py_code` varchar(20) DEFAULT NULL COMMENT '拼音码',
  `is_valid` tinyint(1) DEFAULT NULL COMMENT '是否有效 1为有效，0为无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('12345678901234567890123456789012', '管理员', 'admin', 'GLY', '1');
INSERT INTO `role` VALUES ('12345678901234567890123456789013', '会员', 'member', 'HY', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `login_name` varchar(30) DEFAULT NULL COMMENT '登录帐号名',
  `password` varchar(30) DEFAULT NULL COMMENT '密码',
  `true_name` varchar(40) DEFAULT NULL COMMENT '真实姓名',
  `py_code` varchar(20) DEFAULT NULL COMMENT '真实姓名对应的拼音码',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `role_code` varchar(20) DEFAULT NULL COMMENT '权限ID',
  `phone` varchar(15) DEFAULT NULL COMMENT '电话',
  `address` varchar(100) DEFAULT NULL COMMENT '具体地址（含省市县）',
  `province_code` varchar(32) DEFAULT NULL COMMENT '省份代码',
  `city_code` varchar(32) DEFAULT NULL COMMENT '城市代码',
  `district_code` varchar(32) DEFAULT NULL COMMENT '区/县代码',
  `is_valid` tinyint(1) DEFAULT NULL COMMENT '是否有效 1为有效，0为无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modify_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('123', 'abc', '123', '张三', null, '2014-11-01', 'member', '123456', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('297e66b54974cf31014974cf333a0000', 'testadd1', '123', '33', null, '2014-11-02', 'member', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('297e66b54974cf74014974cf76800000', 'testadd2', '123', '22', null, '2014-11-03', 'member', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('297e66b54974cf74014974cf76800001', 'testadd3', '1234', '11', null, '2014-11-04', 'member', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('297e66b54974cf74014974cf76800002', 'testadd4', '1234', '11', null, '2014-11-05', 'member', '', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('297e66b54974cf74014974cf76800003', 'testadd5', '1234', '11', null, '2014-11-06', 'member', '', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('297e66b54974cf74014974cf76800004', 'testadd6', '1234', '11', null, '2014-11-07', 'member', '', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('297e66b54974cf74014974cf76800005', 'testadd7', '1234', '11', null, '2014-11-08', 'member', '', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('297e66b54974cf74014974cf76800006', 'testadd8', '1234', '11', null, '2014-11-09', 'member', '', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('297e66b54974cf74014974cf76800007', 'testadd9', '1234', '11', null, '2014-11-10', 'member', '', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('297e66b54974cf74014974cf76800008', 'testadd0', '1234', '11', null, '2014-11-11', 'member', '', null, null, null, null, null, null, null);
