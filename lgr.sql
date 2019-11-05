-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.26 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 lgr 的数据库结构
CREATE DATABASE IF NOT EXISTS `lgr` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lgr`;


-- 导出  表 lgr.ship_boat 结构
CREATE TABLE IF NOT EXISTS `ship_boat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '0' COMMENT '船名',
  `money` int(11) DEFAULT '0' COMMENT '价格',
  `people` varchar(50) DEFAULT '0' COMMENT '管理者',
  `dataline` int(11) DEFAULT '0' COMMENT '购买时间',
  `updatedata` int(11) DEFAULT '0' COMMENT '最后维修时间',
  `num` int(11) DEFAULT '0' COMMENT '出航次数',
  `status` int(11) DEFAULT '0' COMMENT '状态0：待出航 1：出航',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 正在导出表  lgr.ship_boat 的数据：~11 rows (大约)
/*!40000 ALTER TABLE `ship_boat` DISABLE KEYS */;
INSERT INTO `ship_boat` (`id`, `name`, `money`, `people`, `dataline`, `updatedata`, `num`, `status`) VALUES
	(1, '中国一号', 100, 'G1', 1572337657, 1572337657, 10, 1),
	(56, '诺碗底', 8, 'G2', 8, 88, 9, 1),
	(57, '超级战舰', 2, 'G5', 1572595581, 0, 9, 0),
	(59, '航空母舰', 1515, 'G4', 1572595642, 0, 2, 0),
	(61, '船1', 9, 'G7', 1572596024, 0, 3, 0),
	(65, '船2', 8, 'G3', 1572596127, 0, 6, 1);
/*!40000 ALTER TABLE `ship_boat` ENABLE KEYS */;


-- 导出  表 lgr.ship_dingdan 结构
CREATE TABLE IF NOT EXISTS `ship_dingdan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0出货 1进货',
  `name` varchar(50) DEFAULT NULL COMMENT '货物名',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `util` varchar(50) DEFAULT NULL COMMENT '单位',
  `dataline` int(11) DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 正在导出表  lgr.ship_dingdan 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `ship_dingdan` DISABLE KEYS */;
INSERT INTO `ship_dingdan` (`id`, `type`, `name`, `num`, `util`, `dataline`) VALUES
	(1, 0, '燃油', 10, '升', 1572407007),
	(8, 1, '柴油', 20, '升', 8),
	(9, 0, '机油', 30, '升', 0),
	(10, 1, '燃油', 10, '升', 0),
	(11, 0, '机油', 30, '升', 0),
	(12, 1, '柴油', 20, '顿', 0),
	(14, 0, '燃油', 10, '升', 1572857246),
	(15, 1, '燃油', 10, '升', 1572857296);
/*!40000 ALTER TABLE `ship_dingdan` ENABLE KEYS */;


-- 导出  表 lgr.ship_kucun 结构
CREATE TABLE IF NOT EXISTS `ship_kucun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0' COMMENT '货物名',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '剩余数量',
  `util` varchar(50) NOT NULL DEFAULT '0' COMMENT '单位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 正在导出表  lgr.ship_kucun 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `ship_kucun` DISABLE KEYS */;
INSERT INTO `ship_kucun` (`id`, `name`, `num`, `util`) VALUES
	(1, '燃油', 10, '升'),
	(2, '机油', 20, '升'),
	(3, '柴油', 30, '升');
/*!40000 ALTER TABLE `ship_kucun` ENABLE KEYS */;


