-- ----------------------------
--  数据库名称为train
-- ---------------------------

-- train.bid definition

CREATE TABLE `bid` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `factoryid` int NOT NULL,
  `bidprice` decimal(8,2) NOT NULL,
  `bidstatus` int NOT NULL DEFAULT '0' COMMENT '1-中标 0-未中标',
  PRIMARY KEY (`ID`),
  KEY `bid_FK` (`orderid`),
  KEY `bid_FK_1` (`factoryid`),
  CONSTRAINT `bid_FK` FOREIGN KEY (`orderid`) REFERENCES `order` (`ID`),
  CONSTRAINT `bid_FK_1` FOREIGN KEY (`factoryid`) REFERENCES `factory` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO train.bid (ID, orderid, factoryid, bidprice, bidstatus) VALUES(1, 1, 2, 100000.00, 1);

-- train.capacity definition

CREATE TABLE `capacity` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `deviceid` int NOT NULL,
  `productid` int NOT NULL,
  `velocity` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `capacity_FK_1` (`productid`),
  KEY `capacity_FK` (`deviceid`),
  CONSTRAINT `capacity_FK` FOREIGN KEY (`deviceid`) REFERENCES `device` (`ID`),
  CONSTRAINT `capacity_FK_1` FOREIGN KEY (`productid`) REFERENCES `product` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO train.capacity (ID, deviceid, productid, velocity) VALUES(1, 1, 1, 50);
INSERT INTO train.capacity (ID, deviceid, productid, velocity) VALUES(2, 2, 1, 40);
INSERT INTO train.capacity (ID, deviceid, productid, velocity) VALUES(3, 2, 2, 50);

-- train.device definition

CREATE TABLE `device` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `typeid` int NOT NULL,
  `devicename` varchar(100) NOT NULL,
  `norms` varchar(100) NOT NULL,
  `describe` varchar(100) DEFAULT NULL,
  `deviceno` varchar(100) NOT NULL,
  `devicestatus` int NOT NULL COMMENT '0-关闭 1-生产中 2-闲置中 3-故障',
  `rentstatus` int NOT NULL COMMENT '0-自用设备  1-租用   2-空闲',
  `factoryid` int DEFAULT NULL COMMENT '为空则不是自用设备',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `device_un` (`deviceno`),
  KEY `device_FK` (`typeid`),
  KEY `device_FK_1` (`factoryid`),
  CONSTRAINT `device_FK` FOREIGN KEY (`typeid`) REFERENCES `device_type` (`ID`),
  CONSTRAINT `device_FK_1` FOREIGN KEY (`factoryid`) REFERENCES `factory` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO train.device (ID, typeid, devicename, norms, `describe`, deviceno, devicestatus, rentstatus, factoryid) VALUES(1, 1, 'PS5车床', '中型', '专用于生产PS5', 'Dno202107061619', 2, 1, 1);
INSERT INTO train.device (ID, typeid, devicename, norms, `describe`, deviceno, devicestatus, rentstatus, factoryid) VALUES(2, 1, 'PS4&PS5车床', '中型', '可以生产PS4也可以生产PS5', 'Dno202107061916', 2, 0, 1);
INSERT INTO train.device (ID, typeid, devicename, norms, `describe`, deviceno, devicestatus, rentstatus, factoryid) VALUES(3, 1, 'PS4车窗', '中型', '专用于生产PS4的车床', 'Dno202107062116', 2, 0, 2);

-- train.device_type definition

CREATE TABLE `device_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) NOT NULL,
  `describe` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO train.device_type (ID, typename, `describe`) VALUES(1, '车床', NULL);

-- train.factory definition

CREATE TABLE `factory` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `factoryname` varchar(100) NOT NULL,
  `introduction` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userid` int NOT NULL,
  `status` int NOT NULL COMMENT '1-正常 2-关停',
  PRIMARY KEY (`ID`),
  KEY `factory_FK` (`userid`),
  CONSTRAINT `factory_FK` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO train.factory (ID, factoryname, introduction, userid, status) VALUES(1, 'cloudfactory', '云工厂管理员所属的工厂', 2, 1);
INSERT INTO train.factory (ID, factoryname, introduction, userid, status) VALUES(2, '山 ', '山高水远', 4, 1);

-- train.`order` definition

