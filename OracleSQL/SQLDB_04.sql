-- 0626
-- 함수 : 미리 사용할 목적으로 만들어 놓은 명령문을 그룹화, 사용자(개발자)가 원할때 호출(Call)

select round(12.368) from dual; -- 소수 첫째자리에서 반올림(5이상 올림) -> 기본
select round(12.368,2) from dual; -- 소수 둘째자리까지 표시 후 반올림(5이상 올림)
select ceil(12.368) from dual; -- 올림
select ceil(12.3681,3) from dual; -- 소수 셋째자리까지 표시 후 올림
select floor(12.3681) from dual; -- 버림

drop table teset2;
create table test2(
kor NUMBER
);
insert into test2(kor) values(100);
insert into test2(kor) values(78);
insert into test2(kor) values(86);
insert into test2(kor) values(95);
insert into test2(kor) values(92);
commit;

select kor from test2;
select kor as 국어점수 from test2;
select kor 국어점수 ,rank() over(order by kor desc) as 석차 from test2;

select sysdate from dual;
select systimestamp from dual;

select sysdate , to_char(systimestamp, 'YYYY"년" MM"월" DD"일" hh":"mi":"ss"') from dual;


-- 서브쿼리 테이블1에서 조건에 맞는 레코드를 조회
-- select * from t2 where c2=(select c1 from t1);


drop table t1;
create table t1(
    id varchar2(100) not null,
    pw varchar2(100) not null
);
insert into t1(id,pw) values('a1','11');
insert into t1(id,pw) values('a2','22');
insert into t1(id,pw) values('a3','33');
insert into t1(id,pw) values('a4','44');
insert into t1(id,pw) values('a5','55');
commit;

drop table t2;
create table t2(
    id varchar2(100) not null,
    name varchar2(100) not null
);
insert into t2(id,name) values('a1','m1');
insert into t2(id,name) values('a2','m2');
insert into t2(id,name) values('a3','m3');
insert into t2(id,name) values('a4','m4');
insert into t2(id,name) values('a5','m5');
commit;


select * from t1;
select * from t2;

-- t1 테이블에서 id가 a1->
select * from t2 where id=(select id from t1 where id='a1');

update t2 
set name='m1수정'
where id=(select id from t1 where id='a1');





/* Drop Tables */

DROP TABLE board0626 CASCADE CONSTRAINTS;
DROP TABLE member0626 CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE board0626
(
	board0626_id number NOT NULL,
	board_title varchar2(100 char) NOT NULL,
	board_content varchar2(255 char) NOT NULL,
	board_writer varchar2(255 char) NOT NULL, -- 글작성자는 이메이롤 등록
	create_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (board0626_id)
);


CREATE TABLE member0626
(
	member0626_id number NOT NULL,
	name varchar2(100 char) NOT NULL,
	password varchar2(100 char) NOT NULL,
	email varchar2(255 char) NOT NULL UNIQUE,
	create_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (member0626_id)
);



/* Create Foreign Keys */

ALTER TABLE board0626
ADD FOREIGN KEY (board_writer)
REFERENCES member0626 (email)
;

drop sequence board0626_seq;
create sequence board0626_seq
increment by 1
start with 1
nocycle;

drop sequence member0626_seq;
create sequence member0626_seq
increment by 1
start with 1
nocycle;

select * from member0626;
select * from board0626;

insert into member0626(member0626_id,name,password,email)
values (member0626_seq.nextval,'a1','1111','a1@gamil.com');
commit; -- 실제 commit 안하면 로컬에서 적용되지 않습니다

insert into board0626(board0626_id,board_title,board_content,board_writer)
values (board0626_seq.nextval,'제목1','내용1','a1@gamil.com');
insert into board0626(board0626_id,board_title,board_content,board_writer)
values (board0626_seq.nextval,'제목2','내용2','a1@gamil.com');
commit;


drop sequence custno_seq;
create sequence custno_seq
increment by 1
start with 100001
nocycle;

create table member_07(
    custno number(6) not null,
    custname varchar2(20),
    phone varchar2(13),
    address varchar2(60),
    joindate date,
    grade char(1) ,
    city char(2) ,
    primary key(custno)
);
insert into member_07
values (custno_seq.nextval, '김이름', '010-1111-2222', '서울 노원구 중계1동', '20221202', 'A', '01');

insert into member_07
values (custno_seq.nextval, '이소리', '010-1111-3333', '서울 노원구 중계2동', '20221206', 'B', '01');

