drop database if exists quan_li_hoc_vien;

create database quan_li_hoc_vien;

use quan_li_hoc_vien;

create table thong_tin (
	id int primary key auto_increment,
    ten varchar(30),
    tuoi int,
    khoa_hoc varchar(30),
    so_tien int
);

insert into thong_tin (ten, tuoi, khoa_hoc, so_tien)
values
('Hoang',21,'CNTT',400000),
('Viet',19,'DTVT',500000),
('Thanh',18,'KTDN',3200000),
('Huong',18,'KTNH',300000),
('Huong',18,'KTNH',500000);

select *
from thong_tin
where ten = 'Huong';

select sum(so_tien)
from thong_tin
where ten = 'Huong';

select distinct ten
from thong_tin;
