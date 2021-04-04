drop database if exists bank_account_management;

create database bank_account_management;

use bank_account_management;

create table transactions (
	tran_number int primary key not null unique,
    account_number int,
    tran_date date,
    amounts int,
    descriptions varchar(30)
);

create table customers (
	customer_number int primary key not null unique,
    full_name varchar(50),
    address varchar(50),
    email varchar(40),
    phone int
);

create table accounts (
	account_number int primary key not null unique,
    account_type varchar(20),
    date_open_account date,
    balance int,
    customers_customer_number int,
    transaction_number int,
    
    constraint fk_customer_account
    foreign key (customers_customer_number) references customers (customer_number),
    foreign key (transaction_number) references transactions (tran_number)
);
