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

insert into bookcategory(name) values('�����');
insert into bookcategory(name) values('��ѧ');
insert into bookcategory(name) values('����');
insert into bookcategory(name) values('Ӣ��');

insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('struts','����ʦ','�廪��ѧ������','2014-1-1',50,1,'�ɽ�','hlm001.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('hibernate','����ʦ','�廪��ѧ������','2014-1-1',50,1,'�ɽ�','xyj001.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('��ѧӢ��','����ʦ','�廪��ѧ������','2014-1-1',50,4,'�ɽ�','hlm015.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('�ߵ���ѧ','����ʦ','�廪��ѧ������','2014-1-1',50,2,'�ɽ�','hlm017.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('����ѧ','����ʦ','�߽̳�����','2014-1-1',50,3,'�ɽ�','hlm022.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('Java','����ʦ','�廪��ѧ������','2014-1-1',50,1,'�ɽ�','sgyy001.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('Jsp','����ʦ','�廪��ѧ������','2014-1-1',50,1,'�ɽ�','shz001.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('mysql','����ʦ','�廪��ѧ������','2014-1-1',50,1,'�ɽ�','sj.jpg');

insert into readercategory(name,maxperiod,fineperday,maxborrownumber) values('ѧ��',30,0.1,5);
insert into readercategory(name,maxperiod,fineperday,maxborrownumber) values('��ʦ',60,0.2,8);

insert into reader(name,sex,phone,department,rcid,photopath) values('����','��','11111','��Ϣ����ϵ',1,'hlm003.jpg');
insert into reader(name,sex,phone,department,rcid,photopath) values('����','Ů','11111','��Ϣ����ϵ',1,'hlm005.jpg');
insert into reader(name,sex,phone,department,rcid,photopath) values('����ʦ','��','11111','��Ϣ����ϵ',2,'hlm007.jpg');

insert into borrow(rid,bid,borrowdate) values(2,8,'2014-1-1');
update book set state='�ѽ�' where id=8;
insert into borrow(rid,bid,borrowdate) values(2,7,'2015-5-1');
update book set state='�ѽ�' where id=7;