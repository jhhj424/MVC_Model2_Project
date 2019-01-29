SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS accompany;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS boardall;
DROP TABLE IF EXISTS member;




/* Create Tables */

CREATE TABLE accompany
(
	id varchar(20) NOT NULL,
	num int NOT NULL,
	chk int,
	PRIMARY KEY (id, num)
);


CREATE TABLE boardall
(
	num int NOT NULL AUTO_INCREMENT,
	id varchar(20) NOT NULL,
	pass int,
	subject varchar(100),
	content varchar(4000),
	country varchar(50),
	loc varchar(50),
	sdate datetime,
	edate datetime,
	maxpno int,
	file1 varchar(100),
	regdate datetime NOT NULL,
	readcnt int,
	recmd int,
	type int NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE comment
(
	cnum int NOT NULL AUTO_INCREMENT,
	num int NOT NULL,
	id varchar(20) NOT NULL,
	comment varchar(4000) NOT NULL,
	regdate datetime NOT NULL,
	recmd int,
	PRIMARY KEY (cnum)
);


CREATE TABLE member
(
	id varchar(20) NOT NULL,
	pass varchar(20),
	name varchar(20),
	gender int(1),
	tel varchar(15),
	email varchar(50),
	picture varchar(200),
	birth datetime,
	address varchar(100),
	remember varchar(50),
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE accompany
	ADD FOREIGN KEY (num)
	REFERENCES boardall (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comment
	ADD FOREIGN KEY (num)
	REFERENCES boardall (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE accompany
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE boardall
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comment
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



