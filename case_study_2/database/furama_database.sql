drop database if exists furama_management;

create database furama_management;

use furama_management;

create table position (
id int primary key auto_increment,
position_name varchar(45)
);
insert into position (position_name)
values 
('Receptionist'),
('Operator'),
('Captain'),
('Supervisor'),
('Manager'),
('General Manager');

create table education_degree (
id int primary key auto_increment,
education_degree_name varchar(45)
);
insert into education_degree (education_degree_name)
values 
('High School'),
('College'),
('University'),
('Post Graduate');

create table department (
id int primary key auto_increment,
department_name varchar(45)
);
insert into department (department_name)
values
('Sale Marketing'),
('Operation'),
('Server'),
('Manager');

create table attach_service (
id int primary key not null auto_increment,
attach_service_name varchar(45) not null,
attach_service_cost double not null,
attach_service_unit int not null,
attach_service_status varchar(45)
);
insert into attach_service (attach_service_name, attach_service_cost, attach_service_unit, attach_service_status)
values 
('Massage', 400.0, 1, 'available'),
('Karaoke', 300.0, 1, 'available'),
('Food', 200.0, 1, 'available'),
('Drink', 150.0, 1, 'available'),
('Car Rental', 500.0, 1, 'available');
create table rent_type (
id int primary key auto_increment,
rent_type_name varchar(45),
rent_type_cost double
);
insert into rent_type (rent_type_name, rent_type_cost)
values
('Per Day', 200),
('Per Week', 1000),
('Per Month', 3000),
('Per Year', 30000);

create table service_type (
id int primary key auto_increment,
service_type_name varchar(45)
);
insert into service_type (service_type_name)
values
('Villa Standard'),
('Villa Premium'),
('Villa Luxury'),
('House Standard'),
('House Premium'),
('House Luxury'),
('Room Standard'),
('Room Premium'),
('Room Luxury');

create table `user` (
username varchar(255) primary key,
`password` varchar(255)
);
insert into `user` 
values
('gdong@furama.com','123456'),
('ndhau@furama.com','123456'),
('ldsang@furama.com','123456'),
('dvthang@furama.com','123456'),
('nhuy@furama.com','123456'),
('tqtuan@furama.com','123456');

create table `role` (
id int primary key auto_increment,
role_name varchar(255)
);
insert into `role` (role_name)
values
('Employee'),
('Supervisor'),
('Manager'),
('Admin');

create table user_role (
role_id int,
user_username varchar(255),
    
    primary key (role_id, user_username),
    foreign key (role_id) references `role` (id) on delete cascade,
    foreign key (user_username) references `user` (username) on delete cascade
);
insert into user_role (role_id, user_username)
values
(2,'gdong@furama.com'),
(1,'ndhau@furama.com'),
(3,'ldsang@furama.com'),
(4,'dvthang@furama.com'),
(3,'nhuy@furama.com'),
(2,'tqtuan@furama.com');

create table employee (
id int primary key auto_increment,
employee_name varchar(45) not null,
employee_birthday date not null,
employee_id_card varchar(45) not null,
employee_salary double not null,
employee_phone varchar(45) not null,
employee_email varchar(45),
employee_address varchar(45),
position_id int not null,
education_degree_id int not null,
department_id int not null,
user_username varchar(255),

foreign key (position_id) references position (id) on delete cascade,
foreign key (education_degree_id) references education_degree (id) on delete cascade,
foreign key (department_id) references department (id) on delete cascade,
foreign key (user_username) references `user` (username) on delete cascade
);
insert into employee (employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address
					,position_id,education_degree_id,department_id,user_username)
values
('Tran Hong Gia Dong', '1995-02-05', '123123121', 750, '090123121','gdong@furama.com','Da Nang', 4,3,2,'gdong@furama.com'),
('Nguyen Duc Hau', '1996-04-02', '123123122', 500, '090123122','ndhau@furama.com','Da Nang', 3,3,3,'ndhau@furama.com'),
('Le Duc Sang', '1992-06-17', '123123123', 1000, '090123123','ldsang@furama.com','Da Nang', 5,3,4,'ldsang@furama.com'),
('Dinh Van Thang', '1992-07-16', '123123124', 1300, '090123124','dvthang@furama.com','Da Nang', 6,3,4,'dvthang@furama.com'),
('Nguyen Huy', '1991-07-17', '123123125', 1000, '090123125','nhuy@furama.com','Da Nang', 5,3,4,'nhuy@furama.com'),
('Tran Quoc Tuan', '1996-03-01', '123123126', 500, '090123126','tqtuan@furama.com','Quang Tri', 3,2,1,'tqtuan@furama.com');
delimiter //
create trigger save_user_name
before insert
on employee for each row
begin
	insert into `user`
    values (lcase(new.employee_email), '12345678');
    
    if new.user_username is null then
		set new.user_username = new.employee_email;
    end if;
