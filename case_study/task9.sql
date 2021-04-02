select distinct dv.ten_dich_vu 'Tên dịch vụ',count(hd.id_khach_hang) 'Số lần đặt phòng',month(hd.ngay_lam_hop_dong) 'Tháng làm hợp đồng',year(hd.ngay_lam_hop_dong) 'Năm làm hợp đồng'
from hop_dong hd
right join khach_hang kh on kh.id = hd.id_khach_hang
left join dich_vu dv on dv.id = hd.id_dich_vu
where year(hd.ngay_lam_hop_dong) = 2019
group by dv.ten_dich_vu;

