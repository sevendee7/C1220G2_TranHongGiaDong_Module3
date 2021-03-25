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
('001', 'Luis Cong', 'Chicago'),
('002', 'David Kha', 'Los Angeles'),
('003', 'Jimmy Sang', 'New York'),
('005', 'Kenny Tai', 'Chicago'),
('006', 'Micheal Dong', 'Los Angeles'),
('007', 'Robert Tam', 'New York'),
('008', 'Sasuke Tung', 'Tokyo'),
('009', 'Tony Huy', 'Shanghai'),
('010', 'Leesin Thang', 'Kyoto'),
('011', 'William Tuan', 'Chicago');

alter table student
modify id varchar(6);

delete from student
where address = 'New York'
or address = 'Shanghai';

select *
from student
where `name` like '%a%'
and address = 'Chicago';

select `name`
from student
where `name` like '%a%';

select id, `name`
from student
where address in ('Chicago', 'Los Angeles');

drop table student;

drop database student_management;