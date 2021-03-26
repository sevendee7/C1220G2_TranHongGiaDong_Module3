drop database if exists practice;

create database practice;

use practice;

CREATE TABLE contact (
	contact_id INT(11) NOT NULL AUTO_INCREMENT,
	last_name VARCHAR(30) NOT NULL,
	first_name VARCHAR(25),
	birthday DATE,
	CONSTRAINT contacts_pk PRIMARY KEY (contact_id)
);

CREATE TABLE suppliers (
	supplier_id INT(11) NOT NULL AUTO_INCREMENT,
	supplier_name VARCHAR(50) NOT NULL,
	account_rep VARCHAR(30) NOT NULL DEFAULT 'TBD',
	CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id)
);

CREATE TABLE users(
   user_id INT AUTO_INCREMENT PRIMARY KEY,
   username VARCHAR(40),
   password VARCHAR(255),
   email VARCHAR(255)
);

CREATE TABLE roles(
   role_id INT AUTO_INCREMENT,
   role_name VARCHAR(50),
   PRIMARY KEY(role_id)
);

CREATE TABLE userroles(
   user_id INT NOT NULL,
   role_id INT NOT NULL,
   PRIMARY KEY(user_id,role_id),
   FOREIGN KEY(user_id) REFERENCES users(user_id),
   FOREIGN KEY(role_id) REFERENCES roles(role_id)
);

alter table contact
	add address varchar(30);
    
alter table contact
	modify last_name varchar(20);
    
alter table contact
	drop column birthday;
    
alter table suppliers
	change column account_rep account_new varchar(30);

alter table contact 
	rename to people;

drop table suppliers;

drop table contact;