-- 연산자, 함수
drop table member11;
create table member11(
    userId varchar2(100) not null,
    userAge number not null,
    userName varchar2(100) not null
);

select * from member11;
select userId,userAge,userName from member11;
select userId as ID,userAge as 비밀번호,userName 이름 from member11;

insert into member11(userId, userAge, userName)
values('m1','11','강이름');
insert into member11(userId, userAge, userName)
values('m2','22','나이름');
insert into member11(userId, userAge, userName)
values('m3','33','도이름');
insert into member11(userId, userAge, userName)
values('m4','44','라이름');
insert into member11(userId, userAge, userName)
values('m5','55','민이름');
commit;

-- 테이블 데이터를 잘라내기(삭제)
TRUNCATE table member11;

-- 조건이 모두 true 레코드를 조회
select * from member11 where userId='m1' and userAge=11;
-- 조건에 하나 이상 true 레코드를 조회
select * from member11 where userId='m1' or userAge=11;
select * from member11 where userId='m1' or userAge>30;
-- not 일치하지 않는
select * from member11 where not userId='m1';
-- <>같지 않은
select * from member11 where userId<>'m1';
-- between A and B A~B
select * from member11 where userAge between 30 and 50;
-- count(*) 레코드수 -> 로그인, 추가, 삭제, 수정, 조회 먼저 체크
select count(*) from member11 where userAge between 30 and 50;
select count(*) from member11 where userId='m1' and userAge=11;
-- in(값1,값2,값3,,,) "포함되어 있는~"
select * from member11 where userId in('m1','m2','m3'); 
-- not in(값1,값2,값3,,,) "포함하지 않는~"
select * from member11 where userId not in('m1','m2','m3');

-- like
-- 칼럼 like 'a%' -> a로 시작하는 모든
select * from member11 where userName like '강%';
-- 칼럼 like '%a' -> a로 끝나는 모든
select * from member11 where userName like '%름';
-- 칼럼 like '%a%' -> a가 포함되어 있는 모든
select * from member11 where userName like '%이%';
-- || 문자열||문자열 
select userId||','||userName as IDNAME from member11;
select userId||','||userName as IDNAME from member11 where userAge>30;


commit;

select userAge+10 from member11 ; -- +
select userAge-10 from member11 ; -- -
select userAge*10 from member11 ; -- *
select userAge/10 from member11 ; -- /


select userAge from member11 where userId='m1';
update member11 set userAge=userAge+1 where userId='m1';
commit;

-- 나이가 30초과인 레코드를 userId의 오름차순으로 조회
select * from member11 where userAge>30 order by userId ASC;
select * from member11 where userAge>30 order by userAge ASC;
select * from member11 where userAge>30 order by userName ASC;
-- 나이가 30초과인 레코드를 userId의 내림차순으로 조회
select * from member11 where userAge>30 order by userId DESC;
select * from member11 where userAge>30 order by userAge DESC;
select * from member11 where userAge>30 order by userName DESC;

-- member11 테이블의 멤버의 전체 나이의 합계
select sum(userAge) 합계 from member11 where userAge>30 group by userAge; 

drop table group1;
create table group1(
    name varchar2(100) not null,
    price number not null,
    depart varchar(100) not null
);

insert into group1(name,price,depart) values('m1',1000,'영업부');
insert into group1(name,price,depart) values('m2',2000,'영업부');

insert into group1(name,price,depart) values('m3',3000,'기획부');
insert into group1(name,price,depart) values('m4',4000,'기획부');

insert into group1(name,price,depart) values('m5',5000,'흥보부');
insert into group1(name,price,depart) values('m6',6000,'흥보부');
insert into group1(name,price,depart) values('m6',7000,'흥보부');

TRUNCATE table group1;
select * from group1;

-- 그룹화 시킬 칼럼을 정하고 -> 그룹화 시킨 칼럼에 대한 그룹 함수를 작성
-- 부서별 금액의 합계
select depart 부서, sum(price) 부서별합계 from group1 group by depart;
-- 부서별 금액의 평균
select depart 부서, avg(price) 부서별평균 from group1 group by depart;
-- 부서별 최대값
select depart 부서, max(price) 부서별최댓값 from group1 group by depart;
-- 부서별 최소값
select depart 부서, min(price) 부서별최소값 from group1 group by depart;

commit;


