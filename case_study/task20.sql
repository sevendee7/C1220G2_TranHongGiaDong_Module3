select kh.id, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh,kh.dia_chi,"khach_hang" as FromTable
from khach_hang kh
union
select nv.id, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh,nv.dia_chi,"nhan_vien" as FromTable
from nhan_vien nv;