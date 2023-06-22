-- 계정확인
select * from all_users;

create user user2 identified by 1111;
grant connect, resource, dba to user2;
revoke connect, resource, dba from user2;
drop user user2 cascade;
commit;


/* Drop Tables */

DROP TABLE admin_tb;
DROP TABLE product_tb;




/* Create Tables */

CREATE TABLE admin_tb
(
	admin_id number NOT NULL,
	admin_name varchar2(100 char) NOT NULL UNIQUE,
	admin_password varchar2(100 char) NOT NULL,
	PRIMARY KEY (admin_id)
);
-- 테이블 이름 변경
alter table admin_tb rename to admin_tb2;
alter table admin_tb2 rename to admin_tb;
desc admin_tb;
desc admin_tb2;

CREATE TABLE product_tb
(
	product_tb_no number NOT NULL,
	product_name varchar2(100 char) NOT NULL,
	product_price number NOT NULL,
	product_detail varchar2(255 char) NOT NULL,
	create_date date DEFAULT sysdate,
	PRIMARY KEY (product_tb_no)
);
-- 칼럼을 수정
alter table product_tb modify product_name char(100 char);
alter table product_tb modify product_name varchar2(100 char);
-- 칼럼을 추가 -> 외래키설정을 할 경우 참조되는 테이블의 기본키 또는 기본키성질의 칼럼 타입과 같아야된다
alter table product_tb add product_admin varchar2(100) NOT NULL;

desc product_tb;
-- 외래키(FK)설정
alter table product_tb 
add foreign key(PRODUCT_ADMIN) 
REFERENCES admin_tb(admin_name);

-- 시퀀스 생성
drop sequence admin_tb_seq;
create sequence admin_tb_seq
increment by 1
start with 1
nocycle;

drop sequence product_tb_seq;
create sequence product_tb_seq
increment by 1
start with 1
nocycle;

-- 상품은 관리자로 등록되어있는 사람만 등록 가능
-- 상품등록 -> 외래키는 기본키에 있는 값만 추가 할 수 있다 -> 참조 무결성 위반
insert into product_tb(product_tb_no,product_name,product_price,product_detail,product_admin)
values(product_tb_seq.nextval,'상품1','10000','상품1상세내역','admin1');
insert into product_tb(product_tb_no,product_name,product_price,product_detail,product_admin)
values(product_tb_seq.nextval,'상품2','20000','상품2상세내역','admin1');
insert into product_tb(product_tb_no,product_name,product_price,product_detail,product_admin)
values(product_tb_seq.nextval,'상품3','30000','상품3상세내역','admin2');
insert into product_tb(product_tb_no,product_name,product_price,product_detail,product_admin)
values(product_tb_seq.nextval,'상품4','40000','상품4상세내역','admin3');
insert into admin_tb(admin_id,admin_name,admin_password)
values(admin_tb_seq.nextval,'admin1','1111');
insert into admin_tb(admin_id,admin_name,admin_password)
values(admin_tb_seq.nextval,'admin2','2222');
insert into admin_tb(admin_id,admin_name,admin_password)
values(admin_tb_seq.nextval,'admin3','3333');


commit;
select * from admin_tb;
select * from product_tb;

