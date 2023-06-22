
/* Drop Tables */

DROP TABLE board1 CASCADE CONSTRAINTS;
DROP TABLE member1 CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE board1
(
	board1_id number NOT NULL,
	title varchar2(100 char) NOT NULL,
	content varchar2(255) NOT NULL,
	writer varchar2(100 char) NOT NULL,
	create_date date DEFAULT sysdate NOT NULL,
	member_id number NOT NULL,
	PRIMARY KEY (board1_id)
);


CREATE TABLE member1
(
	member_id number NOT NULL,
	name varchar2(100 char) NOT NULL,
	email varchar2(255 char) NOT NULL UNIQUE,
	password varchar2(100 char) NOT NULL,
	create_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (member_id)
);



/* Create Foreign Keys */

ALTER TABLE board1
	ADD FOREIGN KEY (member_id)
	REFERENCES member1 (member_id)
;



