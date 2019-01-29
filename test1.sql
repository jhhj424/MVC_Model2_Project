SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS addboard;
DROP TABLE IF EXISTS boardall;




/* Create Tables */

CREATE TABLE addboard
(
	num int NOT NULL,
	seq int(5) NOT NULL,
	content varchar(1000),
	regdate datetime,
	PRIMARY KEY (num, seq)
);


CREATE TABLE boardall
(
	num int NOT NULL,
	title varchar(200),
	content varchar(4000),
	regdate ,
	PRIMARY KEY (num)
);



/* Create Foreign Keys */

ALTER TABLE addboard
	ADD FOREIGN KEY (num)
	REFERENCES boardall (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



