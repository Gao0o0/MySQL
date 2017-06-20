CREATE database stu ;
use stu; 
CREATE TABLE school(
    pno char(5) PRIMARY KEY,
    pname char(30) UNIQUE NOT NULL, 
    dname char(30) NOT NULL,
    state char(1) DEFAULT 1 CHECK(state in ('0','1'))
)character set utf8;

CREATE TABLE information ( 
    sno char(12) PRIMARY KEY,
    sname char(10) NOT NULL,
    sex CHAR(2) CHECK (sex IN('男','女')),
    birth date NOT NULL,
    tel CHAR(11) UNIQUE NOT NULL,                                                          
    adress varchar(50) NOT NULL,
    pno char(5),
    state char(1) DEFAULT 1 CHECK(state in ('0','1')),
    FOREIGN KEY (pno) REFERENCES school(pno)
)character set utf8;

CREATE TABLE course(
    cno char(6) PRIMARY KEY,
    cname char(20) UNIQUE NOT NULL,
    cpan char(6),
    ceredit SMALLINT CHECK(ceredit>0 and ceredit<10) ,
    num SMALLINT DEFAULT 0 CHECK(num >=0 and num<=50 ) ,
    state char(1) DEFAULT 1 CHECK(state in ('0','1')),
    FOREIGN KEY(cpan) REFERENCES course(cno)
)character set utf8;
/*alter table course add num SMALLINT DEFAULT 0 CHECK(num >=0 and num<=50 );*/
/*alter table score add state char(1) DEFAULT 1 CHECK(state in ('0','1'));*/
CREATE TABLE score(
    sno char(12),
    cno char(6),
    grade SMALLINT CHECK(grade >=0 and grade <=100),
    PRIMARY KEY (sno,cno),
    FOREIGN KEY(sno) REFERENCES information(sno),
    state char(1) DEFAULT 1 CHECK(state in ('0','1')),
    FOREIGN KEY(cno) REFERENCES course(cno)
)character set utf8;
CREATE TABLE teacher(
    tno char(8) PRIMARY KEY,
    tname char(10),
    salary SMALLINT CHECK(salary >0)
)character set utf8;
use stu;
insert into school
values('10905','软件工程','信息工程学院');
insert into school
values ('10904','网络工程','信息工程学院');
insert into school
values ('10501','会计学','会计学院');
insert into school
values ('10502','财务管理','会计学院');
insert into school
values ('10202','金融','商学院');
insert into information
values ('414109070128','小明','男','1992-6-25','12892633456','石家庄市','10905');
insert into information
values ('414105010128','小婉','女','1996-6-25','13892633456','合肥市','10501');
insert into course
values ('120001','C语言',null,3);
insert into course
values ('120101','数据结构','120001',3);
insert into course
values ('120111','高等数学',null,3.5);
insert into score
values ('414109070128','120001',89);
insert into score
values ('414109070128','120101',null);

create table lod(
uid char(12) primary key,
perm int check (perm in(0,1)),
pwd char(6) default '000000'
);
insert into lod
values('111111111111',0,'123456');