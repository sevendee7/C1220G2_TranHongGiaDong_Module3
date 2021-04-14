drop database if exists user_management;

create database user_management;

use user_management;

create table users (
	id int primary key auto_increment,
    `name` varchar(15),
    email varchar(30),
    country varchar(30)
);

insert into users (`name`, email, country)
values
( 'Messi', 'messibarca@arghentina.com','Arghentina'),
( 'Inesta', 'inestabarca@espanol.com', 'Spain'),
( 'Suarez', 'suarezbarca@uruguay.com', 'Uruguay'),
( 'Henry', 'henrybarca@france.com', 'France');


