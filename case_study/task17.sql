update khach_hang,
(select hop_dong.id_khach_hang as id,sum(hop_dong.tong_tien) as tong_tien 
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2019
group by hop_dong.id_khach_hang
having tong_tien > 10000000) as temp
set khach_hang.id_loai_khach = (
	select loai_khach.id 
    from loai_khach
    where loai_khach.ten_loai_khach = 'Diamond')
where khach_hang.id_loai_khach = (
	select loai_khach.id 
    from loai_khach
    where loai_khach.ten_loai_khach = 'Platinum')
    and temp.id=khach_hang.id;