drop database if exists demo;

create database demo;

use demo;

create table products (
	id int primary key,
    product_code int,
    product_name varchar(30),
    product_price double,
    product_amount int,
    product_description varchar(50),
    product_status varchar(10)
);

insert into products
values
(1,101,'addidas',79.99,10,'full size','available'),
(2,102,'nike',78.99,10,'full size','available'),
(3,103,'vans',77.99,10,'full size','available'),
(4,104,'converse',76.99,10,'full size','available'),
(5,105,'new balance',75.99,10,'full size','available');

alter table products add index idx_product_code(product_code);

alter table products add index idx_product_info(product_name, product_price);

explain select * from products where product_code = 104;

explain select * from products where product_name = 'vans' or product_price = 76.99;

create view product_views as
select product_code, product_name, product_price, product_status
from products;

select * from product_views;

create or replace view product_views as
select product_code, product_name, product_price, product_status
from products
where product_name = 'vans'
or product_name = 'nike';

select * from product_views;

drop view product_views;

delimiter //
create procedure find_all_products()
begin
	select * from products;
end;
// delimiter ;

call find_all_products();

delimiter //
create procedure add_product()
begin
	insert into products
    values
    (6,106,'MLB',73.99,10,'full size','available');
end;
// delimiter ;

call add_product();

delimiter // 
create procedure edit_product(p_id int,p_price double)
begin
	update products
    set product_price = p_price
    where id = p_id;
end;
// delimiter ;
drop procedure edit_product;

call edit_product(1,89.99);
    
delimiter //
create procedure delete_product(p_id int)
begin
	delete from products
    where id = p_id;
end;
// delimiter ;

call delete_product(6);