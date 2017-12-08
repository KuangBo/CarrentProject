DROP TABLE admin PURGE ;
DROP TABLE trade PURGE ;
DROP TABLE car PURGE ;
DROP TABLE customer PURGE ;

--车辆信息表
CREATE TABLE car (
	cid			NUMBER(4) NOT NULL,		--汽车编号
	brand		VARCHAR2(32),			--汽车品牌
	model		VARCHAR2(32),			--汽车型号
	state		NUMBER(1) NOT NULL,		--汽车状态，是否可以出租，1代表可以出租，0表示不可以出租
	baseprice	NUMBER(7,2),			--押金
	carrent		NUMBER(7,2),			--租金(元/天)
	CONSTRAINT pk_cid PRIMARY KEY(cid)
) ;
--顾客信息表
CREATE TABLE customer (
	cusid		NUMBER(4) NOT NULL,
	cusname		VARCHAR2(32),
	idcard		VARCHAR2(50),
	password	VARCHAR2(32),
	cusphone	VARCHAR2(32),
	balance		NUMBER(9),
	CONSTRAINT pk_cusid PRIMARY KEY(cusid)
) ;
--交易记录表
CREATE TABLE trade (
	id				NUMBER(9) NOT NULL,
	money			NUMBER(7,2),			--交易金额
	startdate		DATE,					--交易开始时间
	enddate 		DATE,					--交易结束时间
	cusid			NUMBER(4),				--顾客编号
	cid				NUMBER(4),				--汽车编号
	state			NUMBER(1) NOT NULL,		--标志位，确定该交易记录是否有效
	CONSTRAINT pk_id PRIMARY KEY(id),
	CONSTRAINT fk_cusid FOREIGN KEY(cusid) REFERENCES customer(cusid),
	CONSTRAINT fk_cid FOREIGN KEY(cid) REFERENCES car(cid)
) ;
--后台管理员表
CREATE TABLE admin (
	aid				VARCHAR2(32),
	password		VARCHAR2(32),
	CONSTRAINT pk_aid PRIMARY KEY(aid)
) ;

--测试数据
--汽车信息表
INSERT INTO car(cid,brand,model,state,baseprice,carrent) VALUES(1000,'大众','途观',0,9000,2000);
INSERT INTO car(cid,brand,model,state,baseprice,carrent) VALUES(1001,'大众','途观L',0,8500,3200);
INSERT INTO car(cid,brand,model,state,baseprice,carrent) VALUES(1002,'大众','途昂',0,8000,4000);
INSERT INTO car(cid,brand,model,state,baseprice,carrent) VALUES(2000,'丰田','威驰',1,5000,3500);
INSERT INTO car(cid,brand,model,state,baseprice,carrent) VALUES(3000,'奥迪','奥迪A3',0,7000,4500);
INSERT INTO car(cid,brand,model,state,baseprice,carrent) VALUES(3001,'奥迪','奥迪S6',0,7500,3000);
--顾客信息表
INSERT INTO customer(cusid,cusname,idcard,password,cusphone,balance) VALUES(8000,'Tom','37032319971020123X','1232','17652393507',100);
INSERT INTO customer(cusid,cusname,idcard,password,cusphone,balance) VALUES(8001,'Smith','370323198701252419','2419','18753653507',100);
INSERT INTO customer(cusid,cusname,idcard,password,cusphone,balance) VALUES(8002,'Bob','370323199502213601','3601','18853393620',100);
INSERT INTO customer(cusid,cusname,idcard,password,cusphone,balance) VALUES(8003,'Johe','370323198607305301','5301','18865530315',100);
INSERT INTO customer(cusid,cusname,idcard,password,cusphone,balance) VALUES(8004,'Ford','370323198610114137','4137','18773402720',100);

--交易记录表
INSERT INTO trade(id,money,startdate,enddate,cusid,cid,state) VALUES(5000,2000,to_date('2017-11-17','YYYY-MM-DD'),to_date('2017-11-18','YYYY-MM-DD'),8000,1000,0);
INSERT INTO trade(id,money,startdate,enddate,cusid,cid,state) VALUES(5001,5000,to_date('2017-11-17','YYYY-MM-DD'),to_date('2017-11-17','YYYY-MM-DD'),8001,2000,1);

--后台管理员表
INSERT INTO admin(aid,password) VALUES ('admin','hello') ;