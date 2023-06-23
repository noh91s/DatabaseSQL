select * from all_users;

select * from HR.employees; -- 실습용 테이블 HR
select * from HR.departments; -- 실습용 테이블 HR

drop table employee;
create table employee (
	emp_id number not null, -- 직원 고유번호 , 시퀀스 1000 시작
	emp_name varchar(100) not null, -- 직원 이름
	emp_depart varchar(100) not null, -- 부서 이름 (외래키) -> 부서테이블 부서명
	emp_email varchar(100) not null,
    create_date date default sysdate,
	primary key(emp_id)
);
commit;

drop sequence employee_seq;
create sequence employee_seq
increment by 1
start with 1000
nocycle;


drop table department;
create table department(
	depart_id number not null, -- 부서 고유 아이디, 시퀀스 1 시작
	depart_name varchar(100) not null unique, -- emplyee emp_depart 외래키의 기본키
	primary key(depart_id)
);

drop sequence department_seq;
create sequence department_seq
increment by 1
start with 1
nocycle;

-- 외래키 설정 employee 테이블 emp_depart 테이블 depart_name 칼럼을 참조한다 
-- emp_depart 칼럼의 데이터는 반드시 depart_name 칼럼의 값만 추가할수 있다
-- emp_depart 칼럼의 데이터가 depart_name 칼럼 이외의 값을 추가하면 참조 무결서 위반
-- 1:다, 1:N

alter table employee -- employee 테이블
add foreign key(emp_depart) -- emp_depart칼럼을 외래키로 등록해라
REFERENCES department(depart_name);  -- 기본키 또는 기본키 성질(unique)을 갖는 키

insert into department(depart_id, depart_name) values (department_seq.nextval,'영업부');
insert into department(depart_id, depart_name) values (department_seq.nextval,'기획부');
insert into department(depart_id, depart_name) values (department_seq.nextval,'흥보부');
insert into department(depart_id, depart_name) values (department_seq.nextval,'기술부');
insert into department(depart_id, depart_name) values (department_seq.nextval,'마케팅부');
commit;
select * from department;

insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'김이름','영업부','m1@gamil.com');
insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'남이름','영업부','m2@gamil.com');
insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'도이름','영업부','m3@gamil.com');

insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'민이름','기획부','n1@gamil.com');
insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'박이름','기획부','n2@gamil.com');

insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'성이름','마케팅부','s1@gamil.com');

insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'양이름','흥보부','t1@gamil.com');
insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'조이름','흥보부','t2@gamil.com');

insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'차이름','기술부','k1@gamil.com');
commit;

-- 직원수 조회
select count(*) as 직원수 from employee;

-- 전체직원 조회
select * from employee;

-- 내림차순 정렬
select * from employee order by emp_name desc;

-- 직원번호가 1000~1005인 직원 조회
select * from employee where emp_id between 1010 and 1015;
select emp_name from employee where emp_id between 1010 and 1015;

-- 부서별 -> 을 설정할수 있는 그룹별 인원
select emp_depart, count(emp_depart) 부서별인원수 from employee group by emp_depart;
select emp_depart, count(emp_depart) 부서별인원수 from employee 
group by emp_depart having count(emp_depart)>=2; -- 부서별 조건 부서의 인원수가 2명이상인 부서




-- 함수
select round(10.123) from dual; -- 반올림 수소 첫째자리 에서 반올림 (기본)
select round(10.523) from dual;
select round(10.532,2) from dual; -- 반올림 수소 둘째자리 에서 반올림

select ceil (10.123) from dual;
select ceil (10.123) from dual; -- 올림 수소 첫째자리 에서 반올림 (기본)

select floor (10.123) from dual; -- 내림 수소 첫째자리 에서 반올림 (기본)


select abs(-10) from dual; -- 절대값(양수)
select power(3,2) from dual; -- 계승
select mod(10,2) from dual; -- 나머지
select sqrt(2) from dual; -- 루트

create table test1(
    kor number
);
insert into test1(kor) values (100);
insert into test1(kor) values (50);
insert into test1(kor) values (80);
insert into test1(kor) values (90);
commit;
select * from test1;
select kor 국어성적, rank() over(order by kor desc) as 국어등수
from test1;



-- 칼럼을 정렬한 후에 랭킹(등수)를 설정 rank() over(정렬)
select emp_name, rank() over(order by emp_name) 등수
from employee;

select lower('Java') from dual; -- 소문자
select initcap('Java') from dual; -- 첫글자 대문자
select upper('Java') from dual; -- 대문자
select length('Java') from dual; -- 문자열 길이
select concat('Java','_Spring') from dual; -- 문자열 결합
select substr('Java_Spring_AWS',5,11) from dual; -- 문자열의 인덱스 5 부터 11 앞까지
select instr('Java_Spring_AWS','S') from dual; -- 문자의 위치 
select lpad(2500,10,'*') from dual; -- 10자리 문자열 공간에서 기존문자열을 제외하고 왼쪽부터 채워라
select rpad(2500,10,'*') from dual; -- 10자리 문자열 공간에서 기존문자열을 제외하고 오른쪽부터 채워라
select ltrim('     java') from dual; -- 왼쪽 공백 제거
select length('     java') from dual; -- 왼쪽 공백포함 문자열 길이
select length(ltrim('     java')) from dual; -- 왼쪽 공백제거 문자열 길이

select rtrim('java     ') from dual; -- 오른쪽 공백 제거

select replace('Java_Spring_AWS','Java','SQL') from dual; -- 문자열의 특정 문자를 변경

-- 날짜 함수 
select sysdate from dual; -- YY/MM/DD
select systimestamp from dual;


select sysdate+10 from dual;
select sysdate-10 from dual;
select sysdate-sysdate from dual;
select add_months(sysdate,2) from dual; -- 날짜 + 월
select next_day(sysdate,2) from dual; -- 날짜 + 다음날
select last_day(sysdate) from dual; -- 날짜 -> 마지막 일
-- 시간 -> 포맷(변환)
select sysdate,to_char(sysdate,'YYYY"년" MM"월" DD"일"') from dual; 
select systimestamp,to_char(systimestamp,'YYYY"년" MM"월" DD"일" HH24"시" mi"분" ss"초"') from dual;
select systimestamp,to_char(systimestamp,'YYYY"년" MM"월" DD"일" HH24":"mi":"ss') from dual;
