create database ELearningApp;
use ELearningApp;

create table Role(
roleid int primary key identity,
rolename varchar(100)
)

create table [User](
uid int primary key identity,
uname varchar(100),
email varchar(100) unique,
password varchar(100),
ufieldid int,
IsInstructor Bit not null default 0,
uroleid int,
createdat varchar(100),
    foreign key(uroleid) references Role(roleid),
    foreign key(ufieldid) references Fields(fieldid)
)
create table Fields(
fieldid int primary key identity,
fieldname varchar(200)
)
create table Courses(
courseid int primary key identity,
coursename varchar(100),
description varchar(max),
fieldid int,
uid int,
status varchar(100) default 'pending',
createdat datetime default getdate()
foreign key (fieldid) references Fields(fieldid),
foreign key (uid) references [User](uid)
)
ALTER TABLE Courses ALTER COLUMN column_name SET DEFAULT default_value;

create table Modules(
moduleid int primary key identity,
courseid int,
title varchar(200),
contenttext varchar(max),
contenturl varchar(500),   
iscompleted bit not null default 0,
createdat datetime default getdate(),

foreign key (courseid) references Courses(courseid)
)
create table Quizzes(
quizid int primary key identity,
courseid int,
moduleid int,
title varchar(200),
createdat datetime default getdate(),

foreign key (courseid) references Courses(courseid),
foreign key (moduleid) references Modules(moduleid)
)

create table Questions(
questionid int primary key identity,
quizid int,
questiontext varchar(max),
optiona varchar(300),
optionb varchar(300),
optionc varchar(300),
optiond varchar(300),
correctanswer varchar(1),   -- A / B / C / D

foreign key (quizid) references Quizzes(quizid)
)
create table Certificates(
certificateid int primary key identity,
uid int,
courseid int,
issueddate datetime default getdate(),

foreign key (uid) references [User](uid),
foreign key (courseid) references Courses(courseid)
)

insert into Fields values('IT'),('Sales'),('Accounts');


