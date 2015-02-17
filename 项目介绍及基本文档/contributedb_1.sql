/*
MySQL Data Transfer
Source Host: localhost
Source Database: contributedb
Target Host: localhost
Target Database: contributedb
Date: 2013/1/8 0:13:08
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryID` int(12) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `parentID` int(12) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for contribution
-- ----------------------------
DROP TABLE IF EXISTS `contribution`;
CREATE TABLE `contribution` (
  `ctbID` int(12) NOT NULL AUTO_INCREMENT,
  `userID` int(12) NOT NULL,
  `title` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `container` longtext CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `categoryID` int(12) NOT NULL,
  `upLoadTime` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updateTime` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isJudge` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ctbID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for dispatch
-- ----------------------------
DROP TABLE IF EXISTS `dispatch`;
CREATE TABLE `dispatch` (
  `ctbID` int(12) NOT NULL,
  `expertID` int(12) NOT NULL,
  PRIMARY KEY (`ctbID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageID` int(12) NOT NULL AUTO_INCREMENT,
  `toUserID` int(12) NOT NULL,
  `userID` int(12) NOT NULL,
  `newsID` int(12) NOT NULL,
  `text` longtext CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `messageTime` int(12) NOT NULL,
  PRIMARY KEY (`messageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` int(12) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `nickName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(12) DEFAULT NULL,
  `gender` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `typeID` int(12) NOT NULL DEFAULT '4',
  `isVerify` varchar(5) COLLATE utf8_unicode_ci DEFAULT 'f',
  `verifyCode` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realName` varchar(50) COLLATE utf8_unicode_ci DEFAULT '匿名',
  `cardID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debitCard` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tellphone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headPic` varchar(50) COLLATE utf8_unicode_ci DEFAULT '../img/user_32.png',
  `creatDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for usertype
-- ----------------------------
DROP TABLE IF EXISTS `usertype`;
CREATE TABLE `usertype` (
  `typeID` int(12) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `category` VALUES ('1', '所有稿件', '0');
INSERT INTO `category` VALUES ('2', '数据库', '1');
INSERT INTO `category` VALUES ('3', '云计算', '1');
INSERT INTO `category` VALUES ('4', '大数据', '1');
INSERT INTO `category` VALUES ('5', 'Web开发', '1');
INSERT INTO `category` VALUES ('6', 'SQL Server', '2');
INSERT INTO `category` VALUES ('7', 'MySQL', '2');
INSERT INTO `category` VALUES ('8', 'Oracle', '2');
INSERT INTO `category` VALUES ('9', '云存储', '3');
INSERT INTO `category` VALUES ('10', '云计算', '3');
INSERT INTO `category` VALUES ('11', '云安全', '3');
INSERT INTO `category` VALUES ('12', '大数据挖掘', '4');
INSERT INTO `category` VALUES ('13', '大数据分析', '4');
INSERT INTO `category` VALUES ('14', '大数据计算', '4');
INSERT INTO `category` VALUES ('15', 'J2EE', '5');
INSERT INTO `category` VALUES ('16', '.NET/C#', '5');
INSERT INTO `category` VALUES ('17', 'PHP', '5');
INSERT INTO `category` VALUES ('18', 'ASP', '5');
INSERT INTO `contribution` VALUES ('13', '4', '数据库系统概论.doc', 'D://Tools/Tomcat 6.0/webapps/cs/file', '2', 'Fri Jan 04 11:02:15 CST 2013', 't', null, '数据库基础');
INSERT INTO `dispatch` VALUES ('13', '3');
INSERT INTO `user` VALUES ('1', 'tjurac.gp@gmail.com', 'C056Dl/oStNftflbnO6seQ==', '非舟', '24', 'male', '1', 'f', 'MTIzOTdlZTYtYjFlNC00OTZhLTllZDEtYTk0NjZkMjdkNDI5LTE=', '郭鹏', '120114198811170011', '6228480020512387', '13642181400', '../headPic/user.jpg', '2012-12-29 15:17:05');
INSERT INTO `user` VALUES ('2', 'hsy@sina.com', '4QrcOUm6Wau+VuBX8g+IPg==', 'HSY', '21', '女', '2', 'f', 'OWQ0NjcyNmEtYjQ4YS00NDg1LWE2OGYtZWY0MTMwOGJkZGM2LTI=', '胡寿英', '12121212121212', '23232323232', '13413415141', '../img/user_32.png', '2012-12-29 15:28:00');
INSERT INTO `user` VALUES ('3', 'jh@sina.com', '4QrcOUm6Wau+VuBX8g+IPg==', 'JH', '29', '男', '3', 'f', 'YzkyNGU0MWItNTVlYi00YzIyLTkyYzAtYTU1NDc2MGY4Y2ExLTM=', '蒋辉', '12414313241', '111111111', '15122264235', '../img/user_32.png', '2012-12-29 15:28:28');
INSERT INTO `user` VALUES ('4', 'gp@gmail.com', 'C056Dl/oStNftflbnO6seQ==', 'GP', '24', 'male', '4', 'f', 'NmU1MjQ3MjItMDQwMS00MTg3LThjNGItNmE2ZDIyZjQxZGZlLTQ=', '郭鹏', '120114198811170011', '6228480012131442', '13642181400', '../img/user_32.png', '2012-12-29 15:28:57');
INSERT INTO `user` VALUES ('5', 'zsn@gmail.com', 'C056Dl/oStNftflbnO6seQ==', 'ZSN', '24', 'male', '4', 'f', 'ODhjNWY3ZTktNDRiYi00MWNiLTkyOWMtMzgwMDZmNTgxNTM4LTU=', '张胜楠', '120114198810100010', '62284800121313414', '15887860437', '../headPic/user.jpg', '2012-12-29 17:40:19');
INSERT INTO `user` VALUES ('7', 'wx@sina.com', '4QrcOUm6Wau+VuBX8g+IPg==', 'WX', '50', '男', '3', 'f', 'ODJmNWVlNmItYTFkNi00ZTRlLWEzYTItZWUxZjJjZjQ4MzQ5LTc=', 'wx', '12414313241', '22222222222', '022-1234', '../img/user_32.png', '2012-12-30 13:34:52');
INSERT INTO `usertype` VALUES ('1', '管理员');
INSERT INTO `usertype` VALUES ('2', '编辑');
INSERT INTO `usertype` VALUES ('3', '专家');
INSERT INTO `usertype` VALUES ('4', '作者');