CREATE TABLE `order` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `orderno` varchar(100) NOT NULL,
  `productid` int NOT NULL,
  `ordernum` int NOT NULL,
  `deaddate` date DEFAULT NULL,
  `deliverdate` date DEFAULT NULL,
  `orderstatus` int NOT NULL DEFAULT '1' COMMENT '1-保存   2-发布 3-投标结束 4-已排产 5-已完工 6-已发货 7-已收货 8-已完成',
  `factoryid` int NOT NULL,
  `publisherid` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `order_un` (`orderno`),
  KEY `order_FK` (`productid`),
  KEY `order_FK_1` (`factoryid`),
  CONSTRAINT `order_FK` FOREIGN KEY (`productid`) REFERENCES `product` (`ID`),
  CONSTRAINT `order_FK_1` FOREIGN KEY (`factoryid`) REFERENCES `factory` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO train.`order` (ID, orderno, productid, ordernum, deaddate, deliverdate, orderstatus, factoryid, publisherid) VALUES(1, 'Ono202107061128', 1, 2, '2021-07-08', '2021-07-15', 3, 2, 3);
INSERT INTO train.`order` (ID, orderno, productid, ordernum, deaddate, deliverdate, orderstatus, factoryid, publisherid) VALUES(5, 'Ono202107062115', 1, 5, '2021-07-09', '2021-07-18', 3, 2, 3);

-- train.product definition

CREATE TABLE `product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `typeid` int NOT NULL,
  `productname` varchar(100) NOT NULL,
  `norms` varchar(100) NOT NULL,
  `describe` varchar(100) DEFAULT NULL,
  `productno` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `product_un` (`productno`),
  KEY `product_FK` (`typeid`),
  CONSTRAINT `product_FK` FOREIGN KEY (`typeid`) REFERENCES `product_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO train.product (ID, typeid, productname, norms, `describe`, productno) VALUES(1, 1, 'PS5', '家用型', '打游戏很爽的哦', 'Pno202107061126');
INSERT INTO train.product (ID, typeid, productname, norms, `describe`, productno) VALUES(2, 1, 'PS4', '家用型', '打游戏一般般爽的哦', 'Pno202107061915');

-- train.product_type definition

CREATE TABLE `product_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) NOT NULL,
  `describe` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO train.product_type (ID, typename, `describe`) VALUES(1, '游戏机', NULL);

-- train.rent definition

CREATE TABLE `rent` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `begindate` date NOT NULL,
  `enddate` date NOT NULL,
  `length` int NOT NULL,
  `deviceid` int NOT NULL,
  `factoryid` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `rent_FK` (`factoryid`),
  KEY `rent_FK_1` (`deviceid`),
  CONSTRAINT `rent_FK` FOREIGN KEY (`factoryid`) REFERENCES `factory` (`ID`),
  CONSTRAINT `rent_FK_1` FOREIGN KEY (`deviceid`) REFERENCES `device` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO train.rent (ID, begindate, enddate, `length`, deviceid, factoryid) VALUES(1, '2021-07-07', '2021-07-13', 6, 1, 1);

-- train.`role` definition

CREATE TABLE `role` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `rolename` varchar(100) NOT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO train.`role` (ID, rolename, remark) VALUES(1, '管理员', '管理系统内的事务');
INSERT INTO train.`role` (ID, rolename, remark) VALUES(2, '云工厂管理员', '管理所属工厂相关信息');
INSERT INTO train.`role` (ID, rolename, remark) VALUES(3, '经销商', '可以发布订单');

-- train.schedule definition

CREATE TABLE `schedule` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `deviceid` int NOT NULL,
  `begindate` date NOT NULL,
  `enddate` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `scheduling_FK` (`orderid`),
  KEY `scheduling_FK_1` (`deviceid`),
  CONSTRAINT `scheduling_FK` FOREIGN KEY (`orderid`) REFERENCES `order` (`ID`),
  CONSTRAINT `scheduling_FK_1` FOREIGN KEY (`deviceid`) REFERENCES `device` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO train.schedule (ID, orderid, deviceid, begindate, enddate) VALUES(1, 1, 3, '2021-07-06', '2021-07-25');

-- train.userinfo definition

CREATE TABLE `userinfo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `account` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `roleid` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `userinfo_un` (`account`),
  KEY `userinfo_FK_1` (`roleid`),
  CONSTRAINT `userinfo_FK_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO train.userinfo (ID, account, password, username, mobile, roleid) VALUES(1, 'admin1', 'admin1', 'admin1', '159753195', 1);
INSERT INTO train.userinfo (ID, account, password, username, mobile, roleid) VALUES(2, 'factory', 'factory', '云工厂管理员', '14516156151', 2);
INSERT INTO train.userinfo (ID, account, password, username, mobile, roleid) VALUES(3, 'dealer', 'dealer', '经销商', '15465156148', 3);
INSERT INTO train.userinfo (ID, account, password, username, mobile, roleid) VALUES(4, 'cloudfactory', 'cloudfactory', 'cloudfactory', '1111111111', 2);
