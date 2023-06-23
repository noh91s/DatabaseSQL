-- ������, �Լ�
drop table member11;
create table member11(
    userId varchar2(100) not null,
    userAge number not null,
    userName varchar2(100) not null
);

select * from member11;
select userId,userAge,userName from member11;
select userId as ID,userAge as ��й�ȣ,userName �̸� from member11;

insert into member11(userId, userAge, userName)
values('m1','11','���̸�');
insert into member11(userId, userAge, userName)
values('m2','22','���̸�');
insert into member11(userId, userAge, userName)
values('m3','33','���̸�');
insert into member11(userId, userAge, userName)
values('m4','44','���̸�');
insert into member11(userId, userAge, userName)
values('m5','55','���̸�');
commit;

-- ���̺� �����͸� �߶󳻱�(����)
TRUNCATE table member11;

-- ������ ��� true ���ڵ带 ��ȸ
select * from member11 where userId='m1' and userAge=11;
-- ���ǿ� �ϳ� �̻� true ���ڵ带 ��ȸ
select * from member11 where userId='m1' or userAge=11;
select * from member11 where userId='m1' or userAge>30;
-- not ��ġ���� �ʴ�
select * from member11 where not userId='m1';
-- <>���� ����
select * from member11 where userId<>'m1';
-- between A and B A~B
select * from member11 where userAge between 30 and 50;
-- count(*) ���ڵ�� -> �α���, �߰�, ����, ����, ��ȸ ���� üũ
select count(*) from member11 where userAge between 30 and 50;
select count(*) from member11 where userId='m1' and userAge=11;
-- in(��1,��2,��3,,,) "���ԵǾ� �ִ�~"
select * from member11 where userId in('m1','m2','m3'); 
-- not in(��1,��2,��3,,,) "�������� �ʴ�~"
select * from member11 where userId not in('m1','m2','m3');

-- like
-- Į�� like 'a%' -> a�� �����ϴ� ���
select * from member11 where userName like '��%';
-- Į�� like '%a' -> a�� ������ ���
select * from member11 where userName like '%��';
-- Į�� like '%a%' -> a�� ���ԵǾ� �ִ� ���
select * from member11 where userName like '%��%';
-- || ���ڿ�||���ڿ� 
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

-- ���̰� 30�ʰ��� ���ڵ带 userId�� ������������ ��ȸ
select * from member11 where userAge>30 order by userId ASC;
select * from member11 where userAge>30 order by userAge ASC;
select * from member11 where userAge>30 order by userName ASC;
-- ���̰� 30�ʰ��� ���ڵ带 userId�� ������������ ��ȸ
select * from member11 where userAge>30 order by userId DESC;
select * from member11 where userAge>30 order by userAge DESC;
select * from member11 where userAge>30 order by userName DESC;

-- member11 ���̺��� ����� ��ü ������ �հ�
select sum(userAge) �հ� from member11 where userAge>30 group by userAge; 

drop table group1;
create table group1(
    name varchar2(100) not null,
    price number not null,
    depart varchar(100) not null
);

insert into group1(name,price,depart) values('m1',1000,'������');
insert into group1(name,price,depart) values('m2',2000,'������');

insert into group1(name,price,depart) values('m3',3000,'��ȹ��');
insert into group1(name,price,depart) values('m4',4000,'��ȹ��');

insert into group1(name,price,depart) values('m5',5000,'�ﺸ��');
insert into group1(name,price,depart) values('m6',6000,'�ﺸ��');
insert into group1(name,price,depart) values('m6',7000,'�ﺸ��');

TRUNCATE table group1;
select * from group1;

-- �׷�ȭ ��ų Į���� ���ϰ� -> �׷�ȭ ��Ų Į���� ���� �׷� �Լ��� �ۼ�
-- �μ��� �ݾ��� �հ�
select depart �μ�, sum(price) �μ����հ� from group1 group by depart;
-- �μ��� �ݾ��� ���
select depart �μ�, avg(price) �μ������ from group1 group by depart;
-- �μ��� �ִ밪
select depart �μ�, max(price) �μ����ִ� from group1 group by depart;
-- �μ��� �ּҰ�
select depart �μ�, min(price) �μ����ּҰ� from group1 group by depart;

commit;


