/*
 Navicat Premium Data Transfer

 Source Server         : 数据库_work
 Source Server Type    : MySQL
 Source Server Version : 50626
 Source Host           : localhost:3306
 Source Schema         : lgr

 Target Server Type    : MySQL
 Target Server Version : 50626
 File Encoding         : 65001

 Date: 20/11/2019 20:20:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ship_boat
-- ----------------------------
DROP TABLE IF EXISTS `ship_boat`;
CREATE TABLE `ship_boat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '船名',
  `money` int(11) DEFAULT 0 COMMENT '价格',
  `people` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '管理者',
  `dataline` int(11) DEFAULT 0 COMMENT '购买时间',
  `updatedata` int(11) DEFAULT 0 COMMENT '最后维修时间',
  `num` int(11) DEFAULT 0 COMMENT '出航次数',
  `status` int(11) DEFAULT 0 COMMENT '状态0：待出航 1：出航',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_boat
-- ----------------------------
INSERT INTO `ship_boat` VALUES (1, 'C1', 10000, 'MR1', 1, 1, 10, 1);
INSERT INTO `ship_boat` VALUES (2, 'C2', 20000, 'MR2', 1, 1, 15, 0);

-- ----------------------------
-- Table structure for ship_dingdan
-- ----------------------------
DROP TABLE IF EXISTS `ship_dingdan`;
CREATE TABLE `ship_dingdan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0出货 1进货',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '货物名',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `util` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '单位',
  `dataline` int(11) DEFAULT NULL COMMENT '时间戳',
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_dingdan
-- ----------------------------
INSERT INTO `ship_dingdan` VALUES (1, 0, '燃油', 15, '升', 1, '2000');
INSERT INTO `ship_dingdan` VALUES (2, 1, '机油', 16, '升', 1, '5000');

-- ----------------------------
-- Table structure for ship_kucun
-- ----------------------------
DROP TABLE IF EXISTS `ship_kucun`;
CREATE TABLE `ship_kucun`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '货物名',
  `num` int(11) NOT NULL DEFAULT 0 COMMENT '剩余数量',
  `util` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '单位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_kucun
-- ----------------------------
INSERT INTO `ship_kucun` VALUES (1, '机油', 9, '升');
INSERT INTO `ship_kucun` VALUES (2, '柴油', 30, '升');
INSERT INTO `ship_kucun` VALUES (3, '燃油', 50, '升');

-- ----------------------------
-- Table structure for ship_plan
-- ----------------------------
DROP TABLE IF EXISTS `ship_plan`;
CREATE TABLE `ship_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0出航1入航',
  `dataline` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '时间戳',
  `people` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '申请人',
  `boat` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '申请船只',
  `oil` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '所需燃油',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态0：未通过1：已通过2：已拒绝',
  `tuolun` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拖轮',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_plan
-- ----------------------------
INSERT INTO `ship_plan` VALUES (1, 1, '1', 'MR1', 'C1', '152', 1, 't1');
INSERT INTO `ship_plan` VALUES (2, 0, '1', 'MR2', 'C2', '26', 0, 't2');
INSERT INTO `ship_plan` VALUES (3, 2, '1', 'MR2', 'C2', '69', 2, 't3');

-- ----------------------------
-- Table structure for ship_post
-- ----------------------------
DROP TABLE IF EXISTS `ship_post`;
CREATE TABLE `ship_post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_post
-- ----------------------------
INSERT INTO `ship_post` VALUES (1, '员工');
INSERT INTO `ship_post` VALUES (2, '经理');

-- ----------------------------
-- Table structure for ship_tuolun
-- ----------------------------
DROP TABLE IF EXISTS `ship_tuolun`;
CREATE TABLE `ship_tuolun`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '船只名',
  `people` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '负责员工',
  `dataline` int(11) DEFAULT NULL COMMENT '时间',
  `status` int(11) DEFAULT NULL COMMENT '任务状态0未完成1已完成',
  `type` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '船体大小状态0 小 1 大',
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '引航计费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_tuolun
-- ----------------------------
INSERT INTO `ship_tuolun` VALUES (1, 'C1', 'MR1', 1, 0, '1', '500');
INSERT INTO `ship_tuolun` VALUES (2, 'C2', 'MR2', 1, 1, '0', '600');

-- ----------------------------
-- Table structure for ship_user
-- ----------------------------
DROP TABLE IF EXISTS `ship_user`;
CREATE TABLE `ship_user`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '账号',
  `pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名字',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `sal` int(11) DEFAULT NULL COMMENT '工资',
  `status` int(11) DEFAULT NULL COMMENT '状态0无任务 1有任务',
  `dataline` int(11) DEFAULT NULL COMMENT '入职时间戳',
  `post` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位',
  `list` int(11) DEFAULT NULL COMMENT '只为优先级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_user
-- ----------------------------
INSERT INTO `ship_user` VALUES (1, 'abc', '123', 'MR1', 15, '男', 16, 0, 1, '员工', 1);
INSERT INTO `ship_user` VALUES (2, '0', '0', 'MR2', 16, '女', 19, 0, 1, '经理', 1);

-- ----------------------------
-- Table structure for ship_weixiu
-- ----------------------------
DROP TABLE IF EXISTS `ship_weixiu`;
CREATE TABLE `ship_weixiu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '机器名',
  `people` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '负责人',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '状态0未完成1已完成',
  `dataline` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '维修时间',
  `money` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '维修金额',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0 维修 1 保养',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_weixiu
-- ----------------------------
INSERT INTO `ship_weixiu` VALUES (1, 'C1', 'MR1', '1', '1', '56556', '1');
INSERT INTO `ship_weixiu` VALUES (2, 'C2', 'MR2', '0', '1', '4851', '1');

SET FOREIGN_KEY_CHECKS = 1;
