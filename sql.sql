CREATE database stu ;
use stu; 
CREATE TABLE school(
    pno char(20) PRIMARY KEY,
    pname char(40) UNIQUE NOT NULL, 
    dname char(40) UNIQUE NOT NULL
);
CREATE TABLE information ( 
    sno char(20) PRIMARY KEY,
    sname char(20) NOT NULL,
    sex CHAR(2) CHECK (sex IN('男','女')),
    sage SMALLINT CHECK(sage>10 and sage<=60),
    tel CHAR(11) UNIQUE NOT NULL,                                                          
    adress char(30) UNIQUE NOT NULL,
    dno char(20),
    FOREIGN KEY (dno) REFERENCES school(pno)
);
CREATE TABLE course(
    cno char(10) PRIMARY KEY,
    cname char(20) UNIQUE NOT NULL,
    cpan char(10),
    ceredit SMALLINT CHECK(ceredit>0 and ceredit<10) ,
    FOREIGN KEY(cpan) REFERENCES course(cno)
);
CREATE TABLE score(
    sno char(20),
    cno char(11),
    grade SMALLINT CHECK(grade >=0 and grade <=100),
    PRIMARY KEY (sno,cno),
    FOREIGN KEY(sno) REFERENCES information(sno),
    FOREIGN KEY(cno) REFERENCES course(cno)
);
