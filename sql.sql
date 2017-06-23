CREATE database stu ;
use stu; 
CREATE TABLE school(
    pno char(5) PRIMARY KEY,
    pname char(64) UNIQUE NOT NULL, 
    dname char(64) NOT NULL,
    state char(1) DEFAULT 1 CHECK(state in ('0','1'))
)character set utf8;

CREATE TABLE information ( 
    sno char(12) PRIMARY KEY,
    sname char(10) NOT NULL,
    sex CHAR(4) CHECK (sex IN('男','女')),
    birth date NOT NULL,
    tel CHAR(11) UNIQUE NOT NULL,                                                          
    adress varchar(50) NOT NULL,
    pno char(5),
    state char(1) DEFAULT 1 CHECK(state in ('0','1')),
    FOREIGN KEY (pno) REFERENCES school(pno)
		on delete cascade 
        on update cascade
)character set utf8;

CREATE TABLE course(
    cno char(6) PRIMARY KEY,
    cname char(20) UNIQUE NOT NULL,
    cpan char(6),
    ceredit SMALLINT CHECK(ceredit>0 and ceredit<10) ,
    num SMALLINT DEFAULT 50 CHECK(num >=0) ,
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
    FOREIGN KEY(sno) REFERENCES information(sno)
		on delete cascade 
        on update cascade,
    state char(1) DEFAULT 1 CHECK(state in ('0','1')),
    FOREIGN KEY(cno) REFERENCES course(cno)
		on delete cascade 
        on update cascade
)character set utf8;
create table lod(
uid char(12) primary key,
perm int  default 1 check (perm in(0,1)),
pwd char(6) default '000000'
);
CREATE TABLE teacher(
    tno char(8) PRIMARY KEY,
    tname char(10),
    salary SMALLINT CHECK(salary >0)
)character set utf8;
create table sessions(
	id char(12) primary key
)character set utf8;
insert into sessions
values('414105010128');
use stu;
insert into school
values('10905','软件工程','信息工程学院','1');
insert into school
values ('10904','网络工程','信息工程学院','1');
insert into school
values ('10501','会计学','会计学院','1');
insert into school
values ('10502','财务管理','会计学院','1');
insert into school
values ('10202','金融','商学院','1');
insert into information
values ('414109070128','小明','男','1992-6-25','12892633456','石家庄市','10905','1');
insert into information
values ('414105010128','小婉','女','1996-6-25','13892633456','合肥市','10501','1');
insert into information 
values('414105020211','张三', '男','1995-6-12','13327851559','河北省石家庄市裕华区','10905','1') ;
insert into course
values ('120001','C语言',null,3,50,'1');
insert into course
values ('120101','数据结构','120001',3,50,'1');
insert into course
values ('120111','高等数学',null,3.5,50,'1');
use stu;
insert into lod
values('111111111111',0,'123456');
insert into lod(uid)
values ('414109070128');
insert into lod(uid)
values ('414105010128');
insert into lod(uid)
values ('414105020211');
use stu;

create view stuinfo(学号,姓名,性别,出生日期,联系方式,籍贯,专业,院系)
as 
select sno,sname,sex,birth,tel,adress,pname,dname
from information , school
where information.pno=school.pno and information.state='1'
order by information.sno asc
with check option;

create view courseinfo(课程号,课程名称,先修课,学分,课余量)
as 
select x.cno,x.cname,y.cname,x.ceredit,x.num
from course x,course y
where x.state='1' and x.cpan=null or x.cpan=y.cno
order by x.cno asc
with check option;
/*alter table course add att smallint default 0 check(att =0 or att=1);*/

use stu;
create view SC(学号,姓名,课程号,课程名称,成绩)
as 
select information.sno,information.sname,course.cno,course.cname,score.grade
from course,information,score
where course.cno=score.cno and information.sno=score.sno and score.state='1';