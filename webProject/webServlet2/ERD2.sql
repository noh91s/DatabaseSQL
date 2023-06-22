
/* Drop Tables */

DROP TABLE SYSTEM.ADMIN_TB CASCADE CONSTRAINTS;
DROP TABLE SYSTEM.PRODUCT_TB CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SYSTEM.ADMIN_TB_SEQ;
DROP SEQUENCE SYSTEM.PRODUCT_TB_SEQ;




/* Create Sequences */

CREATE SEQUENCE SYSTEM.ADMIN_TB_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 1 CACHE 20;
CREATE SEQUENCE SYSTEM.PRODUCT_TB_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 1 CACHE 20;



/* Create Tables */

CREATE TABLE SYSTEM.ADMIN_TB
(
	ADMIN_ID  NOT NULL,
	ADMIN_NAME varchar2(100) NOT NULL UNIQUE,
	ADMIN_PASSWORD varchar2(100) NOT NULL,
	CONSTRAINT SYS_C007140 PRIMARY KEY (ADMIN_ID)
);


CREATE TABLE SYSTEM.PRODUCT_TB
(
	PRODUCT_TB_NO  NOT NULL,
	PRODUCT_NAME varchar2(100) NOT NULL,
	PRODUCT_PRICE  NOT NULL,
	PRODUCT_DETAIL varchar2(255) NOT NULL,
	CREATE_DATE date DEFAULT sysdate,
	PRODUCT_ADMIN varchar2(100 char) NOT NULL,
	CONSTRAINT SYS_C007146 PRIMARY KEY (PRODUCT_TB_NO)
);



