select distinct kh.ho_ten
from khach_hang kh;

select kh.ho_ten
from khach_hang kh
group by kh.ho_ten;

select kh.ho_ten
from khach_hang kh
union
select kh.ho_ten
from khach_hang kh;