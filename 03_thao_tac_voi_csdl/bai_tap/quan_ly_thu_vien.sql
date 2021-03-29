drop database if exists book_management;

create database book_management;

use book_management;

create table category (
	id int primary key not null,
    category_of_book varchar(20)
);


create table student (
	id int primary key not null,
    `name` varchar(50) not null,
    date_of_birth date not null,
    address varchar(50) not null,
    email varchar(30) not null,
    phone_number varchar(12) not null
);

create table book (
	id int primary key not null,
    title varchar(50) not null,
    publishing_company varchar(50) not null,
    author varchar(30) not null,
    year_published date not null,
    number_of_publications int not null,
    price int not null,
    category_id int,
    
    foreign key (category_id) references category (id)
);

create table borrow_order (
	order_number int not null,
    student_id int,
    book_id int,
    borrow_status varchar(50) not null,
    
    primary key (student_id,book_id),
    foreign key (student_id) references student (id),
    foreign key (book_id) references book (id)
);