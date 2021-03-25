drop database if exists student_management;

create database student_management;

use student_management;

create table student (
	id int primary key,
    `name` varchar(50),
    date_of_birth varchar(30),
    address varchar(20)
);

insert into student (id, `name`, address)
values
(001, 'Luis Cong', 'Chicago'),
(002, 'David Kha', 'Los Angeles'),
(003, 'Jimmy Sang', 'New York'),
(004, 'Kenny Tai', 'California'),
(005, 'Big Hau', 'Washinton');

delete from student
where address = 'New York';

drop table student;

drop database student_management;

select *
from student
where `name` like '%a%';

select `name`
from student
where `name` like '%a%'