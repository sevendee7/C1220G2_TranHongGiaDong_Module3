delimiter //
create procedure findAllCustomers()

Begin

	select * from customers;

End;
// delimiter ;

call findAllCustomers();

delimiter //
drop procedure if exists `findAllCustomers` //
create procedure findAllCustomers()
Begin
	select * from customers;
End;
// delimiter ;