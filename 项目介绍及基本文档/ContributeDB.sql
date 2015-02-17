
--	用户表

DROP TABLE IF EXISTS user;

CREATE TABLE user(
	userID		int(12)		NOT NULL AUTO_INCREMENT,
	email		VARCHAR(30)	NOT NULL,
	password	VARCHAR(32)	NOT NULL,
	nickName	VARCHAR(50)	DEFAULT NULL,

	age		int(12)		DEFAULT NULL,
	gender		VARCHAR(30)	DEFAULT NULL,
	typeID		int(12)		NOT NULL DEFAULT 4,
	isVerify	VARCHAR(5) 	DEFAULT 'f',
	verifyCode	VARCHAR(200) 	DEFAULT NULL,

	realName	VARCHAR(50) 	DEFAULT '匿名',

	cardID		VARCHAR(50) 	DEFAULT NULL,

	debitCard	VARCHAR(50) 	DEFAULT NULL,
	tellphone	VARCHAR(50)	DEFAULT NULL,
	headPic		VARCHAR(50) 	DEFAULT '../img/user_32.png',

	creatDate	TIMESTAMP	DEFAULT NOW(),
	PRIMARY KEY (userID),
	UNIQUE KEY email (email)
);

--	稿件表

DROP TABLE IF EXISTS contribution;

CREATE TABLE contribution(
	ctbID		int(12)		NOT NULL AUTO_INCREMENT,
	userID		int(12)		NOT NULL,
	title		VARCHAR(30)	NOT NULL,
--	container	VARCHAR(100)	NOT NULL,
	container	longtext COLLATE utf8_czech_ci NOT NULL,
	categoryID	int(12)		NOT NULL,
	upLoadTime	VARCHAR(30)	DEFAULT NULL,
	updateTime	VARCHAR(30)	DEFAULT NULL,
	isJudge		VARCHAR(30)	DEFAULT NULL,
	keywords	VARCHAR(30)	DEFAULT NULL,
	PRIMARY KEY (ctbID)
);

--	稿件类别表

DROP TABLE IF EXISTS category;

CREATE TABLE category(
	categoryID	int(12)		NOT NULL AUTO_INCREMENT,
	categoryName	VARCHAR(30)	NOT NULL,
	parentID	int(12)		NOT NULL,
	PRIMARY KEY (categoryID)
);

--	用户类别表

DROP TABLE IF EXISTS userType;

CREATE TABLE userType(
	typeID		int(12)		NOT NULL AUTO_INCREMENT,
	typeName	VARCHAR(30)	NOT NULL,
	PRIMARY KEY (typeID)
);

--	稿件分派表

DROP TABLE IF EXISTS dispatch;

CREATE TABLE dispatch(
	ctbID		int(12)		NOT NULL,
	expertID	int(12)		NOT NULL,
	PRIMARY KEY (ctbID)
);

--	信息表

DROP TABLE IF EXISTS message;

CREATE TABLE message(
	messageID	int(12)		NOT NULL AUTO_INCREMENT,
	toUserID	int(12)		NOT NULL,
	userID		int(12)		NOT NULL,
	newsID		int(12)		NOT NULL,	
--	存储方式待定
--	text		VARCHAR(100)	NOT NULL,
	text		longtext COLLATE utf8_czech_ci NOT NULL,
	messageTime	int(12)		NOT NULL,
	PRIMARY KEY (messageID)
);


--	用户类别
delete from userType;
truncate table userType;
insert into userType (typeName) values('管理员');
insert into userType (typeName) values('编辑');
insert into userType (typeName) values('专家');
insert into userType (typeName) values('作者');

--	稿件类别表
delete from category;
truncate table category;
insert into category(categoryName,parentID) values('所有稿件',0);
insert into category(categoryName,parentID) values('数据库',1);
insert into category(categoryName,parentID) values('云计算',1);
insert into category(categoryName,parentID) values('大数据',1);
insert into category(categoryName,parentID) values('Web开发',1);