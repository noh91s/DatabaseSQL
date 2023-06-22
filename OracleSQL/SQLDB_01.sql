--SQLDB접속
CREATE user user1 identified by 1111;
grant connect, resource, dba to user1;
commit;

select * from all_users; -- 사용중 계정 확인
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
-- 테이블의 칼럼을 추가 
alter table member1 add userId varchar2(100);
-- 테이블의 칼럼의 타입변경
alter table member1 modify name varchar2(200);
alter table member1 modify userId varchar2(100) not null;
-- 테이블의 칼럼명 변경
alter table member1 rename column member_id to member1_id;
-- 테이블의 칼럼 삭제
-- alter table member1 drop userId; -- oracle 적용 X 
alter table member1 drop column userId;


-- 테이블 이름 변경
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

-- 테이블의 모든 레코드를 삭제
truncate table member1;


create table member2(
    jumin varchar2(100) not null,
    studynum varchar2(100) not null unique,
    name varchar2(100) not null,
    primary key(jumin)
);
desc member2;
insert into member2(jumin,studynum,name) values('11111','33333','m1');
insert into member2(jumin,studynum,name) values('11111','22222','m2'); -- 개체무결성 위반

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

insert into writer_tb(userId,userPw,userName) values('m1','1111','김이름');
insert into writer_tb(userId,userPw,userName) values('m2','2222','박이름');
insert into writer_tb(userId,userPw,userName) values('m3','3333','송이름');
commit;
select * from writer_tb;

-- 반드시(제약조건) writer_tb 테이블의 userId만 글을 작성 할수 있다. 
insert into board1(board1_no, title, content, userId) values(1,'제목1','내용1','m1');
insert into board1(board1_no, title, content, userId) values(2,'제목2','내용2','m1');
insert into board1(board1_no, title, content, userId) values(3,'제목3','내용3','m1');
insert into board1(board1_no, title, content, userId) values(4,'제목4','내용4','m2');
insert into board1(board1_no, title, content, userId) values(5,'제목5','내용5','m2');

-- 참조무결성 위반
-- insert into board1(board1_no, title, content, userId) values(5,'제목5','내용5','m3');
commit;

-- 기본 설정
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

insert into board1(board1_no, title, content, userId) values(board1_no_seq.NEXTVAL,'제목6','내용6','m1');
commit;

select * from board1;
select * from writer_tb;

desc writer_tb;
-- 조건에 맞는 레코드 조회
select * from writer_tb where writer_tb.userId='m1';
-- 테이블명 as 별칭
select * from writer_tb as tb where tb.userId='m1';

select * from writer_tb;
select USERID, userPw, userName from writer_tb;
select USERID from writer_tb;
select USERID, userPw from writer_tb;

-- 조건
select * from writer_tb where userId='m1';
select userPw, userName from writer_tb where userId='m1';

select * from board1;
select * from board1 where board1_no>5; -- 조건1
select * from board1 where board1_no>5 and title='제목6'; -- 조건1 and 조건2 (동시에 true)
select * from board1 where board1_no>5 or title='제목6'; -- 조건1 or 조건2 (하나이상 true)

-- 칼람명 as 별칭 변경
select board1_no as 글번호, title as 제목, content as 글내용, userId as 아이디 
from board1;

select * from board1 order by board1_no ASC; -- 기본정렬 오름차순(ASC)
select * from board1 order by board1_no DESC; -- 내림차순(DESC) 