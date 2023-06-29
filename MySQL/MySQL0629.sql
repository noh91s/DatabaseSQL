show databases;
drop database mysql06;
create database mysql06;
use mysql06;
show tables;
-- 사용자 계정 추가
create user 'user1'@'localhost' identified by '1111';
-- 사용자 권한 설정
grant all privileges on mysql06.* to 'user1'@'localhost';
-- 사용자 계정 삭제
drop user 'user1'@'localhost';

-- select user from user;
-- 테이블 삭제
drop table member1;
-- 테이블 생성
create table member1(
	member_id bigint not null auto_increment,
    name varchar(100) not null,
    age int not null, 
    primary key(member_id)
);
-- 선택DB 테이블 조회
show tables;
desc member1;

insert into member1(name,age) values('m1','11');
insert into member1(name,age) values('m2','22');
insert into member1(name,age) values('m3','33');
insert into member1(name,age) values('m4','44');
insert into member1(name,age) values('m5','55');

update member1 set name='m1_수정', age=12 where member_id=1;

delete from member1 where member_id=1;

select * from member1;









