SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS duck;
DROP TABLE IF EXISTS matching;
DROP TABLE IF EXISTS recmd;
DROP TABLE IF EXISTS recomment;
DROP TABLE IF EXISTS Board;
DROP TABLE IF EXISTS User;




/* Create Tables */

CREATE TABLE Board
(
	boardnum int NOT NULL AUTO_INCREMENT,
	userid varchar(50) NOT NULL,
	boardtype int NOT NULL,
	subject varchar(50) NOT NULL,
	content varchar(5000) NOT NULL,
	regdate datetime NOT NULL,
	readcnt int,
	recmd int,
	file1 varchar(300),
	pic varchar(300),
	usetech varchar(100),
	price int,
	schedule int,
	PRIMARY KEY (boardnum)
);


CREATE TABLE duck
(
	userid varchar(50) NOT NULL,
	boardnum int NOT NULL,
	PRIMARY KEY (userid, boardnum)
);


CREATE TABLE matching
(
	num int NOT NULL AUTO_INCREMENT,
	userid varchar(50) NOT NULL,
	boardnum int NOT NULL,
	confrim int NOT NULL,
	price int,
	PRIMARY KEY (num)
);


CREATE TABLE recmd
(
	userid varchar(50) NOT NULL,
	boardnum int NOT NULL,
	PRIMARY KEY (userid, boardnum)
);


CREATE TABLE recomment
(
	num int NOT NULL AUTO_INCREMENT,
	userid varchar(50) NOT NULL,
	boardnum int NOT NULL,
	content varchar(500) NOT NULL,
	recmd int,
	ref int,
	refstep int,
	reflevel int,
	PRIMARY KEY (num)
);


CREATE TABLE User
(
	userid varchar(50) NOT NULL,
	pass varchar(300) NOT NULL,
	address varchar(100) NOT NULL,
	tel varchar(20) NOT NULL,
	birth date NOT NULL,
	type varchar(20) NOT NULL,
	businessnum varchar(20),
	usetech varchar(100),
	creditnum varchar(30),
	creditpass varchar(300),
	rating int,
	matching int,
	PRIMARY KEY (userid)
);



/* Create Foreign Keys */

ALTER TABLE duck
	ADD FOREIGN KEY (boardnum)
	REFERENCES Board (boardnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE matching
	ADD FOREIGN KEY (boardnum)
	REFERENCES Board (boardnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE recmd
	ADD FOREIGN KEY (boardnum)
	REFERENCES Board (boardnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE recomment
	ADD FOREIGN KEY (boardnum)
	REFERENCES Board (boardnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Board
	ADD FOREIGN KEY (userid)
	REFERENCES User (userid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE duck
	ADD FOREIGN KEY (userid)
	REFERENCES User (userid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE matching
	ADD FOREIGN KEY (userid)
	REFERENCES User (userid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE recmd
	ADD FOREIGN KEY (userid)
	REFERENCES User (userid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE recomment
	ADD FOREIGN KEY (userid)
	REFERENCES User (userid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