-- 导出  表 lgr.ship_plan 结构
CREATE TABLE IF NOT EXISTS `ship_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0出航1入航',
  `dataline` varchar(225) NOT NULL DEFAULT '0' COMMENT '时间戳',
  `people` varchar(225) NOT NULL DEFAULT '0' COMMENT '申请人',
  `boat` varchar(225) NOT NULL DEFAULT '0' COMMENT '申请船只',
  `oil` varchar(225) NOT NULL DEFAULT '0' COMMENT '所需燃油',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0：未通过1：已通过2：已拒绝',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 正在导出表  lgr.ship_plan 的数据：~11 rows (大约)
/*!40000 ALTER TABLE `ship_plan` DISABLE KEYS */;
INSERT INTO `ship_plan` (`id`, `type`, `dataline`, `people`, `boat`, `oil`, `status`) VALUES
	(3, 1, '0', 'G1', '诺碗底', '16', 1),
	(5, 1, '0', 'G2', '船1', '0', 2),
	(6, 1, '0', 'G3', '船2', '0', 1),
	(7, 0, '0', 'G4', '船3', '0', 0),
	(8, 1, '0', 'G5', '船4', '0', 0),
	(9, 0, '0', 'G6', '船5', '0', 0),
	(10, 1, '0', 'G7', '船6', '0', 2),
	(11, 0, '0', 'G8', '船7', '0', 2);
/*!40000 ALTER TABLE `ship_plan` ENABLE KEYS */;


-- 导出  表 lgr.ship_post 结构
CREATE TABLE IF NOT EXISTS `ship_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post` varchar(50) DEFAULT NULL COMMENT '职位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 正在导出表  lgr.ship_post 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `ship_post` DISABLE KEYS */;
INSERT INTO `ship_post` (`id`, `post`) VALUES
	(1, '员工'),
	(2, '经理');
/*!40000 ALTER TABLE `ship_post` ENABLE KEYS */;


-- 导出  表 lgr.ship_tuolun 结构
CREATE TABLE IF NOT EXISTS `ship_tuolun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boat` varchar(50) NOT NULL DEFAULT '0' COMMENT '船只名',
  `people` varchar(50) DEFAULT NULL COMMENT '负责员工',
  `dataline` int(11) DEFAULT NULL COMMENT '时间',
  `status` int(11) DEFAULT NULL COMMENT '任务状态0未完成1已完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 正在导出表  lgr.ship_tuolun 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `ship_tuolun` DISABLE KEYS */;
INSERT INTO `ship_tuolun` (`id`, `boat`, `people`, `dataline`, `status`) VALUES
	(1, '1', '1', 1572407007, 0),
	(2, '1', '11', 1, 1),
	(3, '0', '0', 0, 0),
	(4, '1', '1', 1, 1),
	(5, '0', '0', 0, 0),
	(6, '1', '1', 1, 1);
/*!40000 ALTER TABLE `ship_tuolun` ENABLE KEYS */;


-- 导出  表 lgr.ship_user 结构
CREATE TABLE IF NOT EXISTS `ship_user` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '0' COMMENT '账号',
  `pwd` varchar(50) NOT NULL DEFAULT '0' COMMENT '密码',
  `name` varchar(50) DEFAULT NULL COMMENT '名字',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `sal` int(11) DEFAULT NULL COMMENT '工资',
  `status` int(11) DEFAULT NULL COMMENT '状态0无任务 1有任务',
  `dataline` int(11) DEFAULT NULL COMMENT '入职时间戳',
  `post` varchar(50) DEFAULT NULL COMMENT '职位',
  `list` int(11) DEFAULT NULL COMMENT '只为优先级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 正在导出表  lgr.ship_user 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `ship_user` DISABLE KEYS */;
INSERT INTO `ship_user` (`id`, `username`, `pwd`, `name`, `age`, `sex`, `sal`, `status`, `dataline`, `post`, `list`) VALUES
	(9, '0', '0', '张三', 15, '男', 5656, 0, 1572486737, '经理', 2),
	(11, '0', '0', 'G8', 23, '男', 669, 1, 1572571444, '经理', 2),
	(13, '0', '0', 'G7', 21, '女', 55, 0, 1572574046, '员工', 1),
	(16, '0', '0', 'G6', 23, '女', 26, 1, 1572577101, '员工', 1),
	(26, '0', '0', 'G5', 15, '男', 99, 0, 1572582484, '员工', 1),
	(28, '0', '0', 'G4', 16, '男', 889, 0, 1572582501, '员工', 1),
	(30, '0', '0', 'G3', 9, '男', 3, 1, 1572582553, '员工', 1),
	(32, '0', '0', 'G2', 2, '女', 2, 1, 1572596168, '员工', 1),
	(33, '0', '0', 'G1', 16, '女', 65, 0, 1572596168, '员工', 1),
	(34, '0', '0', '夏洛特', NULL, NULL, NULL, 0, 1572852810, NULL, NULL),
	(35, '0', '0', NULL, NULL, NULL, NULL, 0, 1572852810, NULL, NULL),
	(36, '0', '0', NULL, NULL, NULL, NULL, 0, 1572861100, NULL, NULL),
	(37, '0', '0', NULL, NULL, NULL, NULL, 0, 1572861100, NULL, NULL),
	(38, '0', '0', NULL, NULL, NULL, NULL, 0, 1572861119, NULL, NULL),
	(39, '0', '0', NULL, NULL, NULL, NULL, 0, 1572861119, NULL, NULL);
/*!40000 ALTER TABLE `ship_user` ENABLE KEYS */;


-- 导出  表 lgr.ship_weixiu 结构
CREATE TABLE IF NOT EXISTS `ship_weixiu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boat` varchar(50) NOT NULL DEFAULT '0' COMMENT '机器名',
  `people` varchar(50) NOT NULL DEFAULT '0' COMMENT '负责人',
  `status` varchar(50) NOT NULL DEFAULT '0' COMMENT '状态0未完成1已完成',
  `dataline` varchar(50) NOT NULL DEFAULT '0' COMMENT '维修时间',
  `money` varchar(50) NOT NULL DEFAULT '0' COMMENT '维修金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 正在导出表  lgr.ship_weixiu 的数据：~15 rows (大约)
/*!40000 ALTER TABLE `ship_weixiu` DISABLE KEYS */;
INSERT INTO `ship_weixiu` (`id`, `boat`, `people`, `status`, `dataline`, `money`) VALUES
	(1, '爱我的错1', 'G1', '0', '1572407007', '50000'),
	(3, '单位房3', 'G2', '0', '0', '7864351'),
	(4, '船是否大V发布', 'G2', '1', '0', '562312'),
	(5, '船附上大V', 'G3', '0', '0', '6527693'),
	(6, '打击', 'G4', '1', '0', '5869351'),
	(9, '船大V', 'G6', '0', '1572867547', '889'),
	(13, '单位房3', 'G7', '1', '1572867622', '12');
/*!40000 ALTER TABLE `ship_weixiu` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
