
--	�û���

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

	realName	VARCHAR(50) 	DEFAULT '����',

	cardID		VARCHAR(50) 	DEFAULT NULL,

	debitCard	VARCHAR(50) 	DEFAULT NULL,
	tellphone	VARCHAR(50)	DEFAULT NULL,
	headPic		VARCHAR(50) 	DEFAULT '../img/user_32.png',

	creatDate	TIMESTAMP	DEFAULT NOW(),
	PRIMARY KEY (userID),
	UNIQUE KEY email (email)
);

--	�����

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

--	�������

DROP TABLE IF EXISTS category;

CREATE TABLE category(
	categoryID	int(12)		NOT NULL AUTO_INCREMENT,
	categoryName	VARCHAR(30)	NOT NULL,
	parentID	int(12)		NOT NULL,
	PRIMARY KEY (categoryID)
);

--	�û�����

DROP TABLE IF EXISTS userType;

CREATE TABLE userType(
	typeID		int(12)		NOT NULL AUTO_INCREMENT,
	typeName	VARCHAR(30)	NOT NULL,
	PRIMARY KEY (typeID)
);

--	������ɱ�

DROP TABLE IF EXISTS dispatch;

CREATE TABLE dispatch(
	ctbID		int(12)		NOT NULL,
	expertID	int(12)		NOT NULL,
	PRIMARY KEY (ctbID)
);

--	��Ϣ��

DROP TABLE IF EXISTS message;

CREATE TABLE message(
	messageID	int(12)		NOT NULL AUTO_INCREMENT,
	toUserID	int(12)		NOT NULL,
	userID		int(12)		NOT NULL,
	newsID		int(12)		NOT NULL,	
--	�洢��ʽ����
--	text		VARCHAR(100)	NOT NULL,
	text		longtext COLLATE utf8_czech_ci NOT NULL,
	messageTime	int(12)		NOT NULL,
	PRIMARY KEY (messageID)
);


--	�û����
delete from userType;
truncate table userType;
insert into userType (typeName) values('����Ա');
insert into userType (typeName) values('�༭');
insert into userType (typeName) values('ר��');
insert into userType (typeName) values('����');

--	�������
delete from category;
truncate table category;
insert into category(categoryName,parentID) values('���и��',0);
insert into category(categoryName,parentID) values('���ݿ�',1);
insert into category(categoryName,parentID) values('�Ƽ���',1);
insert into category(categoryName,parentID) values('������',1);
insert into category(categoryName,parentID) values('Web����',1);