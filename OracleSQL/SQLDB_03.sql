select * from all_users;

select * from HR.employees; -- �ǽ��� ���̺� HR
select * from HR.departments; -- �ǽ��� ���̺� HR

drop table employee;
create table employee (
	emp_id number not null, -- ���� ������ȣ , ������ 1000 ����
	emp_name varchar(100) not null, -- ���� �̸�
	emp_depart varchar(100) not null, -- �μ� �̸� (�ܷ�Ű) -> �μ����̺� �μ���
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
	depart_id number not null, -- �μ� ���� ���̵�, ������ 1 ����
	depart_name varchar(100) not null unique, -- emplyee emp_depart �ܷ�Ű�� �⺻Ű
	primary key(depart_id)
);

drop sequence department_seq;
create sequence department_seq
increment by 1
start with 1
nocycle;

-- �ܷ�Ű ���� employee ���̺� emp_depart ���̺� depart_name Į���� �����Ѵ� 
-- emp_depart Į���� �����ʹ� �ݵ�� depart_name Į���� ���� �߰��Ҽ� �ִ�
-- emp_depart Į���� �����Ͱ� depart_name Į�� �̿��� ���� �߰��ϸ� ���� ���Ἥ ����
-- 1:��, 1:N

alter table employee -- employee ���̺�
add foreign key(emp_depart) -- emp_departĮ���� �ܷ�Ű�� ����ض�
REFERENCES department(depart_name);  -- �⺻Ű �Ǵ� �⺻Ű ����(unique)�� ���� Ű

insert into department(depart_id, depart_name) values (department_seq.nextval,'������');
insert into department(depart_id, depart_name) values (department_seq.nextval,'��ȹ��');
insert into department(depart_id, depart_name) values (department_seq.nextval,'�ﺸ��');
insert into department(depart_id, depart_name) values (department_seq.nextval,'�����');
insert into department(depart_id, depart_name) values (department_seq.nextval,'�����ú�');
commit;
select * from department;

insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'���̸�','������','m1@gamil.com');
insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'���̸�','������','m2@gamil.com');
insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'���̸�','������','m3@gamil.com');

insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'���̸�','��ȹ��','n1@gamil.com');
insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'���̸�','��ȹ��','n2@gamil.com');

insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'���̸�','�����ú�','s1@gamil.com');

insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'���̸�','�ﺸ��','t1@gamil.com');
insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'���̸�','�ﺸ��','t2@gamil.com');

insert into employee(emp_id, emp_name, emp_depart, emp_email) 
values (employee_seq.nextval,'���̸�','�����','k1@gamil.com');
commit;

-- ������ ��ȸ
select count(*) as ������ from employee;

-- ��ü���� ��ȸ
select * from employee;

-- �������� ����
select * from employee order by emp_name desc;

-- ������ȣ�� 1000~1005�� ���� ��ȸ
select * from employee where emp_id between 1010 and 1015;
select emp_name from employee where emp_id between 1010 and 1015;

-- �μ��� -> �� �����Ҽ� �ִ� �׷캰 �ο�
select emp_depart, count(emp_depart) �μ����ο��� from employee group by emp_depart;
select emp_depart, count(emp_depart) �μ����ο��� from employee 
group by emp_depart having count(emp_depart)>=2; -- �μ��� ���� �μ��� �ο����� 2���̻��� �μ�




-- �Լ�
select round(10.123) from dual; -- �ݿø� ���� ù°�ڸ� ���� �ݿø� (�⺻)
select round(10.523) from dual;
select round(10.532,2) from dual; -- �ݿø� ���� ��°�ڸ� ���� �ݿø�

select ceil (10.123) from dual;
select ceil (10.123) from dual; -- �ø� ���� ù°�ڸ� ���� �ݿø� (�⺻)

select floor (10.123) from dual; -- ���� ���� ù°�ڸ� ���� �ݿø� (�⺻)


select abs(-10) from dual; -- ���밪(���)
select power(3,2) from dual; -- ���
select mod(10,2) from dual; -- ������
select sqrt(2) from dual; -- ��Ʈ

create table test1(
    kor number
);
insert into test1(kor) values (100);
insert into test1(kor) values (50);
insert into test1(kor) values (80);
insert into test1(kor) values (90);
commit;
select * from test1;
select kor �����, rank() over(order by kor desc) as ������
from test1;



-- Į���� ������ �Ŀ� ��ŷ(���)�� ���� rank() over(����)
select emp_name, rank() over(order by emp_name) ���
from employee;

select lower('Java') from dual; -- �ҹ���
select initcap('Java') from dual; -- ù���� �빮��
select upper('Java') from dual; -- �빮��
select length('Java') from dual; -- ���ڿ� ����
select concat('Java','_Spring') from dual; -- ���ڿ� ����
select substr('Java_Spring_AWS',5,11) from dual; -- ���ڿ��� �ε��� 5 ���� 11 �ձ���
select instr('Java_Spring_AWS','S') from dual; -- ������ ��ġ 
select lpad(2500,10,'*') from dual; -- 10�ڸ� ���ڿ� �������� �������ڿ��� �����ϰ� ���ʺ��� ä����
select rpad(2500,10,'*') from dual; -- 10�ڸ� ���ڿ� �������� �������ڿ��� �����ϰ� �����ʺ��� ä����
select ltrim('     java') from dual; -- ���� ���� ����
select length('     java') from dual; -- ���� �������� ���ڿ� ����
select length(ltrim('     java')) from dual; -- ���� �������� ���ڿ� ����

select rtrim('java     ') from dual; -- ������ ���� ����

select replace('Java_Spring_AWS','Java','SQL') from dual; -- ���ڿ��� Ư�� ���ڸ� ����

-- ��¥ �Լ� 
select sysdate from dual; -- YY/MM/DD
select systimestamp from dual;


select sysdate+10 from dual;
select sysdate-10 from dual;
select sysdate-sysdate from dual;
select add_months(sysdate,2) from dual; -- ��¥ + ��
select next_day(sysdate,2) from dual; -- ��¥ + ������
select last_day(sysdate) from dual; -- ��¥ -> ������ ��
-- �ð� -> ����(��ȯ)
select sysdate,to_char(sysdate,'YYYY"��" MM"��" DD"��"') from dual; 
select systimestamp,to_char(systimestamp,'YYYY"��" MM"��" DD"��" HH24"��" mi"��" ss"��"') from dual;
select systimestamp,to_char(systimestamp,'YYYY"��" MM"��" DD"��" HH24":"mi":"ss') from dual;
