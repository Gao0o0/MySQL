CREATE database stu ;
use stu; 
CREATE TABLE school(
    pno char(5) PRIMARY KEY,
    pname char(30) UNIQUE NOT NULL, 
    dname char(30) UNIQUE NOT NULL
)character set utf8;
CREATE TABLE information ( 
    sno char(12) PRIMARY KEY,
    id char(18) UNIQUE NOT NULL,
    sname char(10) NOT NULL,
    sex CHAR(2) CHECK (sex IN('男','女')),
    birth date NOT NULL,
    tel CHAR(11) UNIQUE NOT NULL,                                                          
    adress varchar(50) NOT NULL,
    pno char(5),
    FOREIGN KEY (pno) REFERENCES school(pno)
)character set utf8;
CREATE TABLE course(
    cno char(6) PRIMARY KEY,
    cname char(20) UNIQUE NOT NULL,
    cpan char(6),
    ceredit SMALLINT CHECK(ceredit>0 and ceredit<10) ,
    FOREIGN KEY(cpan) REFERENCES course(cno)
)character set utf8;
CREATE TABLE score(
    sno char(12),
    cno char(5),
    grade SMALLINT CHECK(grade >=0 and grade <=100),
    PRIMARY KEY (sno,cno),
    FOREIGN KEY(sno) REFERENCES information(sno),
    FOREIGN KEY(cno) REFERENCES course(cno)
);
CREATE TABLE teacher(
    tno char(8) PRIMARY KEY,
    tname char(10),
    salary SMALLINT CHECK(salary >0)
)character set utf8;
use stu;
insert into school
values('10905','软件工程','信息工程学院');
