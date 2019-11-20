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

 Date: 20/11/2019 18:38:29
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
INSERT INTO `ship_boat` VALUES (1, '船1', 100, 'G1', 1572337657, 1572337657, 10, 1);
INSERT INTO `ship_boat` VALUES (4, '船4', 1515, 'G4', 1572595642, 0, 26, 0);
INSERT INTO `ship_boat` VALUES (5, '船5', 400, 'G5', 1572596024, 0, 16, 1);
INSERT INTO `ship_boat` VALUES (6, '船6', 500, 'G6', 1572596127, 0, 18, 0);
INSERT INTO `ship_boat` VALUES (7, '船7', 600, 'G7', 0, 0, 13, 1);
INSERT INTO `ship_boat` VALUES (8, '船8', 900, 'G8', 0, 0, 16, 0);
INSERT INTO `ship_boat` VALUES (9, '船9', 800, 'G9', 0, 0, 16, 1);
INSERT INTO `ship_boat` VALUES (10, '船10', 1000, 'G11', 0, 0, 37, 1);
INSERT INTO `ship_boat` VALUES (11, '船11', 1000, 'G11', 0, 0, 23, 0);
INSERT INTO `ship_boat` VALUES (12, '船12', 2000, 'G12', 0, 0, 17, 0);
INSERT INTO `ship_boat` VALUES (15, '船13', 3000, 'G13', 0, 0, 34, 1);
INSERT INTO `ship_boat` VALUES (16, '船14', 4000, 'G14', 0, 0, 24, 1);
INSERT INTO `ship_boat` VALUES (17, '船15', 5000, 'G15', 0, 0, 23, 0);
INSERT INTO `ship_boat` VALUES (74, '船12', 998988, 'G11', 1573446301, 0, 0, 0);
INSERT INTO `ship_boat` VALUES (75, NULL, NULL, NULL, 1573446301, 0, 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_dingdan
-- ----------------------------
INSERT INTO `ship_dingdan` VALUES (1, 0, '燃油', 10, '升', 1572407007, '5000￥');
INSERT INTO `ship_dingdan` VALUES (8, 1, '柴油', 20, '升', 8, '6000￥');
INSERT INTO `ship_dingdan` VALUES (9, 0, '机油', 30, '升', 0, '7000￥');
INSERT INTO `ship_dingdan` VALUES (10, 1, '燃油', 10, '升', 0, '8000￥');
INSERT INTO `ship_dingdan` VALUES (11, 0, '机油', 30, '升', 0, '3000￥');
INSERT INTO `ship_dingdan` VALUES (12, 1, '柴油', 20, '升', 0, '5000￥');
INSERT INTO `ship_dingdan` VALUES (14, 0, '燃油', 10, '升', 1572857246, '9000￥');
INSERT INTO `ship_dingdan` VALUES (15, 1, '燃油', 10, '升', 1572857296, '4000￥');
INSERT INTO `ship_dingdan` VALUES (16, 1, '机油', 12321, '升', 1573437372, '6900￥');

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
INSERT INTO `ship_kucun` VALUES (1, '燃油', 10, '升');
INSERT INTO `ship_kucun` VALUES (2, '机油', 12341, '升');
INSERT INTO `ship_kucun` VALUES (3, '柴油', 50, '升');

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
INSERT INTO `ship_plan` VALUES (3, 1, '0', 'G1', '船1', '16', 1, 'test1');
INSERT INTO `ship_plan` VALUES (5, 1, '0', 'G2', '船2', '0', 2, 'test2');
INSERT INTO `ship_plan` VALUES (6, 1, '0', 'G3', '船3', '0', 0, 'test3');
INSERT INTO `ship_plan` VALUES (7, 0, '0', 'G4', '船4', '0', 1, 'test4');
INSERT INTO `ship_plan` VALUES (8, 1, '0', 'G5', '船4', '0', 0, 'test5');
INSERT INTO `ship_plan` VALUES (9, 0, '0', 'G6', '船6', '0', 1, 'test6');
INSERT INTO `ship_plan` VALUES (10, 1, '0', 'G7', '船7', '0', 2, 'test7');
INSERT INTO `ship_plan` VALUES (11, 0, '0', 'G8', '船8', '0', 2, 'test8');
INSERT INTO `ship_plan` VALUES (12, 1, '0', 'G9', '船9', '0', 1, 'test9');
INSERT INTO `ship_plan` VALUES (13, 0, '0', 'G10', '船10', '0', 1, 'test10');
INSERT INTO `ship_plan` VALUES (14, 0, '0', 'G11', '船11', '0', 1, 'test11');
INSERT INTO `ship_plan` VALUES (15, 1, '0', 'G12', '船12', '0', 2, 'test12');
INSERT INTO `ship_plan` VALUES (16, 0, '0', 'G13', '船13', '0', 2, 'test13');
INSERT INTO `ship_plan` VALUES (17, 1, '0', 'G14', '船14', '0', 1, 'test14');
INSERT INTO `ship_plan` VALUES (18, 0, '0', 'G15', '船15', '0', 2, 'test15');

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
INSERT INTO `ship_tuolun` VALUES (1, '船1', 'G1', 1572407007, 0, '0', '5000￥');
INSERT INTO `ship_tuolun` VALUES (2, '船2', 'G2', 1, 1, '1', '6000￥');
INSERT INTO `ship_tuolun` VALUES (3, '船3', 'G3', 0, 0, '0', '845854￥');
INSERT INTO `ship_tuolun` VALUES (4, '船4', 'G4', 1, 1, '1', '87635￥');
INSERT INTO `ship_tuolun` VALUES (5, '船5', 'G5', 0, 0, '0', '6354￥');
INSERT INTO `ship_tuolun` VALUES (6, '船6', 'G6', 1, 1, '1', '6795342￥');
INSERT INTO `ship_tuolun` VALUES (7, '船7', 'G7', 0, 0, '0', '764￥');
INSERT INTO `ship_tuolun` VALUES (8, '船8', 'G8', 0, 1, '1', '86743￥');
INSERT INTO `ship_tuolun` VALUES (9, '船9', 'G9', 0, 0, '0', '8643￥');
INSERT INTO `ship_tuolun` VALUES (10, '船10', 'G10', 0, 1, '1', '6945￥');
INSERT INTO `ship_tuolun` VALUES (11, '船11', 'G11', 0, 0, '0', '86453￥');
INSERT INTO `ship_tuolun` VALUES (12, '船12', 'G12', 0, 1, '1', '98653￥');
INSERT INTO `ship_tuolun` VALUES (13, '船13', 'G13', 0, 0, '0', '4521￥');
INSERT INTO `ship_tuolun` VALUES (14, '船14', 'G14', 0, 1, '1', '67834￥');
INSERT INTO `ship_tuolun` VALUES (15, '船15', 'G15', 0, 0, '0', '4564￥');

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
INSERT INTO `ship_user` VALUES (9, 'abc', '123', 'G1', 15, '男', 5656, 0, 1572486737, '经理', 2);
INSERT INTO `ship_user` VALUES (13, '0', '0', 'G3', 21, '女', 55, 0, 1572574046, '员工', 1);
INSERT INTO `ship_user` VALUES (16, '0', '0', 'G4', 23, '女', 26, 1, 1572577101, '经理', 2);
INSERT INTO `ship_user` VALUES (26, '0', '0', 'G5', 15, '男', 99, 0, 1572582484, '员工', 1);
INSERT INTO `ship_user` VALUES (28, '0', '0', 'G6', 16, '男', 889, 1, 1572582501, '员工', 1);
INSERT INTO `ship_user` VALUES (30, '0', '0', 'G7', 9, '男', 3, 0, 1572582553, '员工', 1);
INSERT INTO `ship_user` VALUES (32, '0', '0', 'G8', 2, '女', 2, 0, 1572596168, '员工', 1);
INSERT INTO `ship_user` VALUES (33, '0', '0', 'G9', 16, '女', 65, 0, 1572596168, '经理', 2);
INSERT INTO `ship_user` VALUES (34, '0', '0', 'G10', 3, '女', 998, 1, 1572852810, '经理', 2);
INSERT INTO `ship_user` VALUES (36, '0', '0', 'G12', 21, '女', 145, 1, 1572861100, '员工', 1);
INSERT INTO `ship_user` VALUES (38, '0', '0', 'G14', 23, '女', 48956, 1, 1572861119, '员工', 1);
INSERT INTO `ship_user` VALUES (39, '0', '0', 'G15', 24, '男', 462, 0, 1572861119, '经理', 2);
INSERT INTO `ship_user` VALUES (42, '0', '0', 'G11', 45, '男', 226, 0, 1573445573, '员工', 1);
INSERT INTO `ship_user` VALUES (43, '0', '0', NULL, NULL, NULL, NULL, 0, 1573445573, NULL, NULL);

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
INSERT INTO `ship_weixiu` VALUES (1, '船1', 'G1', '0', '1572407007', '50000￥', '1');
INSERT INTO `ship_weixiu` VALUES (2, '船2', 'G2', '1', '0', '7864￥', '1');
INSERT INTO `ship_weixiu` VALUES (3, '船3', 'G3', '0', '0', '6000￥', '1');
INSERT INTO `ship_weixiu` VALUES (4, '船4', 'G4', '0', '0', '7000￥', '0');
INSERT INTO `ship_weixiu` VALUES (5, '船5', 'G5', '0', '0', '8000￥', '1');
INSERT INTO `ship_weixiu` VALUES (6, '船6', 'G6', '0', '0', '10000￥', '0');
INSERT INTO `ship_weixiu` VALUES (7, '船7', 'G7', '0', '0', '1200￥', '1');
INSERT INTO `ship_weixiu` VALUES (8, '船8', 'G8', '1', '0', '3000￥', '0');
INSERT INTO `ship_weixiu` VALUES (9, '船9', 'G9', '0', '0', '6000￥', '1');
INSERT INTO `ship_weixiu` VALUES (10, '船10', 'G10', '0', '0', '8000￥', '0');
INSERT INTO `ship_weixiu` VALUES (11, '船11', 'G11', '0', '0', '9000￥', '1');
INSERT INTO `ship_weixiu` VALUES (12, '船12', 'G12', '1', '0', '13000￥', '0');
INSERT INTO `ship_weixiu` VALUES (13, '船13', 'G13', '0', '0', '11000￥', '1');
INSERT INTO `ship_weixiu` VALUES (14, '船14', 'G14', '0', '0', '20000￥', '0');
INSERT INTO `ship_weixiu` VALUES (15, '船15', 'G15', '0', '0', '1500￥', '0');

SET FOREIGN_KEY_CHECKS = 1;
