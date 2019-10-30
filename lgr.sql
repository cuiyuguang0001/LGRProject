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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  lgr.ship_boat 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `ship_boat` DISABLE KEYS */;
INSERT INTO `ship_boat` (`id`, `name`, `money`, `people`, `dataline`, `updatedata`, `num`, `status`) VALUES
	(1, '中国一号', 1000000, '巨魔', 1572337657, 1572337657, 0, 0);
/*!40000 ALTER TABLE `ship_boat` ENABLE KEYS */;


-- 导出  表 lgr.ship_dingdan 结构
CREATE TABLE IF NOT EXISTS `ship_dingdan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0出货 1进货',
  `name` varchar(50) DEFAULT NULL COMMENT '货物名',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `util` varchar(50) DEFAULT NULL COMMENT '单位',
  `dataline` int(11) DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  lgr.ship_dingdan 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `ship_dingdan` DISABLE KEYS */;
INSERT INTO `ship_dingdan` (`id`, `type`, `name`, `num`, `util`, `dataline`) VALUES
	(1, 0, '燃油', 50, '升', 1572407007);
/*!40000 ALTER TABLE `ship_dingdan` ENABLE KEYS */;


-- 导出  表 lgr.ship_kucun 结构
CREATE TABLE IF NOT EXISTS `ship_kucun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0' COMMENT '货物名',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '剩余数量',
  `util` varchar(50) NOT NULL DEFAULT '0' COMMENT '单位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  lgr.ship_kucun 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `ship_kucun` DISABLE KEYS */;
INSERT INTO `ship_kucun` (`id`, `name`, `num`, `util`) VALUES
	(1, '燃油', 50, '升');
/*!40000 ALTER TABLE `ship_kucun` ENABLE KEYS */;


-- 导出  表 lgr.ship_plan 结构
CREATE TABLE IF NOT EXISTS `ship_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0出航1入航',
  `dataline` int(11) NOT NULL DEFAULT '0' COMMENT '时间戳',
  `people` int(11) NOT NULL DEFAULT '0' COMMENT '申请人',
  `boat` int(11) NOT NULL DEFAULT '0' COMMENT '申请船只',
  `oil` int(11) NOT NULL DEFAULT '0' COMMENT '所需燃油',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0：未通过1：已通过2：已拒绝',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  lgr.ship_plan 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `ship_plan` DISABLE KEYS */;
INSERT INTO `ship_plan` (`id`, `type`, `dataline`, `people`, `boat`, `oil`, `status`) VALUES
	(1, 0, 1572407007, 1, 1, 20, 1);
/*!40000 ALTER TABLE `ship_plan` ENABLE KEYS */;


-- 导出  表 lgr.ship_post 结构
CREATE TABLE IF NOT EXISTS `ship_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post` varchar(50) DEFAULT NULL COMMENT '职位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  lgr.ship_tuolun 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `ship_tuolun` DISABLE KEYS */;
INSERT INTO `ship_tuolun` (`id`, `boat`, `people`, `dataline`, `status`) VALUES
	(1, '1', '1', 1572407007, 0);
/*!40000 ALTER TABLE `ship_tuolun` ENABLE KEYS */;


-- 导出  表 lgr.ship_user 结构
CREATE TABLE IF NOT EXISTS `ship_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  lgr.ship_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `ship_user` DISABLE KEYS */;
INSERT INTO `ship_user` (`id`, `username`, `pwd`, `name`, `age`, `sex`, `sal`, `status`, `dataline`, `post`, `list`) VALUES
	(1, 'cuiyuguang', '821568758', '崔宇光', 22, '男', 50000, 0, 1572257570, '经理', 1);
/*!40000 ALTER TABLE `ship_user` ENABLE KEYS */;


-- 导出  表 lgr.ship_weixiu 结构
CREATE TABLE IF NOT EXISTS `ship_weixiu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boat` varchar(50) NOT NULL DEFAULT '0' COMMENT '机器名',
  `people` varchar(50) NOT NULL DEFAULT '0' COMMENT '负责人',
  `status` varchar(50) NOT NULL DEFAULT '0' COMMENT '状态0未完成1已完成',
  `dataline` varchar(50) NOT NULL DEFAULT '0' COMMENT '维修时间',
  `money` varchar(50) NOT NULL DEFAULT '0' COMMENT '维修金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  lgr.ship_weixiu 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `ship_weixiu` DISABLE KEYS */;
INSERT INTO `ship_weixiu` (`id`, `boat`, `people`, `status`, `dataline`, `money`) VALUES
	(1, '1', '1', '0', '1572407007', '50000');
/*!40000 ALTER TABLE `ship_weixiu` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
