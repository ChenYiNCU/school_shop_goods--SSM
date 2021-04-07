create table user1(
  id number,
  uname varchar2(12),
  upwd  varchar2(12),
  type number
)

insert into user1 values(1,'aa','123',1);
insert into user1 values(2,'bb','456',1);
insert into user1 values(3,'cc','789',2);
update user1 set uname='aa123',upwd='123',type='3' where id='1'

update user1  set uname =concat(uname,'123') where id=2;
select * from user1
delete from user1 where id=11


create table person(
id number(4) primary key,
name varchar2(10),
age number(4),
adress varchar2(10),
dept_id number(4),
time date,
path varchar2(10)
)

insert into person values(1,'aa',20,'重庆市',1,to_date('1999-02-09','yyyy-mm-dd'),'');
insert into person values(2,'小红',21,'重庆市',2,to_date('2000-02-09','yyyy-mm-dd'),'');

select * from person;


create table department(
did number(4) primary key,
dept_name varchar2(20)
)

insert into department values(1,'宣传部');
insert into department values(2,'后勤部');
select * from department;
select p.*,d.did from person p,department d where p.dept_id=d.did and p.id=1
