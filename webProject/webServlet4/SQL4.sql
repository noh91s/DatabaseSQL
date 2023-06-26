
/* Drop Tables */

DROP TABLE board0626 CASCADE CONSTRAINTS;
DROP TABLE member0626 CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE board0626
(
	board0626_id number NOT NULL,
	board_title varchar2(100 char) NOT NULL,
	board_content varchar2(255 char) NOT NULL,
	board_writer varchar2(100 char) NOT NULL,
	create_date date DEFAULT sysdate NOT NULL,
	email varchar2(100 char) NOT NULL UNIQUE,
	PRIMARY KEY (board0626_id)
);


CREATE TABLE member0626
(
	member0626_id number NOT NULL,
	name varchar2(100 char) NOT NULL,
	password varchar2(100 char) NOT NULL,
	email varchar2(100 char) NOT NULL UNIQUE,
	create_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (member0626_id)
);



/* Create Foreign Keys */

ALTER TABLE board0626
	ADD FOREIGN KEY (email)
	REFERENCES member0626 (email)
;



