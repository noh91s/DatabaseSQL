--SQLDB����
CREATE user user1 identified by 1111;
grant connect, resource, dba to user1;
commit;

select * from all_users; -- ����� ���� Ȯ��
revoke connect, resource, dba from user1;
drop user user1 cascade;


-- DDL
drop table member1;
create table member1(
    member_id number not null,
    name varchar2(100) not null,
    email varchar2(255) not null,
    password varchar2(100) not null,
    create_date date default sysdate,
    primary key(member_id)
);
desc member1;
-- member_id -> member1_id
-- alter table add , modify
-- ���̺��� Į���� �߰� 
alter table member1 add userId varchar2(100);
-- ���̺��� Į���� Ÿ�Ժ���
alter table member1 modify name varchar2(200);
alter table member1 modify userId varchar2(100) not null;
-- ���̺��� Į���� ����
alter table member1 rename column member_id to member1_id;
-- ���̺��� Į�� ����
-- alter table member1 drop userId; -- oracle ���� X 
alter table member1 drop column userId;


-- ���̺� �̸� ����
-- alter table member1 rename member2;
alter table member2 rename to member1;
desc member1;

insert into member1(member1_id,name,email,password)
values(1,'m1','m1@gmail.com','1111');
insert into member1(member1_id,name,email,password)
values(2,'m2','m2@gmail.com','2222');
insert into member1(member1_id,name,email,password)
values(3,'m3','m3@gmail.com','3333');
commit;
select * from member1;

-- ���̺��� ��� ���ڵ带 ����
truncate table member1;


create table member2(
    jumin varchar2(100) not null,
    studynum varchar2(100) not null unique,
    name varchar2(100) not null,
    primary key(jumin)
);
desc member2;
insert into member2(jumin,studynum,name) values('11111','33333','m1');
insert into member2(jumin,studynum,name) values('11111','22222','m2'); -- ��ü���Ἲ ����

commit;
select * from member2;

create table writer_tb(
    userId varchar2(100) not null,
    userPw varchar2(100) not null,
    userName varchar2(255) not null,
    primary key(userId)
);

desc writer_tb;
drop table board1;
create table board1(
    board1_no number not null,
    title varchar2(100),
    content varchar2(2550) not null,
    userId varchar2(100) not null,   
    primary key(board1_no)
);
desc board1;

insert into writer_tb(userId,userPw,userName) values('m1','1111','���̸�');
insert into writer_tb(userId,userPw,userName) values('m2','2222','���̸�');
insert into writer_tb(userId,userPw,userName) values('m3','3333','���̸�');
commit;
select * from writer_tb;

-- �ݵ��(��������) writer_tb ���̺��� userId�� ���� �ۼ� �Ҽ� �ִ�. 
insert into board1(board1_no, title, content, userId) values(1,'����1','����1','m1');
insert into board1(board1_no, title, content, userId) values(2,'����2','����2','m1');
insert into board1(board1_no, title, content, userId) values(3,'����3','����3','m1');
insert into board1(board1_no, title, content, userId) values(4,'����4','����4','m2');
insert into board1(board1_no, title, content, userId) values(5,'����5','����5','m2');

-- �������Ἲ ����
-- insert into board1(board1_no, title, content, userId) values(5,'����5','����5','m3');
commit;

-- �⺻ ����
alter table board1
    add foreign key (userId)
    references writer_tb(userId); 

select * from board1;  
truncate table board1;

select * from user_sequences;

drop sequence board1_no_seq;
create sequence board1_no_seq
increment by 1
start with 6
nocycle;

insert into board1(board1_no, title, content, userId) values(board1_no_seq.NEXTVAL,'����6','����6','m1');
commit;

select * from board1;
select * from writer_tb;

desc writer_tb;
-- ���ǿ� �´� ���ڵ� ��ȸ
select * from writer_tb where writer_tb.userId='m1';
-- ���̺�� as ��Ī
select * from writer_tb as tb where tb.userId='m1';

select * from writer_tb;
select USERID, userPw, userName from writer_tb;
select USERID from writer_tb;
select USERID, userPw from writer_tb;

-- ����
select * from writer_tb where userId='m1';
select userPw, userName from writer_tb where userId='m1';

select * from board1;
select * from board1 where board1_no>5; -- ����1
select * from board1 where board1_no>5 and title='����6'; -- ����1 and ����2 (���ÿ� true)
select * from board1 where board1_no>5 or title='����6'; -- ����1 or ����2 (�ϳ��̻� true)

-- Į���� as ��Ī ����
select board1_no as �۹�ȣ, title as ����, content as �۳���, userId as ���̵� 
from board1;

select * from board1 order by board1_no ASC; -- �⺻���� ��������(ASC)
select * from board1 order by board1_no DESC; -- ��������(DESC) 