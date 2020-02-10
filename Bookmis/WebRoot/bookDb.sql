drop database bookdb;



create database bookdb;
use bookdb;

create table userinfo(
id int primary key auto_increment,
username varchar(20),
password varchar(20)
);

create table bookcategory(
id int primary key auto_increment,
name varchar(20),
remark varchar(256)
);

create table book(
id int primary key auto_increment,
name varchar(128),
author varchar(20),
pubs varchar(64),
pubdate date,
price float,
isbn varchar(20),
state varchar(4),
picpath varchar(256),
remark varchar(256),
bcid int
);

alter table book add foreign key fk_bc(bcid) references bookcategory(id);

create table readercategory(
id int primary key auto_increment,
name varchar(48),
maxperiod int,
maxborrownumber int,
fineperday float,
remake varchar(256)
);

create table reader(
id int primary key auto_increment,
name varchar(20),
sex varchar(2),
phone varchar(16),
department varchar(24),
photopath varchar(256),
remake varchar(256),
rcid int
);

alter table reader add foreign key fk_rc(rcid) references readercategory(id);

create table borrow(
id int primary key auto_increment,
rid int,
bid int,
borrowdate date,
returndate date,
remark varchar(256)
);

alter table borrow add foreign key fk_r(rid) references reader(id);
alter table borrow add foreign key fk_b(bid) references book(id);

create table fine(
id int primary key auto_increment,
borrowid int,
finenumber float,
remark varchar(256),
uid int
);
alter table fine add foreign key fk_borrow(borrowid) references borrow(id);
alter table fine add foreign key fk_u(uid) references userinfo(id);

insert into userinfo(username, password) values('aaa','111');

insert into bookcategory(name) values('计算机');
insert into bookcategory(name) values('数学');
insert into bookcategory(name) values('管理');
insert into bookcategory(name) values('英语');

insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('struts','唐老师','清华大学出版社','2014-1-1',50,1,'可借','hlm001.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('hibernate','唐老师','清华大学出版社','2014-1-1',50,1,'可借','xyj001.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('大学英语','唐老师','清华大学出版社','2014-1-1',50,4,'可借','hlm015.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('高等数学','唐老师','清华大学出版社','2014-1-1',50,2,'可借','hlm017.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('管理学','唐老师','高教出版社','2014-1-1',50,3,'可借','hlm022.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('Java','唐老师','清华大学出版社','2014-1-1',50,1,'可借','sgyy001.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('Jsp','唐老师','清华大学出版社','2014-1-1',50,1,'可借','shz001.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('mysql','唐老师','清华大学出版社','2014-1-1',50,1,'可借','sj.jpg');

insert into readercategory(name,maxperiod,fineperday,maxborrownumber) values('学生',30,0.1,5);
insert into readercategory(name,maxperiod,fineperday,maxborrownumber) values('老师',60,0.2,8);

insert into reader(name,sex,phone,department,rcid,photopath) values('张三','男','11111','信息工程系',1,'hlm003.jpg');
insert into reader(name,sex,phone,department,rcid,photopath) values('李四','女','11111','信息工程系',1,'hlm005.jpg');
insert into reader(name,sex,phone,department,rcid,photopath) values('唐老师','男','11111','信息工程系',2,'hlm007.jpg');

insert into borrow(rid,bid,borrowdate) values(2,8,'2014-1-1');
update book set state='已借' where id=8;
insert into borrow(rid,bid,borrowdate) values(2,7,'2015-5-1');
update book set state='已借' where id=7;