insert into member_07
values (custno_seq.nextval, '박수진', '010-1111-4444', '경기도 수원시 망포동', '20221001', 'B', '03');

insert into member_07
values (custno_seq.nextval, '최수원', '010-1111-5555', '경기도 의정부시 감축동', '20221113', 'A', '03');

insert into member_07
values (custno_seq.nextval, '강만기', '010-1111-6666', '제주도 제주시 서귀포', '20221225', 'B', '06');

insert into member_07
values (custno_seq.nextval, '우리민', '010-1111-7777', '강원도 춘천시 춘천동', '20221211', 'C', '06');
commit;

select * from member_07;

CREATE TABLE money_07(
custno number(6),
salenol number(8),
pcost number(8),
amount number(4),
price number(8),
pcode varchar2(4),
sdate date
);

insert into money_07 values(100001, 2022001, 500, 5, 2500, 'A001', '20220101');
insert into money_07 values(100001, 2022002, 1000, 4, 4000, 'A002', '20220101');
insert into money_07 values(100001, 2022003, 500, 3, 1500, 'A008', '20220101');
insert into money_07 values(100002, 2022004, 2000, 1, 2000, 'A004', '20220102');
insert into money_07 values(100002, 2022005, 500, 1, 500, 'A001', '20220103');
insert into money_07 values(100003, 2022006, 1500, 2, 3000, 'A003', '20220103');
commit ;

insert into money_07 values(100007, 2022001, 500, 5, 2500, 'A001', '20220101');
insert into money_07 values(100007, 2022002, 1000, 4, 4000, 'A002', '20220101');
insert into money_07 values(100008, 2022003, 500, 3, 1500, 'A008', '20220101');
insert into money_07 values(100008, 2022004, 2000, 1, 2000, 'A004', '20220102');
commit ;

select * from member_07;
select * from money_07;


-- inner join 두테이블의 일치된 칼럼을 기준으로조회
select *
from member_07 C inner join money_07 M-- 조인 맺은 테이블1 inner join 테이블2
on C.custno=M.custno; -- 조인 맺는 칼럼명의 조건

select C.custno,C.custname,M.pcost
from member_07 C inner join money_07 M-- 조인 맺은 테이블1 inner join 테이블2
on C.custno=M.custno; -- 조인 맺는 칼럼명의 조건

select C.custno,C.custname
from member_07 C inner join money_07 M-- 조인 맺은 테이블1 inner join 테이블2
on C.custno=M.custno
group by(C.custname,C.custno);

select C.custno,C.custname,sum(M.pcost) 총합계
from member_07 C inner join money_07 M-- 조인 맺은 테이블1 inner join 테이블2
on C.custno=M.custno
group by(C.custname,C.custno);

select I.custno,I.custname,sum(J.pcost) 총합계, sum(J.price) 총지출
from member_07 I inner join money_07 J-- 조인 맺은 테이블1 inner join 테이블2
on I.custno=J.custno
group by(I.custname,I.custno)
order by 총지출 ASC;

select O.custno,J.pcost
from member_07 O left outer join money_07 J
on O.custno=J.custno;

select *
from member_07 O right outer join money_07 J
on O.custno=J.custno;

select *
from member_07 C cross join money_07 J;

select count(*) from member_07;
select count(*) from money_07;

select count(*)
from member_07 C cross join money_07 J;

select C.custno, J.pcost
from member_07 C cross join money_07 J;

-- SELF JOIN(자체 조인) -> chat bot(Web Sochet, Stom, Komoran, Komoran+ Open Api
-- 자체 조인은 자기 자신과 조인하므로 1개의 테이블을 사용합니다
-- 별도의 문법이 있는 것은 아니고 1개로 조인하면 자체조인이 됩니다
select m1.custno M1_TB_NO, m2.custno M2_TB_NO
from member_07 m1 inner join member_07 m2
on m1.custName=m2.custName;



-- 집합 연산
select * from member_07;
select count(*) from member_07;
select * from money_07;
select count(*) from money_07;

select distinct custno from money_07;

select custno from member_07
union
select custno from money_07;

select custno from member_07
union all
select custno from money_07;

-- 차집합 -> 왼쪽 테이블 기준으로 왼쪽테이블에서 오른쪽 테이블의 값을 제거한 나머지 왼쪽테이블
select custno from member_07
minus
select custno from money_07;

-- 교집합 -> 두테이블의 공통 조회
select custno from member_07
intersect 
select custno from money_07;
