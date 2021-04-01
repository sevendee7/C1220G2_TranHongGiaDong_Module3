select hd.id_khach_hang 'ID Khách Hàng',kh.ho_ten 'Họ và tên', count(hd.id_khach_hang) 'Số lần đặt'
from hop_dong hd
	right join khach_hang kh on hd.id_khach_hang = kh.id
    where kh.id_loai_khach = 5
    group by hd.id_khach_hang
    order by count(hd.id_khach_hang);

