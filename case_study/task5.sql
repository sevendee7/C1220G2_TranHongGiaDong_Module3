select kh.id, kh.ho_ten, lk.ten_loai_khach, hd.id, dv.ten_dich_vu, hd.ngay_lam_hop_dong,
 hd.ngay_ket_thuc, dv.chi_phi_thue + sum(dvdk.gia * dvdk.don_vi) as 'Tổng tiền'
from khach_hang kh
inner join loai_khach lk on lk.id = kh.id
left join hop_dong hd on hd.id_khach_hang = kh.id
left join dich_vu dv on dv.id = hd.id_dich_vu
left join hop_dong_chi_tiet hdct on hdct.id_hop_dong = hd.id
left join dich_vu_di_kem dvdk on dvdk.id = hdct.id_dich_vu_di_kem
group by hd.id;