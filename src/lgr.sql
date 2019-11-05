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

 Date: 05/11/2019 09:20:20
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
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_boat
-- ----------------------------
INSERT INTO `ship_boat` VALUES (1, '中国一号', 100, '巨魔', 1572337657, 1572337657, 10, 1);
INSERT INTO `ship_boat` VALUES (56, '诺碗底', 8, '蔡徐坤', 8, 88, 9, 1);
INSERT INTO `ship_boat` VALUES (57, '超级战舰', 2, '有病你就来', 1572595581, 0, 9, 0);
INSERT INTO `ship_boat` VALUES (59, '航空母舰', 1515, '山东大舞台', 1572595642, 0, 2, 0);
INSERT INTO `ship_boat` VALUES (61, '船1', 9, '高音哥', 1572596024, 0, 3, 0);
INSERT INTO `ship_boat` VALUES (65, '船2', 8, '山东大舞台', 1572596127, 0, 6, 1);
INSERT INTO `ship_boat` VALUES (67, '船3', 3, '高音哥', 1572596259, 0, 6, 0);
INSERT INTO `ship_boat` VALUES (69, '船4', 2, '高音哥', 1572596287, 0, 0, 0);
INSERT INTO `ship_boat` VALUES (71, '船5', 12, '山东大舞台', 1572596516, 0, 0, 0);
INSERT INTO `ship_boat` VALUES (73, '船6', 8, '蔡徐坤', 1572597282, 0, 0, 0);
INSERT INTO `ship_boat` VALUES (74, '船7', 8, '蔡徐坤', 1572597298, 0, 2, 1);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_dingdan
-- ----------------------------
INSERT INTO `ship_dingdan` VALUES (1, 0, '燃油', 10, '升', 1572407007);
INSERT INTO `ship_dingdan` VALUES (8, 1, '柴油', 20, '升', 8);
INSERT INTO `ship_dingdan` VALUES (9, 0, '机油', 30, '升', 0);
INSERT INTO `ship_dingdan` VALUES (10, 1, '燃油', 10, '升', 0);
INSERT INTO `ship_dingdan` VALUES (11, 0, '机油', 30, '升', 0);
INSERT INTO `ship_dingdan` VALUES (12, 1, '柴油', 20, '顿', 0);
INSERT INTO `ship_dingdan` VALUES (14, 0, '燃油', 10, '升', 1572857246);
INSERT INTO `ship_dingdan` VALUES (15, 1, '燃油', 10, '升', 1572857296);

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
INSERT INTO `ship_kucun` VALUES (2, '机油', 20, '升');
INSERT INTO `ship_kucun` VALUES (3, '柴油', 30, '升');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_plan
-- ----------------------------
INSERT INTO `ship_plan` VALUES (1, 1, '1572407007', '黄勃树', '超级战舰', '20', 0);
INSERT INTO `ship_plan` VALUES (2, 0, '0', '崔宇光', '航空母舰', '26', 0);
INSERT INTO `ship_plan` VALUES (3, 1, '0', 'G1', '诺碗底', '16', 1);
INSERT INTO `ship_plan` VALUES (4, 0, '0', '小婷婷', '中国一号', '0', 1);
INSERT INTO `ship_plan` VALUES (5, 1, '0', 'G2', '船1', '0', 2);
INSERT INTO `ship_plan` VALUES (6, 1, '0', 'G3', '船2', '0', 1);
INSERT INTO `ship_plan` VALUES (7, 0, '0', 'G4', '船3', '0', 0);
INSERT INTO `ship_plan` VALUES (8, 1, '0', 'G5', '船4', '0', 0);
INSERT INTO `ship_plan` VALUES (9, 0, '0', 'G6', '船5', '0', 0);
INSERT INTO `ship_plan` VALUES (10, 1, '0', 'G7', '船6', '0', 2);
INSERT INTO `ship_plan` VALUES (11, 0, '0', 'G8', '船7', '0', 2);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_tuolun
-- ----------------------------
INSERT INTO `ship_tuolun` VALUES (1, '1', '1', 1572407007, 0);
INSERT INTO `ship_tuolun` VALUES (2, '1', '11', 1, 1);
INSERT INTO `ship_tuolun` VALUES (3, '0', '0', 0, 0);
INSERT INTO `ship_tuolun` VALUES (4, '1', '1', 1, 1);
INSERT INTO `ship_tuolun` VALUES (5, '0', '0', 0, 0);
INSERT INTO `ship_tuolun` VALUES (6, '1', '1', 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_user
-- ----------------------------
INSERT INTO `ship_user` VALUES (1, 'cuiyuguang', '821568758', '崔宇光', 22, '男', 50000, 0, 1572257570, '经理', 1);
INSERT INTO `ship_user` VALUES (2, 'huangboshu', '111', '黄勃树', 18, '男', 58888888, 1, 555855, '员工', 1);
INSERT INTO `ship_user` VALUES (9, '0', '0', '张三', 15, '男', 5656, 0, 1572486737, '经理', 2);
INSERT INTO `ship_user` VALUES (11, '0', '0', 'G8', 23, '男', 669, 1, 1572571444, '经理', 2);
INSERT INTO `ship_user` VALUES (13, '0', '0', 'G7', 21, '女', 55, 0, 1572574046, '员工', 1);
INSERT INTO `ship_user` VALUES (16, '0', '0', 'G6', 23, '女', 26, 1, 1572577101, '员工', 1);
INSERT INTO `ship_user` VALUES (26, '0', '0', 'G5', 15, '男', 99, 0, 1572582484, '员工', 1);
INSERT INTO `ship_user` VALUES (28, '0', '0', 'G4', 16, '男', 889, 0, 1572582501, '员工', 1);
INSERT INTO `ship_user` VALUES (30, '0', '0', 'G3', 9, '男', 3, 1, 1572582553, '员工', 1);
INSERT INTO `ship_user` VALUES (32, '0', '0', 'G2', 2, '女', 2, 1, 1572596168, '员工', 1);
INSERT INTO `ship_user` VALUES (33, '0', '0', 'G1', 16, '女', 65, 0, 1572596168, '员工', 1);
INSERT INTO `ship_user` VALUES (34, '0', '0', '夏洛特', NULL, NULL, NULL, 0, 1572852810, NULL, NULL);
INSERT INTO `ship_user` VALUES (35, '0', '0', NULL, NULL, NULL, NULL, 0, 1572852810, NULL, NULL);
INSERT INTO `ship_user` VALUES (36, '0', '0', NULL, NULL, NULL, NULL, 0, 1572861100, NULL, NULL);
INSERT INTO `ship_user` VALUES (37, '0', '0', NULL, NULL, NULL, NULL, 0, 1572861100, NULL, NULL);
INSERT INTO `ship_user` VALUES (38, '0', '0', NULL, NULL, NULL, NULL, 0, 1572861119, NULL, NULL);
INSERT INTO `ship_user` VALUES (39, '0', '0', NULL, NULL, NULL, NULL, 0, 1572861119, NULL, NULL);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ship_weixiu
-- ----------------------------
INSERT INTO `ship_weixiu` VALUES (1, '爱我的错1', '阿金牢记使命', '0', '1572407007', '50000');
INSERT INTO `ship_weixiu` VALUES (3, '单位房3', '的奋斗改变', '0', '0', '7864351');
INSERT INTO `ship_weixiu` VALUES (4, '船是否大V发布', '的双方各不', '1', '0', '562312');
INSERT INTO `ship_weixiu` VALUES (5, '船附上大V', '的发生变更 ', '0', '0', '6527693');
INSERT INTO `ship_weixiu` VALUES (6, '打击', '得分大V', '1', '0', '5869351');
INSERT INTO `ship_weixiu` VALUES (9, '船大V', '得分点', '0', '1572867547', '889');
INSERT INTO `ship_weixiu` VALUES (13, '单位房3', '的奋斗改变', '1', '1572867622', '12');
INSERT INTO `ship_weixiu` VALUES (14, '船大V', '得分点', '0', '1572867647', '123456789');
INSERT INTO `ship_weixiu` VALUES (15, '9865', '爱氏晨曦v', '1', '1572867676', '777');
INSERT INTO `ship_weixiu` VALUES (16, '船大V', '得分点', '0', '1572867828', '111111111');
INSERT INTO `ship_weixiu` VALUES (17, '船大V', '得分点', '1', '1572867837', '22222222222');
INSERT INTO `ship_weixiu` VALUES (18, '来看看扩扩扩扩扩扩扩', '得分点', '0', '1572867848', '123456789');
INSERT INTO `ship_weixiu` VALUES (19, '959', '44949', '1', '1572867945', '4916');
INSERT INTO `ship_weixiu` VALUES (20, '55', '55', '0', '1572867958', '55');
INSERT INTO `ship_weixiu` VALUES (21, '33', '33', '1', '1572868040', '33');

SET FOREIGN_KEY_CHECKS = 1;
