-- ����Ȯ��
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
-- ���̺� �̸� ����
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
-- Į���� ����
alter table product_tb modify product_name char(100 char);
alter table product_tb modify product_name varchar2(100 char);
-- Į���� �߰� -> �ܷ�Ű������ �� ��� �����Ǵ� ���̺��� �⺻Ű �Ǵ� �⺻Ű������ Į�� Ÿ�԰� ���ƾߵȴ�
alter table product_tb add product_admin varchar2(100) NOT NULL;

desc product_tb;
-- �ܷ�Ű(FK)����
alter table product_tb 
add foreign key(PRODUCT_ADMIN) 
REFERENCES admin_tb(admin_name);

-- ������ ����
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

-- ��ǰ�� �����ڷ� ��ϵǾ��ִ� ����� ��� ����
-- ��ǰ��� -> �ܷ�Ű�� �⺻Ű�� �ִ� ���� �߰� �� �� �ִ� -> ���� ���Ἲ ����
insert into product_tb(product_tb_no,product_name,product_price,product_detail,product_admin)
values(product_tb_seq.nextval,'��ǰ1','10000','��ǰ1�󼼳���','admin1');
insert into product_tb(product_tb_no,product_name,product_price,product_detail,product_admin)
values(product_tb_seq.nextval,'��ǰ2','20000','��ǰ2�󼼳���','admin1');
insert into product_tb(product_tb_no,product_name,product_price,product_detail,product_admin)
values(product_tb_seq.nextval,'��ǰ3','30000','��ǰ3�󼼳���','admin2');
insert into product_tb(product_tb_no,product_name,product_price,product_detail,product_admin)
values(product_tb_seq.nextval,'��ǰ4','40000','��ǰ4�󼼳���','admin3');
insert into admin_tb(admin_id,admin_name,admin_password)
values(admin_tb_seq.nextval,'admin1','1111');
insert into admin_tb(admin_id,admin_name,admin_password)
values(admin_tb_seq.nextval,'admin2','2222');
insert into admin_tb(admin_id,admin_name,admin_password)
values(admin_tb_seq.nextval,'admin3','3333');


commit;
select * from admin_tb;
select * from product_tb;

