select dv.id, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu,hd.ngay_lam_hop_dong
from dich_vu dv
left join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id
left join hop_dong hd on hd.id_dich_vu = dv.id
where dv.id in (
	select distinct id_dich_vu
    from hop_dong
    where year(ngay_lam_hop_dong) = 2018
    )
    and dv.id not in (
    select distinct id_dich_vu
    from hop_dong
    where year(ngay_lam_hop_dong) = 2019
    );


