drop database if exists book_management;

create database book_management;

use book_management;

create table category (
	id int primary key not null,
    category_of_book varchar(20)
);

insert into category
values
(1,'khoa học'),
(2,'văn học'),
(3,'toán'),
(4,'kinh tế');

create table student (
	id int primary key not null,
    `name` varchar(50) not null,
    date_of_birth date not null,
    address varchar(50) not null,
    email varchar(30) not null,
    phone_number varchar(12) not null
);

insert into student
values
(1,'Công', '1991-12-12', '123 Hải Phòng','cong@gmai.com', 0905123456),
(2,'Đông', '1995-01-01', '12 Hoàng Sa','dong@gmai.com', 0905123456),
(3,'Sang', '1992-03-20', '23 Lê Duẩn','sang@gmai.com', 0905123456),
(4,'Kha','1995-07-15', '13 Trần Cao Vân','kha@gmai.com', 0905123456),
(5,'Huy','1993-07-20', '13 Lê Lợi','kha@gmai.com', 0905123456);

create table book (
	id int primary key not null,
    title varchar(50) not null,
    publishing_company varchar(50) not null,
    author varchar(30) not null,
    year_published year not null,
    number_of_publications int not null,
    price int not null,
    category_id int,
    
    foreign key (category_id) references category (id)
);

insert into book
values
(1,'cha giàu cha ngèo','kim đồng', 'không biết', '1980', 10,80000,4),
(2,'đắc nhân tâm','kim đồng', 'không biết', '1980', 60,80000,2),
(3,'ngữ văn lớp 12','kim đồng', 'không biết', '1980', 50,80000,2),
(4,'học làm giàu','kim đồng', 'không biết', '1980', 30,80000,4),
(5,'toán lớp 8','kim đồng', 'không biết', '1980', 40,80000,3);

create table borrow_order (
	order_number int not null,
    student_id int,
    book_id int,
    borrow_status varchar(50) not null,
    
    primary key (student_id,book_id),
    foreign key (student_id) references student (id),
    foreign key (book_id) references book (id)
);

insert into borrow_order
values
(1,2,1,'available'),
(2,3,2,'not available'),
(4,1,3,'available'),
(3,4,4,'available');
