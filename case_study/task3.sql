select *
from khach_hang
where (year(ngay_sinh) < 2003 
	and year(ngay_sinh) > 1971)
and (dia_chi = 'Đà Nẵng' 
	or dia_chi = 'Quảng Trị');