select kh.id,kh.ho_ten,lk.ten_loai_khach,kh.dia_chi,dvdk.ten_dich_vu
from khach_hang kh
inner join loai_khach lk on lk.id = kh.id_loai_khach
inner join hop_dong hd on kh.id = hd.id_khach_hang
inner join hop_dong_chi_tiet hdct on hdct.id_hop_dong = hd.id
inner join dich_vu_di_kem dvdk on dvdk.id = hdct.id_dich_vu_di_kem
where lk.ten_loai_khach = 'Diamond' 
and (kh.dia_chi = 'Vinh'
	or kh.dia_chi = 'Quảng Ngãi')
group by dvdk.ten_dich_vu;