end;
// delimiter ;

delimiter //
create trigger delete_user_name
after delete
on employee for each row
begin
	delete 
    from `user` 
    where username = old.employee_email;
end;
// delimiter ;

create table service (
id varchar(7) primary key,
service_name varchar(45) not null,
service_area double,
service_cost double not null,
service_capacity int,
standard_room varchar(45),
description_other_convinience varchar(45),
pool_area double,
number_of_floors int,
rent_type_id int not null,
service_type_id int not null,

foreign key (rent_type_id) references rent_type (id) on delete cascade,
foreign key (service_type_id) references service_type (id) on delete cascade
);

insert into service (id, service_name,service_area,service_cost,service_capacity,standard_room,description_other_convinience,
					pool_area,number_of_floors,rent_type_id,service_type_id)
values
('DV-1001','Villa-01',57.5,700,4,'Standard','Garden View',17.5,1,1,1),
('DV-1011','Villa-11',75.5,900,8,'Premium','Pool View',17.5,2,1,2),
('DV-1021','Villa-21',90.5,1200,12,'Luxury','Beach View',23.5,2,1,3),
('DV-2001','House-01',100.5,2000,4,'Standard','Garden View',null,2,3,4),
('DV-2011','House-11',120.5,3500,4,'Premium','Pool View',null,2,3,5),
('DV-2021','House-21',145.5,5000,4,'Luxury','Beach View',null,2,3,6),
('DV-3001','Room-01',80.5,500,2,'Standard','Garden View',null,1,1,7),
('DV-3011','Room-11',100.5,750,2,'Premium','Pool View',null,1,1,8),
('DV-3021','Room-21',120.5,1000,2,'Luxury','Beach View',null,1,1,9);

create table customer_type (
id int primary key auto_increment,
customer_type_name varchar(45)
);
insert into customer_type (customer_type_name)
values
('Diamond'),
('Platinum'),
('Gold'),
('Silver'),
('Member');

create table customer (
id varchar(7) primary key,
customer_name varchar(45) not null,
customer_birthday date not null,
customer_gender bit(1) not null,
customer_id_card varchar(45) not null,
customer_phone varchar(45) not null,
customer_email varchar(45),
customer_address varchar(45),
customer_type_id int not null,

foreign key (customer_type_id) references customer_type (id) on delete cascade
);
insert into customer (id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone
					,customer_email,customer_address,customer_type_id)
values
('KH-0001','Chipu','1994-12-12',0,'789456123','0906789789','chipu@gmail.com','Ha Noi',2),
('KH-0002','Amee','2000-03-18',0,'789456124','0906789788','amee@gmail.com','Ha Noi',3),
('KH-0003','Karik','1989-02-07',1,'789456125','0906789787','karik@gmail.com','TP.HCM',4),
('KH-0004','Ronaldo','1987-01-13',1,'789456126','0906789786','ronaldo@gmail.com','Portugal',1),
('KH-0005','Lam Truong','1982-05-22',1,'789456127','0906789785','truong@gmail.com','USA',5);

create table contract (
id int primary key auto_increment,
contract_start_date datetime not null,
contract_end_date datetime not null,
contract_deposit double,
contract_total_money double,
employee_id int not null,
customer_id varchar(7) not null,
service_id varchar(7) not null,

foreign key (employee_id) references employee (id) on delete cascade,
foreign key (customer_id) references customer (id) on delete cascade,
foreign key (service_id) references service (id) on delete cascade
);
insert into contract (contract_start_date,contract_end_date,contract_deposit,contract_total_money,employee_id,customer_id,service_id)
values
('2019-05-17','2019-05-20',1000,3000,2,'KH-0001','DV-3021'),
('2020-03-10','2020-03-12',500,2400,3,'KH-0002','DV-1021'),
('2021-01-03','2021-01-02',500,1500,1,'KH-0003','DV-3011'),
('2018-07-07','2018-07-10',500,1500,4,'KH-0004','DV-3001');

create table contract_detail (
id int primary key auto_increment,
quantity int not null,
contract_id int not null,
attach_service_id int not null,

foreign key (contract_id) references contract (id) on delete cascade,
foreign key (attach_service_id) references attach_service (id) on delete cascade
);
insert into contract_detail (quantity, contract_id, attach_service_id)
values
(1,1,2),
(2,2,4),
(3,3,1),
(2,4,3);


